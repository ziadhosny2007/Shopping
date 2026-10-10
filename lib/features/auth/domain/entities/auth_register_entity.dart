class AuthRegisterEntity {
  String name;
  String phone;
  String email;
  String password;
  String confirmPassword;

  AuthRegisterEntity({
    this.name = "name",
    this.phone = "phone",
    this.email = "email",
    this.password = "password",
    this.confirmPassword = "confirmPassword",
  });
}
