import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class PhoneAuthScreen extends StatefulWidget {
  const PhoneAuthScreen({super.key});

  @override
  _PhoneAuthScreenState createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends State<PhoneAuthScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  String _verificationId = '';

  Future<void> verifyPhoneNumber(String phoneNumber) async {
    verificationCompleted(PhoneAuthCredential phoneAuthCredential) async {
      await _auth.signInWithCredential(phoneAuthCredential);
      // Navigate to logged in screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoggedInScreen()),
      );
    }

    verificationFailed(FirebaseAuthException authException) {
      print('Phone verification failed: ${authException.message}');
    }

    codeSent(String verificationId, int? resendToken) async {
      print('Code sent to $phoneNumber');
      _verificationId = verificationId;
    }

    codeAutoRetrievalTimeout(String verificationId) {
      _verificationId = verificationId;
    }

    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      timeout: const Duration(seconds: 60),
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }

  Future<void> signInWithPhoneNumber(String smsCode) async {
    try {
      AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId,
        smsCode: smsCode,
      );
      await _auth.signInWithCredential(credential);
      // Navigate to logged in screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoggedInScreen()),
      );
    } catch (e) {
      print('Failed to sign in with phone number: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Phone Auth Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _phoneNumberController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(labelText: 'Phone Number'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String phoneNumber = '+91${_phoneNumberController.text}';
                verifyPhoneNumber(phoneNumber);
              },
              child: const Text('Verify'),
            ),
            const SizedBox(height: 40),
            TextField(
              controller: _otpController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'OTP'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                signInWithPhoneNumber(_otpController.text);
              },
              child: const Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}

class LoggedInScreen extends StatelessWidget {
  const LoggedInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Logged In'),
      ),
      body: const Center(
        child: Text(
          'User is logged in!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}