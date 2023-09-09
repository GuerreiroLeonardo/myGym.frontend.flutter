import '../models/app_user.dart';

abstract class UserRepository {
  Future<AppUser?> getSavedUser(String email);

  Future<void> saveUser(AppUser user);

  Future<void> removeUser(AppUser user);
}
