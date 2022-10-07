// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../cubit/cubit.dart';
import '../home.dart';

class TabSix extends StatefulWidget {
  const TabSix({super.key});

  @override
  State<TabSix> createState() => _TabSixState();
}

class _TabSixState extends State<TabSix>
    with AutomaticKeepAliveClientMixin<TabSix> {
  late TextEditingController c1, c2, c3, c4, c5, c6;

  @override
  void initState() {
    super.initState();
    c1 = TextEditingController();
    c2 = TextEditingController();
    c3 = TextEditingController();
    c4 = TextEditingController();
    c5 = TextEditingController();
    c6 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    Widget sectionHeading(String heading) {
      return Align(
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 0,
            horizontal: 5.w,
          ),
          child: Text(
            heading,
            style: textTheme.headlineSmall,
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    Widget sectionInfo(String heading) {
      return Align(
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 0,
            horizontal: 5.w,
          ),
          child: Text(
            heading,
            softWrap: true,
            style: const TextStyle(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w600,
              fontSize: 16,
              letterSpacing: 0.25,
              wordSpacing: 2.0,
              color: Colors.blueGrey,
            ),
            textAlign: TextAlign.justify,
          ),
        ),
      );
    }

    super.build(context);
    ScrollController scr3 = ScrollController();
    return BlocBuilder<SectionSixCubit, SectionSixState>(
      builder: (context, state) {
        return Align(
          alignment: const Alignment(0, -1 / 3),
          child: Scrollbar(
            thumbVisibility: true,
            controller: scr3,
            child: FocusScope(
              child: ListView(
                controller: scr3,
                padding: const EdgeInsets.all(0.0),
                physics: const AlwaysScrollableScrollPhysics(),
                shrinkWrap: true,
                children: <Widget>[
                  spacerWidget(),
                  sectionHeading(
                      "Importance of land and Impact of the land acquisition"),
                  dividerWidget(),
                  spacerWidget(),
                  spacerWidget(),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 5.w,
                      ),
                      child: TextFormField(
                        inputFormatters: [
                          textFormat(),
                          UpperCaseFormatter(),
                        ],
                        controller: c1 = TextEditingController()
                          ..text = state.landMean.value ?? ''
                          ..selection = TextSelection.fromPosition(
                            TextPosition(
                              offset: state.landMean.value == null
                                  ? 0
                                  : c1.selection.base.offset >
                                          state.landMean.value.length
                                      ? state.landMean.value.length
                                      : c1.selection.base.offset,
                            ),
                          ),
                        maxLines: 5,
                        textCapitalization: TextCapitalization.characters,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        key: const Key('sectionSix_landMean'),
                        onChanged: (value) => context
                            .read<SectionSixCubit>()
                            .landMeanChanged(value),
                        obscureText: false,
                        decoration: InputDecoration(
                          prefixIcon: const Padding(
                            padding: EdgeInsets.only(
                                top: 0), // add padding to adjust icon
                            child: Icon(Icons.person),
                          ),
                          border: const OutlineInputBorder(),
                          labelText: "What does the land mean to you ?",
                          helperText: '',
                          errorText:
                              state.landMean.invalid ? 'required field' : null,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 5.w,
                      ),
                      child: TextFormField(
                        inputFormatters: [
                          textFormat(),
                          UpperCaseFormatter(),
                        ],
                        controller: c2 = TextEditingController()
                          ..text = state.loss.value ?? ''
                          ..selection = TextSelection.fromPosition(
                            TextPosition(
                              offset: state.loss.value == null
                                  ? 0
                                  : c2.selection.base.offset >
                                          state.loss.value.length
                                      ? state.loss.value.length
                                      : c2.selection.base.offset,
                            ),
                          ),
                        maxLines: 5,
                        textCapitalization: TextCapitalization.characters,
                        textInputAction: TextInputAction.next,
                        key: const Key('sectionSix_loss'),
                        onChanged: (value) =>
                            context.read<SectionSixCubit>().lossChanged(value),
                        obscureText: false,
                        decoration: InputDecoration(
                          prefixIcon: const Padding(
                            padding: EdgeInsets.only(
                                top: 0), // add padding to adjust icon
                            child: Icon(Icons.person),
                          ),
                          border: const OutlineInputBorder(),
                          labelText:
                              "What does the loss of Common property mean to you ?",
                          helperText: '',
                          errorText:
                              state.loss.invalid ? 'required field' : null,
                        ),
                      ),
                    ),
                  ),
                  sectionInfo(
                      "How will the land acquisition affect you/ your household according to you(e.g Impact on the economic condition/Health/ Mental health/ Women/Children/ Community/Environment/Ecosystems/Agriculture/Groundwater/ Dust/Blasting)"),
                  spacerWidget(),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 5.w,
                      ),
                      child: TextFormField(
                        inputFormatters: [
                          textFormat(),
                          UpperCaseFormatter(),
                        ],
                        controller: c3 = TextEditingController()
                          ..text = state.landAcquisition.value ?? ''
                          ..selection = TextSelection.fromPosition(
                            TextPosition(
                              offset: state.landAcquisition.value == null
                                  ? 0
                                  : c3.selection.base.offset >
                                          state.landAcquisition.value.length
                                      ? state.landAcquisition.value.length
                                      : c3.selection.base.offset,
                            ),
                          ),
                        maxLines: 5,
                        textCapitalization: TextCapitalization.characters,
                        textInputAction: TextInputAction.next,
                        key: const Key('sectionSix_landAcquisition'),
                        onChanged: (value) => context
                            .read<SectionSixCubit>()
                            .landAcquisitionChanged(value),
                        obscureText: false,
                        decoration: InputDecoration(
                          prefixIcon: const Padding(
                            padding: EdgeInsets.only(
                                top: 0), // add padding to adjust icon
                            child: Icon(Icons.person),
                          ),
                          border: const OutlineInputBorder(),
                          labelText:
                              "How will the land acquisition affect you/ your household according to you(e.g Impact on the economic condition/Health/ Mental health/ Women/Children/ Community/Environment/Ecosystems/Agriculture/Groundwater/ Dust/Blasting)",
                          helperText: '',
                          errorText: state.landAcquisition.invalid
                              ? 'required field'
                              : null,
                        ),
                      ),
                    ),
                  ),
                  sectionInfo(
                      "How is the present mining activity affecting the water bodies, air, land, health, groundwater, blasting, dust, mining"),
                  spacerWidget(),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 5.w,
                      ),
                      child: TextFormField(
                        inputFormatters: [
                          textFormat(),
                          UpperCaseFormatter(),
                        ],
                        controller: c4 = TextEditingController()
                          ..text = state.miningActivity.value ?? ''
                          ..selection = TextSelection.fromPosition(
                            TextPosition(
                              offset: state.miningActivity.value == null
                                  ? 0
                                  : c4.selection.base.offset >
                                          state.miningActivity.value.length
                                      ? state.miningActivity.value.length
                                      : c4.selection.base.offset,
                            ),
                          ),
                        maxLines: 5,
                        textCapitalization: TextCapitalization.characters,
                        textInputAction: TextInputAction.next,
                        key: const Key('sectionSix_miningActivity'),
                        onChanged: (value) => context
                            .read<SectionSixCubit>()
                            .miningActivityChanged(value),
                        obscureText: false,
                        decoration: InputDecoration(
                          prefixIcon: const Padding(
                            padding: EdgeInsets.only(
                                top: 0), // add padding to adjust icon
                            child: Icon(Icons.person),
                          ),
                          border: const OutlineInputBorder(),
                          labelText:
                              "How is the present mining activity affecting the water bodies, air, land, health, groundwater, blasting, dust, mining",
                          helperText: '',
                          errorText: state.miningActivity.invalid
                              ? 'required field'
                              : null,
                        ),
                      ),
                    ),
                  ),
                  sectionInfo(
                      "What has been the discussion at home regarding the Land loss"),
                  spacerWidget(),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 5.w,
                      ),
                      child: TextFormField(
                        inputFormatters: [
                          textFormat(),
                          UpperCaseFormatter(),
                        ],
                        controller: c5 = TextEditingController()
                          ..text = state.discussion.value ?? ''
                          ..selection = TextSelection.fromPosition(
                            TextPosition(
                              offset: state.discussion.value == null
                                  ? 0
                                  : c5.selection.base.offset >
                                          state.discussion.value.length
                                      ? state.discussion.value.length
                                      : c5.selection.base.offset,
                            ),
                          ),
                        maxLines: 5,
                        textCapitalization: TextCapitalization.characters,
                        textInputAction: TextInputAction.next,
                        key: const Key('sectionSix_discussion'),
                        onChanged: (value) => context
                            .read<SectionSixCubit>()
                            .discussionChanged(value),
                        obscureText: false,
                        decoration: InputDecoration(
                          prefixIcon: const Padding(
                            padding: EdgeInsets.only(
                                top: 0), // add padding to adjust icon
                            child: Icon(Icons.person),
                          ),
                          border: const OutlineInputBorder(),
                          labelText:
                              "What has been the discussion at home regarding the Land loss.",
                          helperText: '',
                          errorText: state.discussion.invalid
                              ? 'required field'
                              : null,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 5.w,
                      ),
                      child: TextFormField(
                        inputFormatters: [
                          textFormat(),
                          UpperCaseFormatter(),
                        ],
                        controller: c6 = TextEditingController()
                          ..text = state.comments
                          ..selection = TextSelection.fromPosition(
                            TextPosition(
                              offset: c6.selection.base.offset >
                                      state.comments.length
                                  ? state.comments.length
                                  : c6.selection.base.offset,
                            ),
                          ),
                        maxLines: 5,
                        textCapitalization: TextCapitalization.characters,
                        textInputAction: TextInputAction.done,
                        key: const Key('sectionSix_comments'),
                        onChanged: (value) => context
                            .read<SectionSixCubit>()
                            .commentsChanged(value),
                        obscureText: false,
                        decoration: const InputDecoration(
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(
                                top: 0), // add padding to adjust icon
                            child: Icon(Icons.person),
                          ),
                          border: OutlineInputBorder(),
                          labelText:
                              "Anything else you want to share/comment ?",
                          helperText: '',
                        ),
                      ),
                    ),
                  ),
                  spacerWidget(),
                  spacerWidget(),
                  spacerWidget(),
                  spacerWidget(),
                  spacerWidget(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
