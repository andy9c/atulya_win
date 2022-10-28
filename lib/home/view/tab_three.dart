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
                  child: AbsorbPointer(
                    absorbing:
                        !context.read<InformaticsCubit>().state.isEnabled,
                    child: MultiSelectDialogField(
                      key: GlobalKey(),
                      initialValue:
                          List<String>.from(state.incomeSources.value ?? []),
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
                      enabled: context.read<InformaticsCubit>().state.isEnabled,
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
                      enabled: context.read<InformaticsCubit>().state.isEnabled,
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
                                        state.otherAssetsCount['buffalo'].length
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
                      enabled: context.read<InformaticsCubit>().state.isEnabled,
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
                                        state.otherAssetsCount['bullock'].length
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
                      enabled: context.read<InformaticsCubit>().state.isEnabled,
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
                      enabled: context.read<InformaticsCubit>().state.isEnabled,
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
                                        state.otherAssetsCount['chicken'].length
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
                      enabled: context.read<InformaticsCubit>().state.isEnabled,
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
                      enabled: context.read<InformaticsCubit>().state.isEnabled,
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
                                        state.otherAssetsCount['tractor'].length
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
                      enabled: context.read<InformaticsCubit>().state.isEnabled,
                      inputFormatters: [
                        intFormat(),
                      ],
                      controller: c8 = TextEditingController()
                        ..text = state.otherAssetsCount['powerTiller'] ?? ''
                        ..selection = TextSelection.fromPosition(
                          TextPosition(
                            offset:
                                state.otherAssetsCount['powerTiller'] == null
                                    ? 0
                                    : c8.selection.base.offset >
                                            state
                                                .otherAssetsCount['powerTiller']
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
                      enabled: context.read<InformaticsCubit>().state.isEnabled,
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
                                        state
                                            .otherAssetsCount['thresher'].length
                                    ? state.otherAssetsCount['thresher'].length
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
                      enabled: context.read<InformaticsCubit>().state.isEnabled,
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
                      enabled: context.read<InformaticsCubit>().state.isEnabled,
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
                                        state.otherAssetsCount['tailorMachine']
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
                      enabled: context.read<InformaticsCubit>().state.isEnabled,
                      inputFormatters: [
                        intFormat(),
                      ],
                      controller: c12 = TextEditingController()
                        ..text = state.otherAssetsCount['fourWheeler'] ?? ''
                        ..selection = TextSelection.fromPosition(
                          TextPosition(
                            offset:
                                state.otherAssetsCount['fourWheeler'] == null
                                    ? 0
                                    : c12.selection.base.offset >
                                            state
                                                .otherAssetsCount['fourWheeler']
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
                      enabled: context.read<InformaticsCubit>().state.isEnabled,
                      inputFormatters: [
                        intFormatRange(),
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
                      keyboardType: TextInputType.text,
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
                        helperText: 'annual income range e.g. 3000-5000',
                      ),
                    ),
                  ),
                ),
                AbsorbPointer(
                  absorbing: !context.read<InformaticsCubit>().state.isEnabled,
                  child: cropAndVegetable(),
                ),
                spacerWidget(),
                sectionInfo("Forest Produce (FP) Section - A"),
                spacerWidget(),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 5.w,
                  ),
                  child: AbsorbPointer(
                    absorbing:
                        !context.read<InformaticsCubit>().state.isEnabled,
                    child: MultiSelectDialogField(
                      key: GlobalKey(),
                      initialValue: List<String>.from(state.forestProduce),
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
                      enabled: context.read<InformaticsCubit>().state.isEnabled,
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
                  child: AbsorbPointer(
                    absorbing:
                        !context.read<InformaticsCubit>().state.isEnabled,
                    child: MultiSelectDialogField(
                      key: GlobalKey(),
                      initialValue: List<String>.from(state.freshWaterItems),
                      onConfirm: (value) {
                        context
                            .read<SectionThreeCubit>()
                            .freshWaterItemsChanged(value);
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
                      enabled: context.read<InformaticsCubit>().state.isEnabled,
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
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
