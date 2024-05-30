import 'package:flutter/cupertino.dart';

Widget userTextField(TextEditingController? controller) {
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: CupertinoTextField(
        maxLines: null,
        minLines: null,
        expands: true,
        controller: controller,
      ),
    ),
  );
}
