import 'package:break_and_bad_v1/constants/settings.dart';
import 'package:flutter/material.dart';

import 'package:break_and_bad_v1/Data/model/character_class.dart';

class Characteritem extends StatelessWidget {
  final CharacterClass character;
  const Characteritem({
    Key? key,
    required this.character,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: my_colors.my_white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, character_detalis_screen,
            arguments: character),
        child: GridTile(
          child: Hero(
            tag: character.char_id.toString(),
            child: Container(
              color: my_colors.my_grey,
              child: character.img_url!.isNotEmpty
                  ? FadeInImage.assetNetwork(
                      width: double.infinity,
                      height: double.infinity,
                      placeholder: "assets/images/loading.gif",
                      image: character.img_url!,
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      "assets/images/placeholder.jpg",
                      fit: BoxFit.cover,
                    ),
            ),
          ),
          footer: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            color: Colors.black,
            alignment: Alignment.bottomCenter,
            child: Text(
              "${character.name}",
              style: const TextStyle(
                fontSize: 16,
                color: my_colors.my_white,
                height: 1.3,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
