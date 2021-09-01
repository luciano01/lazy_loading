import 'package:lazy_loading/app/shared/models/user.dart';

abstract class IAppRepository {
  Future<List<User>>? getUsers(int page);
}
