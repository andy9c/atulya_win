// ignore_for_file: file_names

import 'package:atulya/home/cubit/cubit.dart';
import 'package:atulya/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:sizer/sizer.dart';

class TabFour extends StatefulWidget {
  const TabFour({super.key});

  @override
  State<TabFour> createState() => _TabFourState();
}

class _TabFourState extends State<TabFour>
    with AutomaticKeepAliveClientMixin<TabFour> {
  late TextEditingController c1, c2, c3, c4, c5, c6, c7;

  @override
  void initState() {
    super.initState();
    c1 = TextEditingController();
    c2 = TextEditingController();
    c3 = TextEditingController();
    c4 = TextEditingController();
    c5 = TextEditingController();
    c6 = TextEditingController();
    c7 = TextEditingController();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    ScrollController scr4 = ScrollController();

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
    return BlocBuilder<SectionFourCubit, SectionFourState>(
      builder: (context, state) {
        return Align(
          alignment: const Alignment(0, -1 / 3),
          child: Scrollbar(
            thumbVisibility: true,
            controller: scr4,
            child: FocusScope(
              child: ListView(
                controller: scr4,
                padding: const EdgeInsets.all(0.0),
                physics: const AlwaysScrollableScrollPhysics(),
                shrinkWrap: true,
                children: <Widget>[
                  spacerWidget(),
                  sectionHeading(
                      "Details of Land loss for any projects Before"),
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
                      child: DropdownButtonFormField<String>(
                        value: state.lostland.value,
                        onChanged: (String? value) => context
                            .read<SectionFourCubit>()
                            .lostlandChanged(value!),
                        isExpanded: true,
                        //value: "YES",
                        icon: const Icon(Icons.arrow_downward_rounded),
                        iconSize: 24,
                        elevation: 16,
                        style: const TextStyle(color: Colors.deepPurple),
                        decoration: InputDecoration(
                          prefixIcon: const Padding(
                            padding: EdgeInsets.only(
                                top: 0), // add padding to adjust icon
                            child:
                                Icon(Icons.wc_rounded, color: Colors.lightBlue),
                          ),
                          border: const OutlineInputBorder(),
                          labelText:
                              "Have you lost land in any projects in the past?",
                          helperText: '',
                          errorText:
                              state.lostland.invalid ? 'required field' : null,
                        ),
                        items: yesNoList
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        hint: const Text(
                          "Please select yes/no",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                  sectionInfo("If Yes, Then for which Project"),
                  spacerWidget(),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 5.w,
                    ),
                    child: MultiSelectDialogField(
                      key: GlobalKey(),
                      initialValue: state.lostLandtoprojects.value,
                      onConfirm: (value) {
                        context
                            .read<SectionFourCubit>()
                            .lostLandtoprojectsChanged(value);
                      },
                      title: const Text("Select Projects"),
                      buttonText: const Text(
                        "Select Projects",
                        style: TextStyle(
                          color: Colors.lightBlue,
                        ),
                      ),
                      searchable: true,
                      barrierColor: Colors.blueGrey.withOpacity(0.3),
                      items: projectLossList
                          .map((e) => MultiSelectItem(e, e))
                          .toList(),
                      listType: MultiSelectListType.CHIP,
                      decoration: BoxDecoration(
                        border: Border.all(
                            // color: Colors.green,
                            // width: 8,
                            ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  spacerWidget(),
                  sectionInfo("How much land lost ?"),
                  spacerWidget(),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 5.w,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 2,
                          child: TextFormField(
                            inputFormatters: [
                              doubleFormat(),
                            ],
                            controller: c1 = TextEditingController()
                              ..text = state.landAreaLost.value ?? ''
                              ..selection = TextSelection.fromPosition(
                                TextPosition(
                                  offset: state.landAreaLost.value == null
                                      ? 0
                                      : c1.selection.base.offset >
                                              state.landAreaLost.value.length
                                          ? state.landAreaLost.value.length
                                          : c1.selection.base.offset,
                                ),
                              ),
                            maxLines: 1,
                            textCapitalization: TextCapitalization.characters,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                            key: const Key('sectionFour_landAreaLost'),
                            onChanged: (value) => context
                                .read<SectionFourCubit>()
                                .landAreaLostChanged(value),
                            obscureText: false,
                            decoration: const InputDecoration(
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(
                                    top: 0), // add padding to adjust icon
                                child:
                                    Icon(Icons.person, color: Colors.lightBlue),
                              ),
                              border: OutlineInputBorder(),
                              labelText: "How much land lost ?",
                              helperText: '',
                            ),
                          ),
                        ),
                        spacerWidget(),
                        Expanded(
                          flex: 1,
                          child: TextFormField(
                            enabled: false,
                            controller: TextEditingController(
                              text: getArea(state.landAreaLost.value),
                            ),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.blueGrey.shade50,
                              border: const OutlineInputBorder(),
                              labelText: 'acre/decimal',
                              helperText: '',
                            ),
                          ),
                        ),
                      ],
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
                          intFormat(),
                        ],
                        controller: c2 = TextEditingController()
                          ..text = state.yearOflandLost.value ?? ''
                          ..selection = TextSelection.fromPosition(
                            TextPosition(
                              offset: state.yearOflandLost.value == null
                                  ? 0
                                  : c2.selection.base.offset >
                                          state.yearOflandLost.value.length
                                      ? state.yearOflandLost.value.length
                                      : c2.selection.base.offset,
                            ),
                          ),
                        maxLines: 1,
                        textCapitalization: TextCapitalization.characters,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        key: const Key('sectionFour_yearOfLandLost'),
                        onChanged: (value) => context
                            .read<SectionFourCubit>()
                            .yearOflandLostChanged(value),
                        obscureText: false,
                        decoration: const InputDecoration(
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(
                                top: 0), // add padding to adjust icon
                            child: Icon(Icons.person, color: Colors.lightBlue),
                          ),
                          border: OutlineInputBorder(),
                          labelText: "Year of the land lost",
                          helperText: '',
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
                      child: DropdownButtonFormField<String>(
                        value: state.gotCompensation.value,
                        onChanged: (String? value) => context
                            .read<SectionFourCubit>()
                            .gotCompensationChanged(value!),
                        isExpanded: true,
                        //value: "YES",
                        icon: const Icon(Icons.arrow_downward_rounded),
                        iconSize: 24,
                        elevation: 16,
                        style: const TextStyle(color: Colors.deepPurple),
                        decoration: InputDecoration(
                          prefixIcon: const Padding(
                            padding: EdgeInsets.only(
                                top: 0), // add padding to adjust icon
                            child:
                                Icon(Icons.wc_rounded, color: Colors.lightBlue),
                          ),
                          border: const OutlineInputBorder(),
                          labelText: "Did you get any compensation ?",
                          helperText: '',
                          errorText: state.gotCompensation.invalid
                              ? 'required field'
                              : null,
                        ),
                        items: yesNoList
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        hint: const Text(
                          "Please select yes/no",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                  spacerWidget(),
                  sectionInfo(
                      "If Yes, then What was the compensation (Cash, employment, land) ?"),
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
                          alphaNumericFormat(),
                          UpperCaseFormatter(),
                        ],
                        controller: c3 = TextEditingController()
                          ..text = state.compensation
                          ..selection = TextSelection.fromPosition(
                            TextPosition(
                              offset: c3.selection.base.offset >
                                      state.compensation.length
                                  ? state.compensation.length
                                  : c3.selection.base.offset,
                            ),
                          ),
                        maxLines: 5,
                        textCapitalization: TextCapitalization.characters,
                        textInputAction: TextInputAction.next,
                        key: const Key('sectionFour_compensation'),
                        onChanged: (value) => context
                            .read<SectionFourCubit>()
                            .compensationChanged(value),
                        obscureText: false,
                        decoration: const InputDecoration(
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(
                                top: 0), // add padding to adjust icon
                            child: Icon(Icons.person),
                          ),
                          border: OutlineInputBorder(),
                          labelText:
                              "If Yes, then What was the compensation(Cash, employment, land ),?",
                          helperText: '',
                        ),
                      ),
                    ),
                  ),
                  sectionInfo(
                      "If Cash then how much, what were your expectation ?"),
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
                          alphaNumericFormat(),
                          UpperCaseFormatter(),
                        ],
                        controller: c4 = TextEditingController()
                          ..text = state.cashCompensation
                          ..selection = TextSelection.fromPosition(
                            TextPosition(
                              offset: c4.selection.base.offset >
                                      state.cashCompensation.length
                                  ? state.cashCompensation.length
                                  : c4.selection.base.offset,
                            ),
                          ),
                        maxLines: 5,
                        textCapitalization: TextCapitalization.characters,
                        textInputAction: TextInputAction.next,
                        key: const Key('sectionFour_cashCompensation'),
                        onChanged: (value) => context
                            .read<SectionFourCubit>()
                            .cashCompensationChanged(value),
                        obscureText: false,
                        decoration: const InputDecoration(
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(
                                top: 0), // add padding to adjust icon
                            child: Icon(Icons.person),
                          ),
                          border: OutlineInputBorder(),
                          labelText:
                              "If Cash then how much, what were your expectation ?",
                          helperText: '',
                        ),
                      ),
                    ),
                  ),
                  sectionInfo(
                      "If Employment was it permanent or contractual, were you satisfied with the job? "),
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
                          alphaNumericFormat(),
                          UpperCaseFormatter(),
                        ],
                        controller: c5 = TextEditingController()
                          ..text = state.employmentDetails
                          ..selection = TextSelection.fromPosition(
                            TextPosition(
                              offset: c5.selection.base.offset >
                                      state.employmentDetails.length
                                  ? state.employmentDetails.length
                                  : c5.selection.base.offset,
                            ),
                          ),
                        maxLines: 5,
                        textCapitalization: TextCapitalization.characters,
                        textInputAction: TextInputAction.next,
                        key: const Key('sectionFour_employmentDetails'),
                        onChanged: (value) => context
                            .read<SectionFourCubit>()
                            .employmentDetailsChanged(value),
                        obscureText: false,
                        decoration: const InputDecoration(
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(
                                top: 0), // add padding to adjust icon
                            child: Icon(Icons.person),
                          ),
                          border: OutlineInputBorder(),
                          labelText:
                              "If Employment was it permanent or contractual, were you satisfied with the job? ",
                          helperText: '',
                        ),
                      ),
                    ),
                  ),
                  sectionInfo(
                      "If land (mention the quantity and location), were you satisfied ?"),
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
                          alphaNumericFormat(),
                          UpperCaseFormatter(),
                        ],
                        controller: c6 = TextEditingController()
                          ..text = state.landDetails
                          ..selection = TextSelection.fromPosition(
                            TextPosition(
                              offset: c6.selection.base.offset >
                                      state.landDetails.length
                                  ? state.landDetails.length
                                  : c6.selection.base.offset,
                            ),
                          ),
                        maxLines: 5,
                        textCapitalization: TextCapitalization.characters,
                        textInputAction: TextInputAction.next,
                        key: const Key('sectionFour_landDetails'),
                        onChanged: (value) => context
                            .read<SectionFourCubit>()
                            .landDetailsChanged(value),
                        obscureText: false,
                        decoration: const InputDecoration(
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(
                                top: 0), // add padding to adjust icon
                            child: Icon(Icons.person),
                          ),
                          border: OutlineInputBorder(),
                          labelText:
                              "If land (mention the quantity and location), were you satisfied ?",
                          helperText: '',
                        ),
                      ),
                    ),
                  ),
                  sectionInfo("Any other Comments ?"),
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
                          alphaNumericFormat(),
                          UpperCaseFormatter(),
                        ],
                        controller: c7 = TextEditingController()
                          ..text = state.otherComments
                          ..selection = TextSelection.fromPosition(
                            TextPosition(
                              offset: c7.selection.base.offset >
                                      state.otherComments.length
                                  ? state.otherComments.length
                                  : c7.selection.base.offset,
                            ),
                          ),
                        maxLines: 5,
                        textCapitalization: TextCapitalization.characters,
                        textInputAction: TextInputAction.done,
                        key: const Key('sectionFour_otherComments'),
                        onChanged: (value) => context
                            .read<SectionFourCubit>()
                            .otherCommentsChanged(value),
                        obscureText: false,
                        decoration: const InputDecoration(
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(
                                top: 0), // add padding to adjust icon
                            child: Icon(Icons.person),
                          ),
                          border: OutlineInputBorder(),
                          labelText: "Any other comments",
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
}
