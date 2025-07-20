import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registration_form/bloc/user_identity_event.dart';
import 'package:registration_form/bloc/user_identity_state.dart';
import 'package:registration_form/models/user_entity.dart';

class UserIdentityBloc extends Bloc<UserIdentityEvent, UserIdentityState> {
  UserIdentityBloc()
    : super(UserIdentityState(user: const UserEntity(), currentStep: 0)) {
    on<UpdateFirstNameEvent>((event, emit) {
      emit(
        state.copyWith(user: state.user.copyWith(firstName: event.firstName)),
      );
    });

    on<UpdateMiddleNameEvent>((event, emit) {
      emit(
        state.copyWith(user: state.user.copyWith(middleName: event.middleName)),
      );
    });

    on<UpdateLastNameEvent>((event, emit) {
      emit(state.copyWith(user: state.user.copyWith(lastName: event.lastName)));
    });

    on<UpdateBirthdateEvent>((event, emit) {
      emit(
        state.copyWith(user: state.user.copyWith(birthdate: event.birthdate)),
      );
    });

    on<UpdateAgeEvent>((event, emit) {
      emit(state.copyWith(user: state.user.copyWith(age: event.age)));
    });

    on<UpdateBioEvent>((event, emit) {
      emit(state.copyWith(user: state.user.copyWith(bio: event.bio)));
    });

    on<UpdateEmailEvent>((event, emit) {
      emit(state.copyWith(user: state.user.copyWith(email: event.email)));
    });

    on<NextStepEvent>((event, emit) {
      if (state.currentStep < 2) {
        emit(state.copyWith(currentStep: state.currentStep + 1));
      }
    });

    on<PreviousStepEvent>((event, emit) {
      if (state.currentStep > 0) {
        emit(state.copyWith(currentStep: state.currentStep - 1));
      }
    });

    on<SubmitFormEvent>((event, emit) {
      emit(state.copyWith(isSubmissionSuccess: true));
    });

    on<ResetSubmissionEvent>((event, emit) {
      emit(state.copyWith(isSubmissionSuccess: false));
    });
  }
}
