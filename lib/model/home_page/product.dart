class ProductModel {
  String? sId;
  String? categoryId;
  String? userId;
  String? unitId;
  int? productStatus;
  String? productCode;
  String? productName;
  String? productDetail;
  int? productQuantity;
  int? productPrice;
  int? productPriceDiscount;
  List<String>? image;
  bool? highlight;
  String? createdAt;
  String? updatedAt;
  String? categoryName;

  ProductModel(
      {this.sId,
      this.categoryId,
      this.userId,
      this.unitId,
      this.productStatus,
      this.productCode,
      this.productName,
      this.productDetail,
      this.productQuantity,
      this.productPrice,
      this.productPriceDiscount,
      this.image,
      this.highlight,
      this.createdAt,
      this.updatedAt,
      this.categoryName});

  ProductModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    categoryId = json['category_id'];
    userId = json['user_id'];
    unitId = json['unit_id'];
    productStatus = json['product_status'];
    productCode = json['product_code'];
    productName = json['product_name'];
    productDetail = json['product_detail'];
    productQuantity = json['product_quantity'];
    productPrice = json['product_price'];
    productPriceDiscount = json['product_price_discount'];
    image = json['image'].cast<String>();
    highlight = json['highlight'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    categoryName = json['category_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['category_id'] = this.categoryId;
    data['user_id'] = this.userId;
    data['unit_id'] = this.unitId;
    data['product_status'] = this.productStatus;
    data['product_code'] = this.productCode;
    data['product_name'] = this.productName;
    data['product_detail'] = this.productDetail;
    data['product_quantity'] = this.productQuantity;
    data['product_price'] = this.productPrice;
    data['product_price_discount'] = this.productPriceDiscount;
    data['image'] = this.image;
    data['highlight'] = this.highlight;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['category_name'] = this.categoryName;
    return data;
  }
}
