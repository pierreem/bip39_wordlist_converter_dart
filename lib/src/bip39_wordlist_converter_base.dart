import 'lang/all.dart' as lang;

extension CountableStringList on Iterable<String> {
  String mostCommun({required String defaultString}){
    var m = <String,int>{};
    for(var s in this){
      m[s]= (m[s] ?? 0) + 1;
    }

    int mm = 0;
    String ms = defaultString;
    for(var k in m.keys){
      if((m[k] ?? 0) > mm){
        mm = m[k] ?? 0;
        ms = k;
      }
    }

    return ms;
  }
}


class Bip39Converter {
  List<String> _mnemonicWord = [];
  static const String languageNotFound = "not_found";
  String language = languageNotFound;

  static final List<String> languages = [...lang.WORDLIST.keys];

  static final List<String> frenchList = lang.WORDLIST["french"]!;
  static final List<String> italianList = lang.WORDLIST["italian"]!;
  static final List<String> englishList = lang.WORDLIST["english"]!;
  static final List<String> spanishList = lang.WORDLIST["spanish"]!;

  Bip39Converter(String mnemonic){
    _mnemonicWord = mnemonic.split(" ");
    language = detectLanguages();
    if(language == languageNotFound) throw Exception("No language found");
    if(!isUniqLanguage()) throw Exception("Multiple lang unsupported");
  }

  bool isUniqLanguage() {
    for(var w in _mnemonicWord){
      if(lang.WORDLIST[language]?.contains(w) == false) return false;
    }
    return true;
  }

  String detectLanguages(){
    return _mnemonicWord.map((w){
      for(String tryLang in languages){
        if(lang.WORDLIST[tryLang]?.contains(w) == true){
          return tryLang;
        }
      }
      return languageNotFound;
    }).mostCommun(defaultString: languageNotFound);
  }

  String toEnglish() {
    return _toLang("english");
  }

  String toFrench() {
    return _toLang("french");
  }

  String toItalian() {
    return _toLang("italian");
  }

  String toSpanish() {
    return _toLang("spanish");
  }

  String _toLang(String langKey) {
    return _mnemonicWord.map((w) => lang.WORDLIST[langKey]?[lang.WORDLIST[language]?.indexOf(w) ?? 0]).join(" ");
  }
}
