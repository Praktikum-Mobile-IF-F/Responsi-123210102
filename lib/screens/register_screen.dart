import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final AuthService _authService = AuthService();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            if (_message != null) Text(_message!, style: TextStyle(color: Colors.red)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _register,
              // makai Hive
              // onPressed: () async {
              //   await _authService.register(
              //     _usernameController.text,
              //     _passwordController.text,
              //   );
              //   setState(() {
              //     _message = 'User registered successfully';
              //   });
              //   await Future.delayed(Duration(seconds: 2));
              //   Navigator.pop(context);
              // },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _register() async {
    final prefs = await SharedPreferences.getInstance();
    String? username = _usernameController.text;
    String? password = _passwordController.text;

    if (username.isNotEmpty && password.isNotEmpty) {
      prefs.setString('user_$username', password);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('User $username registered successfully')),
      );
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter both username and password')),
      );
    }
  }

}
