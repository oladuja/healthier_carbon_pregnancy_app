import 'dart:convert';
import 'package:http/http.dart' as http;

//Auth token we will use to generate a meeting and connect to it
const String token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhcGlrZXkiOiI2ZTdjNzJlMS0xNDgxLTQ5ZjctOTc3Yi02OTA4MDZkODZmN2YiLCJwZXJtaXNzaW9ucyI6WyJhbGxvd19qb2luIl0sImlhdCI6MTY5NTg0NjU0MSwiZXhwIjoxNzI3MzgyNTQxfQ.55gvwclO3IpoT7WnLB3yKo6UcstC2OdhQ_V3CGDSRVQ";

// API call to create meeting
Future<String> createMeeting() async {
  final http.Response httpResponse = await http.post(
    Uri.parse('https://api.videosdk.live/v2/rooms'),
    headers: {'Authorization': token},
  );

//Destructuring the roomId from the response
  return json.decode(httpResponse.body)['roomId'];
}