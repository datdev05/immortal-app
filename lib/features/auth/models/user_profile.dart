import 'package:equatable/equatable.dart';

class UserProfile extends Equatable {
  const UserProfile({
    required this.id,
    required this.email,
    required this.displayName,
    required this.path,
    required this.motto,
    required this.spiritualPower,
    required this.gender,
    this.avatarUrl,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      id: json['id']?.toString() ?? '',
      email: json['email']?.toString() ?? '',
      displayName: json['displayName']?.toString() ?? '',
      path: json['path']?.toString() ?? '',
      motto: json['motto']?.toString() ?? '',
      spiritualPower: json['spiritualPower'] is int
          ? json['spiritualPower'] as int
          : int.tryParse(json['spiritualPower']?.toString() ?? '') ?? 0,
      avatarUrl: json['avatarUrl']?.toString(),
      gender: json['gender']?.toString() ?? '',
    );
  }

  final String id;
  final String email;
  final String displayName;
  final String path;
  final String motto;
  final int spiritualPower;
  final String? avatarUrl;
  final String gender;

  @override
  List<Object?> get props => [
    id,
    email,
    displayName,
    path,
    motto,
    spiritualPower,
    avatarUrl,
    gender,
  ];
}
