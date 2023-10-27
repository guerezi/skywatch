enum RateTypeEnum {
  hour("hourly", Duration(hours: 1)),
  day("daily", Duration(days: 1));

  const RateTypeEnum(this.value, this.duration);
  final String value;
  final Duration duration;
}
