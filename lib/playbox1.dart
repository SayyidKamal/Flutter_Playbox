import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

void main() {
  runApp(LoginScreen());
}

class loginApp extends StatelessWidget {
  const loginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _email;
  late String _password;
  bool _isObscured = true;
  Color _eyeButtonColor = Colors.grey;

  void _toggle() {
    setState(() {
      _isObscured = !_isObscured;
      _eyeButtonColor = _isObscured ? Colors.grey : Colors.blue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Email",
                  hintText: "Enter your email",
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter your email";
                  }
                  return null;
                },
                onSaved: (value) => _email = value!,
              ),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Password",
                  hintText: "Enter your password",
                  suffixIcon: IconButton(
                    onPressed: _toggle,
                    color: _eyeButtonColor,
                    icon: _isObscured
                        ? Icon(Icons.visibility_off)
                        : Icon(Icons.visibility),
                  ),
                ),
                obscureText: _isObscured,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter your password";
                  }
                  return null;
                },
                onSaved: (value) => _password = value!,
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                width: double.infinity,
                color: Colors.blue,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      print("Email: $_email");
                      print("Password: $_password");
                      // Add your code here to process the login
                      // For example, check the credentials against a database or authentication server.
                    }
                  },
                  child: Text(
                    "LOGIN",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              /*   Container(
                width: double.infinity,
                child: RaisedButton(
                  onPressed: _authorizeWithFingerprint,
                  child: Text("LOGIN WITH FINGERPRINT"),
                  color: Colors.blue,
                  textColor: Colors.white,
                ),
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}
