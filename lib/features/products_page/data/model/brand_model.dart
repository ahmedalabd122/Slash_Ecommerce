
class Brands {
  int? id;
  String? brandName;
  dynamic brandFacebookPageLink;
  dynamic brandInstagramPageLink;
  dynamic brandWebsiteLink;
  String? brandMobileNumber;
  String? brandEmailAddress;
  dynamic taxIdNumber;
  String? brandDescription;
  String? brandLogoImagePath;
  int? brandStatusId;
  dynamic brandStoreAddressId;
  int? brandCategoryId;
  dynamic deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? brandSellerId;
  dynamic brandId;
  dynamic slashContractPath;
  int? brandRating;
  int? daysLimitToReturn;
  dynamic planId;

  Brands({
    this.id,
    this.brandName,
    this.brandFacebookPageLink,
    this.brandInstagramPageLink,
    this.brandWebsiteLink,
    this.brandMobileNumber,
    this.brandEmailAddress,
    this.taxIdNumber,
    this.brandDescription,
    this.brandLogoImagePath,
    this.brandStatusId,
    this.brandStoreAddressId,
    this.brandCategoryId,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.brandSellerId,
    this.brandId,
    this.slashContractPath,
    this.brandRating,
    this.daysLimitToReturn,
    this.planId,
  });

  factory Brands.fromJson(Map<String, dynamic> json) => Brands(
        id: json["id"],
        brandName: json["brand_name"],
        brandFacebookPageLink: json["brand_facebook_page_link"],
        brandInstagramPageLink: json["brand_instagram_page_link"],
        brandWebsiteLink: json["brand_website_link"],
        brandMobileNumber: json["brand_mobile_number"],
        brandEmailAddress: json["brand_email_address"],
        taxIdNumber: json["tax_id_number"],
        brandDescription: json["brand_description"],
        brandLogoImagePath: json["brand_logo_image_path"],
        brandStatusId: json["brand_status_id"],
        brandStoreAddressId: json["brand_store_address_id"],
        brandCategoryId: json["brand_category_id"],
        deletedAt: json["deletedAt"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        brandSellerId: json["brand_seller_id"],
        brandId: json["brand_id"],
        slashContractPath: json["slash_contract_path"],
        brandRating: json["brand_rating"],
        daysLimitToReturn: json["days_limit_to_return"],
        planId: json["planId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "brand_name": brandName,
        "brand_facebook_page_link": brandFacebookPageLink,
        "brand_instagram_page_link": brandInstagramPageLink,
        "brand_website_link": brandWebsiteLink,
        "brand_mobile_number": brandMobileNumber,
        "brand_email_address": brandEmailAddress,
        "tax_id_number": taxIdNumber,
        "brand_description": brandDescription,
        "brand_logo_image_path": brandLogoImagePath,
        "brand_status_id": brandStatusId,
        "brand_store_address_id": brandStoreAddressId,
        "brand_category_id": brandCategoryId,
        "deletedAt": deletedAt,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "brand_seller_id": brandSellerId,
        "brand_id": brandId,
        "slash_contract_path": slashContractPath,
        "brand_rating": brandRating,
        "days_limit_to_return": daysLimitToReturn,
        "planId": planId,
      };
}
