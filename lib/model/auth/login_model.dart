class LoginInfo {
  String? method;
  String? module;
  String? url;
  int? err;
  Body? body;
  Result? result;

  LoginInfo(
      {this.method, this.module, this.url, this.err, this.body, this.result});

  LoginInfo.fromJson(Map<String, dynamic> json) {
    method = json['method'];
    module = json['module'];
    url = json['url'];
    err = json['err'];
    body = json['body'] != null ? new Body.fromJson(json['body']) : null;
    result =
        json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['method'] = this.method;
    data['module'] = this.module;
    data['url'] = this.url;
    data['err'] = this.err;
    if (this.body != null) {
      data['body'] = this.body!.toJson();
    }
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    return data;
  }
}

class Body {
  String? email;
  String? password;

  Body({this.email, this.password});

  Body.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}

class Result {
  String? expiresIn;
  String? token;
  User? user;
  int? err;

  Result({this.expiresIn, this.token, this.user, this.err});

  Result.fromJson(Map<String, dynamic> json) {
    expiresIn = json['expiresIn'];
    token = json['token'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    err = json['err'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['expiresIn'] = this.expiresIn;
    data['token'] = this.token;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['err'] = this.err;
    return data;
  }
}

class User {
  String? sId;
  int? userType;
  Null? code;
  String? email;
  String? fullname;
  String? avatar;
  bool? active;
  String? createdAt;
  bool? isRoot;
  Null? role;

  User(
      {this.sId,
      this.userType,
      this.code,
      this.email,
      this.fullname,
      this.avatar,
      this.active,
      this.createdAt,
      this.isRoot,
      this.role});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userType = json['userType'];
    code = json['code'];
    email = json['email'];
    fullname = json['fullname'];
    avatar = json['avatar'];
    active = json['active'];
    createdAt = json['createdAt'];
    isRoot = json['is_root'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['userType'] = this.userType;
    data['code'] = this.code;
    data['email'] = this.email;
    data['fullname'] = this.fullname;
    data['avatar'] = this.avatar;
    data['active'] = this.active;
    data['createdAt'] = this.createdAt;
    data['is_root'] = this.isRoot;
    data['role'] = this.role;
    return data;
  }
}
