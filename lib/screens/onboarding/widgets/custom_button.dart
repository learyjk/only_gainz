import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final TabController tabController;
  final TextEditingController? emailController;
  final TextEditingController? passwordController;
  final String text;

  const CustomButton(
      {Key? key,
      required this.tabController,
      required this.text,
      this.emailController,
      this.passwordController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            gradient: LinearGradient(colors: [
              Theme.of(context).primaryColor,
              Theme.of(context).accentColor
            ])),
        child: ElevatedButton(
          onPressed: () async {
            if (emailController != null && passwordController != null) {
              await FirebaseAuth.instance
                  .createUserWithEmailAndPassword(
                      email: emailController!.text,
                      password: passwordController!.text)
                  .then((value) => print("User Added"))
                  .catchError((error) => print("Failed to add user."));
            }
            tabController.animateTo(tabController.index + 1);
          },
          child: Container(
            width: double.infinity,
            child: Center(
              child: Text(
                text,
                style: Theme.of(context)
                    .textTheme
                    .headline3!
                    .copyWith(color: Colors.white),
              ),
            ),
          ),
          style: ElevatedButton.styleFrom(
              elevation: 0, primary: Colors.transparent),
        ));
  }
}
