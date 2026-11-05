
// @Injectable(as: LoginRemoteDataSource)
// final class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
//   final ApiClient _apiClient;
//   final SecureStorage _secureStorage;
//   const LoginRemoteDataSourceImpl(this._apiClient, this._secureStorage);
//   @override
//   Future<Result<void>> login({required LoginRequestEntity request}) async {
//     return await executeApi(() async {
//       final response = await _apiClient.login(
//         request: RequestMapper.toLoginRequestModel(loginRequestEntity: request),
//       );
//       await _secureStorage.saveUserToken(token: response.token);
//       TutCareMethodHelper.currentUserToken = response.token;
//     });
//   }
// }