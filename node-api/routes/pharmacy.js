// imports
const express = require('express');
const Order = require("../database/orders");
const User = require("../database/users");

// router init
const router = express.Router();

// placing an order
router.post("/req-order", (req, res, next) => {

    var order = new Order(req.body.order);
    order.requestOrder(req.body.userlogin)
    .then((result) => {
        res.status(
            result.success ? 200 : 400
        ).send(result);
    });
});


// list of all orders by user_id
router.get("/allorders/:id", (req, res, next) => {

    Order.allOrders(req.params.id)
    .then((result) => {
        res.status(
            result.success ? 200 : 400
        ).send(result);
    });
})

module.exports = router;