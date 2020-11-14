// imports
const mongoose = require('mongoose');

// .env init
require('dotenv').config();

// database
class MongoDatabase {
    
    // db init
    constructor (MONGO_URI = undefined) {
        
        // get credentials from .env or params
        const mongo_uri = process.env.MONGO_URI || MONGO_URI;

        // create db if it doesn't exist
        mongoose.connect(mongo_uri, {
            useNewUrlParser: true,
            useUnifiedTopology: true
        });
        this.conn = mongoose.connection;
        this.conn.on('error', console.error.bind(console, 'MongoDB connection error:'));
    }

}

// export MongoDB
module.exports = MongoDatabase;