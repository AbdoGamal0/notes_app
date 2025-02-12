import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/features/AddNoteCubit/data/models/note_model.dart';
import 'package:notes_app/views/edit_note_view.dart';

import '../cubit/create_note_cubit/notes_cubit.dart';

class NotesItem extends StatelessWidget {
  const NotesItem({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => EditNoteView()));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        margin: EdgeInsets.only(top: 16),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 216, 201, 201),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(note.title,
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                  )),
              subtitle: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(note.subTitle,
                    style: TextStyle(fontSize: 18, color: Colors.black45)),
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                color: Colors.black,
                onPressed: () {
                  note.delete();
                  BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24.0, bottom: 8),
              child: Text(
                note.date,
                style: TextStyle(fontSize: 15, color: Colors.black45),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
