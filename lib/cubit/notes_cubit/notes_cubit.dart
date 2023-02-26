import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';

import '../../constants.dart';
import '../../models/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  List<NoteModel>? notes;
  FetchAllNodes() {
    var notebox = Hive.box<NoteModel>(kNotesBox);
    notes = notebox.values.toList();
    emit(Notesuccess());
  }
}
