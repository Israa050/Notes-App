import 'package:flutter/material.dart';
import 'package:notes/features/home/data/model/note.dart';
import 'package:notes/features/home/presentation/widgets/note_list_item.dart';

class NotesSearch extends StatelessWidget {
  final List<Note> notes;
  const NotesSearch({super.key, required this.notes});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: notes.length,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return NotesListItem(
            note: notes[index],
            index: index,
          );
        });
  }
}
