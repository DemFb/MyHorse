
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {

  const Profile({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {

    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFF6F5E4),
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              child: Container(
                padding: const EdgeInsets.only(left: 15),
                width: size.width,
                height: 200,
                decoration: BoxDecoration(
                  color: const Color(0xFFF6F5E4).withOpacity(0.9),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        image: DecorationImage(
                          image: AssetImage("assets/images/pages/launch/Equitation-1-768x600.jpg"),
                          fit: BoxFit.cover
                        )
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: size.width,
              height: size.height,
              margin: const EdgeInsets.only(bottom: 20, top: 200),
              padding: const EdgeInsets.only(left: 15, top: 20, right: 15),
              decoration: BoxDecoration(
                color: const Color(0xFFF6F5E4).withOpacity(0.9),
                borderRadius: const BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
                boxShadow: kElevationToShadow[1],
              ),
              child: CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: SizedBox(
                      child: Column(
                        children: [
                          SizedBox(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Text("Cheval", style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.w600),),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: size.width * .5,
                                          height: 140,
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
                                        ),
                                        Container(
                                          padding: const EdgeInsets.only(top: 5),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              _customInfo(key: "Nom", value: "Petit Tonnerre"),
                                              _customInfo(key: "Age", value: "10"),
                                              _customInfo(key: "Robe", value: "Rouge"),
                                              _customInfo(key: "Race", value: "Humain"),
                                              _customInfo(key: "Sexe", value: "Male"),
                                              _customInfo(key: "Spécialité", value: "Endurance"),
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Text("Flux d'actualités", style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.w600),),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Wrap(
                                      spacing: 5,
                                      runSpacing: 10,
                                      children: [
                                        _activityFluxCard(size: size, activityType: "Cours endurance"),
                                        _activityFluxCard(size: size, activityType: "Soirée apéro"),
                                        _activityFluxCard(size: size, activityType: "Soirée Yakari"),
                                        _activityFluxCard(size: size, activityType: "Course Sprint"),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }


  Container _customInfo({required String key, required String value}) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      child: Row(
        children: [
          Text("$key : ", style: const TextStyle(fontWeight: FontWeight.w600),),
          Text(value)
        ],
      ),
    );
  }

  Container _activityFluxCard({required Size size, required String activityType}) {
    return Container(
      width: size.width * .45,
      height: 140,
      padding: const EdgeInsets.only(bottom: 8, left: 8, right: 8),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        image: DecorationImage(
          image: const AssetImage("assets/images/pages/launch/seth-fink-1bPXERSwOcg-unsplash.jpg"),
          fit: BoxFit.fill,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.2),
            BlendMode.srcOver,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(activityType, style: const TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.w500),),
          Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              border: Border.all(width: 1, color: Colors.white),
              color: Colors.white10.withOpacity(0.5)
            ),
            child: const Icon(Icons.arrow_right_alt_rounded, color: Colors.white, size: 15,),
          )
        ],
      ),
    );
  }

}
