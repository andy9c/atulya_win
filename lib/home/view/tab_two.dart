// ignore_for_file: file_names

import 'package:atulya/home/cubit/cubit.dart';
import 'package:atulya/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

String getArea(String? area) {
  area = area ?? '0';
  area = '$area.0';
  List<String> sp = area.split('.');

  sp[0] = sp[0].isEmpty ? '0' : sp[0];
  sp[1] = sp[1].isEmpty ? '0' : sp[1];

  return '${sp[0]} ac, ${sp[1]} dm';
}

class TabTwo extends StatefulWidget {
  const TabTwo({super.key});

  @override
  State<TabTwo> createState() => _TabTwoState();
}

class _TabTwoState extends State<TabTwo>
    with AutomaticKeepAliveClientMixin<TabTwo> {
  late TextEditingController c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11;

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
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    ScrollController scr2 = ScrollController();

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
    return BlocBuilder<SectionTwoCubit, SectionTwoState>(
      builder: (context, state) {
        return Align(
          alignment: const Alignment(0, -1 / 3),
          child: Scrollbar(
            thumbVisibility: true,
            controller: scr2,
            child: FocusScope(
              child: ListView(
                controller: scr2,
                padding: const EdgeInsets.all(0.0),
                physics: const AlwaysScrollableScrollPhysics(),
                shrinkWrap: true,
                children: <Widget>[
                  spacerWidget(),
                  sectionHeading("Land Holding"),
                  dividerWidget(),
                  spacerWidget(),
                  spacerWidget(),
                  sectionInfo(
                      "For how many generations your family has been living in this village/panchayat as per your memory/information ( No. of generation) ?"),
                  spacerWidget(),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 5.w,
                      ),
                      child: DropdownButtonFormField<String>(
                        isExpanded: true,
                        value: state.generationCount.value,
                        onChanged:
                            !context.read<InformaticsCubit>().state.isEnabled
                                ? null
                                : (String? value) {
                                    context
                                        .read<SectionTwoCubit>()
                                        .generationCountChanged(value!);
                                  },
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
                          labelText: "Generation Count",
                          helperText: '',
                          errorText: state.generationCount.invalid
                              ? 'required field'
                              : null,
                        ),
                        items: numberList
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        hint: const Text(
                          "Please select Generation Count",
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
                        isExpanded: true,
                        value: state.ownLand.value,
                        onChanged:
                            !context.read<InformaticsCubit>().state.isEnabled
                                ? null
                                : (String? value) {
                                    context
                                        .read<SectionTwoCubit>()
                                        .ownLandChanged(value!);
                                  },
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
                          labelText: "Do you own land",
                          helperText: '',
                          errorText:
                              state.ownLand.invalid ? 'required field' : null,
                        ),
                        items: yesNoList
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        hint: const Text(
                          "Do you own land",
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
                        enabled:
                            context.read<InformaticsCubit>().state.isEnabled,
                        inputFormatters: [
                          nameFormat(),
                          UpperCaseFormatter(),
                        ],
                        controller: c1 = TextEditingController()
                          ..text = state.yesName
                          ..selection = TextSelection.fromPosition(
                            TextPosition(
                              offset: c1.selection.base.offset >
                                      state.yesName.length
                                  ? state.yesName.length
                                  : c1.selection.base.offset,
                            ),
                          ),
                        maxLines: 1,
                        textCapitalization: TextCapitalization.characters,
                        textInputAction: TextInputAction.next,
                        key: const Key('sectionTwo_yesName'),
                        onChanged: (value) => context
                            .read<SectionTwoCubit>()
                            .yesNameChanged(value),
                        obscureText: false,
                        decoration: const InputDecoration(
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(
                                top: 0), // add padding to adjust icon
                            child: Icon(Icons.person),
                          ),
                          border: OutlineInputBorder(),
                          labelText:
                              "If Yes, on whose name the patta is on:(Name)",
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
                        enabled:
                            context.read<InformaticsCubit>().state.isEnabled,
                        inputFormatters: [
                          nameFormat(),
                          UpperCaseFormatter(),
                        ],
                        controller: c2 = TextEditingController()
                          ..text = state.noName
                          ..selection = TextSelection.fromPosition(
                            TextPosition(
                              offset:
                                  c2.selection.base.offset > state.noName.length
                                      ? state.noName.length
                                      : c2.selection.base.offset,
                            ),
                          ),
                        maxLines: 1,
                        textCapitalization: TextCapitalization.characters,
                        textInputAction: TextInputAction.next,
                        key: const Key('sectionTwo_noName'),
                        onChanged: (value) => context
                            .read<SectionTwoCubit>()
                            .noNameChanged(value),
                        obscureText: false,
                        decoration: const InputDecoration(
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(
                                top: 0), // add padding to adjust icon
                            child: Icon(Icons.person),
                          ),
                          border: OutlineInputBorder(),
                          labelText:
                              "If No, on whose name the patta is on :(Name)",
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
                        isExpanded: true,
                        value: state.relationship.value,
                        onChanged:
                            !context.read<InformaticsCubit>().state.isEnabled
                                ? null
                                : (String? value) {
                                    context
                                        .read<SectionTwoCubit>()
                                        .relationshipChanged(value!);
                                  },
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
                              "Specify your relationship with the patta holder: Self/Father/ Mother/ Grandfather/Great grandfather",
                          helperText: '',
                          errorText: state.relationship.invalid
                              ? 'required field'
                              : null,
                        ),
                        items: relationshipList
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        hint: const Text(
                          "Your relationship with patta holder",
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
                        isExpanded: true,
                        value: state.isAlive.value,
                        onChanged:
                            !context.read<InformaticsCubit>().state.isEnabled
                                ? null
                                : (String? value) {
                                    context
                                        .read<SectionTwoCubit>()
                                        .isAliveChanged(value!);
                                  },
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
                          labelText: "Is he / she alive",
                          helperText: '',
                          errorText:
                              state.isAlive.invalid ? 'required field' : null,
                        ),
                        items: yesNoList
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        hint: const Text(
                          "Is he / she alive",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                  sectionInfo(
                      "Mention the no. of households/ chulha depend on this patta."),
                  spacerWidget(),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 5.w,
                      ),
                      child: TextFormField(
                        enabled:
                            context.read<InformaticsCubit>().state.isEnabled,
                        inputFormatters: [
                          intFormat(),
                        ],
                        controller: c3 = TextEditingController()
                          ..text = state.countChulha.value ?? ''
                          ..selection = TextSelection.fromPosition(
                            TextPosition(
                              offset: state.countChulha.value == null
                                  ? 0
                                  : c3.selection.base.offset >
                                          state.countChulha.value.length
                                      ? state.countChulha.value.length
                                      : c3.selection.base.offset,
                            ),
                          ),
                        maxLines: 1,
                        textCapitalization: TextCapitalization.characters,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        key: const Key('sectionTwo_countChulha'),
                        onChanged: (value) => context
                            .read<SectionTwoCubit>()
                            .countChulhaChanged(value),
                        obscureText: false,
                        decoration: InputDecoration(
                          prefixIcon: const Padding(
                            padding: EdgeInsets.only(
                                top: 0), // add padding to adjust icon
                            child: Icon(Icons.group_rounded,
                                color: Colors.lightBlue),
                          ),
                          border: const OutlineInputBorder(),
                          labelText:
                              "Mention the no. of households/ chulha depend on this patta.",
                          helperText: '',
                          errorText: state.countChulha.invalid
                              ? 'required field'
                              : null,
                        ),
                      ),
                    ),
                  ),
                  sectionInfo(
                      "Mention the total nos. of persons in these household/chulha."),
                  spacerWidget(),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 5.w,
                      ),
                      child: TextFormField(
                        enabled:
                            context.read<InformaticsCubit>().state.isEnabled,
                        inputFormatters: [
                          intFormat(),
                        ],
                        controller: c4 = TextEditingController()
                          ..text = state.totalPeople.value ?? ''
                          ..selection = TextSelection.fromPosition(
                            TextPosition(
                              offset: state.totalPeople.value == null
                                  ? 0
                                  : c4.selection.base.offset >
                                          state.totalPeople.value.length
                                      ? state.totalPeople.value.length
                                      : c4.selection.base.offset,
                            ),
                          ),
                        maxLines: 1,
                        textCapitalization: TextCapitalization.characters,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        key: const Key('sectionTwo_totalPeople'),
                        onChanged: (value) => context
                            .read<SectionTwoCubit>()
                            .totalPeopleChanged(value),
                        obscureText: false,
                        decoration: InputDecoration(
                          prefixIcon: const Padding(
                            padding: EdgeInsets.only(
                                top: 0), // add padding to adjust icon
                            child: Icon(Icons.group_rounded,
                                color: Colors.lightBlue),
                          ),
                          border: const OutlineInputBorder(),
                          labelText:
                              "Mention the total nos. of persons in these household/chulha.",
                          helperText: '',
                          errorText: state.totalPeople.invalid
                              ? 'required field'
                              : null,
                        ),
                      ),
                    ),
                  ),
                  sectionInfo("Mention the types of land Holding"),
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
                            enabled: context
                                .read<InformaticsCubit>()
                                .state
                                .isEnabled,
                            inputFormatters: [
                              doubleFormat(),
                            ],
                            controller: c5 = TextEditingController()
                              ..text = state.landHolding['goda'] ?? ''
                              ..selection = TextSelection.fromPosition(
                                TextPosition(
                                  offset: state.landHolding['goda'] == null
                                      ? 0
                                      : c5.selection.base.offset >
                                              state.landHolding['goda'].length
                                          ? state.landHolding['goda'].length
                                          : c5.selection.base.offset,
                                ),
                              ),
                            maxLines: 1,
                            textCapitalization: TextCapitalization.characters,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                            key: const Key('sectionTwo_goda'),
                            onChanged: (value) => context
                                .read<SectionTwoCubit>()
                                .landHoldingChanged({"goda": value}),
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
                              text: getArea(state.landHolding['goda']),
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
                            enabled: context
                                .read<InformaticsCubit>()
                                .state
                                .isEnabled,
                            inputFormatters: [
                              doubleFormat(),
                            ],
                            controller: c6 = TextEditingController()
                              ..text = state.landHolding['mal'] ?? ''
                              ..selection = TextSelection.fromPosition(
                                TextPosition(
                                  offset: state.landHolding['mal'] == null
                                      ? 0
                                      : c6.selection.base.offset >
                                              state.landHolding['mal'].length
                                          ? state.landHolding['mal'].length
                                          : c6.selection.base.offset,
                                ),
                              ),
                            maxLines: 1,
                            textCapitalization: TextCapitalization.characters,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                            key: const Key('sectionTwo_mal'),
                            onChanged: (value) => context
                                .read<SectionTwoCubit>()
                                .landHoldingChanged({"mal": value}),
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
                              text: getArea(state.landHolding['mal']),
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
                            enabled: context
                                .read<InformaticsCubit>()
                                .state
                                .isEnabled,
                            inputFormatters: [
                              doubleFormat(),
                            ],
                            controller: c7 = TextEditingController()
                              ..text = state.landHolding['berna'] ?? ''
                              ..selection = TextSelection.fromPosition(
                                TextPosition(
                                  offset: state.landHolding['berna'] == null
                                      ? 0
                                      : c7.selection.base.offset >
                                              state.landHolding['berna'].length
                                          ? state.landHolding['berna'].length
                                          : c7.selection.base.offset,
                                ),
                              ),
                            maxLines: 1,
                            textCapitalization: TextCapitalization.characters,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                            key: const Key('sectionTwo_berna'),
                            onChanged: (value) => context
                                .read<SectionTwoCubit>()
                                .landHoldingChanged({"berna": value}),
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
                              text: getArea(state.landHolding['berna']),
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
                            enabled: context
                                .read<InformaticsCubit>()
                                .state
                                .isEnabled,
                            inputFormatters: [
                              doubleFormat(),
                            ],
                            controller: c8 = TextEditingController()
                              ..text = state.landHolding['bahal'] ?? ''
                              ..selection = TextSelection.fromPosition(
                                TextPosition(
                                  offset: state.landHolding['bahal'] == null
                                      ? 0
                                      : c8.selection.base.offset >
                                              state.landHolding['bahal'].length
                                          ? state.landHolding['bahal'].length
                                          : c8.selection.base.offset,
                                ),
                              ),
                            maxLines: 1,
                            textCapitalization: TextCapitalization.characters,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                            key: const Key('sectionTwo_bahal'),
                            onChanged: (value) => context
                                .read<SectionTwoCubit>()
                                .landHoldingChanged({"bahal": value}),
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
                              text: getArea(state.landHolding['bahal']),
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
                            enabled: context
                                .read<InformaticsCubit>()
                                .state
                                .isEnabled,
                            inputFormatters: [
                              doubleFormat(),
                            ],
                            controller: c9 = TextEditingController()
                              ..text = state.landHolding['gharBari'] ?? ''
                              ..selection = TextSelection.fromPosition(
                                TextPosition(
                                  offset: state.landHolding['gharBari'] == null
                                      ? 0
                                      : c9.selection.base.offset >
                                              state.landHolding['gharBari']
                                                  .length
                                          ? state.landHolding['gharBari'].length
                                          : c9.selection.base.offset,
                                ),
                              ),
                            maxLines: 1,
                            textCapitalization: TextCapitalization.characters,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                            key: const Key('sectionTwo_gharBari'),
                            onChanged: (value) => context
                                .read<SectionTwoCubit>()
                                .landHoldingChanged({"gharBari": value}),
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
                              text: getArea(state.landHolding['gharBari']),
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
                        isExpanded: true,
                        value: state.cultivateAnabadi.value,
                        onChanged:
                            !context.read<InformaticsCubit>().state.isEnabled
                                ? null
                                : (String? value) => context
                                    .read<SectionTwoCubit>()
                                    .cultivateAnabadiChanged(value!),
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
                              "Do you cultivate in community land (Anabadi) apart from your patta land ?",
                          helperText: '',
                          errorText: state.cultivateAnabadi.invalid
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
                        enabled:
                            context.read<InformaticsCubit>().state.isEnabled,
                        inputFormatters: [
                          intFormat(),
                        ],
                        controller: c10 = TextEditingController()
                          ..text = state.yearsAnabadi
                          ..selection = TextSelection.fromPosition(
                            TextPosition(
                              offset: c10.selection.base.offset >
                                      state.yearsAnabadi.length
                                  ? state.yearsAnabadi.length
                                  : c10.selection.base.offset,
                            ),
                          ),
                        maxLines: 1,
                        textCapitalization: TextCapitalization.characters,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        key: const Key('sectionTwo_yearsAnabadi'),
                        onChanged: (value) => context
                            .read<SectionTwoCubit>()
                            .yearsAnabadiChanged(value),
                        obscureText: false,
                        decoration: const InputDecoration(
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(
                                top: 0), // add padding to adjust icon
                            child: Icon(Icons.person),
                          ),
                          border: OutlineInputBorder(),
                          labelText:
                              "Since how many years have you been cultivating in that land?",
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
                        isExpanded: true,
                        value: state.appliedOwnership.value,
                        onChanged:
                            !context.read<InformaticsCubit>().state.isEnabled
                                ? null
                                : (String? value) => context
                                    .read<SectionTwoCubit>()
                                    .appliedOwnershipChanged(value!),
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
                              "Have you applied for Individual Ownership?",
                          helperText: '',
                          errorText: state.appliedOwnership.invalid
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
                        isExpanded: true,
                        value: state.receivedEntitlement.value,
                        onChanged:
                            !context.read<InformaticsCubit>().state.isEnabled
                                ? null
                                : (String? value) => context
                                    .read<SectionTwoCubit>()
                                    .receivedEntitlementChanged(value!),
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
                              "Have you received the entitlement (patta) from the government?",
                          helperText: '',
                          errorText: state.receivedEntitlement.invalid
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
                        enabled:
                            context.read<InformaticsCubit>().state.isEnabled,
                        inputFormatters: [
                          textFormat(),
                          UpperCaseFormatter(),
                        ],
                        controller: c11 = TextEditingController()
                          ..text = state.cropTypes
                          ..selection = TextSelection.fromPosition(
                            TextPosition(
                              offset: c11.selection.base.offset >
                                      state.cropTypes.length
                                  ? state.cropTypes.length
                                  : c11.selection.base.offset,
                            ),
                          ),
                        maxLines: 5,
                        textCapitalization: TextCapitalization.characters,
                        textInputAction: TextInputAction.done,
                        key: const Key('sectionTwo_cropTypes'),
                        onChanged: (value) => context
                            .read<SectionTwoCubit>()
                            .cropTypesChanged(value),
                        obscureText: false,
                        decoration: const InputDecoration(
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(
                                top: 0), // add padding to adjust icon
                            child: Icon(Icons.person),
                          ),
                          border: OutlineInputBorder(),
                          labelText: "The types of crop you grow in this land?",
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
