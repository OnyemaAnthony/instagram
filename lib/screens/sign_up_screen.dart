import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/colors.dart';
import '../widgets/text_field_input.dart';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(child: Container(),flex: 2,),
              SvgPicture.asset('assets/ic_instagram.svg',color:primaryColor,height:  64 ,),
              const SizedBox(height: 64,),
              TextFieldInput(textInputType: TextInputType.emailAddress, controller: emailController, hintText: 'Email'),
              const SizedBox(height: 24,),
              TextFieldInput(textInputType: TextInputType.text, controller: passwordController, hintText: 'Password',isPassword: true,),
              const SizedBox(height: 10,),
              Container(
                child: const Text('Login'),
                width: double.infinity,
                alignment: Alignment.center,
                padding:const  EdgeInsets.symmetric(vertical: 12),
                decoration: const ShapeDecoration(
                  color: blueColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4))
                  ),
                ),
              ),
              const SizedBox(height: 12,),
              Flexible(child: Container(),flex: 2,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: const Text("Don't have an account?"),),

                  GestureDetector(
                    onTap: (){

                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: const Text("Sign Up"),),
                  ),
                ],
              )

            ],
          ),
        ),
      ),
    );

  }
}
