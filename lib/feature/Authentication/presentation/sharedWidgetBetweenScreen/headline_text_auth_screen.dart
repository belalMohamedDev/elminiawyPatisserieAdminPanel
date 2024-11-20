import '../../../../../core/common/shared/shared_imports.dart'; // Import barrel file for shared utilities

class HeadlineTextAuthScreen extends StatelessWidget {
  const HeadlineTextAuthScreen({
    super.key,
    required this.titleText,
    required this.subTitleText,
  });

  final String titleText;
  final String subTitleText;

  @override
  Widget build(BuildContext context) {
    // Initialize the ResponsiveUtils to handle responsive layout adjustments
    final responsive = ResponsiveUtils(context);
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start, // Align children to the left
      children: [
        Text(
          context.translate(titleText),
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: responsive.responsiveTextSize(
                    mobile: responsive.setTextSize(4.2),
                    desktop: responsive.setTextSize(3),
                    tablet: responsive.setTextSize(4)), // Uses theme styling
              ),
        ),

        SizedBox(
          height: responsive.responsiveValue(
              mobile: 1, desktop: 2, tablet: 3), // Spacing after the headline
        ),

        // Subtitle prompting the user to sign in
        Text(
          context.translate(subTitleText),
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: responsive.responsiveTextSize(
                  mobile: responsive.setTextSize(3.4),
                  desktop: responsive.setTextSize(1.5),
                  tablet: responsive.setTextSize(
                      1.5))), // Adjust font size based on screen size
        ),
      ],
    );
  }
}
