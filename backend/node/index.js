const express = require('express');//importing express
const bp = require('body-parser');
const cors = require('cors');
const mongoose = require('mongoose');
const authModel = require('./schemas/authSchema');
const bcrypt = require('bcryptjs');
const todoModel = require('./schemas/todoSchema');
const mainRoute=require('./routes/mainRoute');


const app = express();//for making server, we use express method

// app.set('port',process.env.PORT || 5000);
// OR
const port = process.env.port || 5000; //define application port on which it runs


//for auto assigning backend permission that is needed
app.use(cors());
app.use(bp.urlencoded({
    extended: false,
}));
app.use(bp.json());//data from frontend will come in json
app.use(mainRoute);


//MONDO DB CONNECTION
mongoose.connect('mongodb+srv://hasnain:hasnain123@cluster0.hmgm1.mongodb.net/myFirstDatabase?retryWrites=true&w=majority',
    {
        //for permissions
        useCreateIndex: true,
        useNewUrlParser: true,
        useUnifiedTopology: true
    });

mongoose.connection.on("connected", () => {
    console.log("DATABASE CONNECTED");
});
mongoose.connection.on("error", () => {
    console.log("DATABASE NOT CONNECTED");
});

// ON for realtime connection checking and once for only one time checking
// mongoose.connection.once("connected",()=>{

// })

//creating api
app.get('/', (req, res) => {
    res.send("Express Root Here")//response towards user OR on browser interface OR on client side
});



//to run server
app.listen(port, () => {
    console.log("Server is Running on localhost:" + port);
});
