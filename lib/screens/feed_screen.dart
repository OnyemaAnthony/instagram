import 'package:flutter/material.dart';
import 'package:instagram/utils/colors.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram/widgets/post_card.dart';
class FeedScreen extends StatelessWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: mobileBackgroundColor,
        title: SvgPicture.asset('assets/ic_instagram.svg',color: Colors.white,height: 32,),
        actions: [
          IconButton(onPressed:(){

          }, icon: const Icon(Icons.messenger_outline_rounded)),
        ],
      ),
      body: PostCard(),
    );
  }
}
