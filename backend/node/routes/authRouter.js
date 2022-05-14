const express = require('express');//importing express
const {signUp,signIn}=require('../controllers/authCon');
const router=express.Router();



router.post('/signup',signUp);
router.post('/signin',signIn);


module.exports=router;