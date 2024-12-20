import 'dart:io';

import 'package:file_picker/file_picker.dart';

import '../../../../../core/common/shared/shared_imports.dart'; //

part 'product_state.dart';
part 'product_cubit.freezed.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this._productRepository) : super(const ProductState.initial());
  final ProductRepository _productRepository;
  final TextEditingController search = TextEditingController();

  final TextEditingController productEnTitle = TextEditingController();
  final TextEditingController productArTitle = TextEditingController();
  final TextEditingController productEnDescription = TextEditingController();
  final TextEditingController productArDescription = TextEditingController();
  final TextEditingController productPrice = TextEditingController();

  List<DataProductResponse> dataList = [];
  Uint8List? image;

  void getProduct() async {
    emit(const ProductState.getProductLoading());

    final response = await _productRepository.getProductServices();

    response.when(
      success: (dataResponse) {
        if (dataResponse.data!.isNotEmpty) {
          dataList = [];
          dataList.addAll(dataResponse.data!);
        }
        emit(ProductState.getProductSuccess(dataResponse));
      },
      failure: (error) {
        ProductState.getProductError(error);
      },
    );
  }

  Future<void> pickImage() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );

    if (result != null && result.files.isNotEmpty) {
      final Uint8List? imageBytes = result.files.first.bytes;

      if (imageBytes != null) {
        image = imageBytes;
        emit(ProductState.imageBytes(imageBytes));
      }
    }
  }
}



  // void clearSearch() {
  //   search.clear();
  //   searchList = [];
  //   selectedRange = const RangeValues(0, 2000);
  //   selectedOption = 1;

  //   emit(
  //     ProductState.addItemToList(
  //       searchList!,
  //     ),
  //   );
  // }

  // void addItemToList(String value,
  //     {double? minPrice, double? maxPrice, SortOrder? sortOrder}) {
  //   if (value.isEmpty) {
  //     searchList = [];
  //   } else {
  //     searchList = dataList.where((element) {
  //       final title = element.title?.toLowerCase() ?? '';
  //       final description = element.description?.toLowerCase() ?? '';
  //       final searchValue = value.toLowerCase();
  //       final price = element.price ?? 0.0;

  //       final matchesSearch = title.startsWith(searchValue) ||
  //           description.startsWith(searchValue);
  //       final matchesPrice = (minPrice == null || price >= minPrice) &&
  //           (maxPrice == null || price <= maxPrice);

  //       return matchesSearch && matchesPrice;
  //     }).toList();

  //     // Apply sorting based on the sortOrder
  //     if (sortOrder != null) {
  //       switch (sortOrder) {
  //         case SortOrder.aToZ:
  //           searchList!.sort((a, b) => a.title!.compareTo(b.title!));
  //           break;
  //         case SortOrder.zToA:
  //           searchList!.sort((a, b) => b.title!.compareTo(a.title!));
  //           break;
  //         case SortOrder.priceLowToHigh:
  //           searchList!.sort((a, b) => a.price!.compareTo(b.price!));
  //           break;
  //         case SortOrder.priceHighToLow:
  //           searchList!.sort((a, b) => b.price!.compareTo(a.price!));
  //           break;
  //       }
  //     }
  //   }
  //   emit(
  //     ProductState.addItemToList(
  //       searchList!,
  //     ),
  //   );
  // }
  //////////////////////////////////////////////////

  // // Methods to update filters
  // void updateSelectedOption(int option) {
  //   selectedOption = option;
  //   emit(ProductState.selectedOptionState(
  //     selectedOption,
  //   ));
  //   applyFilters();
  // }

  // void updateSelectedRange(RangeValues range) {
  //   selectedRange = range;
  //   emit(ProductState.selectedRangeState(
  //     selectedRange,
  //   ));
  //   applyFilters();
  // }

  // void applyFilters() {
  //   addItemToList(
  //     search.text,
  //     minPrice: selectedRange.start,
  //     maxPrice: selectedRange.end,
  //     sortOrder: getSortOrder(),
  //   );
//}

//   SortOrder? getSortOrder() {
//     switch (selectedOption) {
//       case 1:
//         return SortOrder.aToZ;
//       case 2:
//         return SortOrder.zToA;
//       case 3:
//         return SortOrder.priceLowToHigh;
//       case 4:
//         return SortOrder.priceHighToLow;
//       default:
//         return null;
//     }
//   }
// }
