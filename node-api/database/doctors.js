// imports
const mongoose = require('mongoose');
const User = require('./users.js');

// Doctor
class Doctor extends User {

    // user schema
    static DoctorModel = mongoose.model('doctors', new mongoose.Schema({
        _id: {                  // email id
            type: String,
            required: true
        },
        password: {             // password
            type: String,
            required: true
        },
        name: {                 // full name
            type: String,
            required: true
        },
        contact_no: {           // contact_no
            type: String,
            required: true
        },
        address: {              // address
            type: Object,
            required: true
        },
        specialization: {       // specialization
            type: String,
            required: true
        },
        qualification: {        // qualification
            type: String,
            required: true
        },
        slot_start: {
            type: Date,
            required: true
        },
        slot_end: {
            type: Date,
            required: true
        }
    }));

    // init doctor model
    constructor(data) {
        super(data);
        this.user = new Doctor.DoctorModel(data);
    }
    
    // find doctors by specialisation
    static async findDoctors (splzn) {
        return Doctor.DoctorModel.find({
            specialization: splzn           // find doctors by specialisation
        }, "_id name contact_no address specialization qualification slot_start slot_end").then((res) => {
            return {
                success: true,              // return results
                result: res
            }
        }).catch((err) => {
            return {
                success: false,             // return error
                error: err
            }
        });
    }
}

// exports
module.exports = Doctor;