// imports
const mongoose = require('mongoose');
const User = require('./users.js');
const Doctor = require('./doctors.js');


const MongoDB = require('./db.js');
new MongoDB();


// Appointment template
class Appointment {

    // Appointment Model
    static ApptModel = mongoose.model('appointments', new mongoose.Schema({
        _id: {                  // appointment _id
            type: mongoose.Types.ObjectId,
            required: true
        },
        user_id: {              // appointment requested by
            type: String,
            required: true
        },
        doc_id: {               // appointment requested to
            type: String,
            required: true
        },
        time_start: {           // start time requested
            type: Date,
            required: true
        },
        time_end: {             // end time requested
            type: Date,
            required: true
        },
        description: {          // description of problem
            type: String,
            required: true
        },
        approved: {             // status of request
            type: Boolean,
            required: true
        }
    }));

    // new appointment object
    constructor(data) {
        this.appointment = new Appointment.ApptModel(data)
    }

    // request appointment
    async requestAppointment(userLogin) {

        // for this appointment object
        var appt_json = this.appointment.toJSON();

        // check if user is logged in
        var loggedIn = await User.verifyUser(userLogin, User.UserModel);

        // check if doctor exists
        var doctorExists = await Doctor.checkIfExists(appt_json['doc_id'], Doctor.DoctorModel);


        if (loggedIn.success) {
            if (doctorExists.success) {

                // check if time requested is within doctor's schedule
                var startTimeCheck = appt_json['time_start'].getTime() > doctorExists['res']['slot_start'].getTime();
                var stopTimeCheck = appt_json['time_end'].getTime() < doctorExists['res']['slot_end'].getTime();
                if (startTimeCheck && stopTimeCheck) {

                    return this.appointment     // save on all conditions satisfy
                    .save()
                    .then((result) => {
                        return {                // successful save
                            success: true,
                            res: result 
                        }
                    })
                    .catch((err) => {           // error on save    
                        return {
                            success: false,
                            error: err
                        }
                    })

                } else {
                    return {                    // time requested is out of schedule
                        success: false,
                        msg: "Time requested isn't available"
                    }
                }
            } else {                            
                return doctorExists;            // doctor (doc_id) doesn't exist
            }
        } else {
            return loggedIn;                    // user is not logged in                   
        }

    }

    // approve appointments by doctor
    static async approveAppointment(appt_id, userLogin) {

        // check if doctor is logged in
        var loggedIn = await User.verifyUser(userLogin, Doctor.DoctorModel);

        if (!loggedIn.success) {
            return {
                success: false,                 // if doctor isn't logged in
                msg: "Doctor not logged in."
            }
        }

        return Appointment.ApptModel            // if doctor is logged in
        .findById(appt_id)
        .then((res) => {
            if (!res) {
                return {                        // invalid appointment ID
                    success: false,
                    result: `Appointment ${appt_id} not found`
                }
            } else {
                res.approved = true;
                return res.save()
                .then((res) => {
                    return {                    // save approve status as true
                        success: true,
                        msg: `Appointment ${appt_id} approved.`,
                        result: res
                    }
                })
                .catch((err) => {
                    return {                    // error in saving
                        success: false,
                        error: err
                    }
                });
            }
        })
        .catch((err) => {                       // error in finding appointment
            return {
                success: false,
                error: err
            }
        });
    }
}


// exports
module.exports = Appointment;