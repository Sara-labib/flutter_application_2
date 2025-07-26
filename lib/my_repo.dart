import 'package:flutter_application_2/user.dart';
import 'package:flutter_application_2/web_services.dart';

class MyRepo {
  final WebServices webServices;

  MyRepo(this.webServices);

  Future<List<User>> getAllUsers() async {
    return await webServices.getAllUsers();
  }

  Future<User> getUserById(int userId) async {
    return await webServices.getUserById(userId);
  }

  Future<User> createNewUser(User newUser) async {
    return await webServices.createNewUser(newUser,
        "Bearer 62ca824f9619bc3d91bdf93b207cd7cf680194b94a2c0f073c2ed3c6790383a1");
  }

  Future<dynamic> deleteUser(String id) async {
    return await webServices.deleteUser(id,
        "Bearer 62ca824f9619bc3d91bdf93b207cd7cf680194b94a2c0f073c2ed3c6790383a1");
  }
}
