import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/features/AddNoteCubit/data/models/note_model.dart';

import '../../../edit_note_view/presentation/widgets/custom_button.dart';
import '../../../edit_note_view/presentation/widgets/custom_text_field.dart';
import '../cubit/add_note_cubit/add_note_cubit.dart';
import 'pick_color.dart';

class AddNoteBottomSheet extends StatefulWidget {
  const AddNoteBottomSheet({
    super.key,
  });

  @override
  State<AddNoteBottomSheet> createState() => _AddNoteBottomSheetState();
}

class _AddNoteBottomSheetState extends State<AddNoteBottomSheet> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          SizedBox(
            height: 16,
          ),
          CustomTextField(
            hintText: 'Title',
            onSaved: (value) {
              title = value;
            },
          ),
          SizedBox(
            height: 16,
          ),
          CustomTextField(
            hintText: 'Content',
            maxlines: 5,
            onSaved: (value) {
              subTitle = value;
            },
          ),
          SizedBox(
            height: 32,
          ),
          ColorListView(),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (BuildContext context, state) => CustomButton(
              isLoading: state is AddNoteLoading ? true : false,
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  var note = NoteModel(
                      title: title!,
                      subTitle: subTitle!,
                      color: Colors.deepOrangeAccent.r.toInt(),
                      date:
                          "${DateTime.now().month} ${DateTime.now().day},${DateTime.now().year}");

                  BlocProvider.of<AddNoteCubit>(context).addNote(note);
                } else {
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
            ),
          ),
          SizedBox(
            height: 16,
          )
        ],
      ),
    );
  }
}
