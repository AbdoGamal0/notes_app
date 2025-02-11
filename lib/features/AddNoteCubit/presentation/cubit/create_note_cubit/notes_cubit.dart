import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/features/AddNoteCubit/data/models/note_model.dart';

import '../../../../../constants.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  List<NoteModel>? notes;
  void fetchAllNotes(NoteModel note) {
    var box = Hive.box<NoteModel>(kNotesBox);
    notes = box.values.toList();
    emit(NotesSuccess(notes: notes ?? []));
  }
}
