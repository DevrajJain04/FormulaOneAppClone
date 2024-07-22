import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:formula1/constants/constants.dart';
import 'package:formula1/widgets/delayed_button.dart';

class VerifyEmailPage extends StatefulWidget {
  const VerifyEmailPage({super.key});

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Check your email',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          // add timer to wait for 30 seconds before user can ask for another mail

          DelayedButton(
              text: 'Didn\'t receive email ? resend ?',
              onPressed: () async {
                await FirebaseAuth.instance.currentUser!
                    .sendEmailVerification();
              }),
          TextButton(
              onPressed: () {
                if (FirebaseAuth.instance.currentUser!.emailVerified == true) {
                  Navigator.of(context).pushNamed(loginRoute);
                }
              },
              child: Text('done'))
        ],
      ),
    );
  }
}
