// imports
const express = require('express');

// router init
const router = express.Router();

// signup request
router.post('/signup', (req, res, next) => {
    res.status(200).send({
        success: true
    });
});

// login request
router.post('/login', (req, res, next) => {
    res.status(200).send({
        success: true
    })
});

// export router
module.exports = router;