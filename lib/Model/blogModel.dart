class BlogModel {
  String? status;
  String? error;
  List<Result>? result;

  BlogModel({this.status, this.error, this.result});

  BlogModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    error = json['error'];
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(new Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['error'] = this.error;
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  String? blogId;
  String? blogTitle;
  String? blogImage;
  String? blogDescription;
  String? blogDate;
  List<Keywords>? keywords;

  Result(
      {this.blogId,
        this.blogTitle,
        this.blogImage,
        this.blogDescription,
        this.blogDate,
        this.keywords});

  Result.fromJson(Map<String, dynamic> json) {
    blogId = json['blog_id'];
    blogTitle = json['blog_title'];
    blogImage = json['blog_image'];
    blogDescription = json['blog_description'];
    blogDate = json['blog_date'];
    if (json['keywords'] != null) {
      keywords = <Keywords>[];
      json['keywords'].forEach((v) {
        keywords!.add(new Keywords.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['blog_id'] = this.blogId;
    data['blog_title'] = this.blogTitle;
    data['blog_image'] = this.blogImage;
    data['blog_description'] = this.blogDescription;
    data['blog_date'] = this.blogDate;
    if (this.keywords != null) {
      data['keywords'] = this.keywords!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Keywords {
  String? word;

  Keywords({this.word});

  Keywords.fromJson(Map<String, dynamic> json) {
    word = json['word'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['word'] = this.word;
    return data;
  }
}