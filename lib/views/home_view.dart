import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/custom_button.dart';
import 'package:notes_app/views/widgets/notes_view_body.dart';

import 'widgets/custom_text_field.dart';

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
                child: Column(
                  children: [
                    SizedBox(
                      height: 16,
                    ),
                    CustomTextField(
                      hintText: 'Title',
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    CustomTextField(
                      hintText: 'Content',
                      maxlines: 5,
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    CustomButton(),
                    SizedBox(
                      height: 16,
                    )
                  ],
                ),
              ),
            ),
          );
        },
        shape: CircleBorder(),
        child: Icon(Icons.add),
      ),
    );
  }
}
