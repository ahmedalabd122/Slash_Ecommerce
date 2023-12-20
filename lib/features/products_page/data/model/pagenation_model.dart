
class Pagination {
  dynamic pages;

  Pagination({
    this.pages,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        pages: json["pages"],
      );

  Map<String, dynamic> toJson() => {
        "pages": pages,
      };
}
