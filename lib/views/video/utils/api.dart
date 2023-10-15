import 'dart:convert';
import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:healthier_carbon_pregnancy_app/views/video/utils/toast.dart';
import 'package:http/http.dart' as http;
Future<String> fetchToken(BuildContext context) async {
  if (!dotenv.isInitialized) {
    // Load Environment variables
    await dotenv.load(fileName: ".env");
  }
  final String? authUrl = dotenv.env['AUTH_URL'];
  String? authToken = dotenv.env['AUTH_TOKEN'];

  if ((authToken?.isEmpty ?? true) && (authUrl?.isEmpty ?? true)) {
    showSnackBarMessage(
        message: "Please set the environment variables", context: context);
    throw Exception("Either AUTH_TOKEN or AUTH_URL is not set in .env file");
  }

  if ((authToken?.isNotEmpty ?? false) && (authUrl?.isNotEmpty ?? false)) {
    showSnackBarMessage(
        message: "Please set only one environment variable", context: context);
    throw Exception("Either AUTH_TOKEN or AUTH_URL can be set in .env file");
  }

  if (authUrl?.isNotEmpty ?? false) {
    final Uri getTokenUrl = Uri.parse('$authUrl/get-token');
    final http.Response tokenResponse = await http.get(getTokenUrl);
    authToken = json.decode(tokenResponse.body)['token'];
  }

  return authToken ?? "";
}

Future<String> createMeeting(String token) async {
  final String? videosdkApiEndpoint = dotenv.env['VIDEOSDK_API_ENDPOINT'];

  final Uri getMeetingIdUrl = Uri.parse('$videosdkApiEndpoint/rooms');
  final http.Response meetingIdResponse =
      await http.post(getMeetingIdUrl, headers: {
    "Authorization": token,
  });

  if (meetingIdResponse.statusCode != 200) {
    throw Exception(json.decode(meetingIdResponse.body)["error"]);
  }
  var meetingID = json.decode(meetingIdResponse.body)['roomId'];
  return meetingID;
}

Future<bool> validateMeeting(String token, String meetingId) async {
  final String? videosdkApiEndpoint = dotenv.env['VIDEOSDK_API_ENDPOINT'];

  final Uri validateMeetingUrl =
      Uri.parse('$videosdkApiEndpoint/rooms/validate/$meetingId');
  final http.Response validateMeetingResponse =
      await http.get(validateMeetingUrl, headers: {
    "Authorization": token,
  });

  if (validateMeetingResponse.statusCode != 200) {
    throw Exception(json.decode(validateMeetingResponse.body)["error"]);
  }

  return validateMeetingResponse.statusCode == 200;
}

Future<dynamic> fetchSession(String token, String meetingId) async {
  final String? videosdkApiEndpoint = dotenv.env['VIDEOSDK_API_ENDPOINT'];

  final Uri getMeetingIdUrl =
      Uri.parse('$videosdkApiEndpoint/sessions?roomId=$meetingId');
  final http.Response meetingIdResponse =
      await http.get(getMeetingIdUrl, headers: {
    "Authorization": token,
  });
  List<dynamic> sessions = jsonDecode(meetingIdResponse.body)['data'];
  return sessions.first;
}

Future<dynamic> fetchActiveHls(String token, String meetingId) async {
  final String? videosdkApiEndpoint = dotenv.env['VIDEOSDK_API_ENDPOINT'];

  final Uri getActiveHlsUrl =
      Uri.parse('$videosdkApiEndpoint/hls/$meetingId/active');
  final http.Response response = await http.get(getActiveHlsUrl, headers: {
    "Authorization": token,
  });
  Map<dynamic, dynamic> activeHls = jsonDecode(response.body)['data'];
  return activeHls;
}

Future<dynamic> fetchHls(String url) async {
  final http.Response response = await http.get(Uri.parse(url));
  log(response.body);
  return response.statusCode;
}
