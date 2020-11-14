// imports
const mongoose = require('mongoose');
const bcrypt = require('bcrypt');

// User
class User {

    // user schema
    static UserModel = mongoose.model('users', 
        new mongoose.Schema({
            _id: {                  // email id
                type: String,
                required: true
            },
            password: {         // hashed password
                type: String,
                required: true
            },
            name: {                 // full name
                type: String,
                required: true
            },
            contact_no: {           // contact_no
                type: String,
                required: true
            },
            address: {              // address
                type: String,
                required: true
            },
            role: {
                type: String,
                required: true
            },
            docprofile: {
                type: Object,
                required: false
            }
        })
    );

    // init user model with data
    constructor (data) {
        data['password'] = bcrypt.hashSync(data['password'], 10); 
        this.user = new User.UserModel(data);
    }

    // save user to database
    async saveUser () {
        return this.user    
        .save()                         // save user to db         
        .then((res) => { 
            return {                    // successfully saved
                success: true,
                msg: `Username: ${this.user.toJSON()['_id']} saved to DB`
            };
        })
        .catch((err) => { 
            if (err.name == "MongoError" && err.code == 11000) {
                return {                // username exists in db
                    success: false,
                    msg: `Username already exists.`
                };
            } else {
                console.log(err);
                return {                // other error while saving
                    success: false,
                    error: err
                };
            }
        });
    }

    // verify user on login
    static async verifyUser (userLogin) {
        return User.UserModel.findById(userLogin['_id']).then((res) => {

            if (!res) {
                return {            // user (_id) not found in db
                    success: false,
                    msg: `User ${userLogin['_id']} not found`
                }
            }
            
            var res_json = res.toJSON();

            if (bcrypt.compareSync(userLogin['password'], res_json['password'])) {
                delete res_json['password'];
                return {            // user (_id) found & hash matched
                    success: true,
                    msg: `User ${userLogin['_id']} verified!`,
                    user: res_json
                }
            } else {
                return {            // user (_id) found & hash didn't match
                    success: false,
                    msg: `User ${userLogin['_id']} wrong password!`
                }
            }
 
        });
    }
}

// export User
module.exports = User;