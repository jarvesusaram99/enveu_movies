class ServerResponse {
  bool success;
  String message;
  String reason;
  Map<String, dynamic>? body;
  PaginationData? pagination;

  ServerResponse({
    required this.success,
    required this.message,
    required this.reason,
    this.body,
    this.pagination,
  });

  static String messageBuilder(dynamic data, defaultMessage) {
    String message = defaultMessage;
    if (data.runtimeType != String) {
      return message;
    }
    return data;
  }
}

class PaginationData {
  PaginationData({
    required this.count,
    required this.totalCount,
    required this.totalPages,
    required this.currentPage,
    required this.prevPage,
    required this.nextPage,
  });

  int count;
  int totalCount;
  int totalPages;
  int currentPage;
  int? prevPage;
  int? nextPage;

  factory PaginationData.fromJson(Map<String, dynamic> json) => PaginationData(
        count: json["count"],
        totalCount: json["total_count"],
        totalPages: json["totalPages"],
        currentPage: json["currentPage"],
        prevPage: json["prev_page"],
        nextPage: json["next_page"],
      );
}
