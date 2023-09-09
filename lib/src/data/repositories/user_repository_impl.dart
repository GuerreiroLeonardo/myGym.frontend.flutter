import 'package:my_gym_coach/src/data/datasources/local/app_database.dart';
import 'package:my_gym_coach/src/domain/models/app_user.dart';
import 'package:my_gym_coach/src/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final AppDatabase _appDatabase;

  UserRepositoryImpl(this._appDatabase);

  @override
  Future<AppUser?> getSavedUser(String email) async {
    return _appDatabase.appUserDao.getUser(email);
  }

  @override
  Future<void> removeUser(AppUser user) async {
    return _appDatabase.appUserDao.deleteUser(user);
  }

  @override
  Future<void> saveUser(AppUser user) async {
    return _appDatabase.appUserDao.insertUser(user);
  }
}
