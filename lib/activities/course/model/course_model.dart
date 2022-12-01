import 'package:my_horse/enum/training_discipline.dart';
import 'package:my_horse/enum/training_ground.dart';

class CourseModel {

  final String trainingGround;
  // only dd/mm/yyyy format accepted
  final String date;
  // Course beginning hour
  final String fromHour;
  // Course end hour
  final String? toHour;
  final int duration;
  final String discipline;
  final String userId;

  const CourseModel({
    required this.trainingGround,
    required this.date, required this.duration,
    required this.discipline,
    required this.fromHour, required this.userId, this.toHour
  });

  Map<String, dynamic> toMap() {
    return {
      "trainingGround": trainingGround,
      "date": date,
      "fromHour": fromHour,
      "duration": duration,
      "discipline": discipline,
      "userId": userId
    };
  }

}
