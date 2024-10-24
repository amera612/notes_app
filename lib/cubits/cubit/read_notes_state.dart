part of 'read_notes_cubit.dart';

@immutable
sealed class ReadNotesState {}

final class ReadNotesInitial extends ReadNotesState {}

final class ReadNoteSuccess extends ReadNotesState {
  // final List<NoteModel> notes;
  // ReadNoteSuccess(this.notes);
}
