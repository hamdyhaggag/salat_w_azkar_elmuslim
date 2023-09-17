import 'package:flutter/material.dart';
import 'package:esys_flutter_share_plus/esys_flutter_share_plus.dart';
import 'dart:ui' as ui;
import 'dart:typed_data';

import '../../constants/colors.dart';

class ShareButton extends StatelessWidget {
  final String textToShare;

  ShareButton(this.textToShare, {Key? key});

  Future<void> shareTextAsImage() async {
    // Create a picture recorder
    final recorder = ui.PictureRecorder();
    final canvas = Canvas(
        recorder, Rect.fromPoints(const Offset(0, 0), const Offset(600, 200)));

    // Background color
    final backgroundPaint = Paint()..color = Colors.white;
    canvas.drawRect(Rect.fromPoints(const Offset(0, 0), const Offset(600, 200)),
        backgroundPaint);

    // Text styling
    final textPainter = TextPainter(
      text: TextSpan(
        text: textToShare,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 24.0,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout(minWidth: 600, maxWidth: 600);

    // Position the text
    textPainter.paint(canvas, const Offset(10, 10));

    // Create an image from the recorder
    final img = await recorder.endRecording().toImage(600, 200);
    final byteData = await img.toByteData(format: ui.ImageByteFormat.png);
    final buffer = byteData!.buffer.asUint8List();

    // Share the image using esys_flutter_share_plus
    await Share.file(
      'شارك النص كصورة',
      'share.png',
      Uint8List.fromList(buffer), // Convert to Uint8List
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
