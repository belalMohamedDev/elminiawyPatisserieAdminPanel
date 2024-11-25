import 'package:elminiawy/core/common/shared/shared_imports.dart';

class TextFieldRow extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final double? sizeBetweenItem;
  final int? minLines;
  final int? maxLines;

  const TextFieldRow({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
    this.sizeBetweenItem,
    this.minLines,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtils(context);
    return Row(
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: responsive.setTextSize(1.5),
              ),
        ),
        responsive.setSizeBox(width: sizeBetweenItem ?? 15),
        responsive.setSizeBox(
         
          width: 40,
          child: TextFormField(
            style: TextStyle(
              fontSize: responsive.responsiveTextSize(
                  desktop: responsive.setTextSize(1.2),
                  tablet: responsive.setTextSize(1.2),
                  mobile: responsive.setTextSize(3)),
            ),
            minLines: minLines,
            maxLines: maxLines,
            controller: controller,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(hintText: hint),
          ),
        ),
      ],
    );
  }
}
