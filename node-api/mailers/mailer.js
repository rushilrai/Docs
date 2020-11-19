// imports
const nodemailer = require("nodemailer");
const ejs = require("ejs");

// init .env variables
require('dotenv').config();

// export mailer
module.exports = {

    // send mail
    sendConfimation (order) {
    
        // setup nodemailer
        var transporter = nodemailer.createTransport({ 
            service: 'gmail',
            auth: {
                user: process.env.MAIL_USER,
                pass: process.env.MAIL_PASS
            }
        });
    

        // render html email template
        ejs.renderFile(__dirname + "/mail-template.ejs", order).then((renderedTemplate) => {

            // configure mail options
            var mailOptions = {
                from: `"Docs" <hrpiggy59@gmail.com>`, 
                subject: "Docs | Your Order",
                to: order.user_id, 
                html: renderedTemplate
            };

            // send mail and log info
            transporter.sendMail(mailOptions, (error, info) => {
                if (error) {
                    console.log(error);
                } else {
                    console.log('Email sent: ' + info.response);
                }
            });

        });
    
    }
};