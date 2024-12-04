import 'package:api_demo/comment.model.dart';
import 'package:api_demo/network_api.dart';
import 'package:flutter/material.dart';

class GetApiDemo extends StatefulWidget {
  const GetApiDemo({super.key});

  @override
  State<GetApiDemo> createState() => _GetApiDemoState();
}

class _GetApiDemoState extends State<GetApiDemo> {
  late Future<List<Comment>> futureCommentData;

  @override
  void initState() {
    futureCommentData = NetworkApi.fetchCommentData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: futureCommentData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) => ListTile(
                leading: CircleAvatar(
                  child: Text(snapshot.data![index].postId.toString()),
                ),
                title: Text(snapshot.data![index].name),
                subtitle: Text(snapshot.data![index].email),
                trailing: Text(snapshot.data![index].id.toString()),
              ),
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
