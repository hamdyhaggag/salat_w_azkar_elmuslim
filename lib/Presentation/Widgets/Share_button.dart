import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import '../../constants/colors.dart';

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
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.only(left: 0, bottom: 10),
      child: IconButton(
        icon: Icon(Icons.share,
            color: isDarkMode ? Colors.white : AppColors.primaryColor),
        onPressed: shareText,
      ),
    );
  }
}
