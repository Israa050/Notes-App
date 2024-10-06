import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../logic/cubit/notes_cubit.dart';
import '../widgets/custom_floating_action_button.dart';
import '../widgets/custom_note_header.dart';
import '../widgets/empty_notes_view.dart';
import '../widgets/error_view.dart';
import '../widgets/notes_view.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  
  
  Widget _buildBlocBuilder() {
    return BlocBuilder<NotesCubit, NotesState>(builder: (context, state) {
      if (state is OldNotes) {
        return NotesView(
          notes: state.oldNotes,
        );
      } else if (state is EmptyNoteError) {
        return ErrorView(
          message: state.message,
        );
      } else {
        return const EmptyHomeView();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<NotesCubit>(context).getAllNotes();
  }

  @override
  Widget build(BuildContext context) {
    final NotesCubit notesCubit = BlocProvider.of<NotesCubit>(context);
    return Scaffold(
      backgroundColor: AppColors.darkGrey,
      body: Padding(
        padding: const EdgeInsets.only(top: 47, left: 24, right: 24),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const CustomNoteHeader(),
            Expanded(
              child: CustomScrollView(
                slivers: [
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 20,
                    ),
                  ),
                  _buildBlocBuilder(),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: customFloatingActionButton(onPressed: () async {
        var result =
            await Navigator.pushNamed(context, AppRoutes.addEditNoteRoute,arguments: null);

        if (result != null) {
          notesCubit.getAllNotes();
        }
      }),
    );
  }
}
