import '../../../../core/constants/app_strings.dart';

class UserModel {
  final String uid;
  final String email;

  UserModel({required this.uid, required this.email});

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map[AppStrings.uid],
      email: map[AppStrings.email],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      AppStrings.uid: uid,
      AppStrings.email: email,
    };
  }
}