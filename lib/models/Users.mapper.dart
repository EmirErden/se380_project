// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'Users.dart';

class UsersMapper extends ClassMapperBase<Users> {
  UsersMapper._();

  static UsersMapper? _instance;
  static UsersMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UsersMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Users';

  static String _$username(Users v) => v.username;
  static const Field<Users, String> _f$username = Field('username', _$username);
  static String _$email(Users v) => v.email;
  static const Field<Users, String> _f$email = Field('email', _$email);
  static String _$password(Users v) => v.password;
  static const Field<Users, String> _f$password = Field('password', _$password);

  @override
  final MappableFields<Users> fields = const {
    #username: _f$username,
    #email: _f$email,
    #password: _f$password,
  };

  static Users _instantiate(DecodingData data) {
    return Users(
        data.dec(_f$username), data.dec(_f$email), data.dec(_f$password));
  }

  @override
  final Function instantiate = _instantiate;

  static Users fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Users>(map);
  }

  static Users fromJson(String json) {
    return ensureInitialized().decodeJson<Users>(json);
  }
}

mixin UsersMappable {
  String toJson() {
    return UsersMapper.ensureInitialized().encodeJson<Users>(this as Users);
  }

  Map<String, dynamic> toMap() {
    return UsersMapper.ensureInitialized().encodeMap<Users>(this as Users);
  }

  UsersCopyWith<Users, Users, Users> get copyWith =>
      _UsersCopyWithImpl(this as Users, $identity, $identity);
  @override
  String toString() {
    return UsersMapper.ensureInitialized().stringifyValue(this as Users);
  }

  @override
  bool operator ==(Object other) {
    return UsersMapper.ensureInitialized().equalsValue(this as Users, other);
  }

  @override
  int get hashCode {
    return UsersMapper.ensureInitialized().hashValue(this as Users);
  }
}

extension UsersValueCopy<$R, $Out> on ObjectCopyWith<$R, Users, $Out> {
  UsersCopyWith<$R, Users, $Out> get $asUsers =>
      $base.as((v, t, t2) => _UsersCopyWithImpl(v, t, t2));
}

abstract class UsersCopyWith<$R, $In extends Users, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? username, String? email, String? password});
  UsersCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _UsersCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Users, $Out>
    implements UsersCopyWith<$R, Users, $Out> {
  _UsersCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Users> $mapper = UsersMapper.ensureInitialized();
  @override
  $R call({String? username, String? email, String? password}) =>
      $apply(FieldCopyWithData({
        if (username != null) #username: username,
        if (email != null) #email: email,
        if (password != null) #password: password
      }));
  @override
  Users $make(CopyWithData data) => Users(
      data.get(#username, or: $value.username),
      data.get(#email, or: $value.email),
      data.get(#password, or: $value.password));

  @override
  UsersCopyWith<$R2, Users, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _UsersCopyWithImpl($value, $cast, t);
}
