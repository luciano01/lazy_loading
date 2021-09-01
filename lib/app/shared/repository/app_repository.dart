import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lazy_loading/app/shared/models/user.dart';

import 'app_repository_interface.dart';

class AppRepository implements IAppRepository, Disposable {
  final _dio = Dio();

  Future<List<User>> getUsers(int page) async {
    String urlBase = "https://randomuser.me/api/?page=$page&results=10";
    final response = await _dio.get(urlBase);
    return User.fromJsonList(response.data["results"])!;
  }

  @override
  void dispose() {
    _dio.close();
  }
}
