// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';
import 'package:sizer/sizer.dart';

import '../home.dart';

class TabFive extends StatefulWidget {
  const TabFive({super.key});

  @override
  State<TabFive> createState() => _TabFiveState();
}

class _TabFiveState extends State<TabFive>
    with AutomaticKeepAliveClientMixin<TabFive> {
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
                  isExpanded: true,
                  //value: "1",
                  icon: const Icon(Icons.arrow_downward_rounded),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  decoration: const InputDecoration(
                    prefixIcon: Padding(
                      padding:
                          EdgeInsets.only(top: 0), // add padding to adjust icon
                      child: Icon(Icons.wc_rounded, color: Colors.lightBlue),
                    ),
                    border: OutlineInputBorder(),
                    labelText:
                        "Do you know that the OCL is acquiring some more land?",
                    helperText: '',
                    //errorText: state.gender.invalid ? 'required field' : null,
                  ),
                  onChanged: (value) {},
                  items:
                      yesNoList.map<DropdownMenuItem<String>>((String value) {
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
                  //value: "YES",
                  icon: const Icon(Icons.arrow_downward_rounded),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  decoration: const InputDecoration(
                    prefixIcon: Padding(
                      padding:
                          EdgeInsets.only(top: 0), // add padding to adjust icon
                      child: Icon(Icons.wc_rounded, color: Colors.lightBlue),
                    ),
                    border: OutlineInputBorder(),
                    labelText:
                        "Are you/your household is going to lose any land?",
                    helperText: '',
                    //errorText: state.gender.invalid ? 'required field' : null,
                  ),
                  onChanged: (value) {},
                  items:
                      yesNoList.map<DropdownMenuItem<String>>((String value) {
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
                  //value: "YES",
                  icon: const Icon(Icons.arrow_downward_rounded),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  decoration: const InputDecoration(
                    prefixIcon: Padding(
                      padding:
                          EdgeInsets.only(top: 0), // add padding to adjust icon
                      child: Icon(Icons.wc_rounded, color: Colors.lightBlue),
                    ),
                    border: OutlineInputBorder(),
                    labelText: "Have you got the notification?",
                    helperText: '',
                    //errorText: state.gender.invalid ? 'required field' : null,
                  ),
                  onChanged: (value) {},
                  items:
                      yesNoList.map<DropdownMenuItem<String>>((String value) {
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
                searchable: true,
                barrierColor: Colors.blueGrey.withOpacity(0.3),
                items: protestActionList
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
                child: DropdownButtonFormField<String>(
                  isExpanded: true,
                  //value: "YES",
                  icon: const Icon(Icons.arrow_downward_rounded),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  decoration: const InputDecoration(
                    prefixIcon: Padding(
                      padding:
                          EdgeInsets.only(top: 0), // add padding to adjust icon
                      child: Icon(Icons.wc_rounded, color: Colors.lightBlue),
                    ),
                    border: OutlineInputBorder(),
                    labelText:
                        "Have you given consent to sell the land to OCL?",
                    helperText: '',
                    //errorText: state.gender.invalid ? 'required field' : null,
                  ),
                  onChanged: (value) {},
                  items:
                      yesNoList.map<DropdownMenuItem<String>>((String value) {
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
                  isExpanded: true,
                  //value: "YES",
                  icon: const Icon(Icons.arrow_downward_rounded),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  decoration: const InputDecoration(
                    prefixIcon: Padding(
                      padding:
                          EdgeInsets.only(top: 0), // add padding to adjust icon
                      child: Icon(Icons.wc_rounded, color: Colors.lightBlue),
                    ),
                    border: OutlineInputBorder(),
                    labelText:
                        "Are you aware of 'why' the land is being acquired for?",
                    helperText: '',
                    //errorText: state.gender.invalid ? 'required field' : null,
                  ),
                  onChanged: (value) {},
                  items:
                      yesNoList.map<DropdownMenuItem<String>>((String value) {
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
                  isExpanded: true,
                  //value: "YES",
                  icon: const Icon(Icons.arrow_downward_rounded),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  decoration: const InputDecoration(
                    prefixIcon: Padding(
                      padding:
                          EdgeInsets.only(top: 0), // add padding to adjust icon
                      child: Icon(Icons.wc_rounded, color: Colors.lightBlue),
                    ),
                    border: OutlineInputBorder(),
                    labelText:
                        "Are you aware of the law under which the land is being taken?",
                    helperText: '',
                    //errorText: state.gender.invalid ? 'required field' : null,
                  ),
                  onChanged: (value) {},
                  items:
                      yesNoList.map<DropdownMenuItem<String>>((String value) {
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
                  isExpanded: true,
                  //value: "YES",
                  icon: const Icon(Icons.arrow_downward_rounded),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  decoration: const InputDecoration(
                    prefixIcon: Padding(
                      padding:
                          EdgeInsets.only(top: 0), // add padding to adjust icon
                      child: Icon(Icons.wc_rounded, color: Colors.lightBlue),
                    ),
                    border: OutlineInputBorder(),
                    labelText:
                        "Was there Gramsabha in your village/panchayat held to discuss whether to give the land to OCL?",
                    helperText: '',
                    //errorText: state.gender.invalid ? 'required field' : null,
                  ),
                  onChanged: (value) {},
                  items:
                      yesNoList.map<DropdownMenuItem<String>>((String value) {
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
                  //value: "YES",
                  icon: const Icon(Icons.arrow_downward_rounded),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  decoration: const InputDecoration(
                    prefixIcon: Padding(
                      padding:
                          EdgeInsets.only(top: 0), // add padding to adjust icon
                      child: Icon(Icons.wc_rounded, color: Colors.lightBlue),
                    ),
                    border: OutlineInputBorder(),
                    labelText: "If yes, did you participate in the gram sabha?",
                    helperText: '',
                    //errorText: state.gender.invalid ? 'required field' : null,
                  ),
                  onChanged: (value) {},
                  items:
                      yesNoList.map<DropdownMenuItem<String>>((String value) {
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
                    labelText: "What resolution was passed in the gram sabha?",
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
                  isExpanded: true,
                  //value: "YES",
                  icon: const Icon(Icons.arrow_downward_rounded),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  decoration: const InputDecoration(
                    prefixIcon: Padding(
                      padding:
                          EdgeInsets.only(top: 0), // add padding to adjust icon
                      child: Icon(Icons.wc_rounded, color: Colors.lightBlue),
                    ),
                    border: OutlineInputBorder(),
                    labelText:
                        "Are you aware of the compensation you will be paid for the loss of land?",
                    helperText: '',
                    //errorText: state.gender.invalid ? 'required field' : null,
                  ),
                  onChanged: (value) {},
                  items:
                      yesNoList.map<DropdownMenuItem<String>>((String value) {
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
                  isExpanded: true,
                  //value: "YES",
                  icon: const Icon(Icons.arrow_downward_rounded),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  decoration: const InputDecoration(
                    prefixIcon: Padding(
                      padding:
                          EdgeInsets.only(top: 0), // add padding to adjust icon
                      child: Icon(Icons.wc_rounded, color: Colors.lightBlue),
                    ),
                    border: OutlineInputBorder(),
                    labelText: "Are you happy with this Compensation?",
                    helperText: '',
                    //errorText: state.gender.invalid ? 'required field' : null,
                  ),
                  onChanged: (value) {},
                  items:
                      yesNoList.map<DropdownMenuItem<String>>((String value) {
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
                  //value: "YES",
                  icon: const Icon(Icons.arrow_downward_rounded),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  decoration: const InputDecoration(
                    prefixIcon: Padding(
                      padding:
                          EdgeInsets.only(top: 0), // add padding to adjust icon
                      child: Icon(Icons.wc_rounded, color: Colors.lightBlue),
                    ),
                    border: OutlineInputBorder(),
                    labelText:
                        "Are you aware of Resettlement and Rehabilitation plan",
                    helperText: '',
                    //errorText: state.gender.invalid ? 'required field' : null,
                  ),
                  onChanged: (value) {},
                  items:
                      yesNoList.map<DropdownMenuItem<String>>((String value) {
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
    );
  }

  @override
  bool get wantKeepAlive => true;
}
