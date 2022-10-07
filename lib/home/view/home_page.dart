// ignore_for_file: unused_element

import 'package:atulya/app/app.dart';
import 'package:atulya/configuration/configuration.dart';
import 'package:atulya/home/cubit/cubit.dart';
import 'package:atulya/home/view/view.dart';
import 'package:atulya/home/widgets/section_one_widget.dart';
import 'package:atulya/home/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: HomePage());

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;
  late AnimationController _hideFabAnimController;

  @override
  void initState() {
    _tabController = TabController(length: 6, vsync: this, initialIndex: 0);
    _tabController.addListener(() {
      context.read<InformaticsCubit>().tabIndexChanged(_tabController.index);
      switch (_tabController.index) {
        case 0:
          _hideFabAnimController.forward();
          break;
        default:
          _hideFabAnimController.reverse();
          break;
      }
    });
    _hideFabAnimController = AnimationController(
      vsync: this,
      duration: kThemeAnimationDuration,
      value: 1, // initially visible
    );
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _hideFabAnimController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final user = context.select((AppBloc bloc) => bloc.state.user);
    // final ScrollController scrollController = ScrollController();

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

    Widget notifyPage(String message) {
      return Align(
        alignment: const Alignment(0, -1 / 3),
        child: Scrollbar(
          thumbVisibility: true,
          child: ListView(
            padding: const EdgeInsets.all(0.0),
            shrinkWrap: false,
            children: <Widget>[
              const SizedBox(height: 80),
              Avatar(photo: user.photo),
              const SizedBox(height: 4),
              registrationEmailID(),
              spacerWidget(),
              spacerWidget(),
              sectionHeading(message),
            ],
          ),
        ),
      );
    }

    Widget printPDF() {
      return Align(
        alignment: const Alignment(0, -1 / 3),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 80),
            Avatar(photo: user.photo),
            const SizedBox(height: 4),
            registrationEmailID(),
            spacerWidget(),
            //printButton(context),
          ],
        ),
      );
    }

    void addFamilyMembers() async {
      final ScrollController scrollController = ScrollController();

      await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text(
              'Family Member Details'), // To display the title it is optional
          content: SizedBox(
            height: 600,
            width: 400,
            child: Scrollbar(
              controller: scrollController,
              thumbVisibility: true,
              child: FocusScope(
                child: ListView(
                  controller: scrollController,
                  padding: const EdgeInsets.all(16.0),
                  physics: const AlwaysScrollableScrollPhysics(),
                  shrinkWrap: false,
                  children: <Widget>[
                    const MemberName(),
                    spacerWidget(),
                    const MemberRelationship(),
                    spacerWidget(),
                    const MemberAge(),
                    spacerWidget(),
                    const MemberGender(),
                    spacerWidget(),
                    const MemberQualification(),
                    spacerWidget(),
                    const MemberOccupation(),
                    spacerWidget(),
                  ],
                ),
              ),
            ),
          ), // Message which will be pop up on the screen
          // Action widget which will provide the user to acknowledge the choice
          actions: [
            BlocBuilder<FamilyMemberCubit, FamilyMemberState>(
              builder: (context, state) {
                return ElevatedButton(
                  // FlatButton widget is used to make a text to work like a button
                  //textColor: Colors.black,
                  onPressed: state.status.isValidated
                      ? () {
                          context
                              .read<SectionOneCubit>()
                              .familyMemberDetailsAdd(
                                  FamilyMemberState.toMap(state));

                          context.read<FamilyMemberCubit>().reset();

                          Navigator.pop(context);
                        }
                      : null, // function used to perform after pressing the button
                  child: const Text('SAVE'),
                );
              },
            ),
            ElevatedButton(
              // FlatButton widget is used to make a text to work like a button
              //textColor: Colors.black,
              onPressed: () => Navigator.pop(
                  context), // function used to perform after pressing the button
              child: const Text('CANCEL'),
            ),
          ],
        ),
        barrierDismissible: false,
      );
    }

    Widget? getFab() {
      return Stack(
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: FadeTransition(
              opacity: _hideFabAnimController,
              child: ScaleTransition(
                scale: _hideFabAnimController,
                child: FloatingActionButton(
                  onPressed: () {
                    addFamilyMembers();
                  },
                  child: const Icon(Icons.person_add),
                ),
              ),
            ),
          ),
          BlocBuilder<InformaticsCubit, InformaticsState>(
            builder: (context, state) {
              final dynamic cubit;

              switch (state.tabIndex) {
                case 0:
                  cubit = context.read<SectionOneCubit>();
                  break;
                case 1:
                  cubit = context.read<SectionTwoCubit>();
                  break;
                case 2:
                  cubit = context.read<SectionThreeCubit>();
                  break;
                case 3:
                  cubit = context.read<SectionFourCubit>();
                  break;
                case 4:
                  cubit = context.read<SectionFiveCubit>();
                  break;
                case 5:
                  cubit = context.read<SectionSixCubit>();
                  break;
                default:
                  cubit = context.read<SectionOneCubit>();
                  break;
              }

              return Align(
                alignment: Alignment.bottomLeft,
                child: Row(
                  children: [
                    spacerWidget(),
                    spacerWidget(),
                    FloatingActionButton.extended(
                      enableFeedback: true,
                      onPressed: () {
                        // print(cubit.canUndo);
                        if (cubit.canUndo) {
                          cubit.undo();
                        }
                      },
                      icon: const Icon(Icons.undo),
                      label: const Text(
                        'Undo',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    spacerWidget(),
                    FloatingActionButton.extended(
                      enableFeedback: true,
                      onPressed: () {
                        // print(cubit.canRedo);
                        if (cubit.canRedo) {
                          cubit.redo();
                        }
                      },
                      icon: const Icon(Icons.redo),
                      label: const Text(
                        'Redo',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          )
        ],
      );
    }

    Widget loadStudent() {
      return TabBarView(
        controller: _tabController,
        children: const [
          TabOne(),
          TabTwo(),
          TabThree(),
          TabFour(),
          TabFive(),
          TabSix(),
        ],
      );
    }

    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          title: Text(configSchoolName),
          bottom: TabBar(
            controller: _tabController,
            labelColor: Colors.blueGrey,
            indicatorColor: Colors.pinkAccent,
            tabs: const [
              Tab(text: "S1"),
              Tab(text: "S2"),
              Tab(text: "S3"),
              Tab(text: "S4"),
              Tab(text: "S5"),
              Tab(text: "S6"),
            ],
          ),
          //backgroundColor: Theme.of(context).primaryColorDark, // appbar color.
          //foregroundColor: Colors.white,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.save_rounded),
              onPressed: () => {},
            ),
            IconButton(
              icon: const Icon(Icons.picture_as_pdf),
              onPressed: () => {},
            ),
            IconButton(
              icon: const Icon(Icons.exit_to_app_rounded),
              onPressed: () =>
                  context.read<AppBloc>().add(AppLogoutRequested()),
            ),
          ],
        ),
        floatingActionButton: getFab() is Container ? null : getFab(),
        body: loadStudent(),
      ),
    );
  }
}
