// imports
const mongoose = require ('mongoose');
const User =  require ('./users.js');
const Prescription = require('./prescriptions.js');

// Order template
class Order {

    // Order model
    static OrderModel = mongoose.model ('orders', new mongoose.Schema({
        _id: {                                  //  order id
            type: mongoose.Types.ObjectId,
            required: true
        },
        user_id: {                              // patient   
            type: String,
            required: true
        },
        address: {                              // address
            type: String,
            required: true
        },
        contact: {                              // contact number
            type: String,
            required: true
        },
        prescription: {                         // prescription
            type: Object,
            required: true
        }
    }));

    // new Order object
    constructor(data){
        data['_id'] = mongoose.Types.ObjectId();
        this.order = new Order.OrderModel(data);
    }
    
    // requesting new order
    async requestOrder(userLogin) {

        // for this order object
        var order_json = this.order.toJSON();

        // check if user is logged in
        var loggedIn = await User.verifyUser(userLogin, User.UserModel);

        // check if prescription is valid
        var prescriptionValid = await Prescription.verifyPrescription(order_json['prescription']);

        if (loggedIn.success) {                 // if user is logged in
            if (prescriptionValid.success) {    // if prescription is valid
                this.order.save()               // saving all data
                .then((result) => {             // successful save
                    return {                
                        success: true,
                        res: result
                    };
                })
                .catch((err) => {               // error while saving
                    return {
                        success: false,
                        error: err
                    };
                });
            } else {
                return prescriptionValid;
            }
        } else {
            return loggedIn;                    // if user is not logged in
        }
    }

    // fetching all orders
    static async allOrders(user_id) {

        // find all orders
        return Order.OrderModel.find({
            user_id: user_id
        }).then((res) => {
            return {                // found all orders
                success: true,
                result: res
            };
        }).catch((err) => {
            return {                // error while finding
                success: false,
                error: err
            };
        });
    }

}

// exports
module.exports = Order;