import 'package:flutter/material.dart';
import 'package:flutter_instagram_clone/screens/signup_screen.dart';
import 'package:flutter_instagram_clone/services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  static final String id = 'login _screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey =
      GlobalKey<FormState>(); // Allow us Setup Validation for the Form
  String _email, _password;

  _submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      // Loggin user w/ Firebase
      AuthService.login(_email, _password);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            'Instagram',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Billabong',
              fontSize: 35.0,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Instagram',
                style: TextStyle(
                  fontFamily: 'Billabong',
                  fontSize: 50.0,
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 30.0,
                        vertical: 10.0,
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(labelText: 'Email'),
                        validator: (input) => !input.contains('@')
                            ? 'Please enter a valid email'
                            : null,
                        onSaved: (input) => _email = input,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 10,
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(labelText: 'Password'),
                        validator: (input) => input.length < 6
                            ? 'Must be at least 6 characters'
                            : null,
                        onSaved: (input) => _password = input,
                        obscureText: true,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      width: 250.0,
                      child: FlatButton(
                        onPressed: _submit,
                        color: Colors.blue,
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.white, fontSize: 18.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      width: 250.0,
                      child: FlatButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, SignupScreen.id),
                        color: Colors.blue,
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          'Go Sign Up',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
