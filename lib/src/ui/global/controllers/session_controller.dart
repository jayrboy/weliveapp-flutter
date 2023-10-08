import 'package:weliveapp/src/domain/models/user.dart';

class SessionController {
  User? _user;
  User? get user => _user;

  void updateUser(User? user) {
    _user = user;
  }
}
