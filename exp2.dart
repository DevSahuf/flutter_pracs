 import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final _formkey = GlobalKey<FormState>();
  final _userController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();

  @override

  void dispose(){
    _userController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _submitForm(){
    if (_formkey.currentState?.validate() == true) {
      showDialog(
        context: context, 
        builder: (context){
          return AlertDialog(
            title: Text("Form Data"),
            content: Text("Username: ${_userController.text}\nPassword: ${_passwordController.text}\nEmail: ${_emailController.text}"),
            actions: [
              TextButton(
                onPressed: (){
                  Navigator.of(context).pop();
                }, 
                child: Text("Close")
              )
            ],
          );
        }
      );
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Form"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _userController,
                decoration: InputDecoration(label:Text("Username")),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter the Username";
                  }
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(label:Text("Password")),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter the Password";
                  }
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(label: Text("Email")),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter the Email";
                  }
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm, 
                child: Text("Submit")
              )
            ],
          ),
        ),
      ),
    );
  }
}
