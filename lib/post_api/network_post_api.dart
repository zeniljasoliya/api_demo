import 'package:api_demo/post_api/user_resp_model.dart';
import 'package:http/http.dart' as http;

class NetworkApi {
  static String userUrl = "https://jsonplaceholder.typicode.com/posts";
  static Future<UserResp> createUser({required String data}) async {
    final response = await http.post(Uri.parse(userUrl), body: data);
    // log(response.body);
    if (response.statusCode == 201) {
      return userRespFromJson(response.body);
    } else {
      throw Exception('Some error occured');
    }
  }
}
