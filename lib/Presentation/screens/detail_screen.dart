import 'dart:ffi';

import 'package:break_and_bad_v1/Data/model/character_class.dart';
import 'package:break_and_bad_v1/constants/settings.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  CharacterClass character;
  DetailScreen({required this.character});
  Widget buildSliverappBar() {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: my_colors.my_grey,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          character.nick_name.toString(),
          style: const TextStyle(color: my_colors.my_white),
        ),
        background: Hero(
          tag: character.char_id.toString(),
          child: FadeInImage.assetNetwork(
            width: double.infinity,
            height: double.infinity,
            placeholder: "assets/images/loading.gif",
            image: character.img_url!,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget info_for_character(String title, String value) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.fade,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: const TextStyle(
              color: my_colors.my_white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          TextSpan(
            text: value,
            style: const TextStyle(
              color: my_colors.my_white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget build_divider(double end) {
    return Divider(
      height: 30,
      color: my_colors.my_tellow,
      endIndent: end,
      thickness: 2,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: my_colors.my_grey,
        body: CustomScrollView(
          slivers: [
            buildSliverappBar(),
            SliverList(
                delegate: SliverChildListDelegate(
              [
                Container(
                  margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      info_for_character(
                          "Job : ", character.jops!.join(" / ").toString()),
                      build_divider(MediaQuery.of(context).size.width * 0.8),
                      info_for_character(
                          "Appeard in  : ", character.category.toString()),
                      build_divider(MediaQuery.of(context).size.width * 0.64),
                      info_for_character(
                          "Seasons : ",
                          character.apperance_of_seasons!
                              .join(" / ")
                              .toString()),
                      build_divider(MediaQuery.of(context).size.width * 0.7),
                      info_for_character("Status : ",
                          character.status_of_DeadORAlive.toString()),
                      build_divider(MediaQuery.of(context).size.width * 0.75),
                      character.better_call_soul!.isEmpty
                          ? Container()
                          : info_for_character("Better call soul apperance : ",
                              character.status_of_DeadORAlive.toString()),
                      character.better_call_soul!.isEmpty
                          ? Container()
                          : build_divider(
                              MediaQuery.of(context).size.width * 0.3),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.7,
                      )
                    ],
                  ),
                )
              ],
            ))
          ],
        ));
  }
}
