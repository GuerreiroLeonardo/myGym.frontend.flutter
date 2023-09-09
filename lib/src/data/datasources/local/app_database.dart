import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../../../domain/models/article.dart';
import '../../../domain/models/app_user.dart';
import 'dao/article_dao.dart';
import 'converters/source_type_converter.dart';
import 'dao/app_user_dao.dart';

part 'app_database.g.dart';

@TypeConverters([SourceTypeConverter])
@Database(version: 1, entities: [Article, AppUser])
abstract class AppDatabase extends FloorDatabase {
  ArticleDao get articleDao;
  AppUserDao get appUserDao;
}
