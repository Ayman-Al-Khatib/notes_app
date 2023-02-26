import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubit/add_note_cubit/add_note_cubit.dart';
import 'package:note_app/models/note_model.dart';

import '../../cubit/notes_cubit/notes_cubit.dart';
import 'CustomButton.dart';
import 'colors_list_view.dart';
import 'custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formkey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? title;

  String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const SizedBox(height: 32),
          CustomTextFiled(
              hint: 'Title',
              maxLine: 1,
              onSaved: (val) {
                title = val;
              }),
          const SizedBox(height: 16),
          CustomTextFiled(
              hint: 'Content ',
              maxLine: 5,
              onSaved: (val) {
                subtitle = val;
              }),
          const SizedBox(
            height: 16,
          ),
          ColorsListView(),
          const SizedBox(
            height: 16,
          ),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomButton(
                Titel: 'Add',
                isLoading: state is AddNoteLoading ? true : false,
                onTap: () {
                  print('===========================');
                  if (formkey.currentState!.validate()) {
                    print('===========================');

                    formkey.currentState!.save();
                    NoteModel noteModel = NoteModel(
                      title: title!,
                      content: subtitle!,
                      date: DateTime.now().toString().substring(0, 10),
                      color: Colors.blue.value,
                    );
                    BlocProvider.of<AddNoteCubit>(context).addnote(noteModel);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );
            },
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
