import 'package:dio/dio.dart';

import '../models/event_model.dart';

class EventRemoteData {
  final Dio dio;

  EventRemoteData({required this.dio});

  Future createEvent({required Map<String, dynamic> event}) async {
    Response res = await dio.post(
      '/events/create/',
      data: FormData.fromMap(event),
    );
    if (res.statusCode != 201) {
      throw Exception('Error');
    }
  }

  Future getEvents() async {
    Response res = await dio.get('/events/all');

    if (res.statusCode == 200) {
      return EventModel.fromJson(res.data);
    } else {
      throw Exception('Error');
    }
  }
}
