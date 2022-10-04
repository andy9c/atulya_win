import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:form_inputs/form_inputs.dart';

part 'interview_state.dart';

class InterviewCubit extends Cubit<InterviewState> {
  InterviewCubit() : super(const InterviewState());
}
