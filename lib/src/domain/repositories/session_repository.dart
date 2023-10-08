import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:weliveapp/src/domain/models/user.dart';

abstract class SessionRepository {
  Future<User?> get user;
  Future<LoginResult> logIn();
  Future<void> logOut();
}
