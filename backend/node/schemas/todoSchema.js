const mongoose  = require('mongoose');

//SCHEMA IS STRUCTURE OF DATA
const todoSchema=mongoose.Schema({

    "todoName":{type:String},
    
});

const todoModel=mongoose.model('todoData',todoSchema);
module.exports=todoModel;