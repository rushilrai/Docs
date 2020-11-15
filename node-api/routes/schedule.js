// imports
const express = require('express');
const { model } = require('mongoose');

// router init
const router = express.Router();


router.post('/req-appt', (req,res,next) => {
    console.log(req.body);
})

router.post('/approve-appt/:id', (req,res,next) => {
    console.log(req.body);
})

router.get('/all-appt/:role/:id', (req,res,next) =>{

    switch(req.params.role){

        case 'patient':

        case 'doctor':

        default:
            res.status(400).send({
                success: false,
                msg: "Invalid 'role' parameter"
            });
    }
} )

