import 'package:equatable/equatable.dart';

abstract class UserIdentityEvent extends Equatable {
  const UserIdentityEvent();

  @override
  List<Object?> get props => [];
}

class UpdateFirstNameEvent extends UserIdentityEvent {
  final String firstName;
  const UpdateFirstNameEvent(this.firstName);
  @override
  List<Object?> get props => [firstName];
}

class UpdateMiddleNameEvent extends UserIdentityEvent {
  final String middleName;
  const UpdateMiddleNameEvent(this.middleName);
  @override
  List<Object?> get props => [middleName];
}

class UpdateLastNameEvent extends UserIdentityEvent {
  final String lastName;
  const UpdateLastNameEvent(this.lastName);
  @override
  List<Object?> get props => [lastName];
}

class UpdateBirthdateEvent extends UserIdentityEvent {
  final String birthdate;
  const UpdateBirthdateEvent(this.birthdate);
  @override
  List<Object?> get props => [birthdate];
}

class UpdateAgeEvent extends UserIdentityEvent {
  final String age;
  const UpdateAgeEvent(this.age);
  @override
  List<Object?> get props => [age];
}

class UpdateBioEvent extends UserIdentityEvent {
  final String bio;
  const UpdateBioEvent(this.bio);
  @override
  List<Object?> get props => [bio];
}

class UpdateEmailEvent extends UserIdentityEvent {
  final String email;
  const UpdateEmailEvent({required this.email});
  @override
  List<Object?> get props => [email];
}

class UpdateUserFieldEvent extends UserIdentityEvent {
  final String field;
  final String value;

  const UpdateUserFieldEvent({required this.field, required this.value});

  @override
  List<Object?> get props => [field, value];
}

class NextStepEvent extends UserIdentityEvent {}

class PreviousStepEvent extends UserIdentityEvent {}

class SubmitFormEvent extends UserIdentityEvent {}

class ResetSubmissionEvent extends UserIdentityEvent {}
