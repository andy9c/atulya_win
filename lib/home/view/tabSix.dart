// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../home.dart';

class TabSix extends StatefulWidget {
  const TabSix({super.key});

  @override
  State<TabSix> createState() => _TabSixState();
}

class _TabSixState extends State<TabSix>
    with AutomaticKeepAliveClientMixin<TabSix> {
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
                "Importance of land and Impact of the land acquisition"),
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
                    labelText: "What does the land mean to you ?",
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
                        "What does the loss of Common property mean to you ?",
                    helperText: '',
                  ),
                ),
              ),
            ),
            sectionInfo(
                "How will the land acquisition affect you/ your household according to you(e.g Impact on the economic condition/Health/ Mental health/ Women/Children/ Community/Environment/Ecosystems/Agriculture/Groundwater/ Dust/Blasting)"),
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
                        "How will the land acquisition affect you/ your household according to you(e.g Impact on the economic condition/Health/ Mental health/ Women/Children/ Community/Environment/Ecosystems/Agriculture/Groundwater/ Dust/Blasting)",
                    helperText: '',
                  ),
                ),
              ),
            ),
            sectionInfo(
                "How is the present mining activity affecting the water bodies, air, land, health, groundwater, blasting, dust, mining"),
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
                        "How is the present mining activity affecting the water bodies, air, land, health, groundwater, blasting, dust, mining",
                    helperText: '',
                  ),
                ),
              ),
            ),
            sectionInfo(
                "What has been the discussion at home regarding the Land loss"),
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
                        "What has been the discussion at home regarding the Land loss.",
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
                    labelText: "Anything else you want to share/comment ?",
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

  @override
  bool get wantKeepAlive => true;
}
