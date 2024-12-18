// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'Question.dart';

class QuestionMapper extends ClassMapperBase<Question> {
  QuestionMapper._();

  static QuestionMapper? _instance;
  static QuestionMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = QuestionMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Question';

  static int _$id(Question v) => v.id;
  static const Field<Question, int> _f$id = Field('id', _$id);
  static String _$firstNumber(Question v) => v.firstNumber;
  static const Field<Question, String> _f$firstNumber =
      Field('firstNumber', _$firstNumber);
  static String _$secondNumber(Question v) => v.secondNumber;
  static const Field<Question, String> _f$secondNumber =
      Field('secondNumber', _$secondNumber);
  static Map<String, bool> _$options(Question v) => v.options;
  static const Field<Question, Map<String, bool>> _f$options =
      Field('options', _$options);

  @override
  final MappableFields<Question> fields = const {
    #id: _f$id,
    #firstNumber: _f$firstNumber,
    #secondNumber: _f$secondNumber,
    #options: _f$options,
  };

  static Question _instantiate(DecodingData data) {
    return Question(
        id: data.dec(_f$id),
        firstNumber: data.dec(_f$firstNumber),
        secondNumber: data.dec(_f$secondNumber),
        options: data.dec(_f$options));
  }

  @override
  final Function instantiate = _instantiate;

  static Question fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Question>(map);
  }

  static Question fromJson(String json) {
    return ensureInitialized().decodeJson<Question>(json);
  }
}

mixin QuestionMappable {
  String toJson() {
    return QuestionMapper.ensureInitialized()
        .encodeJson<Question>(this as Question);
  }

  Map<String, dynamic> toMap() {
    return QuestionMapper.ensureInitialized()
        .encodeMap<Question>(this as Question);
  }

  QuestionCopyWith<Question, Question, Question> get copyWith =>
      _QuestionCopyWithImpl(this as Question, $identity, $identity);
  @override
  String toString() {
    return QuestionMapper.ensureInitialized().stringifyValue(this as Question);
  }

  @override
  bool operator ==(Object other) {
    return QuestionMapper.ensureInitialized()
        .equalsValue(this as Question, other);
  }

  @override
  int get hashCode {
    return QuestionMapper.ensureInitialized().hashValue(this as Question);
  }
}

extension QuestionValueCopy<$R, $Out> on ObjectCopyWith<$R, Question, $Out> {
  QuestionCopyWith<$R, Question, $Out> get $asQuestion =>
      $base.as((v, t, t2) => _QuestionCopyWithImpl(v, t, t2));
}

abstract class QuestionCopyWith<$R, $In extends Question, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  MapCopyWith<$R, String, bool, ObjectCopyWith<$R, bool, bool>> get options;
  $R call(
      {int? id,
      String? firstNumber,
      String? secondNumber,
      Map<String, bool>? options});
  QuestionCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _QuestionCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Question, $Out>
    implements QuestionCopyWith<$R, Question, $Out> {
  _QuestionCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Question> $mapper =
      QuestionMapper.ensureInitialized();
  @override
  MapCopyWith<$R, String, bool, ObjectCopyWith<$R, bool, bool>> get options =>
      MapCopyWith($value.options, (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(options: v));
  @override
  $R call(
          {int? id,
          String? firstNumber,
          String? secondNumber,
          Map<String, bool>? options}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (firstNumber != null) #firstNumber: firstNumber,
        if (secondNumber != null) #secondNumber: secondNumber,
        if (options != null) #options: options
      }));
  @override
  Question $make(CopyWithData data) => Question(
      id: data.get(#id, or: $value.id),
      firstNumber: data.get(#firstNumber, or: $value.firstNumber),
      secondNumber: data.get(#secondNumber, or: $value.secondNumber),
      options: data.get(#options, or: $value.options));

  @override
  QuestionCopyWith<$R2, Question, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _QuestionCopyWithImpl($value, $cast, t);
}
