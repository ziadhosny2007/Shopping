import 'package:shopping/features/profile/data/models/profile_dto.dart';

class ProfileEntity {
  String name;
  String image;
  String address;
  String phone;

  ProfileEntity({
    this.name = "",
    this.image = "",
    this.address = "",
    this.phone = "",
  });
  ProfileDto toDto() {
    return ProfileDto(address: address, image: image, name: name, phone: phone);
  }
}
