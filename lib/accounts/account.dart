class Account {
  final String user;
  final String mail;
  final String password;
  int? trys;

  Account({
    required this.user,
    required this.mail,
    required this.password,
    this.trys,
  });

  Map<String, dynamic> toMap() {
    return {
      'user': user,
      'mail': mail,
      'password': password,
      'trys': trys,
    };
  }

  @override
  String toString() {
    return 'Account{user: $user, mail: $mail, password: $password, trys: $trys}';
  }
}
