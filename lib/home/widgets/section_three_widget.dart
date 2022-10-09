import 'package:atulya/home/cubit/cubit.dart';
import 'package:atulya/home/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';
import 'package:sizer/sizer.dart';

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

Widget cropAndVegetable() {
  return BlocBuilder<SectionThreeCubit, SectionThreeState>(
    builder: (context, state) {
      return Column(
        children: [
          sectionInfo("Cropping Pattern (a) Crops"),
          spacerWidget(),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 0,
              horizontal: 5.w,
            ),
            child: MultiSelectDialogField(
              key: GlobalKey(),
              initialValue:
                  List<String>.from(state.cropsPattern['paddy'] ?? []),
              onConfirm: (value) {
                context
                    .read<SectionThreeCubit>()
                    .cropsPatternChanged({"paddy": value});
              },
              title: const Text("Select Paddy (Dhan)"),
              buttonText: const Text("Select Paddy (Dhan)"),
              searchable: true,
              barrierColor: Colors.blueGrey.withOpacity(0.3),
              items: cropPurposeList.map((e) => MultiSelectItem(e, e)).toList(),
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
              initialValue:
                  List<String>.from(state.cropsPattern['millet'] ?? []),
              onConfirm: (value) {
                context
                    .read<SectionThreeCubit>()
                    .cropsPatternChanged({"millet": value});
              },
              title: const Text("Select Millet (Madwa)"),
              buttonText: const Text("Select Millet (Madwa)"),
              searchable: true,
              barrierColor: Colors.blueGrey.withOpacity(0.3),
              items: cropPurposeList.map((e) => MultiSelectItem(e, e)).toList(),
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
              initialValue:
                  List<String>.from(state.cropsPattern['gangai'] ?? []),
              onConfirm: (value) {
                context
                    .read<SectionThreeCubit>()
                    .cropsPatternChanged({"gangai": value});
              },
              title: const Text("Select Gangai (Jowar)"),
              buttonText: const Text("Select Gangai (Jowar)"),
              searchable: true,
              barrierColor: Colors.blueGrey.withOpacity(0.3),
              items: cropPurposeList.map((e) => MultiSelectItem(e, e)).toList(),
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
              initialValue:
                  List<String>.from(state.cropsPattern['maize'] ?? []),
              onConfirm: (value) {
                context
                    .read<SectionThreeCubit>()
                    .cropsPatternChanged({"maize": value});
              },
              title: const Text("Select Maize (Makka)"),
              buttonText: const Text("Select Maize (Makka)"),
              searchable: true,
              barrierColor: Colors.blueGrey.withOpacity(0.3),
              items: cropPurposeList.map((e) => MultiSelectItem(e, e)).toList(),
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
              initialValue: List<String>.from(state.cropsPattern['kodo'] ?? []),
              onConfirm: (value) {
                context
                    .read<SectionThreeCubit>()
                    .cropsPatternChanged({"kodo": value});
              },
              title: const Text("Select Kodo"),
              buttonText: const Text("Select Kodo"),
              searchable: true,
              barrierColor: Colors.blueGrey.withOpacity(0.3),
              items: cropPurposeList.map((e) => MultiSelectItem(e, e)).toList(),
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
              initialValue:
                  List<String>.from(state.cropsPattern['gondli'] ?? []),
              onConfirm: (value) {
                context
                    .read<SectionThreeCubit>()
                    .cropsPatternChanged({"gondli": value});
              },
              title: const Text("Select Gondli"),
              buttonText: const Text("Select Gondli"),
              searchable: true,
              barrierColor: Colors.blueGrey.withOpacity(0.3),
              items: cropPurposeList.map((e) => MultiSelectItem(e, e)).toList(),
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
              initialValue:
                  List<String>.from(state.cropsPattern['kurthi'] ?? []),
              onConfirm: (value) {
                context
                    .read<SectionThreeCubit>()
                    .cropsPatternChanged({"kurthi": value});
              },
              title: const Text("Select Kurthi"),
              buttonText: const Text("Select Kurthi"),
              searchable: true,
              barrierColor: Colors.blueGrey.withOpacity(0.3),
              items: cropPurposeList.map((e) => MultiSelectItem(e, e)).toList(),
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
              initialValue:
                  List<String>.from(state.cropsPattern['khesra'] ?? []),
              onConfirm: (value) {
                context
                    .read<SectionThreeCubit>()
                    .cropsPatternChanged({"khesra": value});
              },
              title: const Text("Select Khesra"),
              buttonText: const Text("Select Khesra"),
              searchable: true,
              barrierColor: Colors.blueGrey.withOpacity(0.3),
              items: cropPurposeList.map((e) => MultiSelectItem(e, e)).toList(),
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
              initialValue:
                  List<String>.from(state.cropsPattern['rahad'] ?? []),
              onConfirm: (value) {
                context
                    .read<SectionThreeCubit>()
                    .cropsPatternChanged({"rahad": value});
              },
              title: const Text("Select Rahad"),
              buttonText: const Text("Select Rahad"),
              searchable: true,
              barrierColor: Colors.blueGrey.withOpacity(0.3),
              items: cropPurposeList.map((e) => MultiSelectItem(e, e)).toList(),
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
              initialValue: List<String>.from(state.cropsPattern['urad'] ?? []),
              onConfirm: (value) {
                context
                    .read<SectionThreeCubit>()
                    .cropsPatternChanged({"urad": value});
              },
              title: const Text("Select Urad"),
              buttonText: const Text("Select Urad"),
              searchable: true,
              barrierColor: Colors.blueGrey.withOpacity(0.3),
              items: cropPurposeList.map((e) => MultiSelectItem(e, e)).toList(),
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
              initialValue:
                  List<String>.from(state.cropsPattern['jhata'] ?? []),
              onConfirm: (value) {
                context
                    .read<SectionThreeCubit>()
                    .cropsPatternChanged({"jhata": value});
              },
              title: const Text("Select Jhata"),
              buttonText: const Text("Select Jhata"),
              searchable: true,
              barrierColor: Colors.blueGrey.withOpacity(0.3),
              items: cropPurposeList.map((e) => MultiSelectItem(e, e)).toList(),
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
              initialValue:
                  List<String>.from(state.cropsPattern['moong'] ?? []),
              onConfirm: (value) {
                context
                    .read<SectionThreeCubit>()
                    .cropsPatternChanged({"moong": value});
              },
              title: const Text("Select Moong"),
              buttonText: const Text("Select Moong"),
              searchable: true,
              barrierColor: Colors.blueGrey.withOpacity(0.3),
              items: cropPurposeList.map((e) => MultiSelectItem(e, e)).toList(),
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
              initialValue:
                  List<String>.from(state.cropsPattern['masoor'] ?? []),
              onConfirm: (value) {
                context
                    .read<SectionThreeCubit>()
                    .cropsPatternChanged({"masoor": value});
              },
              title: const Text("Select Masoor"),
              buttonText: const Text("Select Masoor"),
              searchable: true,
              barrierColor: Colors.blueGrey.withOpacity(0.3),
              items: cropPurposeList.map((e) => MultiSelectItem(e, e)).toList(),
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
              initialValue:
                  List<String>.from(state.cropsPattern['groundnut'] ?? []),
              onConfirm: (value) {
                context
                    .read<SectionThreeCubit>()
                    .cropsPatternChanged({"groundnut": value});
              },
              title: const Text("Select Groundnut"),
              buttonText: const Text("Select Groundnut"),
              searchable: true,
              barrierColor: Colors.blueGrey.withOpacity(0.3),
              items: cropPurposeList.map((e) => MultiSelectItem(e, e)).toList(),
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
              initialValue:
                  List<String>.from(state.cropsPattern['sesame'] ?? []),
              onConfirm: (value) {
                context
                    .read<SectionThreeCubit>()
                    .cropsPatternChanged({"sesame": value});
              },
              title: const Text("Select Sesame"),
              buttonText: const Text("Select Sesame"),
              searchable: true,
              barrierColor: Colors.blueGrey.withOpacity(0.3),
              items: cropPurposeList.map((e) => MultiSelectItem(e, e)).toList(),
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
              initialValue:
                  List<String>.from(state.cropsPattern['mustardSeedOil'] ?? []),
              onConfirm: (value) {
                context
                    .read<SectionThreeCubit>()
                    .cropsPatternChanged({"mustardSeedOil": value});
              },
              title: const Text("Select Mustard Seed Oil"),
              buttonText: const Text("Select Mustard Seed Oil"),
              searchable: true,
              barrierColor: Colors.blueGrey.withOpacity(0.3),
              items: cropPurposeList.map((e) => MultiSelectItem(e, e)).toList(),
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
              initialValue:
                  List<String>.from(state.cropsPattern['sunflowerSeed'] ?? []),
              onConfirm: (value) {
                context
                    .read<SectionThreeCubit>()
                    .cropsPatternChanged({"sunflowerSeed": value});
              },
              title: const Text("Select Sunflower Seed"),
              buttonText: const Text("Select Sunflower Seed"),
              searchable: true,
              barrierColor: Colors.blueGrey.withOpacity(0.3),
              items: cropPurposeList.map((e) => MultiSelectItem(e, e)).toList(),
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
              initialValue:
                  List<String>.from(state.cropsPattern['jatangi'] ?? []),
              onConfirm: (value) {
                context
                    .read<SectionThreeCubit>()
                    .cropsPatternChanged({"jatangi": value});
              },
              title: const Text("Select Jatangi"),
              buttonText: const Text("Select Jatangi"),
              searchable: true,
              barrierColor: Colors.blueGrey.withOpacity(0.3),
              items: cropPurposeList.map((e) => MultiSelectItem(e, e)).toList(),
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
              initialValue: List<String>.from(state.cropsPattern['jada'] ?? []),
              onConfirm: (value) {
                context
                    .read<SectionThreeCubit>()
                    .cropsPatternChanged({"jada": value});
              },
              title: const Text("Select Jada (Castor)"),
              buttonText: const Text("Select Jada (Castor)"),
              searchable: true,
              barrierColor: Colors.blueGrey.withOpacity(0.3),
              items: cropPurposeList.map((e) => MultiSelectItem(e, e)).toList(),
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
              initialValue:
                  List<String>.from(state.cropsPattern['butChana'] ?? []),
              onConfirm: (value) {
                context
                    .read<SectionThreeCubit>()
                    .cropsPatternChanged({"butChana": value});
              },
              title: const Text("Select But Chana"),
              buttonText: const Text("Select But Chana"),
              searchable: true,
              barrierColor: Colors.blueGrey.withOpacity(0.3),
              items: cropPurposeList.map((e) => MultiSelectItem(e, e)).toList(),
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
              initialValue:
                  List<String>.from(state.vegetablesPattern['brinjal'] ?? []),
              onConfirm: (value) {
                context
                    .read<SectionThreeCubit>()
                    .vegetablesPatternChanged({"brinjal": value});
              },
              title: const Text("Select Brinjal"),
              buttonText: const Text("Select Brinjal"),
              searchable: true,
              barrierColor: Colors.blueGrey.withOpacity(0.3),
              items: cropPurposeList.map((e) => MultiSelectItem(e, e)).toList(),
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
              initialValue:
                  List<String>.from(state.vegetablesPattern['potato'] ?? []),
              onConfirm: (value) {
                context
                    .read<SectionThreeCubit>()
                    .vegetablesPatternChanged({"potato": value});
              },
              title: const Text("Select Potato"),
              buttonText: const Text("Select Potato"),
              searchable: true,
              barrierColor: Colors.blueGrey.withOpacity(0.3),
              items: cropPurposeList.map((e) => MultiSelectItem(e, e)).toList(),
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
              initialValue:
                  List<String>.from(state.vegetablesPattern['tomato'] ?? []),
              onConfirm: (value) {
                context
                    .read<SectionThreeCubit>()
                    .vegetablesPatternChanged({"tomato": value});
              },
              title: const Text("Select Tomato"),
              buttonText: const Text("Select Tomato"),
              searchable: true,
              barrierColor: Colors.blueGrey.withOpacity(0.3),
              items: cropPurposeList.map((e) => MultiSelectItem(e, e)).toList(),
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
              initialValue:
                  List<String>.from(state.vegetablesPattern['cabbage'] ?? []),
              onConfirm: (value) {
                context
                    .read<SectionThreeCubit>()
                    .vegetablesPatternChanged({"cabbage": value});
              },
              title: const Text("Select Cabbage"),
              buttonText: const Text("Select Cabbage"),
              searchable: true,
              barrierColor: Colors.blueGrey.withOpacity(0.3),
              items: cropPurposeList.map((e) => MultiSelectItem(e, e)).toList(),
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
              initialValue: List<String>.from(
                  state.vegetablesPattern['cauliflower'] ?? []),
              onConfirm: (value) {
                context
                    .read<SectionThreeCubit>()
                    .vegetablesPatternChanged({"cauliflower": value});
              },
              title: const Text("Select Cauliflower"),
              buttonText: const Text("Select Cauliflower"),
              searchable: true,
              barrierColor: Colors.blueGrey.withOpacity(0.3),
              items: cropPurposeList.map((e) => MultiSelectItem(e, e)).toList(),
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
              initialValue:
                  List<String>.from(state.vegetablesPattern['pumpkin'] ?? []),
              onConfirm: (value) {
                context
                    .read<SectionThreeCubit>()
                    .vegetablesPatternChanged({"pumpkin": value});
              },
              title: const Text("Select Pumpkin"),
              buttonText: const Text("Select Pumpkin"),
              searchable: true,
              barrierColor: Colors.blueGrey.withOpacity(0.3),
              items: cropPurposeList.map((e) => MultiSelectItem(e, e)).toList(),
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
              initialValue: List<String>.from(
                  state.vegetablesPattern['bottleGourd'] ?? []),
              onConfirm: (value) {
                context
                    .read<SectionThreeCubit>()
                    .vegetablesPatternChanged({"bottleGourd": value});
              },
              title: const Text("Select Bottle Gourd"),
              buttonText: const Text("Select Bottle Gourd"),
              searchable: true,
              barrierColor: Colors.blueGrey.withOpacity(0.3),
              items: cropPurposeList.map((e) => MultiSelectItem(e, e)).toList(),
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
              initialValue: List<String>.from(
                  state.vegetablesPattern['bitterGourd'] ?? []),
              onConfirm: (value) {
                context
                    .read<SectionThreeCubit>()
                    .vegetablesPatternChanged({"bitterGourd": value});
              },
              title: const Text("Select Bitter Gourd"),
              buttonText: const Text("Select Bitter Gourd"),
              searchable: true,
              barrierColor: Colors.blueGrey.withOpacity(0.3),
              items: cropPurposeList.map((e) => MultiSelectItem(e, e)).toList(),
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
              initialValue:
                  List<String>.from(state.vegetablesPattern['radish'] ?? []),
              onConfirm: (value) {
                context
                    .read<SectionThreeCubit>()
                    .vegetablesPatternChanged({"radish": value});
              },
              title: const Text("Select Radish"),
              buttonText: const Text("Select Radish"),
              searchable: true,
              barrierColor: Colors.blueGrey.withOpacity(0.3),
              items: cropPurposeList.map((e) => MultiSelectItem(e, e)).toList(),
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
              initialValue:
                  List<String>.from(state.vegetablesPattern['carrot'] ?? []),
              onConfirm: (value) {
                context
                    .read<SectionThreeCubit>()
                    .vegetablesPatternChanged({"carrot": value});
              },
              title: const Text("Select Carrot"),
              buttonText: const Text("Select Carrot"),
              searchable: true,
              barrierColor: Colors.blueGrey.withOpacity(0.3),
              items: cropPurposeList.map((e) => MultiSelectItem(e, e)).toList(),
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
              initialValue:
                  List<String>.from(state.vegetablesPattern['beetRoot'] ?? []),
              onConfirm: (value) {
                context
                    .read<SectionThreeCubit>()
                    .vegetablesPatternChanged({"beetRoot": value});
              },
              title: const Text("Select Beet Root"),
              buttonText: const Text("Select Beet Root"),
              searchable: true,
              barrierColor: Colors.blueGrey.withOpacity(0.3),
              items: cropPurposeList.map((e) => MultiSelectItem(e, e)).toList(),
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
              initialValue:
                  List<String>.from(state.vegetablesPattern['yam'] ?? []),
              onConfirm: (value) {
                context
                    .read<SectionThreeCubit>()
                    .vegetablesPatternChanged({"yam": value});
              },
              title: const Text("Select Yam (Pechki)"),
              buttonText: const Text("Select Yam (Pechki)"),
              searchable: true,
              barrierColor: Colors.blueGrey.withOpacity(0.3),
              items: cropPurposeList.map((e) => MultiSelectItem(e, e)).toList(),
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
              initialValue:
                  List<String>.from(state.vegetablesPattern['onion'] ?? []),
              onConfirm: (value) {
                context
                    .read<SectionThreeCubit>()
                    .vegetablesPatternChanged({"onion": value});
              },
              title: const Text("Select Onion"),
              buttonText: const Text("Select Onion"),
              searchable: true,
              barrierColor: Colors.blueGrey.withOpacity(0.3),
              items: cropPurposeList.map((e) => MultiSelectItem(e, e)).toList(),
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
              initialValue:
                  List<String>.from(state.vegetablesPattern['garlic'] ?? []),
              onConfirm: (value) {
                context
                    .read<SectionThreeCubit>()
                    .vegetablesPatternChanged({"garlic": value});
              },
              title: const Text("Select Garlic"),
              buttonText: const Text("Select Garlic"),
              searchable: true,
              barrierColor: Colors.blueGrey.withOpacity(0.3),
              items: cropPurposeList.map((e) => MultiSelectItem(e, e)).toList(),
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
              initialValue:
                  List<String>.from(state.vegetablesPattern['bhajiSaag'] ?? []),
              onConfirm: (value) {
                context
                    .read<SectionThreeCubit>()
                    .vegetablesPatternChanged({"bhajiSaag": value});
              },
              title: const Text("Select Bhaji Saag"),
              buttonText: const Text("Select Bhaji Saag"),
              searchable: true,
              barrierColor: Colors.blueGrey.withOpacity(0.3),
              items: cropPurposeList.map((e) => MultiSelectItem(e, e)).toList(),
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
              initialValue:
                  List<String>.from(state.vegetablesPattern['palak'] ?? []),
              onConfirm: (value) {
                context
                    .read<SectionThreeCubit>()
                    .vegetablesPatternChanged({"palak": value});
              },
              title: const Text("Select Palak"),
              buttonText: const Text("Select Palak"),
              searchable: true,
              barrierColor: Colors.blueGrey.withOpacity(0.3),
              items: cropPurposeList.map((e) => MultiSelectItem(e, e)).toList(),
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
              initialValue:
                  List<String>.from(state.vegetablesPattern['methi'] ?? []),
              onConfirm: (value) {
                context
                    .read<SectionThreeCubit>()
                    .vegetablesPatternChanged({"methi": value});
              },
              title: const Text("Select Methi"),
              buttonText: const Text("Select Methi"),
              searchable: true,
              barrierColor: Colors.blueGrey.withOpacity(0.3),
              items: cropPurposeList.map((e) => MultiSelectItem(e, e)).toList(),
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
              initialValue:
                  List<String>.from(state.vegetablesPattern['puiSaag'] ?? []),
              onConfirm: (value) {
                context
                    .read<SectionThreeCubit>()
                    .vegetablesPatternChanged({"puiSaag": value});
              },
              title: const Text("Select Pui Saag"),
              buttonText: const Text("Select Pui Saag"),
              searchable: true,
              barrierColor: Colors.blueGrey.withOpacity(0.3),
              items: cropPurposeList.map((e) => MultiSelectItem(e, e)).toList(),
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
              initialValue:
                  List<String>.from(state.vegetablesPattern['kudrum'] ?? []),
              onConfirm: (value) {
                context
                    .read<SectionThreeCubit>()
                    .vegetablesPatternChanged({"kudrum": value});
              },
              title: const Text("Select Kudrum"),
              buttonText: const Text("Select Kudrum"),
              searchable: true,
              barrierColor: Colors.blueGrey.withOpacity(0.3),
              items: cropPurposeList.map((e) => MultiSelectItem(e, e)).toList(),
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
              initialValue:
                  List<String>.from(state.vegetablesPattern['coriander'] ?? []),
              onConfirm: (value) {
                context
                    .read<SectionThreeCubit>()
                    .vegetablesPatternChanged({"coriander": value});
              },
              title: const Text("Select Coriander"),
              buttonText: const Text("Select Coriander"),
              searchable: true,
              barrierColor: Colors.blueGrey.withOpacity(0.3),
              items: cropPurposeList.map((e) => MultiSelectItem(e, e)).toList(),
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
              initialValue:
                  List<String>.from(state.vegetablesPattern['cucumber'] ?? []),
              onConfirm: (value) {
                context
                    .read<SectionThreeCubit>()
                    .vegetablesPatternChanged({"cucumber": value});
              },
              title: const Text("Select Cucumber"),
              buttonText: const Text("Select Cucumber"),
              searchable: true,
              barrierColor: Colors.blueGrey.withOpacity(0.3),
              items: cropPurposeList.map((e) => MultiSelectItem(e, e)).toList(),
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
              initialValue:
                  List<String>.from(state.vegetablesPattern['longBean'] ?? []),
              onConfirm: (value) {
                context
                    .read<SectionThreeCubit>()
                    .vegetablesPatternChanged({"longBean": value});
              },
              title: const Text("Select Long Bean"),
              buttonText: const Text("Select Long Bean"),
              searchable: true,
              barrierColor: Colors.blueGrey.withOpacity(0.3),
              items: cropPurposeList.map((e) => MultiSelectItem(e, e)).toList(),
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
              initialValue: List<String>.from(
                  state.vegetablesPattern['ladyFinger'] ?? []),
              onConfirm: (value) {
                context
                    .read<SectionThreeCubit>()
                    .vegetablesPatternChanged({"ladyFinger": value});
              },
              title: const Text("Select Lady's Finger"),
              buttonText: const Text("Select Lady's Finger"),
              searchable: true,
              barrierColor: Colors.blueGrey.withOpacity(0.3),
              items: cropPurposeList.map((e) => MultiSelectItem(e, e)).toList(),
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
              initialValue:
                  List<String>.from(state.vegetablesPattern['peas'] ?? []),
              onConfirm: (value) {
                context
                    .read<SectionThreeCubit>()
                    .vegetablesPatternChanged({"peas": value});
              },
              title: const Text("Select Peas"),
              buttonText: const Text("Select Peas"),
              searchable: true,
              barrierColor: Colors.blueGrey.withOpacity(0.3),
              items: cropPurposeList.map((e) => MultiSelectItem(e, e)).toList(),
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
        ],
      );
    },
  );
}
