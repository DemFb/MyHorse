import 'package:flutter/material.dart';
import 'package:my_horse/activities/competition/service/competition_service.dart';
import 'package:my_horse/activities/course/service/course_service.dart';
import 'package:my_horse/authentication/auth_service.dart';
import 'package:my_horse/authentication/model/user_model.dart';

class NotificationClub extends StatefulWidget {

  const NotificationClub({Key? key}): super(key: key);

  @override
  _NotificationClubState createState() => _NotificationClubState();
}

class _NotificationClubState extends State<NotificationClub> {

  final CompetitionService _competitionService = CompetitionService();
  final CourseService _courseService = CourseService();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {

    final Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      width: size.width,
      color: Colors.white,
      padding: const EdgeInsets.only(top: 20, right: 10, left: 15),
      child: SingleChildScrollView(
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Les nouveautés", style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.w600),),
            Container(
              width: size.width,
              margin: const EdgeInsets.only(top: 30),
              alignment: Alignment.topLeft,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Text("Cavaliers", style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.w600),),
                        ),
                        FutureBuilder(
                          future: _authService.getUsers(),
                          builder: (context, AsyncSnapshot<List<UserModel>> snapShot) {
                            if (snapShot.hasData) {
                              return SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: snapShot.data!.map<Widget>((e) => _cardFlux(title: e.username, size: size),
                                      ).toList(),
                                    )
                                  ],
                                ),
                              );
                            } else if (snapShot.hasError) {
                              print(snapShot.error);
                              return Container(
                                child: Text("Error"),
                              );
                            } else {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          }
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Text("Courses", style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.w600),),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  _cardFlux(title: "Thomas", size: size),
                                  _cardFlux(title: "Fabala", size: size),
                                  _cardFlux(title: "Alexis", size: size),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Text("Cours", style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.w600),),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  _cardFlux(title: "Thomas", size: size),
                                  _cardFlux(title: "Fabala", size: size),
                                  _cardFlux(title: "Alexis", size: size),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Container _cardFlux({required String title, required Size size}) {
    return Container(
      width: size.width * .6,
      height: 170,
      padding: const EdgeInsets.only(bottom: 10, right: 10, left: 10),
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          image: DecorationImage(
            image: const AssetImage("assets/images/pages/launch/adrobski-pGuAgo_o2r8-unsplash.jpg"),
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.2),
              BlendMode.srcOver,
            ),
          )
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.w500),),
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              border: Border.all(width: 1, color: Colors.white),
              color: Colors.white10.withOpacity(0.5)
            ),
            child: const Icon(Icons.arrow_right_alt_rounded, color: Colors.white,),
          )
        ],
      ),
    );
  }

}
