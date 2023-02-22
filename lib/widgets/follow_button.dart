import 'package:flutter/material.dart';

class FollowButton extends StatelessWidget {
  final Function()? onPressed;
  final Color? backgroundColor;
  final Color? borderColor;
  final String? text;
  final Color? textColor;
  const FollowButton({Key? key,this.onPressed,this.backgroundColor,this.borderColor,this.text,this.textColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 28),
          child: TextButton(
            onPressed: onPressed!,
            child: Container(
              decoration: BoxDecoration(
                color: backgroundColor,
                border: Border.all(color: borderColor!),
                borderRadius: BorderRadius.circular(5)
              ),
              alignment: Alignment.center,
              child:Text(text!,style: TextStyle(color: textColor,fontWeight: FontWeight.bold),) ,
            ),

          ),
    );
  }
}
