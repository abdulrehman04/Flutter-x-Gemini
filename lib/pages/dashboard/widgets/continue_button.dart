part of '../dashboard_view.dart';

Widget _longButton(String title, void Function() onPressed) {
  return InkWell(
    onTap: onPressed,
    child: Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        boxShadow: [Utils.instance.boxShad(0, 0, 5)],
        borderRadius: BorderRadius.circular(8),
        color: AppColors.instance.primaryColor,
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    ),
  );
}
