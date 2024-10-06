
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/functions/random_color.dart';
import '../../data/model/note.dart';
import '../../logic/cubit/notes_cubit.dart';
import 'custom_colors_row.dart';
import 'custom_form_field.dart';

// ignore: must_be_immutable
class AddEditNoteBlocBuilder extends StatefulWidget {
  Note? note;
  int? index;
  Color color = randomColor();
  AddEditNoteBlocBuilder({super.key,this.note,this.index});



  @override
  State<AddEditNoteBlocBuilder> createState() => _AddEditNoteBlocBuilderState();
}

class _AddEditNoteBlocBuilderState extends State<AddEditNoteBlocBuilder> {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  bool isSuccess = false;


  @override
  void initState() {
    if(widget.note != null){
    titleController.text = widget.note?.title?? '';
    contentController.text = widget.note?.description?? '';
    BlocProvider.of<NotesCubit>(context).title = widget.note?.title??'';
    BlocProvider.of<NotesCubit>(context).description = widget.note?.description??'';
    BlocProvider.of<NotesCubit>(context).color = Color(widget.note!.color!);
    widget.color = Color(widget.note!.color!);
    }
    BlocProvider.of<NotesCubit>(context).color = widget.color;
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOut,
      color: widget.color,
      child: BlocConsumer<NotesCubit, NotesState>(listener: (context, state) {
        if (state is OldNotes) {
          if (kDebugMode) {
            print("new Note state $state");
          }
           //showToast('Note Added Succesfully!');
           Navigator.of(context).pop(true);
        }else if(state is ChangeBackgroundColor){
          setState(() {
            widget.color = state.color;
          });
        }
      }, builder: (context, state) {
        final notesCubit = BlocProvider.of<NotesCubit>(context);
        return Padding(
          padding: const EdgeInsets.only(
            top: 47,
            left: 18,
            right: 18,
          ),
          child: Form(
            key: notesCubit.notesFormKey,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                CustomColorsRow(index: notesCubit.getColorIndex(widget.color),),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomFormField(
                    controller: titleController,
                    hint: 'Title',
                    fontSize: 28,
                    maxLines: 1,
                    maxLength: 50,
                    onChanged: (value) {
                      notesCubit.title = value;
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomFormField(
                      controller: contentController,
                      hint: 'Type something',
                      fontSize: 20,
                      onChanged: (value) {
                        notesCubit.description = value;
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}