// imports
const express = require('express');
const { model } = require('mongoose');
const Appointment = require('../database/appointments');
const Doctor = require("../database/doctors")

// router init
const router = express.Router();

// creating and saving the patients appointment
router.post('/req-appt', (req, res, next) => {

    var appt = new Appointment(req.body.appt);
    appt.requestAppointment(req.body.userlogin)
    .then((result) => {
        res.status(
            result.success ? 200 : 400
        ).send(result);
    });

});

// approving saved appointments
router.post('/approve-appt/:id', (req, res, next) => {

    Appointment.approveAppointment(req.params.id, req.body.userlogin)
    .then((result) => {
        res.status(
            result.success ? 200 : 400
        ).send(result);
    });

});

// fetching all appointments
router.get('/all-appt/:role/:id', (req, res, next) =>{

    Appointment.allAppointments(req.params.role, req.params.id)
    .then((result) => {
        res.status(
            result.success ? 200 : 400
        ).send(result);
    });

});

// searching for doctors by speciality
router.get('/search-doc/:speciality', (req, res, next) => {

    Doctor.findDoctors(req.params.speciality)
    .then((result) => {
        res.status(
            result.success ? 200 : 400
        ).send(result)
    });

})

// export router
module.exports = router;