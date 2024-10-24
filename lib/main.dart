import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/constants.dart';
import 'package:note_app/cubits/cubit/read_notes_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/our_bloc_observer.dart';
import 'package:note_app/views/notes_view.dart';

void main() async {
  Bloc.observer = OurBlocObserver();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  if (!Hive.isBoxOpen(kNotesBox)) {
    await Hive.openBox<NoteModel>(kNotesBox);
  }

  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReadNotesCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: "Poppins",
        ),
        home: const NotesView(),
      ),
    );
  }
}
