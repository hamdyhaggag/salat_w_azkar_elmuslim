import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ShareButton extends StatelessWidget {
  final String textToShare;

  ShareButton(this.textToShare, {Key? key});

  void shareText() {
    String textWithCustomEnding =
        '$textToShare\n تمت المشاركة من خلال تطبيق تَفَكُّر';

    Share.share(textWithCustomEnding, subject: 'شارك النص');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0, bottom: 10),
      child: IconButton(
        icon: const Icon(Icons.share, color: Color(0xff1E5A83)),
        onPressed: shareText,
      ),
    );
  }
}
