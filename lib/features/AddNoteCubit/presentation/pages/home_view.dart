import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/add_note_cubit/add_note_cubit.dart';
import '../cubit/create_note_cubit/notes_cubit.dart';
import '../widgets/add_note_form_field.dart';
import '../widgets/notes_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: Scaffold(
        body: NotesViewBody(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) => BlocProvider<AddNoteCubit>(
                      create: (context) => AddNoteCubit(),
                      child: BlocConsumer<AddNoteCubit, AddNoteState>(
                        listener: (context, state) {
                          if (state is AddNoteSuccess) {
                            Navigator.pop(context);
                          }
                          if (state is AddNoteFailure) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(state.errorMessage),
                            ));
                          }
                        },
                        builder: (context, state) {
                          return Padding(
                            padding: const EdgeInsets.only(
                              right: 8,
                              left: 8,
                            ),
                            child: AbsorbPointer(
                              absorbing: state is AddNoteLoading ? true : false,
                              child:
                                  SingleChildScrollView(child: AddNoteForm()),
                            ),
                          );
                        },
                      ),
                    ));
          },
          shape: CircleBorder(),
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
