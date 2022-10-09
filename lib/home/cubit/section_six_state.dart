part of 'section_six_cubit.dart';

class SectionSixState extends Equatable with FormzMixin {
  const SectionSixState({
    this.landMean = const Compulsory.pure(),
    this.loss = const Compulsory.pure(),
    this.landAcquisition = const Compulsory.pure(),
    this.miningActivity = const Compulsory.pure(),
    this.discussion = const Compulsory.pure(),
    this.comments = "",
    this.reloadToggle = false,
  });

  final Compulsory landMean;
  final Compulsory loss;
  final Compulsory landAcquisition;
  final Compulsory miningActivity;
  final Compulsory discussion;
  final String comments;
  final bool reloadToggle;

  @override
  List<Object> get props {
    return [
      landMean,
      loss,
      landAcquisition,
      miningActivity,
      discussion,
      comments,
      reloadToggle,
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
      landMean: Compulsory.dirty(map['landMean']),
      loss: Compulsory.dirty(map['loss']),
      landAcquisition: Compulsory.dirty(map['landAcquisition']),
      miningActivity: Compulsory.dirty(map['miningActivity']),
      discussion: Compulsory.dirty(map['discussion']),
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
    bool? reloadToggle,
  }) {
    return SectionSixState(
      landMean: landMean ?? this.landMean,
      loss: loss ?? this.loss,
      landAcquisition: landAcquisition ?? this.landAcquisition,
      miningActivity: miningActivity ?? this.miningActivity,
      discussion: discussion ?? this.discussion,
      comments: comments ?? this.comments,
      reloadToggle: reloadToggle ?? this.reloadToggle,
    );
  }
}
