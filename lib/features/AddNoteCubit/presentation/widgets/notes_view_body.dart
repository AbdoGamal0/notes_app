import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/change_app_theme/theme_cubit.dart';
import '../cubit/create_note_cubit/notes_cubit.dart';
import 'custom_app_bar.dart';
import 'notes_list_view.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({super.key});

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          const SizedBox(height: 8),
          BlocBuilder<ThemeCubit, ThemeData>(
            builder: (context, state) {
              return CustomAppBar(
                title: 'Notes',
                icon: state.brightness == Brightness.dark
                    ? Icons.wb_sunny
                    : Icons.dark_mode,
                onTap: () {
                  BlocProvider.of<ThemeCubit>(context).toggleTheme();
                },
              );
            },
          ),
          const Expanded(
            child: NotesListView(),
          ),
        ],
      ),
    );
  }
}
