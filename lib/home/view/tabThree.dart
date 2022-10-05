// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';
import 'package:sizer/sizer.dart';

import '../home.dart';

class TabThree extends StatefulWidget {
  const TabThree({super.key});

  @override
  State<TabThree> createState() => _TabThreeState();
}

class _TabThreeState extends State<TabThree>
    with AutomaticKeepAliveClientMixin<TabThree> {
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
    return Align(
      alignment: const Alignment(0, -1 / 3),
      child: Scrollbar(
        thumbVisibility: true,
        controller: scr3,
        child: ListView(
          controller: scr3,
          padding: const EdgeInsets.all(0.0),
          physics: const AlwaysScrollableScrollPhysics(),
          shrinkWrap: true,
          children: <Widget>[
            spacerWidget(),
            sectionHeading("Livelihood Sources of Income for the Household"),
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
                searchable: true,
                buttonText: const Text("Select Sources of Income"),
                barrierColor: Colors.blueGrey.withOpacity(0.3),
                items: sourcesOfincomeList
                    .map((e) => MultiSelectItem(e, e))
                    .toList(),
                listType: MultiSelectListType.CHIP,
                onConfirm: (values) {
                  // _selectedAnimals = values;
                },
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
                    NameUpperCaseTextFormatter(),
                  ],
                  //enabled: state.setEnabled,
                  //initialValue: state.candidateLastName,
                  maxLines: 1,
                  textCapitalization: TextCapitalization.words,
                  textInputAction: TextInputAction.next,
                  //key: const Key('studentForm_candidateLastName_textField'),
                  onChanged: (candidateLastName) => {},
                  obscureText: false,
                  decoration: const InputDecoration(
                    prefixIcon: Padding(
                      padding:
                          EdgeInsets.only(top: 0), // add padding to adjust icon
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
                    NameUpperCaseTextFormatter(),
                  ],
                  //enabled: state.setEnabled,
                  //initialValue: state.candidateLastName,
                  maxLines: 1,
                  textCapitalization: TextCapitalization.words,
                  textInputAction: TextInputAction.next,
                  //key: const Key('studentForm_candidateLastName_textField'),
                  onChanged: (candidateLastName) => {},
                  obscureText: false,
                  decoration: const InputDecoration(
                    prefixIcon: Padding(
                      padding:
                          EdgeInsets.only(top: 0), // add padding to adjust icon
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
                    NameUpperCaseTextFormatter(),
                  ],
                  //enabled: state.setEnabled,
                  //initialValue: state.candidateLastName,
                  maxLines: 1,
                  textCapitalization: TextCapitalization.words,
                  textInputAction: TextInputAction.next,
                  //key: const Key('studentForm_candidateLastName_textField'),
                  onChanged: (candidateLastName) => {},
                  obscureText: false,
                  decoration: const InputDecoration(
                    prefixIcon: Padding(
                      padding:
                          EdgeInsets.only(top: 0), // add padding to adjust icon
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
                    NameUpperCaseTextFormatter(),
                  ],
                  //enabled: state.setEnabled,
                  //initialValue: state.candidateLastName,
                  maxLines: 1,
                  textCapitalization: TextCapitalization.words,
                  textInputAction: TextInputAction.next,
                  //key: const Key('studentForm_candidateLastName_textField'),
                  onChanged: (candidateLastName) => {},
                  obscureText: false,
                  decoration: const InputDecoration(
                    prefixIcon: Padding(
                      padding:
                          EdgeInsets.only(top: 0), // add padding to adjust icon
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
                    NameUpperCaseTextFormatter(),
                  ],
                  //enabled: state.setEnabled,
                  //initialValue: state.candidateLastName,
                  maxLines: 1,
                  textCapitalization: TextCapitalization.words,
                  textInputAction: TextInputAction.next,
                  //key: const Key('studentForm_candidateLastName_textField'),
                  onChanged: (candidateLastName) => {},
                  obscureText: false,
                  decoration: const InputDecoration(
                    prefixIcon: Padding(
                      padding:
                          EdgeInsets.only(top: 0), // add padding to adjust icon
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
                    NameUpperCaseTextFormatter(),
                  ],
                  //enabled: state.setEnabled,
                  //initialValue: state.candidateLastName,
                  maxLines: 1,
                  textCapitalization: TextCapitalization.words,
                  textInputAction: TextInputAction.next,
                  //key: const Key('studentForm_candidateLastName_textField'),
                  onChanged: (candidateLastName) => {},
                  obscureText: false,
                  decoration: const InputDecoration(
                    prefixIcon: Padding(
                      padding:
                          EdgeInsets.only(top: 0), // add padding to adjust icon
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
                    NameUpperCaseTextFormatter(),
                  ],
                  //enabled: state.setEnabled,
                  //initialValue: state.candidateLastName,
                  maxLines: 1,
                  textCapitalization: TextCapitalization.words,
                  textInputAction: TextInputAction.next,
                  //key: const Key('studentForm_candidateLastName_textField'),
                  onChanged: (candidateLastName) => {},
                  obscureText: false,
                  decoration: const InputDecoration(
                    prefixIcon: Padding(
                      padding:
                          EdgeInsets.only(top: 0), // add padding to adjust icon
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
                    NameUpperCaseTextFormatter(),
                  ],
                  //enabled: state.setEnabled,
                  //initialValue: state.candidateLastName,
                  maxLines: 1,
                  textCapitalization: TextCapitalization.words,
                  textInputAction: TextInputAction.next,
                  //key: const Key('studentForm_candidateLastName_textField'),
                  onChanged: (candidateLastName) => {},
                  obscureText: false,
                  decoration: const InputDecoration(
                    prefixIcon: Padding(
                      padding:
                          EdgeInsets.only(top: 0), // add padding to adjust icon
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
                    NameUpperCaseTextFormatter(),
                  ],
                  //enabled: state.setEnabled,
                  //initialValue: state.candidateLastName,
                  maxLines: 1,
                  textCapitalization: TextCapitalization.words,
                  textInputAction: TextInputAction.next,
                  //key: const Key('studentForm_candidateLastName_textField'),
                  onChanged: (candidateLastName) => {},
                  obscureText: false,
                  decoration: const InputDecoration(
                    prefixIcon: Padding(
                      padding:
                          EdgeInsets.only(top: 0), // add padding to adjust icon
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
                    NameUpperCaseTextFormatter(),
                  ],
                  //enabled: state.setEnabled,
                  //initialValue: state.candidateLastName,
                  maxLines: 1,
                  textCapitalization: TextCapitalization.words,
                  textInputAction: TextInputAction.next,
                  //key: const Key('studentForm_candidateLastName_textField'),
                  onChanged: (candidateLastName) => {},
                  obscureText: false,
                  decoration: const InputDecoration(
                    prefixIcon: Padding(
                      padding:
                          EdgeInsets.only(top: 0), // add padding to adjust icon
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
                    NameUpperCaseTextFormatter(),
                  ],
                  //enabled: state.setEnabled,
                  //initialValue: state.candidateLastName,
                  maxLines: 1,
                  textCapitalization: TextCapitalization.words,
                  textInputAction: TextInputAction.next,
                  //key: const Key('studentForm_candidateLastName_textField'),
                  onChanged: (candidateLastName) => {},
                  obscureText: false,
                  decoration: const InputDecoration(
                    prefixIcon: Padding(
                      padding:
                          EdgeInsets.only(top: 0), // add padding to adjust icon
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
                    NameUpperCaseTextFormatter(),
                  ],
                  //enabled: state.setEnabled,
                  //initialValue: state.candidateLastName,
                  maxLines: 1,
                  textCapitalization: TextCapitalization.words,
                  textInputAction: TextInputAction.next,
                  //key: const Key('studentForm_candidateLastName_textField'),
                  onChanged: (candidateLastName) => {},
                  obscureText: false,
                  decoration: const InputDecoration(
                    prefixIcon: Padding(
                      padding:
                          EdgeInsets.only(top: 0), // add padding to adjust icon
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
                    NameUpperCaseTextFormatter(),
                  ],
                  //enabled: state.setEnabled,
                  //initialValue: state.candidateLastName,
                  maxLines: 1,
                  textCapitalization: TextCapitalization.words,
                  textInputAction: TextInputAction.next,
                  //key: const Key('studentForm_candidateLastName_textField'),
                  onChanged: (candidateLastName) => {},
                  obscureText: false,
                  decoration: const InputDecoration(
                    prefixIcon: Padding(
                      padding:
                          EdgeInsets.only(top: 0), // add padding to adjust icon
                      child: Icon(Icons.person),
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
                title: const Text("Select Paddy"),
                buttonText: const Text("Select Paddy"),
                searchable: true,
                barrierColor: Colors.blueGrey.withOpacity(0.3),
                items:
                    cropPurposeList.map((e) => MultiSelectItem(e, e)).toList(),
                listType: MultiSelectListType.CHIP,
                onConfirm: (values) {
                  // _selectedAnimals = values;
                },
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
                title: const Text("Select Millet"),
                buttonText: const Text("Select Millet"),
                searchable: true,
                barrierColor: Colors.blueGrey.withOpacity(0.3),
                items:
                    cropPurposeList.map((e) => MultiSelectItem(e, e)).toList(),
                listType: MultiSelectListType.CHIP,
                onConfirm: (values) {
                  // _selectedAnimals = values;
                },
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
                title: const Text("Select Gangai"),
                buttonText: const Text("Select Gangai"),
                searchable: true,
                barrierColor: Colors.blueGrey.withOpacity(0.3),
                items:
                    cropPurposeList.map((e) => MultiSelectItem(e, e)).toList(),
                listType: MultiSelectListType.CHIP,
                onConfirm: (values) {
                  // _selectedAnimals = values;
                },
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
                title: const Text("Select Maize"),
                buttonText: const Text("Select Maize"),
                searchable: true,
                barrierColor: Colors.blueGrey.withOpacity(0.3),
                items:
                    cropPurposeList.map((e) => MultiSelectItem(e, e)).toList(),
                listType: MultiSelectListType.CHIP,
                onConfirm: (values) {
                  // _selectedAnimals = values;
                },
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
                title: const Text("Select Kodo"),
                buttonText: const Text("Select Kodo"),
                searchable: true,
                barrierColor: Colors.blueGrey.withOpacity(0.3),
                items:
                    cropPurposeList.map((e) => MultiSelectItem(e, e)).toList(),
                listType: MultiSelectListType.CHIP,
                onConfirm: (values) {
                  // _selectedAnimals = values;
                },
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
                title: const Text("Select Gondli"),
                buttonText: const Text("Select Gondli"),
                searchable: true,
                barrierColor: Colors.blueGrey.withOpacity(0.3),
                items:
                    cropPurposeList.map((e) => MultiSelectItem(e, e)).toList(),
                listType: MultiSelectListType.CHIP,
                onConfirm: (values) {
                  // _selectedAnimals = values;
                },
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
                title: const Text("Select Kurthi"),
                buttonText: const Text("Select Kurthi"),
                searchable: true,
                barrierColor: Colors.blueGrey.withOpacity(0.3),
                items:
                    cropPurposeList.map((e) => MultiSelectItem(e, e)).toList(),
                listType: MultiSelectListType.CHIP,
                onConfirm: (values) {
                  // _selectedAnimals = values;
                },
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
                title: const Text("Select Khesra"),
                buttonText: const Text("Select Khesra"),
                searchable: true,
                barrierColor: Colors.blueGrey.withOpacity(0.3),
                items:
                    cropPurposeList.map((e) => MultiSelectItem(e, e)).toList(),
                listType: MultiSelectListType.CHIP,
                onConfirm: (values) {
                  // _selectedAnimals = values;
                },
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
                title: const Text("Select Rahad"),
                buttonText: const Text("Select Rahad"),
                searchable: true,
                barrierColor: Colors.blueGrey.withOpacity(0.3),
                items:
                    cropPurposeList.map((e) => MultiSelectItem(e, e)).toList(),
                listType: MultiSelectListType.CHIP,
                onConfirm: (values) {
                  // _selectedAnimals = values;
                },
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
                title: const Text("Select Urad"),
                buttonText: const Text("Select Urad"),
                searchable: true,
                barrierColor: Colors.blueGrey.withOpacity(0.3),
                items:
                    cropPurposeList.map((e) => MultiSelectItem(e, e)).toList(),
                listType: MultiSelectListType.CHIP,
                onConfirm: (values) {
                  // _selectedAnimals = values;
                },
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
                title: const Text("Select Jhata"),
                buttonText: const Text("Select Jhata"),
                searchable: true,
                barrierColor: Colors.blueGrey.withOpacity(0.3),
                items:
                    cropPurposeList.map((e) => MultiSelectItem(e, e)).toList(),
                listType: MultiSelectListType.CHIP,
                onConfirm: (values) {
                  // _selectedAnimals = values;
                },
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
                title: const Text("Select Moong"),
                buttonText: const Text("Select Moong"),
                searchable: true,
                barrierColor: Colors.blueGrey.withOpacity(0.3),
                items:
                    cropPurposeList.map((e) => MultiSelectItem(e, e)).toList(),
                listType: MultiSelectListType.CHIP,
                onConfirm: (values) {
                  // _selectedAnimals = values;
                },
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
                title: const Text("Select Masoor"),
                buttonText: const Text("Select Masoor"),
                searchable: true,
                barrierColor: Colors.blueGrey.withOpacity(0.3),
                items:
                    cropPurposeList.map((e) => MultiSelectItem(e, e)).toList(),
                listType: MultiSelectListType.CHIP,
                onConfirm: (values) {
                  // _selectedAnimals = values;
                },
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
                title: const Text("Select Groundnut"),
                buttonText: const Text("Select Groundnut"),
                searchable: true,
                barrierColor: Colors.blueGrey.withOpacity(0.3),
                items:
                    cropPurposeList.map((e) => MultiSelectItem(e, e)).toList(),
                listType: MultiSelectListType.CHIP,
                onConfirm: (values) {
                  // _selectedAnimals = values;
                },
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
                title: const Text("Select Sesame"),
                buttonText: const Text("Select Sesame"),
                searchable: true,
                barrierColor: Colors.blueGrey.withOpacity(0.3),
                items:
                    cropPurposeList.map((e) => MultiSelectItem(e, e)).toList(),
                listType: MultiSelectListType.CHIP,
                onConfirm: (values) {
                  // _selectedAnimals = values;
                },
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
                title: const Text("Select Mustard Seed Oil"),
                buttonText: const Text("Select Mustard Seed Oil"),
                searchable: true,
                barrierColor: Colors.blueGrey.withOpacity(0.3),
                items:
                    cropPurposeList.map((e) => MultiSelectItem(e, e)).toList(),
                listType: MultiSelectListType.CHIP,
                onConfirm: (values) {
                  // _selectedAnimals = values;
                },
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
                title: const Text("Select Sunflower Seed"),
                buttonText: const Text("Select Sunflower Seed"),
                searchable: true,
                barrierColor: Colors.blueGrey.withOpacity(0.3),
                items:
                    cropPurposeList.map((e) => MultiSelectItem(e, e)).toList(),
                listType: MultiSelectListType.CHIP,
                onConfirm: (values) {
                  // _selectedAnimals = values;
                },
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
                title: const Text("Select Jatangi"),
                buttonText: const Text("Select Jatangi"),
                searchable: true,
                barrierColor: Colors.blueGrey.withOpacity(0.3),
                items:
                    cropPurposeList.map((e) => MultiSelectItem(e, e)).toList(),
                listType: MultiSelectListType.CHIP,
                onConfirm: (values) {
                  // _selectedAnimals = values;
                },
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
                title: const Text("Select Jada"),
                buttonText: const Text("Select Jada"),
                searchable: true,
                barrierColor: Colors.blueGrey.withOpacity(0.3),
                items:
                    cropPurposeList.map((e) => MultiSelectItem(e, e)).toList(),
                listType: MultiSelectListType.CHIP,
                onConfirm: (values) {
                  // _selectedAnimals = values;
                },
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
                title: const Text("Select But Chana"),
                buttonText: const Text("Select But Chana"),
                searchable: true,
                barrierColor: Colors.blueGrey.withOpacity(0.3),
                items:
                    cropPurposeList.map((e) => MultiSelectItem(e, e)).toList(),
                listType: MultiSelectListType.CHIP,
                onConfirm: (values) {
                  // _selectedAnimals = values;
                },
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
                title: const Text("Select Brinjal"),
                buttonText: const Text("Select Brinjal"),
                searchable: true,
                barrierColor: Colors.blueGrey.withOpacity(0.3),
                items:
                    cropPurposeList.map((e) => MultiSelectItem(e, e)).toList(),
                listType: MultiSelectListType.CHIP,
                onConfirm: (values) {
                  // _selectedAnimals = values;
                },
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
                title: const Text("Select Potato"),
                buttonText: const Text("Select Potato"),
                searchable: true,
                barrierColor: Colors.blueGrey.withOpacity(0.3),
                items:
                    cropPurposeList.map((e) => MultiSelectItem(e, e)).toList(),
                listType: MultiSelectListType.CHIP,
                onConfirm: (values) {
                  // _selectedAnimals = values;
                },
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
                title: const Text("Select Tomato"),
                buttonText: const Text("Select Tomato"),
                searchable: true,
                barrierColor: Colors.blueGrey.withOpacity(0.3),
                items:
                    cropPurposeList.map((e) => MultiSelectItem(e, e)).toList(),
                listType: MultiSelectListType.CHIP,
                onConfirm: (values) {
                  // _selectedAnimals = values;
                },
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
                title: const Text("Select Cabbage"),
                buttonText: const Text("Select Cabbage"),
                searchable: true,
                barrierColor: Colors.blueGrey.withOpacity(0.3),
                items:
                    cropPurposeList.map((e) => MultiSelectItem(e, e)).toList(),
                listType: MultiSelectListType.CHIP,
                onConfirm: (values) {
                  // _selectedAnimals = values;
                },
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
                title: const Text("Select Cauliflower"),
                buttonText: const Text("Select Cauliflower"),
                searchable: true,
                barrierColor: Colors.blueGrey.withOpacity(0.3),
                items:
                    cropPurposeList.map((e) => MultiSelectItem(e, e)).toList(),
                listType: MultiSelectListType.CHIP,
                onConfirm: (values) {
                  // _selectedAnimals = values;
                },
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
                title: const Text("Select Pumpkin"),
                buttonText: const Text("Select Pumpkin"),
                searchable: true,
                barrierColor: Colors.blueGrey.withOpacity(0.3),
                items:
                    cropPurposeList.map((e) => MultiSelectItem(e, e)).toList(),
                listType: MultiSelectListType.CHIP,
                onConfirm: (values) {
                  // _selectedAnimals = values;
                },
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
                title: const Text("Select Bottle Gourd"),
                buttonText: const Text("Select Bottle Gourd"),
                searchable: true,
                barrierColor: Colors.blueGrey.withOpacity(0.3),
                items:
                    cropPurposeList.map((e) => MultiSelectItem(e, e)).toList(),
                listType: MultiSelectListType.CHIP,
                onConfirm: (values) {
                  // _selectedAnimals = values;
                },
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
                title: const Text("Select Bitter Gourd"),
                buttonText: const Text("Select Bitter Gourd"),
                searchable: true,
                barrierColor: Colors.blueGrey.withOpacity(0.3),
                items:
                    cropPurposeList.map((e) => MultiSelectItem(e, e)).toList(),
                listType: MultiSelectListType.CHIP,
                onConfirm: (values) {
                  // _selectedAnimals = values;
                },
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
                title: const Text("Select Radish"),
                buttonText: const Text("Select Radish"),
                searchable: true,
                barrierColor: Colors.blueGrey.withOpacity(0.3),
                items:
                    cropPurposeList.map((e) => MultiSelectItem(e, e)).toList(),
                listType: MultiSelectListType.CHIP,
                onConfirm: (values) {
                  // _selectedAnimals = values;
                },
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
                title: const Text("Select Carrot"),
                buttonText: const Text("Select Carrot"),
                searchable: true,
                barrierColor: Colors.blueGrey.withOpacity(0.3),
                items:
                    cropPurposeList.map((e) => MultiSelectItem(e, e)).toList(),
                listType: MultiSelectListType.CHIP,
                onConfirm: (values) {
                  // _selectedAnimals = values;
                },
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
                title: const Text("Select Beet Root"),
                buttonText: const Text("Select Beet Root"),
                searchable: true,
                barrierColor: Colors.blueGrey.withOpacity(0.3),
                items:
                    cropPurposeList.map((e) => MultiSelectItem(e, e)).toList(),
                listType: MultiSelectListType.CHIP,
                onConfirm: (values) {
                  // _selectedAnimals = values;
                },
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
                title: const Text("Select Yam"),
                buttonText: const Text("Select Yam"),
                searchable: true,
                barrierColor: Colors.blueGrey.withOpacity(0.3),
                items:
                    cropPurposeList.map((e) => MultiSelectItem(e, e)).toList(),
                listType: MultiSelectListType.CHIP,
                onConfirm: (values) {
                  // _selectedAnimals = values;
                },
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
                title: const Text("Select Onion"),
                buttonText: const Text("Select Onion"),
                searchable: true,
                barrierColor: Colors.blueGrey.withOpacity(0.3),
                items:
                    cropPurposeList.map((e) => MultiSelectItem(e, e)).toList(),
                listType: MultiSelectListType.CHIP,
                onConfirm: (values) {
                  // _selectedAnimals = values;
                },
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
                title: const Text("Select Garlic"),
                buttonText: const Text("Select Garlic"),
                searchable: true,
                barrierColor: Colors.blueGrey.withOpacity(0.3),
                items:
                    cropPurposeList.map((e) => MultiSelectItem(e, e)).toList(),
                listType: MultiSelectListType.CHIP,
                onConfirm: (values) {
                  // _selectedAnimals = values;
                },
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
                title: const Text("Select Bhaji Saag"),
                buttonText: const Text("Select Bhaji Saag"),
                searchable: true,
                barrierColor: Colors.blueGrey.withOpacity(0.3),
                items:
                    cropPurposeList.map((e) => MultiSelectItem(e, e)).toList(),
                listType: MultiSelectListType.CHIP,
                onConfirm: (values) {
                  // _selectedAnimals = values;
                },
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
                title: const Text("Select Palak"),
                buttonText: const Text("Select Palak"),
                searchable: true,
                barrierColor: Colors.blueGrey.withOpacity(0.3),
                items:
                    cropPurposeList.map((e) => MultiSelectItem(e, e)).toList(),
                listType: MultiSelectListType.CHIP,
                onConfirm: (values) {
                  // _selectedAnimals = values;
                },
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
                title: const Text("Select Methi"),
                buttonText: const Text("Select Methi"),
                searchable: true,
                barrierColor: Colors.blueGrey.withOpacity(0.3),
                items:
                    cropPurposeList.map((e) => MultiSelectItem(e, e)).toList(),
                listType: MultiSelectListType.CHIP,
                onConfirm: (values) {
                  // _selectedAnimals = values;
                },
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
                title: const Text("Select Pui Saag"),
                buttonText: const Text("Select Pui Saag"),
                searchable: true,
                barrierColor: Colors.blueGrey.withOpacity(0.3),
                items:
                    cropPurposeList.map((e) => MultiSelectItem(e, e)).toList(),
                listType: MultiSelectListType.CHIP,
                onConfirm: (values) {
                  // _selectedAnimals = values;
                },
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
                title: const Text("Select Kudrum"),
                buttonText: const Text("Select Kudrum"),
                searchable: true,
                barrierColor: Colors.blueGrey.withOpacity(0.3),
                items:
                    cropPurposeList.map((e) => MultiSelectItem(e, e)).toList(),
                listType: MultiSelectListType.CHIP,
                onConfirm: (values) {
                  // _selectedAnimals = values;
                },
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
                title: const Text("Select Coriander"),
                buttonText: const Text("Select Coriander"),
                searchable: true,
                barrierColor: Colors.blueGrey.withOpacity(0.3),
                items:
                    cropPurposeList.map((e) => MultiSelectItem(e, e)).toList(),
                listType: MultiSelectListType.CHIP,
                onConfirm: (values) {
                  // _selectedAnimals = values;
                },
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
                title: const Text("Select Cucumber"),
                buttonText: const Text("Select Cucumber"),
                searchable: true,
                barrierColor: Colors.blueGrey.withOpacity(0.3),
                items:
                    cropPurposeList.map((e) => MultiSelectItem(e, e)).toList(),
                listType: MultiSelectListType.CHIP,
                onConfirm: (values) {
                  // _selectedAnimals = values;
                },
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
                title: const Text("Select Long Bean"),
                buttonText: const Text("Select Long Bean"),
                searchable: true,
                barrierColor: Colors.blueGrey.withOpacity(0.3),
                items:
                    cropPurposeList.map((e) => MultiSelectItem(e, e)).toList(),
                listType: MultiSelectListType.CHIP,
                onConfirm: (values) {
                  // _selectedAnimals = values;
                },
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
                title: const Text("Select Lady's Finger"),
                buttonText: const Text("Select Lady's Finger"),
                searchable: true,
                barrierColor: Colors.blueGrey.withOpacity(0.3),
                items:
                    cropPurposeList.map((e) => MultiSelectItem(e, e)).toList(),
                listType: MultiSelectListType.CHIP,
                onConfirm: (values) {
                  // _selectedAnimals = values;
                },
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
                title: const Text("Select Peas"),
                buttonText: const Text("Select Peas"),
                searchable: true,
                barrierColor: Colors.blueGrey.withOpacity(0.3),
                items:
                    cropPurposeList.map((e) => MultiSelectItem(e, e)).toList(),
                listType: MultiSelectListType.CHIP,
                onConfirm: (values) {
                  // _selectedAnimals = values;
                },
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
                title: const Text("Select Forest Produce"),
                buttonText: const Text("Select Forest Produce"),
                searchable: true,
                barrierColor: Colors.blueGrey.withOpacity(0.3),
                items: forestProduceList
                    .map((e) => MultiSelectItem(e, e))
                    .toList(),
                listType: MultiSelectListType.CHIP,
                onConfirm: (values) {
                  // _selectedAnimals = values;
                },
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
                    NameUpperCaseTextFormatter(),
                  ],
                  //enabled: state.setEnabled,
                  //initialValue: state.candidateLastName,
                  maxLines: 5,
                  textCapitalization: TextCapitalization.words,
                  textInputAction: TextInputAction.next,
                  //key: const Key('studentForm_candidateLastName_textField'),
                  onChanged: (candidateLastName) => {},
                  obscureText: false,
                  decoration: const InputDecoration(
                    prefixIcon: Padding(
                      padding:
                          EdgeInsets.only(top: 0), // add padding to adjust icon
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
                title: const Text("Select"),
                buttonText: const Text("Select Fresh Water Produce"),
                searchable: true,
                barrierColor: Colors.blueGrey.withOpacity(0.3),
                items: freshWaterProduceList
                    .map((e) => MultiSelectItem(e, e))
                    .toList(),
                listType: MultiSelectListType.CHIP,
                onConfirm: (values) {
                  // _selectedAnimals = values;
                },
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
                    NameUpperCaseTextFormatter(),
                  ],
                  //enabled: state.setEnabled,
                  //initialValue: state.candidateLastName,
                  maxLines: 5,
                  textCapitalization: TextCapitalization.words,
                  textInputAction: TextInputAction.next,
                  //key: const Key('studentForm_candidateLastName_textField'),
                  onChanged: (candidateLastName) => {},
                  obscureText: false,
                  decoration: const InputDecoration(
                    prefixIcon: Padding(
                      padding:
                          EdgeInsets.only(top: 0), // add padding to adjust icon
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
  }

  @override
  bool get wantKeepAlive => true;
}
