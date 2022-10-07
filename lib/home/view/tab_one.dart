// ignore_for_file: file_names

import 'package:atulya/app/bloc/app_bloc.dart';
import 'package:atulya/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../cubit/cubit.dart';
import '../widgets/section_one_widget.dart';

class TabOne extends StatefulWidget {
  const TabOne({super.key});

  @override
  State<TabOne> createState() => _TabOneState();
}

class _TabOneState extends State<TabOne>
    with AutomaticKeepAliveClientMixin<TabOne> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final user = context.select((AppBloc bloc) => bloc.state.user);
    final ScrollController scr1 = ScrollController();

    Widget registrationEmailID() {
      return Align(
        alignment: Alignment.center,
        child: SizedBox(
          width: 70.w,
          child: Align(
            alignment: Alignment.center,
            child: Text(user.email ?? '', style: textTheme.titleLarge),
          ),
        ),
      );
    }

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

    // ignore: unused_element
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
        controller: scr1,
        child: FocusScope(
          child: BlocBuilder<SectionOneCubit, SectionOneState>(
            key: UniqueKey(),
            builder: (context, state) {
              return ListView(
                controller: scr1,
                padding: const EdgeInsets.all(0.0),
                physics: const AlwaysScrollableScrollPhysics(),
                shrinkWrap: false,
                children: <Widget>[
                  const SizedBox(height: 80),
                  Avatar(photo: user.photo),
                  const SizedBox(height: 4),
                  registrationEmailID(),

                  spacerWidget(),
                  instructionButton(context),
                  spacerWidget(),
                  spacerWidget(),
                  spacerWidget(),
                  sectionHeading("Respondent's Information"),
                  dividerWidget(),
                  spacerWidget(),
                  //LoadingState(),
                  //spacerWidget(),
                  const PattaNumber(),
                  spacerWidget(),
                  const RespondentFullName(),
                  spacerWidget(),
                  const RespondentRelationship(),
                  spacerWidget(),
                  const HeadOfHousehold(),
                  spacerWidget(),
                  const RespondentAge(),
                  spacerWidget(),
                  const GenderSelection(),
                  spacerWidget(),
                  const ReligionSelection(),
                  spacerWidget(),
                  const SocialCategorySelection(),
                  spacerWidget(),
                  const CommunityName(),
                  spacerWidget(),
                  const GramPanchayat(),
                  spacerWidget(),

                  const CardHolder(),
                  spacerWidget(),
                  const RespondentQualification(),
                  spacerWidget(),
                  const RespondentPrimaryOccupation(),
                  spacerWidget(),
                  const RespondentSecondaryOccupation(),
                  spacerWidget(),
                  const FamilyMember(),
                  spacerWidget(),

                  spacerWidget(),
                  spacerWidget(),
                  spacerWidget(),
                  spacerWidget(),
                  spacerWidget(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
