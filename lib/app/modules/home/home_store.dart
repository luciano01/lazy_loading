import 'package:lazy_loading/app/shared/models/user.dart';
import 'package:lazy_loading/app/shared/repository/app_repository_interface.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final IAppRepository _repository;

  HomeStoreBase(this._repository) {
    getMoreUsers();
  }

  @observable
  ObservableFuture<List<User>> users = ObservableFuture.value([]);

  @observable
  int currentPage = 0;

  @action
  getMoreUsers() async {
    currentPage++;
    final List<User>? data = await _repository.getUsers(currentPage);
    users = ObservableFuture.value(users.value!..addAll(data!));
  }
}
