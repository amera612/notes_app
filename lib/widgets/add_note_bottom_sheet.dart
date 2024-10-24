import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/cubit/add_note_cubit.dart';
import 'package:note_app/cubits/cubit/read_notes_cubit.dart';
import 'package:note_app/widgets/add_note_form.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteFailure) {
            log('failed ${state.errMessage}');
          } else if (state is AddNoteSuccess) {
            BlocProvider.of<ReadNotesCubit>(context).featchAllNotes();
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          //AbsorbPointer it use to make user can't change
          return AbsorbPointer(
            absorbing: State is AddNoteLoaded ? true : false,
            child: Padding(
              padding: EdgeInsets.only(
                  top: 30,
                  left: 18,
                  right: 18,
                  //🦋🦋🦋🦋to make the space from under ex. keyboard
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: const SingleChildScrollView(
                child: AddNoteForm(),
              ),
            ),
          );
        },
      ),
    );
  }
}
