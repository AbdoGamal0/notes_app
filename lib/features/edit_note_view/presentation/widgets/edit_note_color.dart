import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/features/AddNoteCubit/data/models/note_model.dart';

import '../../../AddNoteCubit/presentation/widgets/pick_color.dart';

class EditColorListView extends StatefulWidget {
  const EditColorListView({super.key, required this.note});
  final NoteModel note;
  @override
  State<EditColorListView> createState() => _EditColorListViewState();
}

class _EditColorListViewState extends State<EditColorListView> {
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = kColors.indexOf(Color(widget.note.color));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        itemCount: kColors.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              setState(() {
                currentIndex = index;
                widget.note.color = kColors[index] as int;
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: ColorItem(
                color: kColors[index],
                isSelected: currentIndex == index,
              ),
            ),
          );
        },
      ),
    );
  }
}
