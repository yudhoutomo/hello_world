import 'package:flutter/foundation.dart';

class Config {
  static const baseUrl = 'https://api.nuryazid.com';
  static const apiKey = 'API_KEY';
  static const notificationChannelId = 'hello_world_channel_id';
  static const notificationChannelName = 'hello_world notification';
  static const notificationChannelDesc = 'hello_world notification';
  static const savedNotification = 'FCM_MESSAGE';
  static const timeout = kDebugMode ? 90 * 1000 : 10 * 1000;
}
