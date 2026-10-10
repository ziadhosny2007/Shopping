
import 'package:shopping/features/auth/domain/entities/login_response_entity.dart';

class LoginResponseDto {
  String? message;
  String? token;
  UserDto? user;

  LoginResponseDto({
    this.message,
    this.token,
    this.user,
  });

  LoginResponseDto.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    token = json['token'];
    user = json['user'] != null
        ? UserDto.fromJson(json['user'])
        : null;
  }

  LoginResponseEntity toEntity() {
    return LoginResponseEntity(
      user: user!.toEntity(),
      message: message ?? "",
      token: token ?? "",
    );
  }
}

class UserDto {
  String? name;
  String? phone;
  String? email;
  String? role;
  String? image;

  UserDto({
    this.name,
    this.phone,
    this.email,
    this.role,
    this.image,
  });

  UserDto.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    role = json['role'];
    image = json['image'];
  }

  User toEntity() {
    return User(
      email: email ?? "",
      image: image ?? "",
      phone: phone ?? "",
      name: name ?? "",
      role: role ?? "",
    );
  }
}
