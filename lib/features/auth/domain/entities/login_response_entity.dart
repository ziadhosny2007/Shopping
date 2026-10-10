class LoginResponseEntity {
  String message;
  String token;
  User user;

  LoginResponseEntity({this.message = "", this.token = "", required this.user});
}

class User {
  String name;
  String phone;
  String email;
  String role;
  String image;

  User(
   { this.name = "",
    this.phone = "",
    this.email = "",
    this.role = "",
    this.image = "",}
  );
}
