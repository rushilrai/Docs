// imports
const express = require('express');
const Order = require("../database/orders.js");

// router init
const router = express.Router();

// placing an order
router.post("/request", (req, res, next) => {

    // new order
    var order = new Order(req.body.order);

    // request for order
    order.requestOrder(req.body.userlogin)
    .then((result) => {
        res.status(
            result.success ? 200 : 400
        ).send(result);
    });
});


// list of all orders by user_id
router.get("/all/:id", (req, res, next) => {

    Order.allOrders(req.params.id)
    .then((result) => {
        res.status(
            result.success ? 200 : 400
        ).send(result);
    });
})

module.exports = router;