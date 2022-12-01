import 'package:mongo_dart/mongo_dart.dart';
import 'package:my_horse/activities/course/model/course_model.dart';
import 'package:my_horse/db/enum/db_enum.dart';
import 'package:my_horse/db/mongo_database.dart';

class CourseService {
  final String courseCollection = DbEnum.courseCollection.value;
  // accepted separator for date " / "
  final RegExp dateRegex = RegExp(r"^(?=\d{2}([\/])\d{2}\1\d{4}$)(?:0[1-9]|1\d|[2][0-8]|29(?!.02.(?!(?!(?:[02468][1-35-79]|[13579][0-13-57-9])00)\d{2}(?:[02468][048]|[13579][26])))|30(?!.02)|31(?=.(?:0[13578]|10|12))).(?:0[1-9]|1[012]).\d{4}$");
  final RegExp hourRegex = RegExp(r"^([0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]$");

  Future<CourseModel?> createCourse({required Map<String, dynamic> courseData}) async {

    if (courseData.isEmpty) {
      return null;
    }

    late CourseModel response;

    if (dateRegex.hasMatch(courseData["date"]) && hourRegex.hasMatch(courseData["fromHour"])) {
        WriteResult result = await MongoDatabase.getDb.collection(courseCollection).insertOne(courseData);
        response = CourseModel(
            trainingGround: result.document!["trainingGround"] as String,
            date: result.document!["date"] as String, duration: result.document!["duration"] as String,
            discipline: result.document!["discipline"] as String, fromHour: result.document!["fromHour"] as String,
            userId: result.document!["userId"] as String
        );
    }
    return response;
  }

}
