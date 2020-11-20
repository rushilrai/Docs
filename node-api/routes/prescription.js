// imports
const express = require('express');
const Prescription  = require('../database/prescriptions.js');

// router init
const router = express.Router();

// creating and saving the patients appointment
router.post('/new', (req, res, next) => {

    var prescription = new Prescription(req.body.prescription);
    prescription.prescribe(req.body.userlogin)
    .then((result) => {
        res.status(
            result.success ? 200 : 400
        ).send(result);
    })
    .catch((err) => {
        res.status(500).send(err);
    });

});

// fetching all appointments
router.get('/all/:role/:id', (req, res, next) =>{

    Prescription.allPrescriptions(req.params.role, req.params.id)
    .then((result) => {
        res.status(
            result.success ? 200 : 400
        ).send(result);
    })
    .catch((err) => {
        res.status(500).send(err);
    });

});

// export router
module.exports = router;