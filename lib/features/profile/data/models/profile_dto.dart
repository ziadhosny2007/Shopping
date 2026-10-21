import 'package:shopping/features/profile/domain/entities/profile_entity.dart';

class ProfileDto {
  String? name;
  String? image;
  String? address;
  String? phone;

  ProfileDto({this.name, this.image, this.address, this.phone});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    data['name'] = name;
    data['image'] = image;
    data['address'] = address;
    data['phone'] = phone;
    return data;
  }

  ProfileDto.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    address = json['address'];
    phone = json['phone'];
  }

  ProfileEntity toEntity() {
    return ProfileEntity(
      phone: phone ?? "",
      address: address ?? "",
      image: image ?? "",
      name: name ?? "",
    );
  }
}
