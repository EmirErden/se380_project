import 'package:dart_mappable/dart_mappable.dart';

part 'Users.mapper.dart';

@MappableClass()
class Users with UsersMappable {
  final String username;
  final String email;
  final String password;

  Users(this.username, this.email, this.password);
}