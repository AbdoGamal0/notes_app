import 'package:flutter/material.dart';
import 'package:notes_app/views/edit_note_view.dart';

class NotesItem extends StatelessWidget {
  const NotesItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => EditNoteView()));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        margin: EdgeInsets.only(top: 16),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 216, 201, 201),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text('NotesApp',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                  )),
              subtitle: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text('Build your career with \nAbdo Gamal',
                    style: TextStyle(fontSize: 18, color: Colors.black45)),
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                color: Colors.black,
                onPressed: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24.0),
              child: Text(
                'May 21 , 2023',
                style: TextStyle(fontSize: 15, color: Colors.black45),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
