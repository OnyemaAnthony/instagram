import 'package:flutter/material.dart';
import '../utils/colors.dart';

class PostCard extends StatelessWidget {
  const PostCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=986&q=80',
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
                          'Username',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                IconButton(onPressed:(){
                 showDialog(context: context, builder: (context){
                   return Dialog(
                     child: ListView(
                       shrinkWrap: true,
                       padding: const EdgeInsets.symmetric(vertical:16 ),
                       children: [
                         'Delete',
                       ].map((e) => InkWell(
                         child: Container(
                           padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 16),
                         ),

                         onTap: (){

                       },)).toList(),
                     ),
                   );
                 });
                }, icon:const Icon(Icons.more_vert))
              ],
            ),

          ),
          SizedBox(
            height: MediaQuery.of(context).size.height *0.35,
            width: double.infinity,
            child: Image.network('',fit: BoxFit.cover,),
          ),
          Row(
            children: [
              IconButton(onPressed:(){

              }, icon: const Icon(Icons.favorite,color: Colors.red,)),

              IconButton(onPressed:(){

              }, icon: const Icon(Icons.comment_outlined,)),

              IconButton(onPressed:(){

              }, icon: const Icon(Icons.send)),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                    onPressed: (){

                    },
                    icon: Icon(Icons.bookmark_add),
                  ),
                ),
              )

            ],
          ),
        ],
      ),
      color: mobileBackgroundColor,
    );
  }
}
