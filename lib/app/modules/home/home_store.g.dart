// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on HomeStoreBase, Store {
  final _$usersAtom = Atom(name: 'HomeStoreBase.users');

  @override
  ObservableFuture<List<User>> get users {
    _$usersAtom.reportRead();
    return super.users;
  }

  @override
  set users(ObservableFuture<List<User>> value) {
    _$usersAtom.reportWrite(value, super.users, () {
      super.users = value;
    });
  }

  final _$currentPageAtom = Atom(name: 'HomeStoreBase.currentPage');

  @override
  int get currentPage {
    _$currentPageAtom.reportRead();
    return super.currentPage;
  }

  @override
  set currentPage(int value) {
    _$currentPageAtom.reportWrite(value, super.currentPage, () {
      super.currentPage = value;
    });
  }

  final _$getMoreUsersAsyncAction = AsyncAction('HomeStoreBase.getMoreUsers');

  @override
  Future getMoreUsers() {
    return _$getMoreUsersAsyncAction.run(() => super.getMoreUsers());
  }

  @override
  String toString() {
    return '''
users: ${users},
currentPage: ${currentPage}
    ''';
  }
}
