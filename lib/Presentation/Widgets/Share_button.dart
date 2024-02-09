import 'dart:async';
import 'package:flutter/material.dart';
import 'package:esys_flutter_share_plus/esys_flutter_share_plus.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;
import '../../constants/app_text.dart';
import '../../constants/colors.dart';

class ShareButton extends StatelessWidget {
  final String textToShare;

  const ShareButton(this.textToShare, {Key? key});

  Future<void> shareTextAsImage() async {
    double verticalPadding = 100;
    double horizontalPadding = 50;

    int maxLines = 35;

    final textPainter = TextPainter(
      text: TextSpan(
        text: textToShare,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 24.0,
          fontFamily: 'Cairo',
        ),
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.rtl,
      maxLines: maxLines,
    );

    textPainter.layout(maxWidth: 800 - (2 * horizontalPadding));

    double imageWidth = textPainter.width + (2 * horizontalPadding);
    double imageHeight = textPainter.height + (3 * verticalPadding);

    final recorder = ui.PictureRecorder();
    final canvas = Canvas(
      recorder,
      Rect.fromPoints(Offset.zero, Offset(imageWidth, imageHeight)),
    );

    final backgroundPaint = Paint()..color = Colors.white;
    canvas.drawRect(
      Rect.fromPoints(Offset.zero, Offset(imageWidth, imageHeight)),
      backgroundPaint,
    );

    final topImage = await loadImage('assets/share.png');
    if (topImage != null) {
      const topImageWidth = 900.0;
      const topImageHeight = 1800.0;

      final topImageRect = Rect.fromCenter(
        center: Offset(
          imageWidth / 2,
          topImageHeight / 2,
        ),
        width: topImageWidth,
        height: topImageHeight,
      );

      canvas.drawImageRect(
          topImage,
          Rect.fromLTRB(
              0, 0, topImage.width.toDouble(), topImage.height.toDouble()),
          topImageRect,
          Paint());
    }

    textPainter.paint(canvas, Offset(horizontalPadding, verticalPadding));

    final bottomImage = await loadImage(
      'assets/nav2.png',
    );
    if (bottomImage != null) {
      final aspectRatio = bottomImage.width / bottomImage.height;
      const bottomImageWidth = 300.0;
      final bottomImageHeight = bottomImageWidth / aspectRatio;

      final bottomImageRect = Rect.fromCenter(
        center: Offset(
          imageWidth / 2,
          verticalPadding +
              textPainter.height +
              (verticalPadding / 2) +
              bottomImageHeight / 0.8,
        ),
        width: bottomImageWidth,
        height: bottomImageHeight,
      );

      canvas.drawImageRect(
          bottomImage,
          Rect.fromLTRB(0, 0, bottomImage.width.toDouble(),
              bottomImage.height.toDouble()),
          bottomImageRect,
          Paint());
    }

    final img = await recorder.endRecording().toImage(
          imageWidth.toInt(),
          imageHeight.toInt(),
        );
    final byteData = await img.toByteData(format: ui.ImageByteFormat.png);
    final buffer = byteData!.buffer.asUint8List();

    await Share.file(
      'شارك النص كصورة',
      'share.png',
      Uint8List.fromList(buffer),
      'image/png',
    );
  }

  Future<ui.Image?> loadImage(String imagePath) async {
    final image = await rootBundle.load(imagePath);
    final bytes = Uint8List.sublistView(image.buffer.asUint8List());
    final codec = await ui.instantiateImageCodec(bytes);
    final frameInfo = await codec.getNextFrame();
    return frameInfo.image;
  }

  void shareText() {
    String textWithCustomEnding =
        '$textToShare\n تمت المشاركة من خلال تطبيق تَطْمَئِن';

    Share.text('شارك النص', textWithCustomEnding, 'text/plain');
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.only(left: 0, bottom: 10),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: PopupMenuButton<int>(
              elevation: 0,
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(3),
              ),
              icon: Icon(
                Icons.share,
                color: isDarkMode ? Colors.white : AppColors.primaryColor,
              ),
              onSelected: (value) {
                if (value == 0) {
                  shareText();
                } else if (value == 2) {
                  shareTextAsImage();
                }
              },
              itemBuilder: (context) {
                return [
                  PopupMenuItem<int>(
                    value: 0,
                    child: Center(
                      child: AppText(
                        'شارك النص',
                        color:
                            isDarkMode ? Colors.white : AppColors.primaryColor,
                      ),
                    ),
                  ),
                  const PopupMenuDivider(),
                  PopupMenuItem<int>(
                    value: 2,
                    child: Center(
                      child: AppText(
                        'شارك النص كصورة',
                        color:
                            isDarkMode ? Colors.white : AppColors.primaryColor,
                      ),
                    ),
                  ),
                ];
              },
            ),
          )
        ],
      ),
    );
  }
}
