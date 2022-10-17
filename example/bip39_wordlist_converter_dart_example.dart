import 'package:bip39_wordlist_converter/bip39_wordlist_converter.dart';
import 'package:bip39/bip39.dart' as bip39;

void main() {

  var converter = Bip39Converter(bip39.generateMnemonic());

  print('From: \n${converter.toEnglish()}\nto french\n${converter.toFrench()}');
  print('to italian\n${converter.toItalian()}');
  print('to spanish\n${converter.toSpanish()}');

  var french = converter.toFrench();
  var frenchConverter = Bip39Converter(french);
  print('\n\nFrom: \n$french}\nto english\n${frenchConverter.toEnglish()}');
  print('to italian\n${frenchConverter.toItalian()}');
  print('to spanish\n${frenchConverter.toSpanish()}');
}
