enum GenderType {
  MALE(0, '남자', 'MALE'),
  FEMALE(1, '여자', 'FEMALE'),
  NONE(2, '', 'NONE');

  const GenderType(this.idx, this.name, this.code);

  final int idx;
  final String name;
  final String code;
}
