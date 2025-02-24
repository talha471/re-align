import 'package:get_storage/get_storage.dart';

class Preferences {
  final storage = GetStorage();

  
  void setUser(Map<String,dynamic> user) => storage.write("user", user);
  getUser() => storage.read("user");

  void setUserToken(String token) => storage.write("token", token);
  getUserToken() => storage.read("token");

  removeToken2_0() => storage.remove("token");

 
}
