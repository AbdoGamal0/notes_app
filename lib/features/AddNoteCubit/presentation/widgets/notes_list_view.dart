import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/features/AddNoteCubit/data/models/note_model.dart';

import '../cubit/create_note_cubit/notes_cubit.dart';
import 'notes_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel> note = BlocProvider.of<NotesCubit>(context).notes!;
        return ListView.builder(
          // dragStartBehavior: DragStartBehavior.down,
          padding: EdgeInsets.zero,
          itemCount: note.length,
          itemBuilder: (context, index) => NotesItem(note: note[index]),
        );
      },
    );
  }
}
