import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notes_app/features/AddNoteCubit/presentation/widgets/notes_view_body.dart';

import '../cubit/add_note_cubit.dart';
import '../widgets/add_note_form_field.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotesViewBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: SingleChildScrollView(
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
                      return ModalProgressHUD(
                          inAsyncCall: state is AddNoteLoading ? false : true,
                          child: AddNoteForm());
                    },
                  ))));
        },
        shape: CircleBorder(),
        child: Icon(Icons.add),
      ),
    );
  }
}
