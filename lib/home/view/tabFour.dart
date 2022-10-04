// ignore_for_file: file_names

import 'package:atulya/home/home.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:sizer/sizer.dart';

class TabFour extends StatefulWidget {
  const TabFour({super.key});

  @override
  State<TabFour> createState() => _TabFourState();
}

class _TabFourState extends State<TabFour>
    with AutomaticKeepAliveClientMixin<TabFour> {
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
    return Align(
      alignment: const Alignment(0, -1 / 3),
      child: Scrollbar(
        thumbVisibility: true,
        controller: scr4,
        child: ListView(
          controller: scr4,
          padding: const EdgeInsets.all(0.0),
          physics: const AlwaysScrollableScrollPhysics(),
          shrinkWrap: true,
          children: <Widget>[
            spacerWidget(),
            sectionHeading("Details of Land loss for any projects Before"),
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
                        "Have you lost land in any projects in the past?",
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
            sectionInfo("If Yes, Then for which Project"),
            spacerWidget(),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 5.w,
              ),
              child: MultiSelectDialogField(
                title: const Text("Select Projects"),
                buttonText: const Text("Select Projects"),
                searchable: true,
                barrierColor: Colors.blueGrey.withOpacity(0.3),
                items:
                    projectLossList.map((e) => MultiSelectItem(e, e)).toList(),
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
                    flex: 1,
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
                        labelText: "How much land lost ?",
                        helperText: '',
                      ),
                    ),
                  ),
                  spacerWidget(),
                  Expanded(
                    flex: 1,
                    child: DropdownButtonFormField<String>(
                      isExpanded: true,
                      //value: "YES",
                      icon: const Icon(Icons.arrow_downward_rounded),
                      iconSize: 24,
                      elevation: 16,
                      style: const TextStyle(color: Colors.deepPurple),
                      decoration: const InputDecoration(
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(
                              top: 0), // add padding to adjust icon
                          child:
                              Icon(Icons.wc_rounded, color: Colors.lightBlue),
                        ),
                        border: OutlineInputBorder(),
                        labelText: "Decimal/Acre",
                        helperText: '',
                        //errorText: state.gender.invalid ? 'required field' : null,
                      ),
                      onChanged: (value) {},
                      items: areaList
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      hint: const Text(
                        "Unit",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
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
                    labelText: "Did you get any compensation ?",
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
                        "If Yes, then What was the compensation(Cash, employment, land ),?",
                    helperText: '',
                  ),
                ),
              ),
            ),
            sectionInfo("If Cash then how much, what were your expectation ?"),
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
          ],
        ),
      ),
    );
  }
}
