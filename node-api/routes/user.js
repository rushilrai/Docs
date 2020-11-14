// imports
const express = require('express');
const { model } = require('mongoose');
const User = require('../database/user-db.js');

// router init
const router = express.Router();

// signup request
router.post('/signup', (req, res, next) => {
    var user = new User(req.body);
    user.saveUser().then((result) => {
        res.status(
            result.success ? 200 : 400
        ).send(result);
    })
});

// login request
router.post('/login', (req, res, next) => {
    User.verifyUser(req.body).then((result) => {
        res.status(
            result.success ? 200 : 401
        ).send(result);
    })
});

// export router
module.exports = router;