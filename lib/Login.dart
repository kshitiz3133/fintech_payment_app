import 'dart:async';
import 'package:flutter/material.dart';

// Mock authentication service
class AuthService {
  final _authStreamController = StreamController<bool>();

  // Simulated authentication function
  Future<void> login(String username, String password) async {
    // Simulate network request
    await Future.delayed(Duration(seconds: 2));
    // Emit authentication state change
    _authStreamController.add(true);
  }

  // Log out
  Future<void> logout() async {
    _authStreamController.add(false);
  }

  // Expose authentication state stream
  Stream<bool> get authState => _authStreamController.stream;
}

class LoginForm extends StatefulWidget {
  final AuthService authService;

  LoginForm({required this.authService});

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    final String username = _usernameController.text;
    final String password = _passwordController.text;
    widget.authService.login(username, password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final AuthService authService;

  HomePage({required this.authService});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              authService.logout();
            },
          ),
        ],
      ),
      body: Center(
        child: Text('Welcome!'),
      ),
    );
  }
}


class MyApp extends StatelessWidget {
  final AuthService authService;

  MyApp({required this.authService});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        stream: authService.authState,
        initialData: false,
        builder: (context, snapshot) {
          if (snapshot.data == true) {
            return HomePage(authService: authService);
          } else {
            return LoginForm(authService: authService);
          }
        },
    );
  }
}
