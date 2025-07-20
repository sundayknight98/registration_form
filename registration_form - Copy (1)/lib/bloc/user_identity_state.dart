import 'package:equatable/equatable.dart';
import 'package:registration_form/models/user_entity.dart';

class UserIdentityState extends Equatable {
  final UserEntity user;
  final int currentStep;
  final bool isSubmissionSuccess;

  const UserIdentityState({
    required this.user,
    required this.currentStep,
    this.isSubmissionSuccess = false,
  });

  UserIdentityState copyWith({
    UserEntity? user,
    int? currentStep,
    bool? isSubmissionSuccess,
  }) {
    return UserIdentityState(
      user: user ?? this.user,
      currentStep: currentStep ?? this.currentStep,
      isSubmissionSuccess: isSubmissionSuccess ?? this.isSubmissionSuccess,
    );
  }

  @override
  List<Object?> get props => [user, currentStep, isSubmissionSuccess];
}
