import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/cubit.dart';

class TabZero extends StatefulWidget {
  const TabZero({super.key});

  @override
  State<TabZero> createState() => _TabZeroState();
}

class _TabZeroState extends State<TabZero>
    with AutomaticKeepAliveClientMixin<TabZero> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Center(
      child: BlocBuilder<SectionOneCubit, SectionOneState>(
        key: UniqueKey(),
        builder: (context, state) {
          return ElevatedButton(
            key: UniqueKey(),
            onPressed: () {
              // print("Pressed ...");
              Iterable<String> x = context
                  .read<SectionOneCubit>()
                  .state
                  .familyMemberDetails
                  .keys;
              if (x.isEmpty) {
                // print("Map Empty !");
              } else {
                context
                    .read<SectionOneCubit>()
                    .familyMemberDetailsRemove([x.first]);
                // print("Deleted ...");
              }
            },
            child: Text(
              key: UniqueKey(),
              state.familyMemberDetails.length.toString(),
            ),
          );
        },
      ),
    );
  }
}
