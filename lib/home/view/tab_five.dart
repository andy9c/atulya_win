// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';
import 'package:sizer/sizer.dart';

import '../cubit/cubit.dart';
import '../home.dart';

class TabFive extends StatefulWidget {
  const TabFive({super.key});

  @override
  State<TabFive> createState() => _TabFiveState();
}

class _TabFiveState extends State<TabFive>
    with AutomaticKeepAliveClientMixin<TabFive> {
  late TextEditingController c1, c2, c3, c4, c5, c6, c7, c8, c9;

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
    c8 = TextEditingController();
    c9 = TextEditingController();
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
    return BlocBuilder<SectionFiveCubit, SectionFiveState>(
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
                      "Awareness about the Expansion of  the  OCL mining Project"),
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
                        value: state.oclAcquiring.value,
                        onChanged: (String? value) => context
                            .read<SectionFiveCubit>()
                            .oclAcquiringChanged(value!),
                        isExpanded: true,
                        //value: "1",
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
                              "Do you know that the OCL is acquiring some more land?",
                          helperText: '',
                          errorText: state.oclAcquiring.invalid
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
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 5.w,
                      ),
                      child: DropdownButtonFormField<String>(
                        value: state.looseLand.value,
                        onChanged: (String? value) => context
                            .read<SectionFiveCubit>()
                            .looseLandChanged(value!),
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
                              "Are you/your household is going to lose any land?",
                          helperText: '',
                          errorText:
                              state.looseLand.invalid ? 'required field' : null,
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
                  sectionInfo("Mention the Land Holdings Lost"),
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
                              ..text = state.landHoldingLost['goda'] ?? ''
                              ..selection = TextSelection.fromPosition(
                                TextPosition(
                                  offset: state.landHoldingLost['goda'] == null
                                      ? 0
                                      : c1.selection.base.offset >
                                              state.landHoldingLost['goda']
                                                  .length
                                          ? state.landHoldingLost['goda'].length
                                          : c1.selection.base.offset,
                                ),
                              ),
                            maxLines: 1,
                            textCapitalization: TextCapitalization.characters,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                            key: const Key('sectionFive_goda'),
                            onChanged: (value) => context
                                .read<SectionFiveCubit>()
                                .landHoldingLostChanged({"goda": value}),
                            obscureText: false,
                            decoration: const InputDecoration(
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(
                                    top: 0), // add padding to adjust icon
                                child: Icon(Icons.person),
                              ),
                              border: OutlineInputBorder(),
                              labelText: "Goda",
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
                              text: getArea(state.landHoldingLost['goda']),
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
                            controller: c2 = TextEditingController()
                              ..text = state.landHoldingLost['mal'] ?? ''
                              ..selection = TextSelection.fromPosition(
                                TextPosition(
                                  offset: state.landHoldingLost['mal'] == null
                                      ? 0
                                      : c2.selection.base.offset >
                                              state
                                                  .landHoldingLost['mal'].length
                                          ? state.landHoldingLost['mal'].length
                                          : c2.selection.base.offset,
                                ),
                              ),
                            maxLines: 1,
                            textCapitalization: TextCapitalization.characters,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                            key: const Key('sectionFive_mal'),
                            onChanged: (value) => context
                                .read<SectionFiveCubit>()
                                .landHoldingLostChanged({"mal": value}),
                            obscureText: false,
                            decoration: const InputDecoration(
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(
                                    top: 0), // add padding to adjust icon
                                child: Icon(Icons.person),
                              ),
                              border: OutlineInputBorder(),
                              labelText: "Mal",
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
                              text: getArea(state.landHoldingLost['mal']),
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
                            controller: c3 = TextEditingController()
                              ..text = state.landHoldingLost['berna'] ?? ''
                              ..selection = TextSelection.fromPosition(
                                TextPosition(
                                  offset: state.landHoldingLost['berna'] == null
                                      ? 0
                                      : c3.selection.base.offset >
                                              state.landHoldingLost['berna']
                                                  .length
                                          ? state
                                              .landHoldingLost['berna'].length
                                          : c3.selection.base.offset,
                                ),
                              ),
                            maxLines: 1,
                            textCapitalization: TextCapitalization.characters,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                            key: const Key('sectionFive_berna'),
                            onChanged: (value) => context
                                .read<SectionFiveCubit>()
                                .landHoldingLostChanged({"berna": value}),
                            obscureText: false,
                            decoration: const InputDecoration(
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(
                                    top: 0), // add padding to adjust icon
                                child: Icon(Icons.person),
                              ),
                              border: OutlineInputBorder(),
                              labelText: "Berna",
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
                              text: getArea(state.landHoldingLost['berna']),
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
                            controller: c4 = TextEditingController()
                              ..text = state.landHoldingLost['bahal'] ?? ''
                              ..selection = TextSelection.fromPosition(
                                TextPosition(
                                  offset: state.landHoldingLost['bahal'] == null
                                      ? 0
                                      : c4.selection.base.offset >
                                              state.landHoldingLost['bahal']
                                                  .length
                                          ? state
                                              .landHoldingLost['bahal'].length
                                          : c4.selection.base.offset,
                                ),
                              ),
                            maxLines: 1,
                            textCapitalization: TextCapitalization.characters,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                            key: const Key('sectionFive_bahal'),
                            onChanged: (value) => context
                                .read<SectionFiveCubit>()
                                .landHoldingLostChanged({"bahal": value}),
                            obscureText: false,
                            decoration: const InputDecoration(
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(
                                    top: 0), // add padding to adjust icon
                                child: Icon(Icons.person),
                              ),
                              border: OutlineInputBorder(),
                              labelText: "Bahal",
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
                              text: getArea(state.landHoldingLost['bahal']),
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
                            controller: c5 = TextEditingController()
                              ..text = state.landHoldingLost['gharBari'] ?? ''
                              ..selection = TextSelection.fromPosition(
                                TextPosition(
                                  offset: state.landHoldingLost['gharBari'] ==
                                          null
                                      ? 0
                                      : c5.selection.base.offset >
                                              state.landHoldingLost['gharBari']
                                                  .length
                                          ? state.landHoldingLost['gharBari']
                                              .length
                                          : c5.selection.base.offset,
                                ),
                              ),
                            maxLines: 1,
                            textCapitalization: TextCapitalization.characters,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                            key: const Key('sectionFive_gharBari'),
                            onChanged: (value) => context
                                .read<SectionFiveCubit>()
                                .landHoldingLostChanged({"gharBari": value}),
                            obscureText: false,
                            decoration: const InputDecoration(
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(
                                    top: 0), // add padding to adjust icon
                                child: Icon(Icons.person),
                              ),
                              border: OutlineInputBorder(),
                              labelText: "Ghar Bari",
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
                              text: getArea(state.landHoldingLost['gharBari']),
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
                      child: DropdownButtonFormField<String>(
                        value: state.gotNotification.value,
                        onChanged: (String? value) => context
                            .read<SectionFiveCubit>()
                            .gotNotificationChanged(value!),
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
                          labelText: "Have you got the notification?",
                          helperText: '',
                          errorText: state.gotNotification.invalid
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
                  sectionInfo("If no, what action has been taken by you?"),
                  spacerWidget(),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 5.w,
                    ),
                    child: MultiSelectDialogField(
                      key: GlobalKey(),
                      initialValue: state.whatAction.value,
                      onConfirm: (value) {
                        context
                            .read<SectionFiveCubit>()
                            .whatActionChanged(value);
                      },
                      searchable: true,
                      barrierColor: Colors.blueGrey.withOpacity(0.3),
                      items: protestActionList
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
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 5.w,
                      ),
                      child: DropdownButtonFormField<String>(
                        value: state.givenConsent.value,
                        onChanged: (String? value) => context
                            .read<SectionFiveCubit>()
                            .givenConsentChanged(value!),
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
                              "Have you given consent to sell the land to OCL?",
                          helperText: '',
                          errorText: state.givenConsent.invalid
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
                          ..text = state.reason
                          ..selection = TextSelection.fromPosition(
                            TextPosition(
                              offset:
                                  c6.selection.base.offset > state.reason.length
                                      ? state.reason.length
                                      : c6.selection.base.offset,
                            ),
                          ),
                        maxLines: 5,
                        textCapitalization: TextCapitalization.characters,
                        textInputAction: TextInputAction.next,
                        key: const Key('sectionFive_reason'),
                        onChanged: (value) => context
                            .read<SectionFiveCubit>()
                            .reasonChanged(value),
                        obscureText: false,
                        decoration: const InputDecoration(
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(
                                top: 0), // add padding to adjust icon
                            child: Icon(Icons.person),
                          ),
                          border: OutlineInputBorder(),
                          labelText: "If Yes/No, then state the reason",
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
                        value: state.aware.value,
                        onChanged: (String? value) => context
                            .read<SectionFiveCubit>()
                            .awareChanged(value!),
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
                              "Are you aware of 'why' the land is being acquired for?",
                          helperText: '',
                          errorText:
                              state.aware.invalid ? 'required field' : null,
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
                  sectionInfo(
                      "Are you aware of the law under which the land is being taken?"),
                  spacerWidget(),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 5.w,
                      ),
                      child: DropdownButtonFormField<String>(
                        value: state.law.value,
                        onChanged: (String? value) =>
                            context.read<SectionFiveCubit>().lawChanged(value!),
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
                              "Are you aware of the law under which the land is being taken?",
                          helperText: '',
                          errorText:
                              state.law.invalid ? 'required field' : null,
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
                  sectionInfo(
                      "Was there Gramsabha in your village/panchayat held to discuss whether to give the land to OCL?"),
                  spacerWidget(),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 5.w,
                      ),
                      child: DropdownButtonFormField<String>(
                        value: state.gramsabha.value,
                        onChanged: (String? value) => context
                            .read<SectionFiveCubit>()
                            .gramsabhaChanged(value!),
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
                              "Was there Gramsabha in your village/panchayat held to discuss whether to give the land to OCL?",
                          helperText: '',
                          errorText:
                              state.gramsabha.invalid ? 'required field' : null,
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
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 5.w,
                      ),
                      child: DropdownButtonFormField<String>(
                        value: state.participate.value,
                        onChanged: (String? value) => context
                            .read<SectionFiveCubit>()
                            .participateChanged(value!),
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
                              "If yes, did you participate in the gram sabha?",
                          helperText: '',
                          errorText: state.participate.invalid
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
                          ..text = state.resolution
                          ..selection = TextSelection.fromPosition(
                            TextPosition(
                              offset: c7.selection.base.offset >
                                      state.resolution.length
                                  ? state.resolution.length
                                  : c7.selection.base.offset,
                            ),
                          ),
                        maxLines: 5,
                        textCapitalization: TextCapitalization.characters,
                        textInputAction: TextInputAction.next,
                        key: const Key('sectionFive_resolution'),
                        onChanged: (value) => context
                            .read<SectionFiveCubit>()
                            .resolutionChanged(value),
                        obscureText: false,
                        decoration: const InputDecoration(
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(
                                top: 0), // add padding to adjust icon
                            child: Icon(Icons.person),
                          ),
                          border: OutlineInputBorder(),
                          labelText:
                              "What resolution was passed in the gram sabha?",
                          helperText: '',
                        ),
                      ),
                    ),
                  ),
                  sectionInfo(
                      "Are you aware of the compensation you will be paid for the loss of land ?"),
                  spacerWidget(),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 5.w,
                      ),
                      child: DropdownButtonFormField<String>(
                        value: state.compensationAware.value,
                        onChanged: (String? value) => context
                            .read<SectionFiveCubit>()
                            .compensationAwareChanged(value!),
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
                              "Are you aware of the compensation you will be paid for the loss of land?",
                          helperText: '',
                          errorText: state.compensationAware.invalid
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
                  sectionInfo(
                      "If Yes, mention the compensation  you would receive for selling the land ?"),
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
                        controller: c8 = TextEditingController()
                          ..text = state.compensationDetails
                          ..selection = TextSelection.fromPosition(
                            TextPosition(
                              offset: c8.selection.base.offset >
                                      state.compensationDetails.length
                                  ? state.compensationDetails.length
                                  : c8.selection.base.offset,
                            ),
                          ),
                        maxLines: 5,
                        textCapitalization: TextCapitalization.characters,
                        textInputAction: TextInputAction.next,
                        key: const Key('sectionFive_compensationDetails'),
                        onChanged: (value) => context
                            .read<SectionFiveCubit>()
                            .compensationDetailsChanged(value),
                        obscureText: false,
                        decoration: const InputDecoration(
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(
                                top: 0), // add padding to adjust icon
                            child: Icon(Icons.person),
                          ),
                          border: OutlineInputBorder(),
                          labelText:
                              "If Yes, mention the compensation  you would receive for selling the land ?",
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
                        value: state.happyWithCompensation.value,
                        onChanged: (String? value) => context
                            .read<SectionFiveCubit>()
                            .happyWithCompensationChanged(value!),
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
                          labelText: "Are you happy with this Compensation?",
                          helperText: '',
                          errorText: state.happyWithCompensation.invalid
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
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 5.w,
                      ),
                      child: DropdownButtonFormField<String>(
                        value: state.resettlementPlan.value,
                        onChanged: (String? value) => context
                            .read<SectionFiveCubit>()
                            .resettlementPlanChanged(value!),
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
                              "Are you aware of Resettlement and Rehabilitation plan",
                          helperText: '',
                          errorText: state.resettlementPlan.invalid
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
                  sectionInfo(
                      "What are your opinion about the Resettlement and rehabilitation plan ?"),
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
                        controller: c9 = TextEditingController()
                          ..text = state.resettlementOpinion
                          ..selection = TextSelection.fromPosition(
                            TextPosition(
                              offset: c9.selection.base.offset >
                                      state.resettlementOpinion.length
                                  ? state.resettlementOpinion.length
                                  : c9.selection.base.offset,
                            ),
                          ),
                        maxLines: 5,
                        textCapitalization: TextCapitalization.characters,
                        textInputAction: TextInputAction.done,
                        key: const Key('sectionFive_resettlementOpinion'),
                        onChanged: (value) => context
                            .read<SectionFiveCubit>()
                            .resettlementOpinionChanged(value),
                        obscureText: false,
                        decoration: const InputDecoration(
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(
                                top: 0), // add padding to adjust icon
                            child: Icon(Icons.person),
                          ),
                          border: OutlineInputBorder(),
                          labelText:
                              "What are your opinion about the Resettlement and rehabilitation plan ?",
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
