import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/features/AddNoteCubit/data/models/note_model.dart';

import '../../../../../constants.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  Color? pickedColor = Color(0xff324496);
  void addNote(NoteModel note) async {
    note.color = pickedColor as int;
    emit(AddNoteLoading());
    try {
      var box = Hive.box<NoteModel>(kNotesBox);
      box.add(note);
      emit(AddNoteSuccess());
    } catch (e) {
      emit(AddNoteFailure(errorMessage: e.toString()));
    }
  }
}
