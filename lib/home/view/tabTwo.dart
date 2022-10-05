// ignore_for_file: file_names

import 'package:atulya/home/home.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TabTwo extends StatefulWidget {
  const TabTwo({super.key});

  @override
  State<TabTwo> createState() => _TabTwoState();
}

class _TabTwoState extends State<TabTwo>
    with AutomaticKeepAliveClientMixin<TabTwo> {
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
    return Align(
      alignment: const Alignment(0, -1 / 3),
      child: Scrollbar(
        thumbVisibility: true,
        controller: scr2,
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
                    labelText: "Generation Count",
                    helperText: '',
                    //errorText: state.gender.invalid ? 'required field' : null,
                  ),
                  onChanged: (value) {},
                  items:
                      numberList.map<DropdownMenuItem<String>>((String value) {
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
                    labelText: "Do you own land",
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
                    labelText: "If Yes, on whose name the patta is on:(Name)",
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
                    labelText: "If No, on whose name the patta is on :(Name)",
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
                        "Specify your relationship with the patta holder: Self/Father/ Mother/ Grandfather/Great grandfather",
                    helperText: '',
                    //errorText: state.gender.invalid ? 'required field' : null,
                  ),
                  onChanged: (value) {},
                  items: motherTongueList
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
                    labelText: "Is he / she alive",
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
                    labelText:
                        "Mention the no. of households/ chulha depend on this patta.",
                    helperText: '',
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
                    labelText:
                        "Mention the total nos. of persons in these household/chulha.",
                    helperText: '',
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
                        "Do you cultivate in community land (Anabadi) apart from your patta land ?",
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
                    labelText: "Have you applied for Individual Ownership?",
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
                        "Have you received the entitlement (patta) from the government?",
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
    );
  }
}
