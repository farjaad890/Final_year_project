import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:navigation/firebase_options.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:navigation/screens/home.dart';
class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);
  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  FirebaseAuth _auth=FirebaseAuth.instance;
  TextEditingController email= new TextEditingController();
  TextEditingController pasword= new TextEditingController();
  TextEditingController phonenumber= new TextEditingController();
  bool isLoading = false;


  bool validateEmail(String value)
  {
    print(value);
    String pattern = r'^\w+@(gmail|hotmail|yahoo)\.com$';;
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      print("Error from Email");
      return false;
    }
    else
      return true;
  }
  bool validatePhoneNumber(String value) {
    print(value);
    String pattern = r'^(03\d{9}|\+92\d{10})$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      print("Error from phonenumber");
      return false;
    }
    else
      return true;
  }
  signUp() async {
    try {
      String emailadress = email.text.trim(),
          Pasword = pasword.text.trim(),
           phone = phonenumber.text.trim();
      if (email == null || pasword == null || phonenumber==null)
      {
        showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
                title: const Text("Alert Dialog Box"),
                content: Text('"Error in input or empty input field"'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(ctx).pop();
                    }, child: Container(
                    color: Color(0xFFA7FFEB),
                    padding: const EdgeInsets.all(14),
                    child: const Text("okay"),
                  ),
                  )
                ]
            )
        );
      }
      else if(!validateEmail(emailadress)){
        showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
                title: const Text("Alert Dialog Box"),
                content: Text("Error in input or empty input field"),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(ctx).pop();
                    }, child: Container(
                    color: Color(0xFFA7FFEB),
                    padding: const EdgeInsets.all(14),
                    child: const Text("okay"),
                  ),
                  )
                ]
            )
        );
      }
      else if(!validatePhoneNumber(phone)){
        showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
                title: const Text("Alert Dialog Box"),
                content: Text("Error in input or empty input field"),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(ctx).pop();
                    }, child: Container(
                    color: Color(0xFFA7FFEB),
                    padding: const EdgeInsets.all(14),
                    child: const Text("okay"),
                  ),
                  )
                ]
            )
        );
      }
      else
      {
        setState(() {
          isLoading=true;
        });
        UserCredential newUser = await _auth.createUserWithEmailAndPassword(
            email: emailadress, password: Pasword);
        final user = newUser.user;
        if (user != null) {
          Map<String,String> dataTosave={
            'Email':emailadress,
            'Password':Pasword,
            'Phonenumber':phone,
            'isBlock':'false'
          };
          final DatabaseReference dbref = FirebaseDatabase.instance.ref();
          dbref.child("customerInfo").push().set(dataTosave);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => home(),),
          );
        }else
        {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('email or Number already exist')),
          );
        }
      }
    } catch (e) {
      setState(() {
        isLoading=false;
      });
      print(e);
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
              title: const Text("Alert Dialog Box"),
              content: Text(e.toString()),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  }, child: Container(
                  color: Color(0xFFA7FFEB),
                  padding: const EdgeInsets.all(14),
                  child: const Text("okay"),
                ),
                )
              ]
          )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child:Stack(
          children: [
            Container(
              constraints: BoxConstraints.expand(),
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/made3.png"),
                    fit: BoxFit.fill
                ),
              ),
            ),
            Center(
              child: isLoading ? CircularProgressIndicator() : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 50.0,
                    child: Container(
                      child: Icon(
                        Icons.shopping_cart,
                        color: Color(0xFF64FFDA),
                        size: 50.0,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  Material(
                    elevation: 2.5,
                    child: Container(
                      height: 50.0,
                      width:300.0,
                      color: Color(0xFFA7FFEB),
                      child:TextField(
                        controller: email,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          label: Center(child: Text('example@gmail.com')),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    child: Text("@gmail.com or @yahoo.com or @hotmail.com"),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Material(
                    elevation: 2.5,
                    child: Container(
                      height: 50.0,
                      width:300.0,
                      color: Color(0xFFA7FFEB),
                      child:TextField(
                        controller: pasword,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          label: Center(child: Text('Password')),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    child: Text("Password length minimum 6 characters"),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Material(
                    elevation: 2.5,
                    child: Container(
                      height: 50.0,
                      width:300.0,
                      color: Color(0xFFA7FFEB),
                      child:TextField(
                        controller: phonenumber,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          label: Center(child: Text('phone number')),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    child: Text("Starts with +92 or 03"),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                      height: 50.0,
                      width:250.0,
                      child: ElevatedButton(
                        onPressed: () {
                       signUp();
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFF45F1B9),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text('Sign Up',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      )
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
