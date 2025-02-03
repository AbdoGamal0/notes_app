import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/notes_item.dart';

import 'custom_app_bar.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          SizedBox(height: 8),
          CustomAppBar(),
          NotesItem(),
        ],
      ),
    );
  }
}
