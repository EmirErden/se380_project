// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'User.dart';

class UserMapper extends ClassMapperBase<User> {
  UserMapper._();

  static UserMapper? _instance;
  static UserMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'User';

  static String _$username(User v) => v.username;
  static const Field<User, String> _f$username = Field('username', _$username);
  static String _$email(User v) => v.email;
  static const Field<User, String> _f$email = Field('email', _$email);
  static String _$password(User v) => v.password;
  static const Field<User, String> _f$password = Field('password', _$password);
  static int _$score(User v) => v.score;
  static const Field<User, int> _f$score = Field('score', _$score);
  static int _$addIndex(User v) => v.addIndex;
  static const Field<User, int> _f$addIndex = Field('addIndex', _$addIndex);
  static int _$extIndex(User v) => v.extIndex;
  static const Field<User, int> _f$extIndex = Field('extIndex', _$extIndex);
  static int _$multiIndex(User v) => v.multiIndex;
  static const Field<User, int> _f$multiIndex =
      Field('multiIndex', _$multiIndex);
  static int _$divIndex(User v) => v.divIndex;
  static const Field<User, int> _f$divIndex = Field('divIndex', _$divIndex);
  static int _$totalQuestions(User v) => v.totalQuestions;
  static const Field<User, int> _f$totalQuestions =
      Field('totalQuestions', _$totalQuestions);
  static List<int> _$daysEntered(User v) => v.daysEntered;
  static const Field<User, List<int>> _f$daysEntered =
      Field('daysEntered', _$daysEntered);
  static String _$profilePicture(User v) => v.profilePicture;
  static const Field<User, String> _f$profilePicture =
      Field('profilePicture', _$profilePicture);

  @override
  final MappableFields<User> fields = const {
    #username: _f$username,
    #email: _f$email,
    #password: _f$password,
    #score: _f$score,
    #addIndex: _f$addIndex,
    #extIndex: _f$extIndex,
    #multiIndex: _f$multiIndex,
    #divIndex: _f$divIndex,
    #totalQuestions: _f$totalQuestions,
    #daysEntered: _f$daysEntered,
    #profilePicture: _f$profilePicture,
  };

  static User _instantiate(DecodingData data) {
    return User(
        data.dec(_f$username),
        data.dec(_f$email),
        data.dec(_f$password),
        data.dec(_f$score),
        data.dec(_f$addIndex),
        data.dec(_f$extIndex),
        data.dec(_f$multiIndex),
        data.dec(_f$divIndex),
        data.dec(_f$totalQuestions),
        data.dec(_f$daysEntered),
        data.dec(_f$profilePicture));
  }

  @override
  final Function instantiate = _instantiate;

  static User fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<User>(map);
  }

  static User fromJson(String json) {
    return ensureInitialized().decodeJson<User>(json);
  }
}

mixin UserMappable {
  String toJson() {
    return UserMapper.ensureInitialized().encodeJson<User>(this as User);
  }

  Map<String, dynamic> toMap() {
    return UserMapper.ensureInitialized().encodeMap<User>(this as User);
  }

  UserCopyWith<User, User, User> get copyWith =>
      _UserCopyWithImpl(this as User, $identity, $identity);
  @override
  String toString() {
    return UserMapper.ensureInitialized().stringifyValue(this as User);
  }

  @override
  bool operator ==(Object other) {
    return UserMapper.ensureInitialized().equalsValue(this as User, other);
  }

  @override
  int get hashCode {
    return UserMapper.ensureInitialized().hashValue(this as User);
  }
}

extension UserValueCopy<$R, $Out> on ObjectCopyWith<$R, User, $Out> {
  UserCopyWith<$R, User, $Out> get $asUser =>
      $base.as((v, t, t2) => _UserCopyWithImpl(v, t, t2));
}

abstract class UserCopyWith<$R, $In extends User, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get daysEntered;
  $R call(
      {String? username,
      String? email,
      String? password,
      int? score,
      int? addIndex,
      int? extIndex,
      int? multiIndex,
      int? divIndex,
      int? totalQuestions,
      List<int>? daysEntered,
      String? profilePicture});
  UserCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _UserCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, User, $Out>
    implements UserCopyWith<$R, User, $Out> {
  _UserCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<User> $mapper = UserMapper.ensureInitialized();
  @override
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get daysEntered =>
      ListCopyWith(
          $value.daysEntered,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(daysEntered: v));
  @override
  $R call(
          {String? username,
          String? email,
          String? password,
          int? score,
          int? addIndex,
          int? extIndex,
          int? multiIndex,
          int? divIndex,
          int? totalQuestions,
          List<int>? daysEntered,
          String? profilePicture}) =>
      $apply(FieldCopyWithData({
        if (username != null) #username: username,
        if (email != null) #email: email,
        if (password != null) #password: password,
        if (score != null) #score: score,
        if (addIndex != null) #addIndex: addIndex,
        if (extIndex != null) #extIndex: extIndex,
        if (multiIndex != null) #multiIndex: multiIndex,
        if (divIndex != null) #divIndex: divIndex,
        if (totalQuestions != null) #totalQuestions: totalQuestions,
        if (daysEntered != null) #daysEntered: daysEntered,
        if (profilePicture != null) #profilePicture: profilePicture
      }));
  @override
  User $make(CopyWithData data) => User(
      data.get(#username, or: $value.username),
      data.get(#email, or: $value.email),
      data.get(#password, or: $value.password),
      data.get(#score, or: $value.score),
      data.get(#addIndex, or: $value.addIndex),
      data.get(#extIndex, or: $value.extIndex),
      data.get(#multiIndex, or: $value.multiIndex),
      data.get(#divIndex, or: $value.divIndex),
      data.get(#totalQuestions, or: $value.totalQuestions),
      data.get(#daysEntered, or: $value.daysEntered),
      data.get(#profilePicture, or: $value.profilePicture));

  @override
  UserCopyWith<$R2, User, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _UserCopyWithImpl($value, $cast, t);
}
