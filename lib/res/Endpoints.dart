class EndPoints {
  static const String BASE_URL = "https://shop.techasyst.com.au/";

  // Products
  static const String PRODUCTS = "products";
  static const String PRODUCT_BY_CATEGORY = "/wp-json/wc/v3/products?category=";
  static const String CATEGORIES = "/wp-json/wc/v3/products/categories";
  static const String PRODUCTS_BY_PAGE = "/wp-json/wc/v3/products?page=";
  static const String PRODUCT_BY_VARIATION =
      " /wp-json/wc/v3/products/<product_id>/variations/<id>";

  //Coupons
  static const String COUPONS = "/wp-json/wc/v3/coupons";
  static const String COUPON_BY_ID = "/wp-json/wc/v3/coupons/<id>";

  // Customers
  static const String CREATE_CUSTOMER = "/wp-json/wc/v3/customers";
  static const String UPDATE_CUSTOMER = "/wp-json/wc/v3/customers/<id>";
}
