class Language{
  final String lang;

  Language (this.lang);

static List<Language> langList() {
    return <Language> [
      Language("en"),
      Language("de"),
      Language("fr"),
    ];
  }
}
