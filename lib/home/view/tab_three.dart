// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';
import 'package:sizer/sizer.dart';

import '../cubit/cubit.dart';
import '../home.dart';

class TabThree extends StatefulWidget {
  const TabThree({super.key});

  @override
  State<TabThree> createState() => _TabThreeState();
}

class _TabThreeState extends State<TabThree>
    with AutomaticKeepAliveClientMixin<TabThree> {
  late TextEditingController c1,
      c2,
      c3,
      c4,
      c5,
      c6,
      c7,
      c8,
      c9,
      c10,
      c11,
      c12,
      c13,
      c14,
      c15;

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
    c10 = TextEditingController();
    c11 = TextEditingController();
    c12 = TextEditingController();
    c13 = TextEditingController();
    c14 = TextEditingController();
    c15 = TextEditingController();
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
    return BlocBuilder<SectionThreeCubit, SectionThreeState>(
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
                      "Livelihood Sources of Income for the Household"),
                  dividerWidget(),
                  spacerWidget(),
                  spacerWidget(),
                  sectionInfo("Sources of Income for the Household"),
                  spacerWidget(),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 5.w,
                    ),
                    child: MultiSelectDialogField(
                      key: GlobalKey(),
                      initialValue: state.incomeSources.value,
                      onConfirm: (value) {
                        context
                            .read<SectionThreeCubit>()
                            .incomeSourcesChanged(value);
                      },
                      searchable: true,
                      buttonText: const Text(
                        "Select Sources of Income",
                        style: TextStyle(
                          color: Colors.lightBlue,
                        ),
                      ),
                      barrierColor: Colors.blueGrey.withOpacity(0.3),
                      items: sourcesOfincomeList
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
                  sectionInfo("Livelihood assets other than Land"),
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
                          intFormat(),
                        ],
                        controller: c1 = TextEditingController()
                          ..text = state.otherAssetsCount['cow'] ?? ''
                          ..selection = TextSelection.fromPosition(
                            TextPosition(
                              offset: state.otherAssetsCount['cow'] == null
                                  ? 0
                                  : c1.selection.base.offset >
                                          state.otherAssetsCount['cow'].length
                                      ? state.otherAssetsCount['cow'].length
                                      : c1.selection.base.offset,
                            ),
                          ),
                        maxLines: 1,
                        textCapitalization: TextCapitalization.characters,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        key: const Key('sectionThree_cowCount'),
                        onChanged: (value) => context
                            .read<SectionThreeCubit>()
                            .otherAssetsCountChanged({"cow": value}),
                        obscureText: false,
                        decoration: const InputDecoration(
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(
                                top: 0), // add padding to adjust icon
                            child: Icon(Icons.person),
                          ),
                          border: OutlineInputBorder(),
                          labelText: "Cow (Count)",
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
                      child: TextFormField(
                        inputFormatters: [
                          intFormat(),
                        ],
                        controller: c2 = TextEditingController()
                          ..text = state.otherAssetsCount['buffalo'] ?? ''
                          ..selection = TextSelection.fromPosition(
                            TextPosition(
                              offset: state.otherAssetsCount['buffalo'] == null
                                  ? 0
                                  : c2.selection.base.offset >
                                          state.otherAssetsCount['buffalo']
                                              .length
                                      ? state.otherAssetsCount['buffalo'].length
                                      : c2.selection.base.offset,
                            ),
                          ),
                        maxLines: 1,
                        textCapitalization: TextCapitalization.characters,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        key: const Key('sectionThree_buffaloCount'),
                        onChanged: (value) => context
                            .read<SectionThreeCubit>()
                            .otherAssetsCountChanged({"buffalo": value}),
                        obscureText: false,
                        decoration: const InputDecoration(
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(
                                top: 0), // add padding to adjust icon
                            child: Icon(Icons.person),
                          ),
                          border: OutlineInputBorder(),
                          labelText: "Buffalo (Count)",
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
                      child: TextFormField(
                        inputFormatters: [
                          intFormat(),
                        ],
                        controller: c3 = TextEditingController()
                          ..text = state.otherAssetsCount['bullock'] ?? ''
                          ..selection = TextSelection.fromPosition(
                            TextPosition(
                              offset: state.otherAssetsCount['bullock'] == null
                                  ? 0
                                  : c3.selection.base.offset >
                                          state.otherAssetsCount['bullock']
                                              .length
                                      ? state.otherAssetsCount['bullock'].length
                                      : c3.selection.base.offset,
                            ),
                          ),
                        maxLines: 1,
                        textCapitalization: TextCapitalization.characters,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        key: const Key('sectionThree_bullockCount'),
                        onChanged: (value) => context
                            .read<SectionThreeCubit>()
                            .otherAssetsCountChanged({"bullock": value}),
                        obscureText: false,
                        decoration: const InputDecoration(
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(
                                top: 0), // add padding to adjust icon
                            child: Icon(Icons.person),
                          ),
                          border: OutlineInputBorder(),
                          labelText: "Bullock (Count)",
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
                      child: TextFormField(
                        inputFormatters: [
                          intFormat(),
                        ],
                        controller: c4 = TextEditingController()
                          ..text = state.otherAssetsCount['goat'] ?? ''
                          ..selection = TextSelection.fromPosition(
                            TextPosition(
                              offset: state.otherAssetsCount['goat'] == null
                                  ? 0
                                  : c4.selection.base.offset >
                                          state.otherAssetsCount['goat'].length
                                      ? state.otherAssetsCount['goat'].length
                                      : c4.selection.base.offset,
                            ),
                          ),
                        maxLines: 1,
                        textCapitalization: TextCapitalization.characters,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        key: const Key('sectionThree_goatCount'),
                        onChanged: (value) => context
                            .read<SectionThreeCubit>()
                            .otherAssetsCountChanged({"goat": value}),
                        obscureText: false,
                        decoration: const InputDecoration(
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(
                                top: 0), // add padding to adjust icon
                            child: Icon(Icons.person),
                          ),
                          border: OutlineInputBorder(),
                          labelText: "Goat (Count)",
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
                      child: TextFormField(
                        inputFormatters: [
                          intFormat(),
                        ],
                        controller: c5 = TextEditingController()
                          ..text = state.otherAssetsCount['chicken'] ?? ''
                          ..selection = TextSelection.fromPosition(
                            TextPosition(
                              offset: state.otherAssetsCount['chicken'] == null
                                  ? 0
                                  : c5.selection.base.offset >
                                          state.otherAssetsCount['chicken']
                                              .length
                                      ? state.otherAssetsCount['chicken'].length
                                      : c5.selection.base.offset,
                            ),
                          ),
                        maxLines: 1,
                        textCapitalization: TextCapitalization.characters,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        key: const Key('sectionThree_chickenCount'),
                        onChanged: (value) => context
                            .read<SectionThreeCubit>()
                            .otherAssetsCountChanged({"chicken": value}),
                        obscureText: false,
                        decoration: const InputDecoration(
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(
                                top: 0), // add padding to adjust icon
                            child: Icon(Icons.person),
                          ),
                          border: OutlineInputBorder(),
                          labelText: "Chicken (Count)",
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
                      child: TextFormField(
                        inputFormatters: [
                          intFormat(),
                        ],
                        controller: c6 = TextEditingController()
                          ..text = state.otherAssetsCount['duck'] ?? ''
                          ..selection = TextSelection.fromPosition(
                            TextPosition(
                              offset: state.otherAssetsCount['duck'] == null
                                  ? 0
                                  : c6.selection.base.offset >
                                          state.otherAssetsCount['duck'].length
                                      ? state.otherAssetsCount['duck'].length
                                      : c6.selection.base.offset,
                            ),
                          ),
                        maxLines: 1,
                        textCapitalization: TextCapitalization.characters,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        key: const Key('sectionThree_duckCount'),
                        onChanged: (value) => context
                            .read<SectionThreeCubit>()
                            .otherAssetsCountChanged({"duck": value}),
                        obscureText: false,
                        decoration: const InputDecoration(
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(
                                top: 0), // add padding to adjust icon
                            child: Icon(Icons.person),
                          ),
                          border: OutlineInputBorder(),
                          labelText: "Duck (Count)",
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
                      child: TextFormField(
                        inputFormatters: [
                          intFormat(),
                        ],
                        controller: c7 = TextEditingController()
                          ..text = state.otherAssetsCount['tractor'] ?? ''
                          ..selection = TextSelection.fromPosition(
                            TextPosition(
                              offset: state.otherAssetsCount['tractor'] == null
                                  ? 0
                                  : c7.selection.base.offset >
                                          state.otherAssetsCount['tractor']
                                              .length
                                      ? state.otherAssetsCount['tractor'].length
                                      : c7.selection.base.offset,
                            ),
                          ),
                        maxLines: 1,
                        textCapitalization: TextCapitalization.characters,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        key: const Key('sectionThree_tractorCount'),
                        onChanged: (value) => context
                            .read<SectionThreeCubit>()
                            .otherAssetsCountChanged({"tractor": value}),
                        obscureText: false,
                        decoration: const InputDecoration(
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(
                                top: 0), // add padding to adjust icon
                            child: Icon(Icons.person),
                          ),
                          border: OutlineInputBorder(),
                          labelText: "Tractor (Count)",
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
                      child: TextFormField(
                        inputFormatters: [
                          intFormat(),
                        ],
                        controller: c8 = TextEditingController()
                          ..text = state.otherAssetsCount['powerTiller'] ?? ''
                          ..selection = TextSelection.fromPosition(
                            TextPosition(
                              offset: state.otherAssetsCount['powerTiller'] ==
                                      null
                                  ? 0
                                  : c8.selection.base.offset >
                                          state.otherAssetsCount['powerTiller']
                                              .length
                                      ? state.otherAssetsCount['powerTiller']
                                          .length
                                      : c8.selection.base.offset,
                            ),
                          ),
                        maxLines: 1,
                        textCapitalization: TextCapitalization.characters,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        key: const Key('sectionThree_powerTillerCount'),
                        onChanged: (value) => context
                            .read<SectionThreeCubit>()
                            .otherAssetsCountChanged({"powerTiller": value}),
                        obscureText: false,
                        decoration: const InputDecoration(
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(
                                top: 0), // add padding to adjust icon
                            child: Icon(Icons.person),
                          ),
                          border: OutlineInputBorder(),
                          labelText: "Power Tiller (Count)",
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
                      child: TextFormField(
                        inputFormatters: [
                          intFormat(),
                        ],
                        controller: c9 = TextEditingController()
                          ..text = state.otherAssetsCount['thresher'] ?? ''
                          ..selection = TextSelection.fromPosition(
                            TextPosition(
                              offset: state.otherAssetsCount['thresher'] == null
                                  ? 0
                                  : c9.selection.base.offset >
                                          state.otherAssetsCount['thresher']
                                              .length
                                      ? state
                                          .otherAssetsCount['thresher'].length
                                      : c9.selection.base.offset,
                            ),
                          ),
                        maxLines: 1,
                        textCapitalization: TextCapitalization.characters,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        key: const Key('sectionThree_thresherCount'),
                        onChanged: (value) => context
                            .read<SectionThreeCubit>()
                            .otherAssetsCountChanged({"thresher": value}),
                        obscureText: false,
                        decoration: const InputDecoration(
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(
                                top: 0), // add padding to adjust icon
                            child: Icon(Icons.person),
                          ),
                          border: OutlineInputBorder(),
                          labelText: "Thresher (Count)",
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
                      child: TextFormField(
                        inputFormatters: [
                          intFormat(),
                        ],
                        controller: c10 = TextEditingController()
                          ..text = state.otherAssetsCount['pump'] ?? ''
                          ..selection = TextSelection.fromPosition(
                            TextPosition(
                              offset: state.otherAssetsCount['pump'] == null
                                  ? 0
                                  : c10.selection.base.offset >
                                          state.otherAssetsCount['pump'].length
                                      ? state.otherAssetsCount['pump'].length
                                      : c10.selection.base.offset,
                            ),
                          ),
                        maxLines: 1,
                        textCapitalization: TextCapitalization.characters,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        key: const Key('sectionThree_pumpCount'),
                        onChanged: (value) => context
                            .read<SectionThreeCubit>()
                            .otherAssetsCountChanged({"pump": value}),
                        obscureText: false,
                        decoration: const InputDecoration(
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(
                                top: 0), // add padding to adjust icon
                            child: Icon(Icons.person),
                          ),
                          border: OutlineInputBorder(),
                          labelText: "Pump (Count)",
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
                      child: TextFormField(
                        inputFormatters: [
                          intFormat(),
                        ],
                        controller: c11 = TextEditingController()
                          ..text = state.otherAssetsCount['tailorMachine'] ?? ''
                          ..selection = TextSelection.fromPosition(
                            TextPosition(
                              offset: state.otherAssetsCount['tailorMachine'] ==
                                      null
                                  ? 0
                                  : c11.selection.base.offset >
                                          state
                                              .otherAssetsCount['tailorMachine']
                                              .length
                                      ? state.otherAssetsCount['tailorMachine']
                                          .length
                                      : c11.selection.base.offset,
                            ),
                          ),
                        maxLines: 1,
                        textCapitalization: TextCapitalization.characters,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        key: const Key('sectionThree_tailorMachineCount'),
                        onChanged: (value) => context
                            .read<SectionThreeCubit>()
                            .otherAssetsCountChanged({"tailorMachine": value}),
                        obscureText: false,
                        decoration: const InputDecoration(
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(
                                top: 0), // add padding to adjust icon
                            child: Icon(Icons.person),
                          ),
                          border: OutlineInputBorder(),
                          labelText: "Tailor Machine (Count)",
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
                      child: TextFormField(
                        inputFormatters: [
                          intFormat(),
                        ],
                        controller: c12 = TextEditingController()
                          ..text = state.otherAssetsCount['fourWheeler'] ?? ''
                          ..selection = TextSelection.fromPosition(
                            TextPosition(
                              offset: state.otherAssetsCount['fourWheeler'] ==
                                      null
                                  ? 0
                                  : c12.selection.base.offset >
                                          state.otherAssetsCount['fourWheeler']
                                              .length
                                      ? state.otherAssetsCount['fourWheeler']
                                          .length
                                      : c12.selection.base.offset,
                            ),
                          ),
                        maxLines: 1,
                        textCapitalization: TextCapitalization.characters,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        key: const Key('sectionThree_fourWheelerCount'),
                        onChanged: (value) => context
                            .read<SectionThreeCubit>()
                            .otherAssetsCountChanged({"fourWheeler": value}),
                        obscureText: false,
                        decoration: const InputDecoration(
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(
                                top: 0), // add padding to adjust icon
                            child: Icon(Icons.person),
                          ),
                          border: OutlineInputBorder(),
                          labelText: "Four Wheeler (Count)",
                          helperText: '',
                        ),
                      ),
                    ),
                  ),
                  sectionInfo("Annual Income of Family"),
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
                          intFormat(),
                        ],
                        controller: c13 = TextEditingController()
                          ..text = state.annualIncome.value ?? ''
                          ..selection = TextSelection.fromPosition(
                            TextPosition(
                              offset: state.annualIncome.value == null
                                  ? 0
                                  : c13.selection.base.offset >
                                          state.annualIncome.value.length
                                      ? state.annualIncome.value.length
                                      : c13.selection.base.offset,
                            ),
                          ),
                        maxLines: 1,
                        textCapitalization: TextCapitalization.characters,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        key: const Key('sectionThree_annualIncome'),
                        onChanged: (value) => context
                            .read<SectionThreeCubit>()
                            .annualIncomeChanged(value),
                        obscureText: false,
                        decoration: const InputDecoration(
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(
                                top: 0), // add padding to adjust icon
                            child: Icon(Icons.monetization_on_rounded,
                                color: Colors.lightBlue),
                          ),
                          border: OutlineInputBorder(),
                          labelText: "Annual Income of Family",
                          helperText: '',
                        ),
                      ),
                    ),
                  ),
                  sectionInfo("Cropping Pattern (a) Crops"),
                  spacerWidget(),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 5.w,
                    ),
                    child: MultiSelectDialogField(
                      key: GlobalKey(),
                      initialValue: state.cropsPattern['paddy'],
                      onConfirm: (value) {
                        context
                            .read<SectionThreeCubit>()
                            .cropsPatternChanged({"paddy": value});
                      },
                      title: const Text("Select Paddy"),
                      buttonText: const Text("Select Paddy"),
                      searchable: true,
                      barrierColor: Colors.blueGrey.withOpacity(0.3),
                      items: cropPurposeList
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
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 5.w,
                    ),
                    child: MultiSelectDialogField(
                      key: GlobalKey(),
                      initialValue: state.cropsPattern['millet'],
                      onConfirm: (value) {
                        context
                            .read<SectionThreeCubit>()
                            .cropsPatternChanged({"millet": value});
                      },
                      title: const Text("Select Millet"),
                      buttonText: const Text("Select Millet"),
                      searchable: true,
                      barrierColor: Colors.blueGrey.withOpacity(0.3),
                      items: cropPurposeList
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
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 5.w,
                    ),
                    child: MultiSelectDialogField(
                      key: GlobalKey(),
                      initialValue: state.cropsPattern['gangai'],
                      onConfirm: (value) {
                        context
                            .read<SectionThreeCubit>()
                            .cropsPatternChanged({"gangai": value});
                      },
                      title: const Text("Select Gangai"),
                      buttonText: const Text("Select Gangai"),
                      searchable: true,
                      barrierColor: Colors.blueGrey.withOpacity(0.3),
                      items: cropPurposeList
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
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 5.w,
                    ),
                    child: MultiSelectDialogField(
                      key: GlobalKey(),
                      initialValue: state.cropsPattern['maize'],
                      onConfirm: (value) {
                        context
                            .read<SectionThreeCubit>()
                            .cropsPatternChanged({"maize": value});
                      },
                      title: const Text("Select Maize"),
                      buttonText: const Text("Select Maize"),
                      searchable: true,
                      barrierColor: Colors.blueGrey.withOpacity(0.3),
                      items: cropPurposeList
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
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 5.w,
                    ),
                    child: MultiSelectDialogField(
                      key: GlobalKey(),
                      initialValue: state.cropsPattern['kodo'],
                      onConfirm: (value) {
                        context
                            .read<SectionThreeCubit>()
                            .cropsPatternChanged({"kodo": value});
                      },
                      title: const Text("Select Kodo"),
                      buttonText: const Text("Select Kodo"),
                      searchable: true,
                      barrierColor: Colors.blueGrey.withOpacity(0.3),
                      items: cropPurposeList
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
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 5.w,
                    ),
                    child: MultiSelectDialogField(
                      key: GlobalKey(),
                      initialValue: state.cropsPattern['gondli'],
                      onConfirm: (value) {
                        context
                            .read<SectionThreeCubit>()
                            .cropsPatternChanged({"gondli": value});
                      },
                      title: const Text("Select Gondli"),
                      buttonText: const Text("Select Gondli"),
                      searchable: true,
                      barrierColor: Colors.blueGrey.withOpacity(0.3),
                      items: cropPurposeList
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
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 5.w,
                    ),
                    child: MultiSelectDialogField(
                      key: GlobalKey(),
                      initialValue: state.cropsPattern['kurthi'],
                      onConfirm: (value) {
                        context
                            .read<SectionThreeCubit>()
                            .cropsPatternChanged({"kurthi": value});
                      },
                      title: const Text("Select Kurthi"),
                      buttonText: const Text("Select Kurthi"),
                      searchable: true,
                      barrierColor: Colors.blueGrey.withOpacity(0.3),
                      items: cropPurposeList
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
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 5.w,
                    ),
                    child: MultiSelectDialogField(
                      key: GlobalKey(),
                      initialValue: state.cropsPattern['khesra'],
                      onConfirm: (value) {
                        context
                            .read<SectionThreeCubit>()
                            .cropsPatternChanged({"khesra": value});
                      },
                      title: const Text("Select Khesra"),
                      buttonText: const Text("Select Khesra"),
                      searchable: true,
                      barrierColor: Colors.blueGrey.withOpacity(0.3),
                      items: cropPurposeList
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
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 5.w,
                    ),
                    child: MultiSelectDialogField(
                      key: GlobalKey(),
                      initialValue: state.cropsPattern['rahad'],
                      onConfirm: (value) {
                        context
                            .read<SectionThreeCubit>()
                            .cropsPatternChanged({"rahad": value});
                      },
                      title: const Text("Select Rahad"),
                      buttonText: const Text("Select Rahad"),
                      searchable: true,
                      barrierColor: Colors.blueGrey.withOpacity(0.3),
                      items: cropPurposeList
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
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 5.w,
                    ),
                    child: MultiSelectDialogField(
                      key: GlobalKey(),
                      initialValue: state.cropsPattern['urad'],
                      onConfirm: (value) {
                        context
                            .read<SectionThreeCubit>()
                            .cropsPatternChanged({"urad": value});
                      },
                      title: const Text("Select Urad"),
                      buttonText: const Text("Select Urad"),
                      searchable: true,
                      barrierColor: Colors.blueGrey.withOpacity(0.3),
                      items: cropPurposeList
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
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 5.w,
                    ),
                    child: MultiSelectDialogField(
                      key: GlobalKey(),
                      initialValue: state.cropsPattern['jhata'],
                      onConfirm: (value) {
                        context
                            .read<SectionThreeCubit>()
                            .cropsPatternChanged({"jhata": value});
                      },
                      title: const Text("Select Jhata"),
                      buttonText: const Text("Select Jhata"),
                      searchable: true,
                      barrierColor: Colors.blueGrey.withOpacity(0.3),
                      items: cropPurposeList
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
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 5.w,
                    ),
                    child: MultiSelectDialogField(
                      key: GlobalKey(),
                      initialValue: state.cropsPattern['moong'],
                      onConfirm: (value) {
                        context
                            .read<SectionThreeCubit>()
                            .cropsPatternChanged({"moong": value});
                      },
                      title: const Text("Select Moong"),
                      buttonText: const Text("Select Moong"),
                      searchable: true,
                      barrierColor: Colors.blueGrey.withOpacity(0.3),
                      items: cropPurposeList
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
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 5.w,
                    ),
                    child: MultiSelectDialogField(
                      key: GlobalKey(),
                      initialValue: state.cropsPattern['masoor'],
                      onConfirm: (value) {
                        context
                            .read<SectionThreeCubit>()
                            .cropsPatternChanged({"masoor": value});
                      },
                      title: const Text("Select Masoor"),
                      buttonText: const Text("Select Masoor"),
                      searchable: true,
                      barrierColor: Colors.blueGrey.withOpacity(0.3),
                      items: cropPurposeList
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
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 5.w,
                    ),
                    child: MultiSelectDialogField(
                      key: GlobalKey(),
                      initialValue: state.cropsPattern['groundnut'],
                      onConfirm: (value) {
                        context
                            .read<SectionThreeCubit>()
                            .cropsPatternChanged({"groundnut": value});
                      },
                      title: const Text("Select Groundnut"),
                      buttonText: const Text("Select Groundnut"),
                      searchable: true,
                      barrierColor: Colors.blueGrey.withOpacity(0.3),
                      items: cropPurposeList
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
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 5.w,
                    ),
                    child: MultiSelectDialogField(
                      key: GlobalKey(),
                      initialValue: state.cropsPattern['sesame'],
                      onConfirm: (value) {
                        context
                            .read<SectionThreeCubit>()
                            .cropsPatternChanged({"sesame": value});
                      },
                      title: const Text("Select Sesame"),
                      buttonText: const Text("Select Sesame"),
                      searchable: true,
                      barrierColor: Colors.blueGrey.withOpacity(0.3),
                      items: cropPurposeList
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
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 5.w,
                    ),
                    child: MultiSelectDialogField(
                      key: GlobalKey(),
                      initialValue: state.cropsPattern['mustardSeedOil'],
                      onConfirm: (value) {
                        context
                            .read<SectionThreeCubit>()
                            .cropsPatternChanged({"mustardSeedOil": value});
                      },
                      title: const Text("Select Mustard Seed Oil"),
                      buttonText: const Text("Select Mustard Seed Oil"),
                      searchable: true,
                      barrierColor: Colors.blueGrey.withOpacity(0.3),
                      items: cropPurposeList
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
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 5.w,
                    ),
                    child: MultiSelectDialogField(
                      key: GlobalKey(),
                      initialValue: state.cropsPattern['sunflowerSeed'],
                      onConfirm: (value) {
                        context
                            .read<SectionThreeCubit>()
                            .cropsPatternChanged({"sunflowerSeed": value});
                      },
                      title: const Text("Select Sunflower Seed"),
                      buttonText: const Text("Select Sunflower Seed"),
                      searchable: true,
                      barrierColor: Colors.blueGrey.withOpacity(0.3),
                      items: cropPurposeList
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
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 5.w,
                    ),
                    child: MultiSelectDialogField(
                      key: GlobalKey(),
                      initialValue: state.cropsPattern['jatangi'],
                      onConfirm: (value) {
                        context
                            .read<SectionThreeCubit>()
                            .cropsPatternChanged({"jatangi": value});
                      },
                      title: const Text("Select Jatangi"),
                      buttonText: const Text("Select Jatangi"),
                      searchable: true,
                      barrierColor: Colors.blueGrey.withOpacity(0.3),
                      items: cropPurposeList
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
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 5.w,
                    ),
                    child: MultiSelectDialogField(
                      key: GlobalKey(),
                      initialValue: state.cropsPattern['jada'],
                      onConfirm: (value) {
                        context
                            .read<SectionThreeCubit>()
                            .cropsPatternChanged({"jada": value});
                      },
                      title: const Text("Select Jada"),
                      buttonText: const Text("Select Jada"),
                      searchable: true,
                      barrierColor: Colors.blueGrey.withOpacity(0.3),
                      items: cropPurposeList
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
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 5.w,
                    ),
                    child: MultiSelectDialogField(
                      key: GlobalKey(),
                      initialValue: state.cropsPattern['butChana'],
                      onConfirm: (value) {
                        context
                            .read<SectionThreeCubit>()
                            .cropsPatternChanged({"butChana": value});
                      },
                      title: const Text("Select But Chana"),
                      buttonText: const Text("Select But Chana"),
                      searchable: true,
                      barrierColor: Colors.blueGrey.withOpacity(0.3),
                      items: cropPurposeList
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
                  sectionInfo("Cropping Pattern (b) Vegetables"),
                  spacerWidget(),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 5.w,
                    ),
                    child: MultiSelectDialogField(
                      key: GlobalKey(),
                      initialValue: state.vegetablesPattern['brinjal'],
                      onConfirm: (value) {
                        context
                            .read<SectionThreeCubit>()
                            .vegetablesPatternChanged({"brinjal": value});
                      },
                      title: const Text("Select Brinjal"),
                      buttonText: const Text("Select Brinjal"),
                      searchable: true,
                      barrierColor: Colors.blueGrey.withOpacity(0.3),
                      items: cropPurposeList
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
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 5.w,
                    ),
                    child: MultiSelectDialogField(
                      key: GlobalKey(),
                      initialValue: state.vegetablesPattern['potato'],
                      onConfirm: (value) {
                        context
                            .read<SectionThreeCubit>()
                            .vegetablesPatternChanged({"potato": value});
                      },
                      title: const Text("Select Potato"),
                      buttonText: const Text("Select Potato"),
                      searchable: true,
                      barrierColor: Colors.blueGrey.withOpacity(0.3),
                      items: cropPurposeList
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
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 5.w,
                    ),
                    child: MultiSelectDialogField(
                      key: GlobalKey(),
                      initialValue: state.vegetablesPattern['tomato'],
                      onConfirm: (value) {
                        context
                            .read<SectionThreeCubit>()
                            .vegetablesPatternChanged({"tomato": value});
                      },
                      title: const Text("Select Tomato"),
                      buttonText: const Text("Select Tomato"),
                      searchable: true,
                      barrierColor: Colors.blueGrey.withOpacity(0.3),
                      items: cropPurposeList
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
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 5.w,
                    ),
                    child: MultiSelectDialogField(
                      key: GlobalKey(),
                      initialValue: state.vegetablesPattern['cabbage'],
                      onConfirm: (value) {
                        context
                            .read<SectionThreeCubit>()
                            .vegetablesPatternChanged({"cabbage": value});
                      },
                      title: const Text("Select Cabbage"),
                      buttonText: const Text("Select Cabbage"),
                      searchable: true,
                      barrierColor: Colors.blueGrey.withOpacity(0.3),
                      items: cropPurposeList
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
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 5.w,
                    ),
                    child: MultiSelectDialogField(
                      key: GlobalKey(),
                      initialValue: state.vegetablesPattern['cauliflower'],
                      onConfirm: (value) {
                        context
                            .read<SectionThreeCubit>()
                            .vegetablesPatternChanged({"cauliflower": value});
                      },
                      title: const Text("Select Cauliflower"),
                      buttonText: const Text("Select Cauliflower"),
                      searchable: true,
                      barrierColor: Colors.blueGrey.withOpacity(0.3),
                      items: cropPurposeList
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
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 5.w,
                    ),
                    child: MultiSelectDialogField(
                      key: GlobalKey(),
                      initialValue: state.vegetablesPattern['pumpkin'],
                      onConfirm: (value) {
                        context
                            .read<SectionThreeCubit>()
                            .vegetablesPatternChanged({"pumpkin": value});
                      },
                      title: const Text("Select Pumpkin"),
                      buttonText: const Text("Select Pumpkin"),
                      searchable: true,
                      barrierColor: Colors.blueGrey.withOpacity(0.3),
                      items: cropPurposeList
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
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 5.w,
                    ),
                    child: MultiSelectDialogField(
                      key: GlobalKey(),
                      initialValue: state.vegetablesPattern['bottleGourd'],
                      onConfirm: (value) {
                        context
                            .read<SectionThreeCubit>()
                            .vegetablesPatternChanged({"bottleGourd": value});
                      },
                      title: const Text("Select Bottle Gourd"),
                      buttonText: const Text("Select Bottle Gourd"),
                      searchable: true,
                      barrierColor: Colors.blueGrey.withOpacity(0.3),
                      items: cropPurposeList
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
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 5.w,
                    ),
                    child: MultiSelectDialogField(
                      key: GlobalKey(),
                      initialValue: state.vegetablesPattern['bitterGourd'],
                      onConfirm: (value) {
                        context
                            .read<SectionThreeCubit>()
                            .vegetablesPatternChanged({"bitterGourd": value});
                      },
                      title: const Text("Select Bitter Gourd"),
                      buttonText: const Text("Select Bitter Gourd"),
                      searchable: true,
                      barrierColor: Colors.blueGrey.withOpacity(0.3),
                      items: cropPurposeList
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
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 5.w,
                    ),
                    child: MultiSelectDialogField(
                      key: GlobalKey(),
                      initialValue: state.vegetablesPattern['radish'],
                      onConfirm: (value) {
                        context
                            .read<SectionThreeCubit>()
                            .vegetablesPatternChanged({"radish": value});
                      },
                      title: const Text("Select Radish"),
                      buttonText: const Text("Select Radish"),
                      searchable: true,
                      barrierColor: Colors.blueGrey.withOpacity(0.3),
                      items: cropPurposeList
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
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 5.w,
                    ),
                    child: MultiSelectDialogField(
                      key: GlobalKey(),
                      initialValue: state.vegetablesPattern['carrot'],
                      onConfirm: (value) {
                        context
                            .read<SectionThreeCubit>()
                            .vegetablesPatternChanged({"carrot": value});
                      },
                      title: const Text("Select Carrot"),
                      buttonText: const Text("Select Carrot"),
                      searchable: true,
                      barrierColor: Colors.blueGrey.withOpacity(0.3),
                      items: cropPurposeList
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
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 5.w,
                    ),
                    child: MultiSelectDialogField(
                      key: GlobalKey(),
                      initialValue: state.vegetablesPattern['beetRoot'],
                      onConfirm: (value) {
                        context
                            .read<SectionThreeCubit>()
                            .vegetablesPatternChanged({"beetRoot": value});
                      },
                      title: const Text("Select Beet Root"),
                      buttonText: const Text("Select Beet Root"),
                      searchable: true,
                      barrierColor: Colors.blueGrey.withOpacity(0.3),
                      items: cropPurposeList
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
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 5.w,
                    ),
                    child: MultiSelectDialogField(
                      key: GlobalKey(),
                      initialValue: state.vegetablesPattern['yam'],
                      onConfirm: (value) {
                        context
                            .read<SectionThreeCubit>()
                            .vegetablesPatternChanged({"yam": value});
                      },
                      title: const Text("Select Yam"),
                      buttonText: const Text("Select Yam"),
                      searchable: true,
                      barrierColor: Colors.blueGrey.withOpacity(0.3),
                      items: cropPurposeList
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
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 5.w,
                    ),
                    child: MultiSelectDialogField(
                      key: GlobalKey(),
                      initialValue: state.vegetablesPattern['onion'],
                      onConfirm: (value) {
                        context
                            .read<SectionThreeCubit>()
                            .vegetablesPatternChanged({"onion": value});
                      },
                      title: const Text("Select Onion"),
                      buttonText: const Text("Select Onion"),
                      searchable: true,
                      barrierColor: Colors.blueGrey.withOpacity(0.3),
                      items: cropPurposeList
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
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 5.w,
                    ),
                    child: MultiSelectDialogField(
                      key: GlobalKey(),
                      initialValue: state.vegetablesPattern['garlic'],
                      onConfirm: (value) {
                        context
                            .read<SectionThreeCubit>()
                            .vegetablesPatternChanged({"garlic": value});
                      },
                      title: const Text("Select Garlic"),
                      buttonText: const Text("Select Garlic"),
                      searchable: true,
                      barrierColor: Colors.blueGrey.withOpacity(0.3),
                      items: cropPurposeList
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
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 5.w,
                    ),
                    child: MultiSelectDialogField(
                      key: GlobalKey(),
                      initialValue: state.vegetablesPattern['bhajiSaag'],
                      onConfirm: (value) {
                        context
                            .read<SectionThreeCubit>()
                            .vegetablesPatternChanged({"bhajiSaag": value});
                      },
                      title: const Text("Select Bhaji Saag"),
                      buttonText: const Text("Select Bhaji Saag"),
                      searchable: true,
                      barrierColor: Colors.blueGrey.withOpacity(0.3),
                      items: cropPurposeList
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
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 5.w,
                    ),
                    child: MultiSelectDialogField(
                      key: GlobalKey(),
                      initialValue: state.vegetablesPattern['palak'],
                      onConfirm: (value) {
                        context
                            .read<SectionThreeCubit>()
                            .vegetablesPatternChanged({"palak": value});
                      },
                      title: const Text("Select Palak"),
                      buttonText: const Text("Select Palak"),
                      searchable: true,
                      barrierColor: Colors.blueGrey.withOpacity(0.3),
                      items: cropPurposeList
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
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 5.w,
                    ),
                    child: MultiSelectDialogField(
                      key: GlobalKey(),
                      initialValue: state.vegetablesPattern['methi'],
                      onConfirm: (value) {
                        context
                            .read<SectionThreeCubit>()
                            .vegetablesPatternChanged({"methi": value});
                      },
                      title: const Text("Select Methi"),
                      buttonText: const Text("Select Methi"),
                      searchable: true,
                      barrierColor: Colors.blueGrey.withOpacity(0.3),
                      items: cropPurposeList
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
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 5.w,
                    ),
                    child: MultiSelectDialogField(
                      key: GlobalKey(),
                      initialValue: state.vegetablesPattern['puiSaag'],
                      onConfirm: (value) {
                        context
                            .read<SectionThreeCubit>()
                            .vegetablesPatternChanged({"puiSaag": value});
                      },
                      title: const Text("Select Pui Saag"),
                      buttonText: const Text("Select Pui Saag"),
                      searchable: true,
                      barrierColor: Colors.blueGrey.withOpacity(0.3),
                      items: cropPurposeList
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
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 5.w,
                    ),
                    child: MultiSelectDialogField(
                      key: GlobalKey(),
                      initialValue: state.vegetablesPattern['kudrum'],
                      onConfirm: (value) {
                        context
                            .read<SectionThreeCubit>()
                            .vegetablesPatternChanged({"kudrum": value});
                      },
                      title: const Text("Select Kudrum"),
                      buttonText: const Text("Select Kudrum"),
                      searchable: true,
                      barrierColor: Colors.blueGrey.withOpacity(0.3),
                      items: cropPurposeList
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
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 5.w,
                    ),
                    child: MultiSelectDialogField(
                      key: GlobalKey(),
                      initialValue: state.vegetablesPattern['coriander'],
                      onConfirm: (value) {
                        context
                            .read<SectionThreeCubit>()
                            .vegetablesPatternChanged({"coriander": value});
                      },
                      title: const Text("Select Coriander"),
                      buttonText: const Text("Select Coriander"),
                      searchable: true,
                      barrierColor: Colors.blueGrey.withOpacity(0.3),
                      items: cropPurposeList
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
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 5.w,
                    ),
                    child: MultiSelectDialogField(
                      key: GlobalKey(),
                      initialValue: state.vegetablesPattern['cucumber'],
                      onConfirm: (value) {
                        context
                            .read<SectionThreeCubit>()
                            .vegetablesPatternChanged({"cucumber": value});
                      },
                      title: const Text("Select Cucumber"),
                      buttonText: const Text("Select Cucumber"),
                      searchable: true,
                      barrierColor: Colors.blueGrey.withOpacity(0.3),
                      items: cropPurposeList
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
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 5.w,
                    ),
                    child: MultiSelectDialogField(
                      key: GlobalKey(),
                      initialValue: state.vegetablesPattern['longBean'],
                      onConfirm: (value) {
                        context
                            .read<SectionThreeCubit>()
                            .vegetablesPatternChanged({"longBean": value});
                      },
                      title: const Text("Select Long Bean"),
                      buttonText: const Text("Select Long Bean"),
                      searchable: true,
                      barrierColor: Colors.blueGrey.withOpacity(0.3),
                      items: cropPurposeList
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
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 5.w,
                    ),
                    child: MultiSelectDialogField(
                      key: GlobalKey(),
                      initialValue: state.vegetablesPattern['ladyFinger'],
                      onConfirm: (value) {
                        context
                            .read<SectionThreeCubit>()
                            .vegetablesPatternChanged({"ladyFinger": value});
                      },
                      title: const Text("Select Lady's Finger"),
                      buttonText: const Text("Select Lady's Finger"),
                      searchable: true,
                      barrierColor: Colors.blueGrey.withOpacity(0.3),
                      items: cropPurposeList
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
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 5.w,
                    ),
                    child: MultiSelectDialogField(
                      key: GlobalKey(),
                      initialValue: state.vegetablesPattern['peas'],
                      onConfirm: (value) {
                        context
                            .read<SectionThreeCubit>()
                            .vegetablesPatternChanged({"peas": value});
                      },
                      title: const Text("Select Peas"),
                      buttonText: const Text("Select Peas"),
                      searchable: true,
                      barrierColor: Colors.blueGrey.withOpacity(0.3),
                      items: cropPurposeList
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
                  sectionInfo("Forest Produce (FP) Section - A"),
                  spacerWidget(),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 5.w,
                    ),
                    child: MultiSelectDialogField(
                      key: GlobalKey(),
                      initialValue: state.forestProduce,
                      onConfirm: (value) {
                        context
                            .read<SectionThreeCubit>()
                            .forestProduceChanged(value);
                      },
                      title: const Text("Select Forest Produce"),
                      buttonText: const Text("Select Forest Produce"),
                      searchable: true,
                      barrierColor: Colors.blueGrey.withOpacity(0.3),
                      items: forestProduceList
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
                      child: TextFormField(
                        inputFormatters: [
                          textFormat(),
                          UpperCaseFormatter(),
                        ],
                        controller: c14 = TextEditingController()
                          ..text = state.otherForestProduce
                          ..selection = TextSelection.fromPosition(
                            TextPosition(
                              offset: c14.selection.base.offset >
                                      state.otherForestProduce.length
                                  ? state.otherForestProduce.length
                                  : c14.selection.base.offset,
                            ),
                          ),
                        maxLines: 5,
                        textCapitalization: TextCapitalization.characters,
                        textInputAction: TextInputAction.next,
                        key: const Key('sectionThree_otherForest'),
                        onChanged: (value) => context
                            .read<SectionThreeCubit>()
                            .otherForestProduceChanged(value),
                        obscureText: false,
                        decoration: const InputDecoration(
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(
                                top: 0), // add padding to adjust icon
                            child: Icon(Icons.person),
                          ),
                          border: OutlineInputBorder(),
                          labelText:
                              "Mention other Forest produce collected in the region",
                          helperText: '',
                        ),
                      ),
                    ),
                  ),
                  spacerWidget(),
                  sectionInfo("Fresh Water Items. Section - B"),
                  spacerWidget(),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 5.w,
                    ),
                    child: MultiSelectDialogField(
                      key: GlobalKey(),
                      initialValue: state.forestProduce,
                      onConfirm: (value) {
                        context
                            .read<SectionThreeCubit>()
                            .forestProduceChanged(value);
                      },
                      title: const Text("Select"),
                      buttonText: const Text("Select Fresh Water Produce"),
                      searchable: true,
                      barrierColor: Colors.blueGrey.withOpacity(0.3),
                      items: freshWaterProduceList
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
                      child: TextFormField(
                        inputFormatters: [
                          textFormat(),
                          UpperCaseFormatter(),
                        ],
                        controller: c15 = TextEditingController()
                          ..text = state.otherFreshWaterItems
                          ..selection = TextSelection.fromPosition(
                            TextPosition(
                              offset: c15.selection.base.offset >
                                      state.otherFreshWaterItems.length
                                  ? state.otherFreshWaterItems.length
                                  : c15.selection.base.offset,
                            ),
                          ),
                        maxLines: 5,
                        textCapitalization: TextCapitalization.characters,
                        textInputAction: TextInputAction.done,
                        key: const Key('sectionThree_otherFreshWaterItems'),
                        onChanged: (value) => context
                            .read<SectionThreeCubit>()
                            .otherFreshWaterItemsChanged(value),
                        obscureText: false,
                        decoration: const InputDecoration(
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(
                                top: 0), // add padding to adjust icon
                            child: Icon(Icons.person),
                          ),
                          border: OutlineInputBorder(),
                          labelText:
                              "Mention other fresh water collects available in the region",
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
