import '../../../../../../core/common/shared/shared_imports.dart'; //

abstract class CategoryRepository {
  Future<ApiResult<CategoryResponse>> getCategories(String sort);
}

class CategoryRepositoryImplement implements CategoryRepository {
  CategoryRepositoryImplement(this._apiService);

  final AppServiceClient _apiService;

  List<Data>? categoryDate;

  @override
  Future<ApiResult<CategoryResponse>> getCategories(String sort) async {
    try {
      final response = await _apiService.getCategories(sort);
      return ApiResult.success(response);
      
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
