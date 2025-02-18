import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/features/AddNoteCubit/data/models/note_model.dart';
import 'package:notes_app/features/edit_note_view/presentation/pages/edit_note_view.dart';

import '../cubit/create_note_cubit/notes_cubit.dart';

class NotesItem extends StatefulWidget {
  const NotesItem({super.key, required this.note});
  final NoteModel note;

  @override
  State<NotesItem> createState() => _NotesItemState();
}

class _NotesItemState extends State<NotesItem> {
  bool isDelete = false;
  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 300),
      opacity: isDelete ? 0.0 : 1.0,
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditNoteView(note: widget.note),
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          margin: const EdgeInsets.only(top: 16),
          decoration: BoxDecoration(
            color: Color(widget.note.color),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                title: Text(
                  widget.note.title,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.black,
                        fontSize: 25,
                      ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    widget.note.subTitle,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Colors.black45,
                          fontSize: 18,
                        ),
                  ),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  color: Colors.black,
                  onPressed: () async {
                    final confirmDelete =
                        await _showDeleteConfirmation(context);
                    if (confirmDelete == true) {
                      setState(() => isDelete = true);
                      Future.delayed(const Duration(milliseconds: 300), () {
                        widget.note.delete();
                        // ignore: use_build_context_synchronously
                        BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                        setState(() => isDelete = false);
                      });
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 24.0, bottom: 8),
                child: Text(
                  widget.note.date,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.black45,
                        fontSize: 15,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool?> _showDeleteConfirmation(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Confirm Delete"),
        content: const Text("Are you sure you want to delete this note?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text("Delete", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
