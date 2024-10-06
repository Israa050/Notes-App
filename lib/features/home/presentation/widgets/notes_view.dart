import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/core/utils/app_colors.dart';
import 'package:notes/features/home/data/model/note.dart';
import 'package:notes/features/home/logic/cubit/notes_cubit.dart';
import 'package:notes/features/home/presentation/widgets/note_list_item.dart';

class NotesView extends StatefulWidget {
  final List<Note> notes;
  const NotesView({super.key, required this.notes});

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  @override
  Widget build(BuildContext context) {
    final notesCubit = BlocProvider.of<NotesCubit>(context);
         return SliverList(
        //scrollDirection: Axis.vertical,
        //shrinkWrap: true,
        // itemCount: notes.length,
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return  Dismissible(
              key: UniqueKey(),
              background: Container(
                decoration: BoxDecoration(
                  color: AppColors.red,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onDismissed: (direction) {
               // widget.notes.removeAt(index);
                notesCubit.emitDeleteNote(index: index);
              },
              child: NotesListItem(
                  note: widget.notes[index],
                  index: index,
              ),
            );
          },
          childCount: widget.notes.length,
        ),
      );

        }
      }
