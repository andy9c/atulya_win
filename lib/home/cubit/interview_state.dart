part of 'interview_cubit.dart';

class InterviewState extends Equatable {
  const InterviewState({
    this.interviewDescription = const Compulsory.pure(),
    this.pattaNumber = const Compulsory.pure(),
  });

  final Compulsory interviewDescription;
  final Compulsory pattaNumber;

  @override
  List<Object> get props => [];
}
