import 'dart:convert';

import 'package:unitask_practicle_hardik/model/user_model.dart';
import 'package:unitask_practicle_hardik/network/repo/base_repo.dart';
import 'package:unitask_practicle_hardik/other/app_string.dart';

import '../api_utils.dart';

class UserRepo extends BaseRepo {
  Future<UserModel?> getUsersList() async {
    try {
      var response = await httpClient.get(Uri.parse(getUserUrl));
      if (response.statusCode == 200) {
        var userModel = UserModel.fromJson(json.decode(response.body));
        return userModel;
      } else {
        return Future.error(someThingWentWrong);
      }
    } catch (e) {
      return Future.error(someThingWentWrong);
    }
  }
}
