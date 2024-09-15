class UsermodelSignup{
  final String uid;
  final String fullname;
  final String email;
  final String password;

  const UsermodelSignup({
    required this.uid,
    required this.fullname,
    required this.email,
    required this.password
  });

  toJson(){
    return{
      'FullName' : fullname,
      'Email' : email,
      'Password' : password
    };
  }
}