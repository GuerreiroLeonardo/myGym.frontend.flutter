import 'package:floor/floor.dart';
import 'package:my_gym_coach/src/domain/models/app_user.dart';
import 'package:my_gym_coach/src/utils/constants/strings.dart';

@dao
abstract class AppUserDao {
  @Query('SELECT * FROM $usersTableName WHERE email = :email;')
  Future<AppUser?> getUser(String email);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertUser(AppUser user);

  @delete
  Future<void> deleteUser(AppUser user);
}
