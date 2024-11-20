
import '../../../../core/common/shared/shared_imports.dart'; // Import the barrel file

class LoadingShimmer extends StatelessWidget {
  const LoadingShimmer({
    super.key,
    this.height,
    this.width,
    this.borderRadius,
    this.widget,
  });
  final double? height;
  final double? width;
  final double? borderRadius;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade600,
      highlightColor: Colors.grey.shade400,
      child: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.3),
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius ?? 14),
          ),
        ),
        child: widget,
      ),
    );
  }
}