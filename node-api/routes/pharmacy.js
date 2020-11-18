// imports
const express = require('express');
const Order = require("../database/orders.js");
const mailer = require("../mailers/mailer")

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

    // sending mail for order confirmation
    const html = `<b>Receipt</b>
    <br/>
    Your order is confirmed
    <br/>
    Prescription ID: <b> ${req.body.order.prescription._id} </b>
    <br/>
    Medicines: <b> ${req.body.order.prescription.meds} </b>
    <br/>
    Total Amount to be paid: Rs. 1234.00 `
    
    let mail = req.body.order.user_id
    mailer.sendEmail("admin@piggy.com",mail,"Your Order",html);
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