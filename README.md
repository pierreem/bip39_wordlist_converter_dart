Translate bip39 sentences from one language to another. (not like true translation, but like same integer in the 2048 base)
Permit to use any bip39 library without multiling support.

Tested with bip39 package, support english, french, italian and spanish. (adding wordlist is really simple, just ask me on github)

## Features

Valid mnemonic, find source language @ constructor 
convert to any language supported with one call 'toLanguage()'

Exposed also easy-to-use languageList for your autocompletion UI/UX:
~~~
Bip39Converter.frenchList;
~~~

## Getting started

install with:
~~~
dart pub add bip39_wordlist_converter
~~~

import with:
~~~
import 'package:bip39_wordlist_converter/bip39_wordlist_converter.dart';
~~~

## Usage

~~~
var converter = Bip39Converter("aliéner mouvant pieuvre louer surprise cendrier hermine aviser plaque écluse nombreux minorer");
converter.toEnglish();
~~~
