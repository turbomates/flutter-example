class User {
  User({this.username, this.email});

  String username;
  String email;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          runtimeType == other.runtimeType &&
          username == other.username &&
          email == other.email;

  @override
  int get hashCode => username.hashCode ^ email.hashCode;
}
