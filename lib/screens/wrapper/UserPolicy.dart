import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:vonette_mobile/services/database.dart';
import 'package:provider/provider.dart';
import 'package:vonette_mobile/models/user.dart';
import 'package:vonette_mobile/shared/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/gestures.dart';

class UserPolicy extends StatefulWidget {
  const UserPolicy({super.key});

  @override
  State<UserPolicy> createState() => _UserPolicyState();
}

class _UserPolicyState extends State<UserPolicy> {
  @override
  Widget build(BuildContext context) {
    double height_sc = MediaQuery.of(context).size.height;
    double width_sc = MediaQuery.of(context).size.width;
    final user = Provider.of<UserInApp?>(context);
    return Scaffold(
        body: Container(
            padding: (EdgeInsets.fromLTRB(width_sc * 0.1, 0, 0, 0)),
            child: Column(
              children: [
                Container(
                    padding: (EdgeInsets.fromLTRB(0, height_sc * 0.25, 0, 0)),
                    child: const Icon(
                      Icons.account_balance_outlined,
                      color: accentPurple,
                      size: 150,
                    )),
                Container(
                    padding: (EdgeInsets.fromLTRB(
                        width_sc * 0.2, height_sc * 0.01, 0, 0)),
                    width: width_sc * 0.8,
                    child: const Text(
                      "User Policy Agreement",
                      style: TextStyle(
                        color: Colors.black,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                Container(
                    padding: (EdgeInsets.fromLTRB(
                        width_sc * 0.05, height_sc * 0.02, width_sc * 0.05, 0)),
                    width: width_sc * 0.8,
                    child: RichText(
                        text: TextSpan(children: [
                      const TextSpan(
                          text: "By proceeding, you agree to Vonette's ",
                          style: TextStyle(color: Colors.black)),
                      TextSpan(
                          text: "Term's of Service",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () =>
                                launchUrl(Uri.parse('https://google.com')),
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          )),
                      const TextSpan(
                          text: " and ", style: TextStyle(color: Colors.black)),
                      TextSpan(
                          text: "Privacy Policy",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () =>
                                launchUrl(Uri.parse('https://google.com')),
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ))
                    ]))),
                Container(
                    margin: (EdgeInsets.fromLTRB(0, height_sc * 0.3, 0, 0)),
                    width: width_sc * 0.8,
                    height: height_sc * 0.05,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll<Color>(accentPurple)),
                        onPressed: (() =>
                            DatabaseService(user: user).updateUser()),
                        child: const Text(
                          "Accept",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ))),
                const TextButton(
                    onPressed: null,
                    child: Text(
                      "Decline",
                      style: TextStyle(color: accentPurple),
                    )),
              ],
            )));
  }
}
