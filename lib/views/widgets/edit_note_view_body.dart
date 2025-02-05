import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/custom_button.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';

import 'custom_app_bar.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({super.key});

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
          ),
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
            height: 40,
          ),
          CustomButton(onPressed: () {
            print('object');
          })
        ],
      ),
    );
  }
}
