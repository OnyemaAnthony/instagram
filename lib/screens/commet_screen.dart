import 'package:flutter/material.dart';
import 'package:instagram/utils/colors.dart';

import '../widgets/comment_card.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({Key? key}) : super(key: key);

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: const Text('Comments'),
        centerTitle: false,
      ),
      body: CommentCard(),
      bottomNavigationBar: SafeArea(
        child: Container(
          height: kToolbarHeight,
          margin:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          padding: const EdgeInsets.only(left: 16, right: 8),
          child: Row(
            children:  [
              CircleAvatar(
                radius: 18,
                backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1660850889008-e26c9fd0772c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80'),
              ),
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 16, right: 8),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Comment as Username',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: (){

                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 8),
                  child: const Text('Post',style: TextStyle(color: blueColor),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}