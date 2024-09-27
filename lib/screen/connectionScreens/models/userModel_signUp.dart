class UsermodelSignup{
  final String? uid;
  final String email;
  final String password;

  const UsermodelSignup({
    required this.uid,
    required this.email,
    required this.password
  });

  Map<String, dynamic> toJson() {
    return {
      'uid': uid, // include 'uid' field if it's needed in Firestore
      'Email': email,
      'Password': password,
    };
  }
}