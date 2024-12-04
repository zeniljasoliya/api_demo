import 'package:api_demo/post_api/network_post_api.dart';
import 'package:api_demo/post_api/user_req_model.dart';
import 'package:api_demo/post_api/user_resp_model.dart';
import 'package:flutter/material.dart';

class PostApiDemo extends StatefulWidget {
  const PostApiDemo({super.key});

  @override
  State<PostApiDemo> createState() => _PostApiDemoState();
}

class _PostApiDemoState extends State<PostApiDemo> {
  Future<UserResp>? futureUserResp;
  TextEditingController txtTitleController = TextEditingController();
  TextEditingController txtBodyController = TextEditingController();
  TextEditingController txtUserIdController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: txtTitleController,
            decoration: const InputDecoration(labelText: 'Title'),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: txtBodyController,
            decoration: const InputDecoration(labelText: 'Body'),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: txtUserIdController,
            decoration: const InputDecoration(labelText: 'UserId'),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              UserReq obj = UserReq(
                title: txtTitleController.text,
                body: txtBodyController.text,
                userId: int.parse(txtUserIdController.text),
              );
              futureUserResp = NetworkApi.createUser(data: userReqToJson(obj));
              setState(() {});
            },
            child: const Text('Submit'),
          ),
          const SizedBox(
            height: 10,
          ),
          FutureBuilder(
            future: futureUserResp,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.id.toString());
              } else {
                return const CircularProgressIndicator();
              }
            },
          )
        ],
      ),
    );
  }
}
