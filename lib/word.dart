class Word {
  String word;
  List<String> guessedLetters;

  Word({required this.word, List<String>? guessedLetters})
      : guessedLetters = guessedLetters ?? [];

  List<String> getDisplayWord() {
    return word.split('').map((letter) {
      return guessedLetters.contains(letter.toLowerCase()) ? letter : '_';
    }).toList();
  }

  void updateGuessedLetters(String letter) {
    if (!guessedLetters.contains(letter.toLowerCase())) {
      guessedLetters.add(letter.toLowerCase());
    }
  }

  void updateGuessedWord(String guessedWord) {
    for (int i = 0; i < guessedWord.length; i++) {
      updateGuessedLetters(guessedWord[i]);
    }
  }

  bool isWordGuessed() {
    return word
        .split('')
        .every((letter) => guessedLetters.contains(letter.toLowerCase()));
  }

  bool isLetterInCorrectPosition(int index, String letter) {
    return word.length > index &&
        word[index].toLowerCase() == letter.toLowerCase();
  }
}
