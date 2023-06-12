class Urls{
  static const String baseUrl = 'https://craftybay.teamrabbil.com/api';
  static const String productSliderUrl = '$baseUrl/ListProductSlider';
  static const String productCategoryUrl = '$baseUrl/CategoryList';
  static const String readProfileUrl = '$baseUrl/ReadProfile';

  static String productByRemarksUrl(String remarks) =>
      '$baseUrl/ListProductByRemark/$remarks';

  static String productByCategoryUrl(String categoryId) =>
      '$baseUrl/ListProductByCategory/$categoryId';

  static String productDetailsByIdUrl(int productId) =>
      '$baseUrl/ProductDetailsById/$productId';

  static String sendOTPToEmail(String email) =>
      '$baseUrl/UserLogin/$email';

  static String verifyOTPURL(String email,String otp) =>
      '$baseUrl/UserLogin/$email/$otp';
}