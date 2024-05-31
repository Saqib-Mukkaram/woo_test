class EndPoints {
  static const String BASE_URL = "https://myvape.ie";

  // Products
  static const String PRODUCTS = "products";
  static const String PRODUCT_BY_CATEGORY = "/wp-json/wc/v3/products?category=";
  static const String CATEGORIES = "/wp-json/wc/v3/products/categories";
  static const String PRODUCTS_BY_PAGE = "/wp-json/wc/v3/products?page=";

  // Customers
  static const String CREATE_CUSTOMER = "/wp-json/wc/v3/customers";
  static const String UPDATE_CUSTOMER = "/wp-json/wc/v3/customers/<id>";
}
