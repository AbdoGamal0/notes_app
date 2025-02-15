import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/add_note_cubit/add_note_cubit.dart';
import '../cubit/create_note_cubit/notes_cubit.dart';
import '../widgets/add_note_form_bottom_sheet.dart';
import '../widgets/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const NotesViewBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return BlocProvider(
                create: (context) => AddNoteCubit(),
                child: BlocConsumer<AddNoteCubit, AddNoteState>(
                  listener: (context, state) {
                    if (state is AddNoteSuccess) {
                      BlocProvider.of<NotesCubit>(context).fetchAllNotes();

                      Navigator.pop(context);
                    }
                    if (state is AddNoteFailure) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.errorMessage),
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: AbsorbPointer(
                        absorbing: state is AddNoteLoading,
                        child: const SingleChildScrollView(
                          child: AddNoteBottomSheet(),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
