class AuthLoginRequestDto {
  String? email;
  String? password;

  AuthLoginRequestDto({this.email, this.password});
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data['email'] = email;
    data['password'] = password;

    return data;
  }
}
