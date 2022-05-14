import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  var hidePass = true;
  var hideConfPass = true;
  var selectedVal = '0';
  var checkBoxVal = false;

  TextEditingController myDOBController = TextEditingController();

  var focusColor = Color(0xFFBDBDBD);

  hidePassword() {
    setState(() {
      hidePass = !hidePass;
    });
  }

  hideConfPassword() {
    setState(() {
      hideConfPass = !hideConfPass;
    });
  }

  getDOB() async {
    var initialDate = DateTime(DateTime.now().year - 10);
    var newDate = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 100),
      lastDate: DateTime(DateTime.now().year - 1),
      initialDate: initialDate,
      helpText: "SELECT DATE OF BIRTH",
    );
    setState(() {
      if (newDate != null) {
        myDOBController.text =
            "${newDate.day}/${newDate.month}/${newDate.year}";
      }
    });
  }

  containerFocused() {
// Color(0xFFEC407A)
    print("TAPPED");
    setState(() {
      focusColor = Colors.pink;
    });
  }

  selectedRadioVal(val) {
    setState(() {
      selectedVal = val;
    });
  }

  setCheckBox(value) {
    setState(() {
      checkBoxVal = !checkBoxVal;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("SIGN UP"),
        // backgroundColor: Colors.deepOrange,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: TextField(
                    keyboardType: TextInputType.text,
                    maxLines: 1,
                    // autofocus: true,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(),
                        hintText: 'Full Name'),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  // child: TextField(
                  //   keyboardType: TextInputType.text,
                  //   maxLines: 1,
                  //   autofocus: true,
                  //   decoration: InputDecoration(
                  //       prefixIcon: Icon(Icons.email),
                  //       border: OutlineInputBorder(),
                  //       hintText: 'Full Name'),
                  // ),
                  child: Row(children: [
                    Text("Gender"),
                    SizedBox(
                      width: 15,
                    ),
                    Radio(
                        activeColor: Theme.of(context).colorScheme.primary,
                        value: 'm',
                        groupValue: selectedVal,
                        onChanged: (val) {
                          selectedRadioVal(val);
                        }),
                    Icon(Icons.male),
                    Text("Male"),
                    SizedBox(
                      width: 5,
                    ),
                    Radio(
                        activeColor: Theme.of(context).colorScheme.primary,
                        value: 'f',
                        groupValue: selectedVal,
                        onChanged: (val) {
                          selectedRadioVal(val);
                        }),
                    Icon(Icons.female),
                    Text("Female"),
                    SizedBox(
                      width: 5,
                    ),
                    Radio(
                        activeColor: Theme.of(context).colorScheme.primary,
                        value: 'o',
                        groupValue: selectedVal,
                        onChanged: (val) {
                          selectedRadioVal(val);
                        }),
                    Icon(Icons.add),
                    Text("Other"),
                  ]),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    maxLines: 1,
                    controller: myDOBController,
                    // autofocus: true,
                    decoration: InputDecoration(
                        prefixIcon: GestureDetector(
                          child: Icon(Icons.calendar_today),
                          onTap: getDOB,
                        ),
                        border: OutlineInputBorder(),
                        hintText: 'Date of Birth'),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    // containerFocused()
                    // ,
                    // ;
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                        // borderRadius: ,
                        border: Border.all(
                      color: focusColor,
                      width: 1,
                    )),
                    child: CountryCodePicker(
                      showCountryOnly: true,
                      showOnlyCountryWhenClosed: true,
                      showDropDownButton: true,
                      alignLeft: true,
                      boxDecoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      searchDecoration: InputDecoration(
                        hintText: " Search Country",
                      ),
                    ),
                    // TextField(
                    //   keyboardType: TextInputType.text,
                    //   maxLines: 1,
                    //   autofocus: true,
                    //   decoration: InputDecoration(
                    //       prefixIcon:Icon(Icons.email),
                    //       border: OutlineInputBorder(),
                    //       hintText: ''
                    //       ),
                    // ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    maxLines: 1,
                    // autofocus: true,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(),
                        hintText: 'Email Address'),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    maxLines: 1,
                    // autofocus: true,
                    decoration: InputDecoration(
                        prefixIcon: CountryCodePicker(
                          boxDecoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          searchDecoration: InputDecoration(
                            hintText: " Search Country Code",
                          ),
                        ),
                        border: OutlineInputBorder(),
                        hintText: 'Phone Number'),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: TextField(
                    keyboardType: TextInputType.text,
                    maxLines: 1,
                    // autofocus: true,
                    obscureText: hidePass, //for passwords to hide
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.password),
                        suffixIcon: GestureDetector(
                          onTap: hidePassword,
                          child: hidePass
                              ? Icon(Icons.visibility)
                              : Icon(Icons.visibility_off),
                        ),
                        border: OutlineInputBorder(),
                        hintText: 'Password'),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: TextField(
                    keyboardType: TextInputType.text,
                    maxLines: 1,
                    // autofocus: true,
                    obscureText: hideConfPass, //for passwords to hide
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.password),
                        suffixIcon: GestureDetector(
                          onTap: hideConfPassword,
                          child: hideConfPass
                              ? Icon(Icons.visibility)
                              : Icon(Icons.visibility_off),
                        ),
                        border: OutlineInputBorder(),
                        hintText: 'Confirm Password'),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Row(children: [
                    Checkbox(
                      value: checkBoxVal,
                      onChanged: (value) {
                        setCheckBox(value);
                      },
                      activeColor: Theme.of(context).colorScheme.primary,
                    ),
                    Text("I accept that all given information is valid."),
                  ]),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("SIGN UP"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
