email = document.getElementById("email").value;
password = document.getElementById("password").value;

function signIn() {
    console.log("EmAIL: ", email, "\nPassword: ", password);

    // axios.post('localhost:5000/auth/signin', { email: email, password: password })
    //     .then((success) => {
    //         console.log("Succes======>", success)
    //     })
    //     .catch((err) => {
    //         console.log("Error======>", err)
    //     })


    var obj={
        method:"POST",
        headers:{"Access-Control-Allow-Origin":"*","Content-Type":"application/json"},
        data:{email:email,password:password},
        url:"http://localhost:5000/auth/signin",
    }

    axios(obj)
    .then((success)=>{
        console.log("Succes======>",success)
    })
    .catch((err)=>{
        console.log("Error======>",err)
    })


}