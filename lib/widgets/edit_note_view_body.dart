import 'package:flutter/material.dart';
import 'package:note_app/widgets/custom_app_bar.dart';
import 'package:note_app/widgets/custom_text_field.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: [
          CustomAppBar(
            text: 'Edit Note',
            icon: Icons.check_sharp,
          ),
          SizedBox(height: 50),
          CustomTextField(
            hint: 'Title',
          ),
          SizedBox(height: 20),
          CustomTextField(
            hint: 'Content',
            maxLines: 7,
          ),
        ],
      ),
    );
  }
}
