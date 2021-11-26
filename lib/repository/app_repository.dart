import 'package:dio/dio.dart';
import 'package:lazy_loading/models/user.dart';

class AppRepository {
  final _dio = Dio();

  Future<List<User>> getUsers(int page) async {
    String urlBase = "https://randomuser.me/api/?page=$page&results=10";
    final response = await _dio.get(urlBase);
    return User.fromJsonList(response.data["results"])!;
  }
}
