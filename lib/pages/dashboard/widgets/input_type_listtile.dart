part of '../dashboard_view.dart';

Widget _inputListTile(
  String title,
  String subtitle,
  GeminiInputType? groupVal,
  GeminiInputType value,
  Function(GeminiInputType?)? onChange,
) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [Utils.instance.boxShad(0, 0, 5)],
    ),
    child: RadioListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: onChange,
      groupValue: groupVal,
    ),
  );
}
