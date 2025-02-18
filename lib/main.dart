import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/utils/constants.dart';
import 'features/AddNoteCubit/data/models/note_model.dart';
import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNotesBox);
  runApp(const MyApp());
}
