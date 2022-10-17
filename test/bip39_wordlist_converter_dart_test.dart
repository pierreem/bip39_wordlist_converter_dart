import 'package:bip39_wordlist_converter/bip39_wordlist_converter.dart';
import 'package:test/test.dart';
import 'package:bip39/bip39.dart' as bip39;

void main() {
  group('Multiple translation test', () {
    var englishMnemonic = bip39.generateMnemonic();
    var converter = Bip39Converter(englishMnemonic);
    var frenchConverter = Bip39Converter(converter.toFrench());
    var italianConverter = Bip39Converter(frenchConverter.toItalian());
    var spanichConverter = Bip39Converter(italianConverter.toSpanish());

    test('English to french to italian to spanish to english test', () {
      expect(spanichConverter.toEnglish() == englishMnemonic, isTrue);
    });
  });
}
