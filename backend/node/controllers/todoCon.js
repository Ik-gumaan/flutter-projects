const todoModel = require('../schemas/todoSchema');


const addToDo=async (req, res) => {

    let todoCreate = new todoModel({
        todoName: req.body.todoItem,
    });

    todoCreate.save()
        .then((response) => {
            // console.log("THEN RESPONSE SUCCES-------->",response)
            res.status(200).send({ result: response, message: "ITEM ADDED SUCEESFULLY>>>" });
        })
        .catch((err) => {
            // console.log("CATCH RESPONSE ERROR-------->",err)
            res.status(200).send({ result: response, message: "ITEM ADDED UNSUCEESFULLY>>>" });
        })


}

const getAllTodo= async (req, res) => {

    var result=await todoModel.find({});
    res.status(200).send({data:result,message:"Item Fetched Successfullyy..."});

}

module.exports={addToDo,getAllTodo};