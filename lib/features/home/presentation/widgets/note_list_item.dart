import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../data/model/note.dart';
import '../../logic/cubit/notes_cubit.dart';

class NotesListItem extends StatelessWidget {
  final Note note;
  final int index;
  const NotesListItem({super.key, required this.note, required this.index});

  @override
  Widget build(BuildContext context) {
    final NotesCubit notesCubit = BlocProvider.of<NotesCubit>(context);
    return GestureDetector(
      onTap: () async {
        final result = await Navigator.of(context).pushNamed(
          AppRoutes.addEditNoteRoute,
          arguments: {
            'note': note,
            'index': index,
          },
        );
        if (result != null) {
          notesCubit.getAllNotes();
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(
          top: 12,
          bottom: 12,
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          constraints: const BoxConstraints(
            minHeight: 100,
            maxHeight: 157,
          ),
          decoration: BoxDecoration(
            color: Color(note.color!),
            borderRadius: BorderRadius.circular(12),
            // boxShadow:const  [
            //   BoxShadow(
            //     color: AppColors.grey,
            //     blurRadius: 4,
            //     offset: Offset(4, 8), // Shadow position
            //   ),
            // ],
          ),
          child: ListTile(
            title: Text(
              note.title ?? 'no Title',
              maxLines: 1,
              style: const TextStyle(fontSize: 18,),
            ),
            subtitle: Text(
              note.description ?? 'no content',
              overflow: TextOverflow.ellipsis,
              maxLines: 4,
              style: const TextStyle(fontSize: 15,),
            ),
            // trailing: Text(notes[index].dateTime?? '000/00'),
          ),
        ),
      ),
    );
  }
}
