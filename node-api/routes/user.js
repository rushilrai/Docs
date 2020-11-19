// imports
const express = require('express');
const User = require('../database/users.js');
const Doctor = require('../database/doctors.js');

// router init
const router = express.Router();

// signup request
router.post('/signup/:role', (req, res, next) => {

    switch (req.params.role) {                      // check for role

        case 'patient':                             // save patient
            var user = new User(req.body);          
            user.saveUser().then((result) => {
                res.status(
                    result.success ? 200 : 400
                ).send(result);
            });
            break;
        
        case 'doctor':                              // save doctor
            var doctor = new Doctor(req.body);
            doctor.saveUser().then((result) => {
                res.status(
                    result.success ? 200 : 400
                ).send(result);
            });
            break;
        
        default:                                    // invalid role
            res.status(400).send({
                success: false,
                msg: "Invalid 'role' parameter"
            });        
    }

});

// login request
router.post('/login/:role', (req, res, next) => {

    switch (req.params.role) {                      // check for role

        case 'patient':                             // verify patient
            User.verifyUser(req.body, User.UserModel).then((result) => {
                res.status(
                    result.success ? 200 : 401
                ).send(result);
            });
            break;

        case 'doctor':                              // verify doctor
            Doctor.verifyUser(req.body, Doctor.DoctorModel).then((result) => {
                res.status(
                    result.success ? 200 : 401
                ).send(result);
            });
            break;

        default:
            res.status(400).send({                  // verify doctor
                success: false,
                msg: "Invalid 'role' parameter"
            });  

    }

});

// export router
module.exports = router;