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
        schedule: {
            type: Object,
            required: true
        }
    }));

    // init doctor model
    constructor(data) {
        super(data);
        this.user = new Doctor.DoctorModel(data);
    }
    
}

// exports
module.exports = Doctor;