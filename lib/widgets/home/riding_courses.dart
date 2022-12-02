import 'package:flutter/material.dart';
import 'package:my_horse/activities/course/model/course_model.dart';
import 'package:my_horse/activities/course/service/course_service.dart';

class RidingCourses extends StatefulWidget {

  const RidingCourses({Key? key}): super(key: key);

  @override
  State<RidingCourses> createState() => _RidingCoursesState();

}


class _RidingCoursesState extends State<RidingCourses> {

  final CourseService courseService = CourseService();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Cours D'équitation", style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w600),),
          Container(
            height: 120,
            padding: const EdgeInsets.only(top: 10),
            child: FutureBuilder(
              future: courseService.getAllCourses(),
              builder: (context, AsyncSnapshot<List<CourseModel>> snapShot) {
                if (snapShot.hasData) {
                  return ListView.builder(
                    itemCount: snapShot.data?.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) {
                      return Column(
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(Radius.circular(25)),
                                border: Border.all(width: 3, color: const Color(0xFFDA5C44)),
                                image: const DecorationImage(
                                    image: AssetImage("assets/images/pages/launch/adrobski-pGuAgo_o2r8-unsplash.jpg"),
                                    fit: BoxFit.fill
                                )
                            ),
                          ),
                          Text(snapShot.data![index].discipline, style: const TextStyle(fontWeight: FontWeight.w500),)
                        ],
                      );
                    },
                  );
                } else if (snapShot.hasError) {
                  return Container(
                    child: Text("Error"),
                  );
                } else {
                  return Container(
                    width: 30,
                    height: 30,
                    child: const CircularProgressIndicator(),
                  );
                }
            }),
          )
        ],
      ),
    );
  }

/*

   */
}