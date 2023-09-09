import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

import '../../utils/constants/strings.dart';

@Entity(tableName: usersTableName)
class AppUser extends Equatable {
  @PrimaryKey(autoGenerate: true)
  final String? id;
  final String? name;
  final String? email;
  final String? photoURL;

  const AppUser({
    this.id,
    this.name,
    this.email,
    this.photoURL,
  });

  AppUser copyWith({
    String? id,
    String? name,
    String? email,
    String? photoURL,
  }) {
    return AppUser(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      photoURL: photoURL ?? this.photoURL,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'photoURL': photoURL,
    };
  }

  factory AppUser.fromJson(Map<String, dynamic> json) {
    return AppUser(
      id: json['id'] != null ? json['id'] as String : null,
      name: json['name'] != null ? json['name'] as String : null,
      email: json['email'] != null ? json['email'] as String : null,
      photoURL: json['photoURL'] != null ? json['photoURL'] as String : null,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, name, email, photoURL];
}
