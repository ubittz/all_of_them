enum FestivalCategoryType {
  corporateEvent('기업행사'),
  localEvent('지역행사'),
  otherEvents('기타행사'),
  performancePlannedEvent('공연, 기획 행사');

  const FestivalCategoryType(this.label);

  final String label;
}
