class TicketList {
  final bool? success;
  final Data? data;
  final String? message;

  TicketList({
    this.success,
    this.data,
    this.message,
  });

  TicketList.fromJson(Map<String, dynamic> json)
      : success = json['success'] as bool?,
        data = (json['data'] as Map<String,dynamic>?) != null ? Data.fromJson(json['data'] as Map<String,dynamic>) : null,
        message = json['message'] as String?;

  Map<String, dynamic> toJson() => {
    'success' : success,
    'data' : data?.toJson(),
    'message' : message
  };
}

class Data {
  final int? currentPage;
  final List<PaginateData>? paginateData;
  final String? firstPageUrl;
  final int? from;
  final int? lastPage;
  final String? lastPageUrl;
  final List<Links>? links;
  final String? nextPageUrl;
  final String? path;
  final String? perPage;
  final dynamic prevPageUrl;
  final int? to;
  final int? total;

  Data({
    this.currentPage,
    this.paginateData,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  Data.fromJson(Map<String, dynamic> json)
      : currentPage = json['current_page'] as int?,
        paginateData = (json['paginate_data'] as List?)?.map((dynamic e) => PaginateData.fromJson(e as Map<String,dynamic>)).toList(),
        firstPageUrl = json['first_page_url'] as String?,
        from = json['from'] as int?,
        lastPage = json['last_page'] as int?,
        lastPageUrl = json['last_page_url'] as String?,
        links = (json['links'] as List?)?.map((dynamic e) => Links.fromJson(e as Map<String,dynamic>)).toList(),
        nextPageUrl = json['next_page_url'] as String?,
        path = json['path'] as String?,
        perPage = json['per_page'] as String?,
        prevPageUrl = json['prev_page_url'],
        to = json['to'] as int?,
        total = json['total'] as int?;

  Map<String, dynamic> toJson() => {
    'current_page' : currentPage,
    'paginate_data' : paginateData?.map((e) => e.toJson()).toList(),
    'first_page_url' : firstPageUrl,
    'from' : from,
    'last_page' : lastPage,
    'last_page_url' : lastPageUrl,
    'links' : links?.map((e) => e.toJson()).toList(),
    'next_page_url' : nextPageUrl,
    'path' : path,
    'per_page' : perPage,
    'prev_page_url' : prevPageUrl,
    'to' : to,
    'total' : total
  };
}

class PaginateData {
  final int? id;
  final String? title;
  final String? content;
  final dynamic mailTime;
  final int? userId;
  final dynamic messageId;
  final String? createdAt;
  final String? updatedAt;
  final dynamic deletedAt;
  final int? statusId;
  final int? priorityId;
  final dynamic assignedToUserId;
  final int? categoryId;
  final int? source;
  final dynamic assignedToClientId;
  final int? websiteAddress;
  final int? service;
  final String? categoryName;
  final String? message;

  PaginateData({
    this.id,
    this.title,
    this.content,
    this.mailTime,
    this.userId,
    this.messageId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.statusId,
    this.priorityId,
    this.assignedToUserId,
    this.categoryId,
    this.source,
    this.assignedToClientId,
    this.websiteAddress,
    this.service,
    this.categoryName,
    this.message,
  });

  PaginateData.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        title = json['title'] as String?,
        content = json['content'] as String?,
        mailTime = json['mail_time'],
        userId = json['user_id'] as int?,
        messageId = json['message_id'],
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?,
        deletedAt = json['deleted_at'],
        statusId = json['status_id'] as int?,
        priorityId = json['priority_id'] as int?,
        assignedToUserId = json['assigned_to_user_id'],
        categoryId = json['category_id'] as int?,
        source = json['source'] as int?,
        assignedToClientId = json['assigned_to_client_id'],
        websiteAddress = json['website_address'] as int?,
        service = json['service'] as int?,
        categoryName = json['category_name'] as String?,
        message = json['message'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'title' : title,
    'content' : content,
    'mail_time' : mailTime,
    'user_id' : userId,
    'message_id' : messageId,
    'created_at' : createdAt,
    'updated_at' : updatedAt,
    'deleted_at' : deletedAt,
    'status_id' : statusId,
    'priority_id' : priorityId,
    'assigned_to_user_id' : assignedToUserId,
    'category_id' : categoryId,
    'source' : source,
    'assigned_to_client_id' : assignedToClientId,
    'website_address' : websiteAddress,
    'service' : service,
    'category_name' : categoryName,
    'message' : message
  };
}

class Links {
  final dynamic url;
  final String? label;
  final bool? active;

  Links({
    this.url,
    this.label,
    this.active,
  });

  Links.fromJson(Map<String, dynamic> json)
      : url = json['url'],
        label = json['label'] as String?,
        active = json['active'] as bool?;

  Map<String, dynamic> toJson() => {
    'url' : url,
    'label' : label,
    'active' : active
  };
}