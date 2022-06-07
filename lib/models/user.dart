class User {
  final String email;
  final String authToken;

  User({required this.email, required this.authToken});

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'authToken': authToken,
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'],
      authToken: json['authToken'],
    );
  }
}
