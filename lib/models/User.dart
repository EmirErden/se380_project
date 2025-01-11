import 'package:dart_mappable/dart_mappable.dart';

part 'User.mapper.dart';

@MappableClass()
class User with UserMappable {
  String username;
  String email;
  String password;
  int score;
  int addIndex;
  int extIndex;
  int multiIndex;
  int divIndex;
  int totalQuestions;
  List<int> daysEntered;
  String profilePicture;

  User(
      this.username,
      this.email,
      this.password,
      this.score,
      this.addIndex,
      this.extIndex,
      this.multiIndex,
      this.divIndex,
      this.totalQuestions,
      this.daysEntered,
      this.profilePicture);
}
