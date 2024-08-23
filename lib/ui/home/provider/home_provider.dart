import 'package:flutter/material.dart';
import 'package:unitask_practicle_hardik/network/repo/user_repo.dart';
import 'package:unitask_practicle_hardik/other/extensions.dart';

import '../../../model/user_model.dart';

class HomeProvider with ChangeNotifier {
  HomeProvider(this._userRepo);

  final UserRepo _userRepo;

  UserModel? userModel;
  List<Users> usersList = [];
  List<Users> searchUserList = [];
  var isLoading = false;

  void init() {
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    startLoading();
    _userRepo.getUsersList().then(
      (value) {
        usersList.clear();
        searchUserList.clear();
        userModel = value;
        usersList.addAll(userModel?.users ?? []);
        searchUserList.addAll(userModel?.users ?? []);
        stopLoading();
      },
    ).onError(
      (error, stackTrace) {
        stopLoading();
        if (error.toString().isNotEmpty) {
          error.toString().showSnackBar;
        }
      },
    );
  }

  void startLoading() {
    isLoading = true;
    notifyListeners();
  }

  void stopLoading() {
    isLoading = false;
    notifyListeners();
  }

  void onChange(String value) {
    searchUserList.clear();
    if (value.isNotEmpty) {
      searchUserList.addAll(usersList
          .where(
            (element) =>
                element.firstName
                    ?.toLowerCase()
                    .trim()
                    .contains(value.toLowerCase().trim()) ??
                false,
          )
          .toList());
      searchUserList.addAll(usersList
          .where(
            (element) =>
                element.lastName
                    ?.toLowerCase()
                    .trim()
                    .contains(value.toLowerCase().trim()) ??
                false,
          )
          .toList());
      searchUserList.addAll(usersList
          .where(
            (element) =>
                element.maidenName
                    ?.toLowerCase()
                    .trim()
                    .contains(value.toLowerCase().trim()) ??
                false,
          )
          .toList());
      searchUserList.addAll(usersList
          .where(
            (element) =>
                element.ssn
                    ?.toLowerCase()
                    .trim()
                    .contains(value.toLowerCase().trim()) ??
                false,
          )
          .toList());
    } else {
      searchUserList.addAll(usersList);
    }
    notifyListeners();
  }
}
