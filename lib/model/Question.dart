// ignore_for_file: non_constant_identifier_names
// ignore_for_file: file_names
class Question {
  String question_text;
  bool is_correct;
  bool _is_visited;

  bool get is_visited => _is_visited;

  set is_visited(bool is_visited) {
    _is_visited = is_visited;
  }

  Question.name(this.question_text, this.is_correct, this._is_visited);
}
