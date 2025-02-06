import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/features/AddNoteCubit/data/models/note_model.dart';

import '../../../../constants.dart';

part 'add_note_state.dart';

class AddnotecubitCubit extends Cubit<AddNoteState> {
  AddnotecubitCubit() : super(AddNoteInitial());

  void addNote(NoteModel note) async {
    emit(AddNoteLoading());
    try {
      var box = Hive.box<NoteModel>(kNotesBox);
      await box.add(note);
      emit(AddNoteSuccess());
    } catch (e) {
      emit(AddNoteFailure(errorMessage: e.toString()));
    }
  }
}
