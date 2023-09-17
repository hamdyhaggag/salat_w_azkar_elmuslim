import 'package:flutter/material.dart';
import 'package:esys_flutter_share_plus/esys_flutter_share_plus.dart';
import 'dart:ui' as ui;
import 'dart:typed_data';

import '../../constants/colors.dart';

class ShareButton extends StatelessWidget {
  final String textToShare;

  ShareButton(this.textToShare, {Key? key});

  Future<void> shareTextAsImage() async {
    // Define padding values
    double verticalPadding = 50;
    double horizontalPadding = 50;

    // Define the maximum number of lines for the text
    int maxLines = 10; // Adjust as needed

    // Create a text painter with maxLines property
    final textPainter = TextPainter(
      text: TextSpan(
        text: textToShare,
        style: const TextStyle(
            color: Colors.white, fontSize: 24.0, fontFamily: 'Cairo'),
      ),
      textDirection: TextDirection.rtl,
      maxLines: maxLines,
    );

    // Layout the text within the available width while respecting maxLines
    textPainter.layout(maxWidth: 600 - (2 * horizontalPadding));

    // Calculate the image width and height based on the text size and padding
    double imageWidth = textPainter.width + (2 * horizontalPadding);
    double imageHeight = textPainter.height + (2 * verticalPadding);

    // Create a picture recorder
    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder,
        Rect.fromPoints(Offset.zero, Offset(imageWidth, imageHeight)));

    // Background color
    final backgroundPaint = Paint()..color = AppColors.primaryColor;
    canvas.drawRect(
        Rect.fromPoints(Offset.zero, Offset(imageWidth, imageHeight)),
        backgroundPaint);

    // Position the text with padding
    textPainter.paint(canvas, Offset(horizontalPadding, verticalPadding));

    final img = await recorder
        .endRecording()
        .toImage(imageWidth.toInt(), imageHeight.toInt());
    final byteData = await img.toByteData(format: ui.ImageByteFormat.png);
    final buffer = byteData!.buffer.asUint8List();

    await Share.file(
      'شارك النص كصورة',
      'share.png',
      Uint8List.fromList(buffer),
      'image/png',
    );
  }

  void shareText() {
    String textWithCustomEnding =
        '$textToShare\n تمت المشاركة من خلال تطبيق تَفَكُّر';

    Share.text('شارك النص', textWithCustomEnding, 'text/plain');
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.only(left: 0, bottom: 10),
      child: Row(
        children: [
          IconButton(
            icon: Icon(
              Icons.share,
              color: isDarkMode ? Colors.white : AppColors.primaryColor,
            ),
            onPressed: shareText,
          ),
          IconButton(
            icon: Icon(
              Icons.image,
              color: isDarkMode ? Colors.white : AppColors.primaryColor,
            ),
            onPressed: shareTextAsImage,
          ),
        ],
      ),
    );
  }
}
