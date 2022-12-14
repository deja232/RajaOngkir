part of 'services.dart';

class RajaOngkirServices {
  static Future<http.Response> getOngkir() {
    return http.post(Uri.https(Const.baseUrl, "/starter/cost"),
        headers: <String, String>{
          'Content - Type': 'application/json; charset=UTF-8',
          'key': Const.apiKey,
        },
        body: jsonEncode(<String, dynamic>{
          'origin': '121',
          'destination': '100',
          'weight': 1700,
          'courier': 'sicepat',
        }));
  }
}
