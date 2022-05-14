const express = require('express');//importing express
const authRouter=require('./authRouter');
const router=express.Router();



router.use('/auth',authRouter);

module.exports=router;
