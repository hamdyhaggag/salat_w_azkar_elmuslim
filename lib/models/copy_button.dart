import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CopyButton extends StatelessWidget {
  final String textToCopy;

  const CopyButton(this.textToCopy, {super.key});

  void copyTextToClipboard() {
    Clipboard.setData(ClipboardData(text: textToCopy));
    Fluttertoast.showToast(
      msg: 'تم النسخ ',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0, bottom: 10),
      child: IconButton(
        icon: const Icon(FontAwesomeIcons.copy, color: Color(0xff1E5A83)),
        onPressed: copyTextToClipboard,
      ),
    );
  }
}
