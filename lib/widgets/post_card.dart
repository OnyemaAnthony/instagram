import 'package:flutter/material.dart';
import 'package:instagram/models/post_Model.dart';
import 'package:instagram/models/user_model.dart';
import 'package:instagram/providers/user_provider.dart';
import 'package:instagram/resources/firestore_methos.dart';
import 'package:instagram/screens/commet_screen.dart';
import 'package:instagram/screens/like_animation.dart';
import 'package:instagram/utils/utils.dart';
import '../utils/colors.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:provider/provider.dart';

class PostCard extends StatefulWidget {
  PostModel? post;

  PostCard({Key? key, this.post}) : super(key: key);

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool isLikeAnimating = false;
  
  @override
  Widget build(BuildContext context) {
    UserModel user = Provider.of<UserProvider>(context).getUser;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16)
                .copyWith(
              right: 0,
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundImage: NetworkImage(
                    widget.post!.profileImage!,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.post!.userName!,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              child: ListView(
                                shrinkWrap: true,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                children: [
                                  'Delete',
                                ]
                                    .map((e) => InkWell(
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 12, horizontal: 16),
                                          ),
                                          onTap: () {},
                                        ))
                                    .toList(),
                              ),
                            );
                          });
                    },
                    icon: const Icon(Icons.more_vert))
              ],
            ),
          ),
          GestureDetector(
            onDoubleTap: ()async{
              await FirestoreMethos().likePost(widget.post!.id!, user.id!, widget.post!.likes!);
              setState(() {
                isLikeAnimating = true;
              });
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.35,
                  width: double.infinity,
                  child: Image.network(
                    // 'https://images.unsplash.com/photo-1660850889008-e26c9fd0772c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80',
                    widget.post!.photoUrl!,
                    fit: BoxFit.cover,
                  ),
                ),
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  opacity: isLikeAnimating? 1:0,
                  onEnd: (){
                    setState(() {
                      isLikeAnimating =false;
                    });
                  },
                  child: LikeAnimation(child: const Icon(Icons.favorite,color: Colors.white,size: 120,), isAnimation: isLikeAnimating,
                  duration: const Duration(milliseconds: 400),
                  ),
                )
              ],
            ),
          ),
          Row(
            children: [
              LikeAnimation(
                isAnimation: widget.post!.likes!.contains(user.id),
                smallLike: true,
                child: IconButton(
                    onPressed: ()async {
                      await FirestoreMethos().likePost(widget.post!.id!, user.id!, widget.post!.likes!);

                    },
                    icon: widget.post!.likes!.contains(user.id)? const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ):const Icon(Icons.favorite_border)),
              ),
              IconButton(
                  onPressed: () {
                    push(context,CommentScreen() );
                  },
                  icon: const Icon(
                    Icons.comment_outlined,
                  )),
              IconButton(onPressed: () {}, icon: const Icon(Icons.send)),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.bookmark_add),
                  ),
                ),
              )
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultTextStyle(
                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
                          fontWeight: FontWeight.w800,
                        ),
                    child: Text('${widget.post!.likes!.length}likes',
                        style: Theme.of(context).textTheme.bodyText2)),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 8),
                  child: RichText(
                    text: TextSpan(
                        style: const TextStyle(color: Colors.white),
                        children: [
                          TextSpan(
                            text: widget.post!.userName,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: ' ${widget.post!.descriptions}',
                          ),
                        ]),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 14,
                    ),
                    child: const Text(
                      'View all 200 comments',
                      style: TextStyle(
                        fontSize: 16,
                        color: secondaryColor,
                      ),
                    ),
                  ),
                ),
                Text(
                  timeago.format(DateTime.parse(widget.post!.createdAt!)),
                  style: const TextStyle(
                    fontSize: 16,
                    color: secondaryColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      color: mobileBackgroundColor,
    );
  }
}
