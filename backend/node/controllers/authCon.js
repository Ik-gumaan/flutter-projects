const authModel = require('../schemas/authSchema');
const bcrypt = require('bcryptjs');



const signUp=async (req, res) => {
    console.log("POST REQ----->", req.body);
    res.send("SIGNUP POST API");
    res.send(req.body); //deta will be an object in body


    //mongodb builtin function to find data there 
    var checkUser = await authModel.findOne({ email: req.body.email });
    // res.send({result:checkUser});

    if (checkUser) {
        res.status(200).send({ result: checkUser, message: "Email already registered" });
    }
    else {
        // res.send({result:checkUser,message:"You can sign up!"});

        var hashPass = await bcrypt.hash(req.bodyy.password, 12);//12 means layer of encryption(greater layer=greater security)
        res.send({ hashPassword: hashPass });


        // let userCreate=new authModel({
        //     email:req.body.email,
        //     password:hashPass,    
        // });

        // userCreate.save()
        // .then((response)=>{
        // console.log("THEN RESPONSE SUCCES-------->",response)
        // res.status(200).send({result:response,message:"USER SIGNUP successfullyy"});
        // })
        // .catch((err)=>{
        // console.log("CATCH RESPONSE ERROR-------->",err)
        // res.status(400).send({result:err.message,message:"data not stored successfullyy"});

        // })



    }

}



const signIn=async (req, res) => {
    // console.log("POST REQ----->",req.body);
    // res.send("SIGNUP POST API");
    // res.send(req.body); //deta will be an object in body


    //mongodb builtin function to find data there 
    var checkUser = await authModel.findOne({ email: req.body.email });
    // res.send({result:checkUser});

    if (checkUser) {
        // res.send({result:checkUser,message:"login successfully"});

        var checkPass = await bcrypt.compare(req.body.password, checkUser.password);
        // res.send(checkPass);

        if (checkPass) {
            res.status(200).send({ message: "signin succesfully" });

        }
        else {
            res.status(403).send({ message: "Incorrect password" });
        }

        // var hashPass= await bcrypt.hash(req.bodyy.password,12);//12 means layer of encryption(greater layer=greater security)
        // res.send({hashPassword:hashPass});




    }
    else {
        res.status(200).send({ message: "Invalid Email and password" });
    }

}


module.exports={signUp,signIn};