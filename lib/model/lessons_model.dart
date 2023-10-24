class Lessons {
  List<Lesson>? lessons;

  Lessons({this.lessons});

  Lessons.fromJson(Map<String, dynamic> json) {
    if (json['lessons'] != null) {
      lessons = <Lesson>[];
      json['lessons'].forEach((v) {
        lessons!.add(Lesson.fromJson(v));
      });
    }
  }
}

class Lesson {
  int? id;
  String? exercise;
  int? mark;
  String? level;

  Lesson({this.id, this.exercise, this.mark, this.level});

  Lesson.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    exercise = json['exercise'];
    mark = json['mark'];
    level = json['level'];
  }
}
