import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';

Future<void> postLocation({
  required String deviceId,
  required double latitude,
  required double longitude,
  required String timestamp,
}) async {
  final dio = Dio();
  final url = "http://10.0.0.15:8000/location";

  try {
    final response = await dio.post(
      url,
      data: {
        "device_id": deviceId,
        "latitude": latitude,
        "longitude": longitude,
        "timestamp": timestamp,
      },
      options: Options(headers: {"Content-Type": "application/json"}),
    );

    if (response.statusCode == 200) {
      print("Location posted successfully.");
    } else {
      print("Failed: ${response.statusCode}");
    }
  } catch (e) {
    print("Error posting location: $e");
  }
}
