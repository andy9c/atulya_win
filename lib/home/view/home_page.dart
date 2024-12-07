// ignore_for_file: unused_element

import 'dart:async';
import 'dart:io';

import 'package:atulya/app/app.dart';
import 'package:atulya/configuration/configuration.dart';
import 'package:atulya/database/stream.dart';
import 'package:atulya/home/cubit/cubit.dart';
import 'package:atulya/home/view/view.dart';
import 'package:atulya/home/widgets/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:formz/formz.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:sizer/sizer.dart';

import '../../database/database.dart';
import '../../main.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: HomePage());

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;
  late final StreamSubscription<InternetConnectionStatus>? listener;

  Future<void> secureScreen() async {
    await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  }

  @override
  void initState() {
    if (!kIsWeb && Platform.isAndroid) {
      secureScreen();
    }

    _tabController = TabController(
      length: 6,
      vsync: this,
      initialIndex: context.read<InformaticsCubit>().state.tabIndex,
    );

    _tabController.addListener(() {
      context.read<InformaticsCubit>().tabIndexChanged(_tabController.index);
    });

    if (!kIsWeb) {
      // actively listen for status updates
      listener = InternetConnectionChecker().onStatusChange.listen(
        (InternetConnectionStatus status) {
          switch (status) {
            case InternetConnectionStatus.connected:
              // ignore: avoid_print
              // print('Data connection is available.');
              context.read<InformaticsCubit>().hasInternetChanged(true);
              String message = 'Connected to internet !';
              showMessageBanner(message, dismiss: true);
              break;
            case InternetConnectionStatus.disconnected:
              // ignore: avoid_print
              // print('You are disconnected from the internet.');
              context.read<InformaticsCubit>().hasInternetChanged(false);
              String message = 'No internet !';
              showMessageBanner(message, dismiss: true);
              break;
          }
        },
      );
    } else {
      listener = null;
    }

    if (context.read<InformaticsCubit>().state.documentID.value != null) {
      context.read<InformaticsCubit>().isEnabledChanged(context, false);
    } else {
      context.read<InformaticsCubit>().isEnabledChanged(context, true);
    }

    super.initState();
  }

  @override
  Future<void> dispose() async {
    super.dispose();
    globalScaffoldMessenger.currentState!.hideCurrentMaterialBanner();
    _tabController.dispose();

    // if (kIsWeb) {
    //   await listener!.cancel();
    // }
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

    void listData() async {
      final User? user = FirebaseAuth.instance.currentUser;
      final String emailID = user!.email.toString();

      final specDomain = RegExp(r'^[A-Za-z0-9]*@watch\.edu$');

      bool isVisitor = specDomain.hasMatch(emailID);

      await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Records'), // To display the title it is optional
          content: SizedBox(
            height: 600,
            width: 400,
            child: StreamBuilder(
              stream:
                  StreamData.getRecords().asyncMap((event) => event).distinct(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Text('Something went wrong');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: SizedBox(
                      width: 48,
                      height: 48,
                      child: CircularProgressIndicator.adaptive(),
                    ),
                  );
                }

                if (snapshot.data!.size == 0) {
                  return const Text('Record Empty');
                }

                return BlocBuilder<InformaticsCubit, InformaticsState>(
                  builder: (context, state) {
                    return AbsorbPointer(
                      absorbing: state.isLoadingDocument,
                      child: Column(
                        children: [
                          !state.isLoadingDocument
                              ? Container()
                              : const LinearProgressIndicator(
                                  value: null,
                                  semanticsLabel: 'Linear progress indicator',
                                ),
                          spacerWidget(),
                          Flexible(
                            child: ListView.separated(
                              // separatorBuilder: separatorBuilder,
                              physics: const BouncingScrollPhysics(),
                              itemCount: snapshot.data!.size,
                              separatorBuilder: (context, index) {
                                return Divider(
                                  color: Theme.of(context).primaryColorLight,
                                );
                              },
                              itemBuilder: (context, index) {
                                DocumentSnapshot document =
                                    snapshot.data!.docs[index];
                                String docID = document.id;
                                Map<String, dynamic> data =
                                    document.data()! as Map<String, dynamic>;

                                bool isEdited = data['isEdited'] ?? false;

                                return ListTile(
                                  dense: true,
                                  isThreeLine: true,
                                  leading: Text((index + 1).toString()),
                                  title: isEdited
                                      ? Text(
                                          '${data["s1_edit"]["fullName"]}, (${data["s1_edit"]["gramPanchayat"]})')
                                      : Text(
                                          '${data["s1"]["fullName"]}, (${data["s1"]["gramPanchayat"]})'),
                                  subtitle: Text('${data['email']}'),
                                  trailing: IconButton(
                                    onPressed: isVisitor
                                        ? null
                                        : () {
                                            showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    AlertDialog(
                                                      title: const Text(
                                                        'Confirm Delete !',
                                                      ),
                                                      content: ListTile(
                                                        dense: true,
                                                        isThreeLine: true,
                                                        leading: const Icon(
                                                          Icons.list_rounded,
                                                        ),
                                                        title: isEdited
                                                            ? Text(
                                                                '${data["s1_edit"]["fullName"]}, (${data["s1_edit"]["gramPanchayat"]})')
                                                            : Text(
                                                                '${data["s1"]["fullName"]}, (${data["s1"]["gramPanchayat"]})'),
                                                        subtitle: Text(
                                                            '${data['email']}'),
                                                      ),
                                                      icon: const Icon(
                                                        Icons.delete,
                                                      ),
                                                      actions: [
                                                        ElevatedButton(
                                                          onPressed: () {
                                                            Delete.execute(
                                                                docID);
                                                            Navigator.pop(
                                                                context);
                                                            showInfo(isEdited
                                                                ? '${data["s1_edit"]["fullName"]}, (${data["s1_edit"]["gramPanchayat"]}) deleted !'
                                                                : '${data["s1"]["fullName"]}, (${data["s1"]["gramPanchayat"]}) deleted !');
                                                          },
                                                          child: const Text(
                                                              "DELETE"),
                                                        ),
                                                        ElevatedButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: const Text(
                                                              "CANCEL"),
                                                        ),
                                                      ],
                                                    ));
                                          },
                                    icon: const Icon(
                                      Icons.delete,
                                    ),
                                  ),
                                  onTap: () async {
                                    context
                                        .read<InformaticsCubit>()
                                        .isLoadingDocumentChanged(true);

                                    DocumentSnapshot<Object?> data =
                                        await Read.execute(docID);

                                    if (mounted) {
                                      context
                                          .read<InformaticsCubit>()
                                          .documentIDChanged(docID);

                                      context
                                          .read<InformaticsCubit>()
                                          .isEnabledChanged(context, false);
                                    }

                                    SectionOneState s1 = isEdited
                                        ? SectionOneState.fromMap(
                                            data["s1_edit"])
                                        : SectionOneState.fromMap(data["s1"]);

                                    SectionTwoState s2 = isEdited
                                        ? SectionTwoState.fromMap(
                                            data["s2_edit"])
                                        : SectionTwoState.fromMap(data["s2"]);

                                    SectionThreeState s3 = isEdited
                                        ? SectionThreeState.fromMap(
                                            data["s3_edit"])
                                        : SectionThreeState.fromMap(data["s3"]);

                                    SectionFourState s4 = isEdited
                                        ? SectionFourState.fromMap(
                                            data["s4_edit"])
                                        : SectionFourState.fromMap(data["s4"]);

                                    SectionFiveState s5 = isEdited
                                        ? SectionFiveState.fromMap(
                                            data["s5_edit"])
                                        : SectionFiveState.fromMap(data["s5"]);

                                    SectionSixState s6 = isEdited
                                        ? SectionSixState.fromMap(
                                            data["s6_edit"])
                                        : SectionSixState.fromMap(data["s6"]);

                                    if (mounted) {
                                      context
                                          .read<InformaticsCubit>()
                                          .isLoadingDocumentChanged(false);

                                      context
                                          .read<SectionOneCubit>()
                                          .setState(s1);
                                      context
                                          .read<SectionTwoCubit>()
                                          .setState(s2);
                                      context
                                          .read<SectionThreeCubit>()
                                          .setState(s3);
                                      context
                                          .read<SectionFourCubit>()
                                          .setState(s4);
                                      context
                                          .read<SectionFiveCubit>()
                                          .setState(s5);
                                      context
                                          .read<SectionSixCubit>()
                                          .setState(s6);

                                      Navigator.pop(context);

                                      _tabController.animateTo(0,
                                          duration: const Duration(seconds: 1));

                                      TabOne.of(context)?.scrollUp();
                                    }
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ), // Message which will be pop up on the screen
          // Action widget which will provide the user to acknowledge the choice
          actions: [
            ElevatedButton(
              // FlatButton widget is used to make a text to work like a button
              //textColor: Colors.black,
              onPressed: () => Navigator.pop(
                  context), // function used to perform after pressing the button
              child: const Text('CLOSE'),
            ),
          ],
        ),
        barrierDismissible: false,
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
      final User? user = FirebaseAuth.instance.currentUser;
      final String emailID = user!.email.toString();

      final specDomain = RegExp(r'^[A-Za-z0-9]*@watch\.edu$');

      return specDomain.hasMatch(emailID)
          ? Container()
          : Stack(
              children: [
                Align(
                  alignment: Alignment.bottomRight,
                  child: FloatingActionButton.extended(
                    enableFeedback: true,
                    onPressed: () {
                      String message =
                          "Create New Record ? Unsaved changes will be lost !";

                      globalScaffoldMessenger.currentState
                        ?..removeCurrentMaterialBanner()
                        ..showMaterialBanner(
                          MaterialBanner(
                            //backgroundColor: Colors.blue,
                            content: Text(message),
                            //contentTextStyle: const TextStyle(color: Colors.white),
                            onVisible: () => Future.delayed(
                              const Duration(seconds: 7),
                              () => globalScaffoldMessenger.currentState!
                                  .hideCurrentMaterialBanner(),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  context.read<SectionOneCubit>().reset();
                                  context.read<SectionTwoCubit>().reset();
                                  context.read<SectionThreeCubit>().reset();
                                  context.read<SectionFourCubit>().reset();
                                  context.read<SectionFiveCubit>().reset();
                                  context.read<SectionSixCubit>().reset();

                                  globalScaffoldMessenger.currentState!
                                      .hideCurrentMaterialBanner();

                                  context
                                      .read<InformaticsCubit>()
                                      .documentIDChanged(null);

                                  context
                                      .read<InformaticsCubit>()
                                      .isEnabledChanged(context, true);

                                  _tabController.animateTo(0,
                                      duration: const Duration(seconds: 1));

                                  TabOne.of(context)?.scrollUp();
                                },
                                child: const Text("CREATE"),
                              ),
                              TextButton(
                                //style: TextButton.styleFrom(foregroundColor: Colors.white),
                                onPressed: () {
                                  globalScaffoldMessenger.currentState!
                                      .hideCurrentMaterialBanner();
                                },
                                child: const Text("DISMISS"),
                              )
                            ],
                          ),
                        );
                    },
                    icon: const Icon(Icons.add),
                    label: const Text(
                      'New',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
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

    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          title: BlocBuilder<SectionOneCubit, SectionOneState>(
            builder: (context, state) {
              return (state.fullName.value ?? '').isEmpty
                  ? Text((configSchoolName))
                  : Text(
                      '${state.fullName.value} (${state.gramPanchayat.value})');
            },
          ),
          bottom: TabBar(
            controller: _tabController,
            labelColor: Colors.blueGrey,
            indicatorColor: Colors.pinkAccent,
            tabs: [
              BlocBuilder<SectionOneCubit, SectionOneState>(
                builder: (context, state) {
                  return Tab(
                    child: Text(
                      'S1',
                      style: TextStyle(
                        color: state.status.isValid ? null : Colors.pinkAccent,
                      ),
                    ),
                  );
                },
              ),
              BlocBuilder<SectionTwoCubit, SectionTwoState>(
                builder: (context, state) {
                  return Tab(
                    child: Text(
                      'S2',
                      style: TextStyle(
                        color: state.status.isValid ? null : Colors.pinkAccent,
                      ),
                    ),
                  );
                },
              ),
              BlocBuilder<SectionThreeCubit, SectionThreeState>(
                builder: (context, state) {
                  return Tab(
                    child: Text(
                      'S3',
                      style: TextStyle(
                        color: state.status.isValid ? null : Colors.pinkAccent,
                      ),
                    ),
                  );
                },
              ),
              BlocBuilder<SectionFourCubit, SectionFourState>(
                builder: (context, state) {
                  return Tab(
                    child: Text(
                      'S4',
                      style: TextStyle(
                        color: state.status.isValid ? null : Colors.pinkAccent,
                      ),
                    ),
                  );
                },
              ),
              BlocBuilder<SectionFiveCubit, SectionFiveState>(
                builder: (context, state) {
                  return Tab(
                    child: Text(
                      'S5',
                      style: TextStyle(
                        color: state.status.isValid ? null : Colors.pinkAccent,
                      ),
                    ),
                  );
                },
              ),
              BlocBuilder<SectionSixCubit, SectionSixState>(
                builder: (context, state) {
                  return Tab(
                    child: Text(
                      'S6',
                      style: TextStyle(
                        color: state.status.isValid ? null : Colors.pinkAccent,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          //backgroundColor: Theme.of(context).primaryColorDark, // appbar color.
          //foregroundColor: Colors.white,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.view_list_rounded),
              onPressed: () {
                listData();
              },
            ),
            BlocBuilder<InformaticsCubit, InformaticsState>(
              builder: (context, state) {
                return IconButton(
                  icon: const Icon(Icons.save_rounded),
                  onPressed: !state.isEnabled
                      ? null
                      : () async {
                          if (context
                                  .read<SectionOneCubit>()
                                  .state
                                  .status
                                  .isValidated &&
                              context
                                  .read<SectionTwoCubit>()
                                  .state
                                  .status
                                  .isValidated &&
                              context
                                  .read<SectionThreeCubit>()
                                  .state
                                  .status
                                  .isValidated &&
                              context
                                  .read<SectionFourCubit>()
                                  .state
                                  .status
                                  .isValidated &&
                              context
                                  .read<SectionFiveCubit>()
                                  .state
                                  .status
                                  .isValidated &&
                              context
                                  .read<SectionSixCubit>()
                                  .state
                                  .status
                                  .isValidated) {
                            String message = "Confirm Save !";

                            globalScaffoldMessenger.currentState
                              ?..removeCurrentMaterialBanner()
                              ..showMaterialBanner(
                                MaterialBanner(
                                  //backgroundColor: Colors.blue,
                                  content: Text(message),
                                  //contentTextStyle: const TextStyle(color: Colors.white),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        if (!context
                                            .read<InformaticsCubit>()
                                            .state
                                            .hasInternet) {
                                          String message =
                                              'Information will sync when internet is back !';

                                          showMessageBanner(message);
                                        } else {
                                          String message = 'Record Saved !';
                                          showMessageBanner(message,
                                              dismiss: true);
                                        }

                                        Create.execute(context);

                                        context.read<SectionOneCubit>().reset();
                                        context.read<SectionTwoCubit>().reset();
                                        context
                                            .read<SectionThreeCubit>()
                                            .reset();
                                        context
                                            .read<SectionFourCubit>()
                                            .reset();
                                        context
                                            .read<SectionFiveCubit>()
                                            .reset();
                                        context.read<SectionSixCubit>().reset();

                                        context
                                            .read<InformaticsCubit>()
                                            .documentIDChanged(null);

                                        context
                                            .read<InformaticsCubit>()
                                            .isEnabledChanged(context, true);

                                        _tabController.animateTo(0,
                                            duration:
                                                const Duration(seconds: 1));
                                      },
                                      child: const Text("SAVE"),
                                    ),
                                    TextButton(
                                      //style: TextButton.styleFrom(foregroundColor: Colors.white),
                                      onPressed: () {
                                        globalScaffoldMessenger.currentState!
                                            .hideCurrentMaterialBanner();
                                      },
                                      child: const Text("DISMISS"),
                                    )
                                  ],
                                ),
                              );
                          } else {
                            String message = 'Required fields are missing !';
                            showMessageBanner(message);
                          }
                        },
                );
              },
            ),
            const IconButton(
              icon: Icon(Icons.picture_as_pdf),
              onPressed: null,
            ),
            IconButton(
              icon: const Icon(Icons.exit_to_app_rounded),
              onPressed: () {
                String message = "Confirm Signout !";

                globalScaffoldMessenger.currentState
                  ?..removeCurrentMaterialBanner()
                  ..showMaterialBanner(
                    MaterialBanner(
                      //backgroundColor: Colors.blue,
                      content: Text(message),
                      //contentTextStyle: const TextStyle(color: Colors.white),
                      onVisible: () => Future.delayed(
                        const Duration(seconds: 7),
                        () => globalScaffoldMessenger.currentState!
                            .hideCurrentMaterialBanner(),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            context.read<AppBloc>().add(AppLogoutRequested());
                          },
                          child: const Text("SIGNOUT"),
                        ),
                        TextButton(
                          //style: TextButton.styleFrom(foregroundColor: Colors.white),
                          onPressed: () {
                            globalScaffoldMessenger.currentState!
                                .hideCurrentMaterialBanner();
                          },
                          child: const Text("DISMISS"),
                        )
                      ],
                    ),
                  );
              },
            ),
          ],
        ),
        floatingActionButton: getFab() is Container ? null : getFab(),
        body: TabBarView(
          controller: _tabController,
          children: const [
            TabOne(),
            TabTwo(),
            TabThree(),
            TabFour(),
            TabFive(),
            TabSix(),
          ],
        ),
      ),
    );
  }
}
