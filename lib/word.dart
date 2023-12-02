class Word {
  String word;
  List<String> guessedLetters;

  Word({required this.word, List<String>? guessedLetters})
      : guessedLetters = guessedLetters ?? [];

  // Retorna una lista de caracteres que representa la palabra, con '_' para letras no adivinadas
  List<String> getDisplayWord() {
    return word.split('').map((letter) {
      return guessedLetters.contains(letter.toLowerCase()) ? letter : '_';
    }).toList();
  }

  // Actualiza la lista de letras adivinadas
  void updateGuessedLetters(String letter) {
    if (!guessedLetters.contains(letter.toLowerCase())) {
      guessedLetters.add(letter.toLowerCase());
    }
  }

  // Verifica si todas las letras de la palabra han sido adivinadas
  bool isWordGuessed() {
    return word
        .split('')
        .every((letter) => guessedLetters.contains(letter.toLowerCase()));
  }
}
