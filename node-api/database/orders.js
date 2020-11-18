// imports
const mongoose = require ('mongoose');
const User =  require ('./users');
const Doctor = require ("./doctors")



// order
class Order {

    // order model
    static OrderModel = mongoose.model ('order', new mongoose.Schema({
        _id: {                                   //  order id
            type: mongoose.Types.ObjectId,
            required: true
        },
        user_id: {                               // patient id  
            type: String,
            required: true
        },
        address: {                                // doc id
            type: String,
            required: true
        },
        contact: {                             // list of medicines
            type: String,
            required: true
        },
        prescription: {                       // prescribed by the doctor
            type: Object,
            required: true
        }
    }));

    // object data
    constructor(data){
        data['_id'] = mongoose.Types.ObjectId();
        this.order = new Order.OrderModel(data);
    }
    
    // sending and saving an order
    async requestOrder(userLogin) {

        // for this order object
        var order_json = this.order.toJSON();

        // check if user is logged in
        var loggedIn = await User.verifyUser(userLogin, User.UserModel);


        if (loggedIn.success) {
        
            this.order.save()   // saving all data
            .then((result) => {
                return {              // successful save
                    success: true,
                    res: result
                }
            })
            .catch((err) => {
                return {
                    success: false,
                    error: err
                }
            })
        } else {
            return loggedIn            // user is not logged in
        }
    }

    static async allOrders(user_id) {

        var db_query = { user_id: user_id }
        return Order.OrderModel.find(db_query).then((res) => {        // finding all orders with a given user_id
            return {
                success: true,
                result: res
            }
        })
    }

}

module.exports = Order;