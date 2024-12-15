import 'package:dart_mappable/dart_mappable.dart';

part 'User.mapper.dart';

@MappableClass()
class User with UserMappable {
  final String username;
  final String email;
  final String password;
  final int score;
  final int addIndex;
  final int extIndex;
  final int multiIndex;
  final int divIndex;

  User(this.username, this.email, this.password, this.score, this.addIndex, this.extIndex, this.multiIndex, this.divIndex);
}