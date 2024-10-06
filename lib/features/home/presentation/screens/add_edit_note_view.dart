import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/core/utils/app_colors.dart';
import 'package:notes/features/home/data/model/note.dart';
import 'package:notes/features/home/logic/cubit/notes_cubit.dart';
import 'package:notes/features/home/presentation/widgets/add_edit_note_bloc_builder.dart';
import 'package:notes/features/home/presentation/widgets/custom_floating_action_button.dart';

// ignore: must_be_immutable
class AddNewNoteView extends StatefulWidget {
  Note? note;
  int? index;
  Color color = AppColors.lightPurple;
  AddNewNoteView({super.key, this.note, this.index});

  @override
  State<AddNewNoteView> createState() => _AddNewNoteViewState();
}

class _AddNewNoteViewState extends State<AddNewNoteView> {
  @override
  Widget build(BuildContext context) {
    final notesCubit = BlocProvider.of<NotesCubit>(context);
    return Scaffold(
      body: AddEditNoteBlocBuilder(
        note: widget.note,
        index: widget.index,
      ),
      floatingActionButton: customFloatingActionButton(
        onPressed: () async {
          if (notesCubit.notesFormKey.currentState!.validate()) {
            (widget.note == null && widget.index == null)
                ? await context.read<NotesCubit>().emitCreateNewNote()
                : context.read<NotesCubit>().emitUpdateNote(widget.index!);
          }
        },
        icon: Icons.save,
      ),
    );
  }
}
