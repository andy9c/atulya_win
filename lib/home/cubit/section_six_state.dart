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

  @override
  bool get stringify => true;
  Map<String, dynamic> toMap() {
    return {
      'landMean': landMean.value,
      'loss': loss.value,
      'landAcquisition': landAcquisition.value,
      'miningActivity': miningActivity.value,
      'discussion': discussion.value,
      'comments': comments,
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
  String toJson() => json.encode(toMap());

  factory SectionSixState.fromJson(String source) =>
      SectionSixState.fromMap(json.decode(source));

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
