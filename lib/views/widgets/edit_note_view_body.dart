import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/constants.dart';
import 'package:note_app/cubit/notes_cubit/notes_cubit.dart';
import 'package:note_app/models/note_model.dart';

import '../../cubit/add_note_cubit/add_note_cubit.dart';
import 'colors_list_view.dart';
import 'custom_app_bat.dart';
import 'custom_text_field.dart';
import 'edit_note_color_list_view.dart';

class EditNotesViewBody extends StatefulWidget {
  const EditNotesViewBody({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNotesViewBody> createState() => _EditNotesViewBodyState();
}

class _EditNotesViewBodyState extends State<EditNotesViewBody> {
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 20),
      child: Column(
        children: [
          CustomAppBar(
            title: 'Edit Note',
            icon: Icons.check,
            onPressed: () {
              widget.note.title = title ?? widget.note.title;
              widget.note.content = content ?? widget.note.content;
              widget.note.save();
              BlocProvider.of<NotesCubit>(context).FetchAllNodes();
              Navigator.pop(context);
            },
          ),
          SizedBox(height: 50),
          CustomTextFiled(
            hint: widget.note.title,
            maxLine: 1,
            onChanged: (val) {
              title = val;
            },
          ),
          SizedBox(height: 16),
          CustomTextFiled(
            hint: widget.note.content,
            maxLine: 5,
            onChanged: (val) {
              content = val;
            },
          ),
          SizedBox(height: 32),
          EditNoteColorList(note: widget.note),
        ],
      ),
    );
  }
}
