part of 'section_six_cubit.dart';

class SectionSixState extends Equatable with FormzMixin {
  const SectionSixState({
    this.landMean = const Compulsory.pure(),
    this.loss = const Compulsory.pure(),
    this.landAcquisition = const Compulsory.pure(),
    this.miningActivity = const Compulsory.pure(),
    this.discussion = const Compulsory.pure(),
    this.comments = "",
  });

  final Compulsory landMean;
  final Compulsory loss;
  final Compulsory landAcquisition;
  final Compulsory miningActivity;
  final Compulsory discussion;
  final String comments;

  @override
  List<Object> get props {
    return [
      landMean,
      loss,
      landAcquisition,
      miningActivity,
      discussion,
      comments,
    ];
  }

  @override
  List<FormzInput> get inputs => [
        landMean,
        loss,
        landAcquisition,
        miningActivity,
        discussion,
      ];

  static Map<String, dynamic> toMap(SectionSixState state) {
    return {
      'landMean': state.landMean.value,
      'loss': state.loss.value,
      'landAcquisition': state.landAcquisition.value,
      'miningActivity': state.miningActivity.value,
      'discussion': state.discussion.value,
      'comments': state.comments,
    };
  }

  factory SectionSixState.fromMap(Map<String, dynamic> map) {
    return SectionSixState(
      landMean: map['landMean'],
      loss: map['loss'],
      landAcquisition: map['landAcquisition'],
      miningActivity: map['miningActivity'],
      discussion: map['discussion'],
      comments: map['comments'],
    );
  }

  SectionSixState copyWith({
    Compulsory? landMean,
    Compulsory? loss,
    Compulsory? landAcquisition,
    Compulsory? miningActivity,
    Compulsory? discussion,
    String? comments,
  }) {
    return SectionSixState(
      landMean: landMean ?? this.landMean,
      loss: loss ?? this.loss,
      landAcquisition: landAcquisition ?? this.landAcquisition,
      miningActivity: miningActivity ?? this.miningActivity,
      discussion: discussion ?? this.discussion,
      comments: comments ?? this.comments,
    );
  }
}