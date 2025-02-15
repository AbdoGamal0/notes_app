import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/features/edit_note_view/presentation/widgets/custom_text_field.dart';

import '../../../AddNoteCubit/data/models/note_model.dart';
import '../../../AddNoteCubit/presentation/cubit/create_note_cubit/notes_cubit.dart';
import '../../../AddNoteCubit/presentation/widgets/custom_app_bar.dart';
import 'edit_note_color.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.notemodel});
  final NoteModel notemodel;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title;
  String? subTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          SizedBox(height: 8),
          CustomAppBar(
            title: 'Edit Notes',
            icon: Icons.check,
            onTap: () {
              widget.notemodel.title = title ?? widget.notemodel.title;
              widget.notemodel.subTitle = subTitle ?? widget.notemodel.subTitle;
              widget.notemodel.save();
              Navigator.pop(context);
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
            },
          ),
          SizedBox(
            height: 16,
          ),
          CustomTextField(
            hintText: widget.notemodel.title,
            onChanged: (value) {
              title = value;
            },
          ),
          SizedBox(
            height: 16,
          ),
          CustomTextField(
            onChanged: (value) {
              subTitle = value;
            },
            hintText: widget.notemodel.subTitle,
            maxlines: 5,
          ),
          SizedBox(
            height: 40,
          ),
          EditColorListView(note: widget.notemodel),
          // CustomButton(onPressed: () {

          // })
        ],
      ),
    );
  }
}
