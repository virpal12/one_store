// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  int totalSize;
  int limit;
  int offset;
  List<ProductResult> products;

  ProductModel({
    required this.totalSize,
    required this.limit,
    required this.offset,
    required this.products,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    totalSize: json["total_size"],
    limit: json["limit"],
    offset: json["offset"],
    products: List<ProductResult>.from(json["products"].map((x) => ProductResult.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "total_size": totalSize,
    "limit": limit,
    "offset": offset,
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
  };
}

class ProductResult {
  int id;
  AddedBy addedBy;
  int userId;
  String name;
  String slug;
  ProductType productType;
  List<CategoryId> categoryIds;
  int brandId;
  Unit unit;
  int minQty;
  int refundable;
  dynamic digitalProductType;
  dynamic digitalFileReady;
  List<String> images;
  String thumbnail;
  int? featured;
  dynamic flashDeal;
  VideoProvider videoProvider;
  dynamic videoUrl;
  List<Color> colors;
  int variantProduct;
  List<int> attributes;
  List<ChoiceOption> choiceOptions;
  List<Variation> variation;
  int published;
  int unitPrice;
  double purchasePrice;
  int tax;
  Type taxType;
  int discount;
  Type discountType;
  int currentStock;
  int minimumOrderQty;
  String details;
  int freeShipping;
  dynamic attachment;
  DateTime createdAt;
  DateTime updatedAt;
  int status;
  int featuredStatus;
  String metaTitle;
  String metaDescription;
  String metaImage;
  int requestStatus;
  dynamic deniedNote;
  int shippingCost;
  int multiplyQty;
  dynamic tempShippingCost;
  dynamic isShippingCostUpdated;
  String code;
  int reviewsCount;
  List<dynamic> rating;
  List<dynamic> translations;
  List<dynamic> reviews;

  ProductResult({
    required this.id,
    required this.addedBy,
    required this.userId,
    required this.name,
    required this.slug,
    required this.productType,
    required this.categoryIds,
    required this.brandId,
    required this.unit,
    required this.minQty,
    required this.refundable,
    required this.digitalProductType,
    required this.digitalFileReady,
    required this.images,
    required this.thumbnail,
    required this.featured,
    required this.flashDeal,
    required this.videoProvider,
    required this.videoUrl,
    required this.colors,
    required this.variantProduct,
    required this.attributes,
    required this.choiceOptions,
    required this.variation,
    required this.published,
    required this.unitPrice,
    required this.purchasePrice,
    required this.tax,
    required this.taxType,
    required this.discount,
    required this.discountType,
    required this.currentStock,
    required this.minimumOrderQty,
    required this.details,
    required this.freeShipping,
    required this.attachment,
    required this.createdAt,
    required this.updatedAt,
    required this.status,
    required this.featuredStatus,
    required this.metaTitle,
    required this.metaDescription,
    required this.metaImage,
    required this.requestStatus,
    required this.deniedNote,
    required this.shippingCost,
    required this.multiplyQty,
    required this.tempShippingCost,
    required this.isShippingCostUpdated,
    required this.code,
    required this.reviewsCount,
    required this.rating,
    required this.translations,
    required this.reviews,
  });

  factory ProductResult.fromJson(Map<String, dynamic> json) => ProductResult(
    id: json["id"],
    addedBy: addedByValues.map[json["added_by"]]!,
    userId: json["user_id"],
    name: json["name"],
    slug: json["slug"],
    productType: productTypeValues.map[json["product_type"]]!,
    categoryIds: List<CategoryId>.from(json["category_ids"].map((x) => CategoryId.fromJson(x))),
    brandId: json["brand_id"],
    unit: unitValues.map[json["unit"]]!,
    minQty: json["min_qty"],
    refundable: json["refundable"],
    digitalProductType: json["digital_product_type"],
    digitalFileReady: json["digital_file_ready"],
    images: List<String>.from(json["images"].map((x) => x)),
    thumbnail: json["thumbnail"],
    featured: json["featured"],
    flashDeal: json["flash_deal"],
    videoProvider: videoProviderValues.map[json["video_provider"]]!,
    videoUrl: json["video_url"],
    colors: List<Color>.from(json["colors"].map((x) => Color.fromJson(x))),
    variantProduct: json["variant_product"],
    attributes: List<int>.from(json["attributes"].map((x) => x)),
    choiceOptions: List<ChoiceOption>.from(json["choice_options"].map((x) => ChoiceOption.fromJson(x))),
    variation: List<Variation>.from(json["variation"].map((x) => Variation.fromJson(x))),
    published: json["published"],
    unitPrice: json["unit_price"],
    purchasePrice: json["purchase_price"]?.toDouble(),
    tax: json["tax"],
    taxType: typeValues.map[json["tax_type"]]!,
    discount: json["discount"],
    discountType: typeValues.map[json["discount_type"]]!,
    currentStock: json["current_stock"],
    minimumOrderQty: json["minimum_order_qty"],
    details: json["details"],
    freeShipping: json["free_shipping"],
    attachment: json["attachment"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    status: json["status"],
    featuredStatus: json["featured_status"],
    metaTitle: json["meta_title"],
    metaDescription: json["meta_description"],
    metaImage: json["meta_image"],
    requestStatus: json["request_status"],
    deniedNote: json["denied_note"],
    shippingCost: json["shipping_cost"],
    multiplyQty: json["multiply_qty"],
    tempShippingCost: json["temp_shipping_cost"],
    isShippingCostUpdated: json["is_shipping_cost_updated"],
    code: json["code"],
    reviewsCount: json["reviews_count"],
    rating: List<dynamic>.from(json["rating"].map((x) => x)),
    translations: List<dynamic>.from(json["translations"].map((x) => x)),
    reviews: List<dynamic>.from(json["reviews"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "added_by": addedByValues.reverse[addedBy],
    "user_id": userId,
    "name": name,
    "slug": slug,
    "product_type": productTypeValues.reverse[productType],
    "category_ids": List<dynamic>.from(categoryIds.map((x) => x.toJson())),
    "brand_id": brandId,
    "unit": unitValues.reverse[unit],
    "min_qty": minQty,
    "refundable": refundable,
    "digital_product_type": digitalProductType,
    "digital_file_ready": digitalFileReady,
    "images": List<dynamic>.from(images.map((x) => x)),
    "thumbnail": thumbnail,
    "featured": featured,
    "flash_deal": flashDeal,
    "video_provider": videoProviderValues.reverse[videoProvider],
    "video_url": videoUrl,
    "colors": List<dynamic>.from(colors.map((x) => x.toJson())),
    "variant_product": variantProduct,
    "attributes": List<dynamic>.from(attributes.map((x) => x)),
    "choice_options": List<dynamic>.from(choiceOptions.map((x) => x.toJson())),
    "variation": List<dynamic>.from(variation.map((x) => x.toJson())),
    "published": published,
    "unit_price": unitPrice,
    "purchase_price": purchasePrice,
    "tax": tax,
    "tax_type": typeValues.reverse[taxType],
    "discount": discount,
    "discount_type": typeValues.reverse[discountType],
    "current_stock": currentStock,
    "minimum_order_qty": minimumOrderQty,
    "details": details,
    "free_shipping": freeShipping,
    "attachment": attachment,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "status": status,
    "featured_status": featuredStatus,
    "meta_title": metaTitle,
    "meta_description": metaDescription,
    "meta_image": metaImage,
    "request_status": requestStatus,
    "denied_note": deniedNote,
    "shipping_cost": shippingCost,
    "multiply_qty": multiplyQty,
    "temp_shipping_cost": tempShippingCost,
    "is_shipping_cost_updated": isShippingCostUpdated,
    "code": code,
    "reviews_count": reviewsCount,
    "rating": List<dynamic>.from(rating.map((x) => x)),
    "translations": List<dynamic>.from(translations.map((x) => x)),
    "reviews": List<dynamic>.from(reviews.map((x) => x)),
  };
}

enum AddedBy {
  ADMIN
}

final addedByValues = EnumValues({
  "admin": AddedBy.ADMIN
});

class CategoryId {
  String id;
  int position;

  CategoryId({
    required this.id,
    required this.position,
  });

  factory CategoryId.fromJson(Map<String, dynamic> json) => CategoryId(
    id: json["id"],
    position: json["position"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "position": position,
  };
}

class ChoiceOption {
  String name;
  String title;
  List<String> options;

  ChoiceOption({
    required this.name,
    required this.title,
    required this.options,
  });

  factory ChoiceOption.fromJson(Map<String, dynamic> json) => ChoiceOption(
    name: json["name"],
    title: json["title"],
    options: List<String>.from(json["options"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "title": title,
    "options": List<dynamic>.from(options.map((x) => x)),
  };
}

class Color {
  String name;
  String code;

  Color({
    required this.name,
    required this.code,
  });

  factory Color.fromJson(Map<String, dynamic> json) => Color(
    name: json["name"],
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "code": code,
  };
}

enum Type {
  PERCENT
}

final typeValues = EnumValues({
  "percent": Type.PERCENT
});

enum ProductType {
  PHYSICAL
}

final productTypeValues = EnumValues({
  "physical": ProductType.PHYSICAL
});

enum Unit {
  PC
}

final unitValues = EnumValues({
  "pc": Unit.PC
});

class Variation {
  String type;
  int price;
  String sku;
  int qty;

  Variation({
    required this.type,
    required this.price,
    required this.sku,
    required this.qty,
  });

  factory Variation.fromJson(Map<String, dynamic> json) => Variation(
    type: json["type"],
    price: json["price"],
    sku: json["sku"],
    qty: json["qty"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "price": price,
    "sku": sku,
    "qty": qty,
  };
}

enum VideoProvider {
  YOUTUBE
}

final videoProviderValues = EnumValues({
  "youtube": VideoProvider.YOUTUBE
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
