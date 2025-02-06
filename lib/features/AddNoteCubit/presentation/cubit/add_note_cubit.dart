import 'package:bloc/bloc.dart';

part 'add_note_state.dart';

class AddnotecubitCubit extends Cubit<AddNoteState> {
  AddnotecubitCubit() : super(AddNoteInitial());
}
