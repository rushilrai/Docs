// imports
const nodemailer = require("nodemailer");
require('dotenv').config;

var transporter = nodemailer.createTransport({
    service: 'gmail',
    auth: {
      user: process.env.MAIL_USER,
      pass: process.env.MAIL_PASS
    }
  });


  
  module.exports = {
      sendEmail(from, to, subject, html){
          return new Promise((resolve, reject)=>{
              transporter.sendMail({from, subject, to ,html}, (err, info)=>{
                  if(err) reject(err);
  
                  resolve(info);
              });
          });
      }
  }