import 'package:ecommerce2/Api/api.dart';
import 'package:ecommerce2/constants.dart';
import 'package:ecommerce2/screens/auth/Register.dart';
import 'package:ecommerce2/utils/alerts.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController controllerUsername = TextEditingController();

  bool invisible = true;
  bool invisible2 = true;

  register(BuildContext context) {
    var email = controllerEmail.text;
    var password = controllerPassword.text;
    var username = controllerUsername.text;
    //validasi
    if (email == "") {
      Alerts.showMessage("Please enter your email", context);
      return;
    }
    if (password == "") {
      Alerts.showMessage("Please enter your password", context);
      return;
    }
    if (username == "") {
      Alerts.showMessage("Please enter your username", context);
      return;
    }

    Api.submitRegister({
      "email": email,
      "username": username,
      "password": password,
    }).then((value) {
      //jika register berhasil maka muncul pesan berhasil
      Alerts.showMessage(value.message!, context);
    }).catchError((error) {
      //jika register gagal,maka muncul pesan error
      Alerts.showMessage(error, context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black54)),
      body: Container(
        padding: EdgeInsets.fromLTRB(15, 100, 15, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome',
              style: Constants.createaccount,
            ),
            Text(
              'Sign in to continue',
              style: Constants.signuptocontinue,
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              width: double.infinity,
              child: TextFormField(
                controller: controllerEmail,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          BorderSide(width: 0, style: BorderStyle.none)),
                  filled: true,
                  fillColor: Colors.black12,
                  hintText: 'Email Address',
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              child: TextFormField(
                controller: controllerPassword,
                obscureText: invisible,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(width: 0, style: BorderStyle.none)),
                  filled: true,
                  fillColor: Colors.black12,
                  hintText: 'Password',
                  suffixIcon: IconButton(
                    icon: Icon((invisible == true)
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        invisible = !invisible;
                      });
                    },
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  register(context);
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.orange)),
                child: Text(
                  'Sign in',
                  style: Constants.judulcategory,
                ),
              ),
            ),
            Center(
                child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Register()));
                    },
                    child: Text("Don't have an account? Create an account")))
          ],
        ),
      ),
    );
  }
}
