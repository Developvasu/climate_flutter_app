import 'package:http/http.dart' as http;

class NetworkHelper {
  String url;
  NetworkHelper({this.url});

  Future getResponse() async {
    String responseBody;
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      responseBody = response.body;
      print('Response' + responseBody);
    } else {
      print(response.statusCode);
    }
    return responseBody;
  }
}
