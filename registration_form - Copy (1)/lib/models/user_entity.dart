import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String firstName;
  final String middleName;
  final String lastName;
  final String birthdate;
  final String age;
  final String bio;
  final String email;
  final String password;
  final String confirmPassword;

  const UserEntity({
    this.firstName = '',
    this.middleName = '',
    this.lastName = '',
    this.birthdate = '',
    this.age = '',
    this.bio = '',
    this.email = '',
    this.password = '',
    this.confirmPassword = '',
  });

  UserEntity copyWith({
    String? firstName,
    String? middleName,
    String? lastName,
    String? birthdate,
    String? age,
    String? bio,
    String? email,
    String? password,
    String? confirmPassword,
  }) {
    return UserEntity(
      firstName: firstName ?? this.firstName,
      middleName: middleName ?? this.middleName,
      lastName: lastName ?? this.lastName,
      birthdate: birthdate ?? this.birthdate,
      age: age ?? this.age,
      bio: bio ?? this.bio,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }

  @override
  List<Object?> get props => [
    firstName,
    middleName,
    lastName,
    birthdate,
    age,
    bio,
    email,
    password,
    confirmPassword,
  ];
}
