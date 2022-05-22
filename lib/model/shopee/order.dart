class ShopeeOrders {
  Status? status;
  Shipping? shipping;
  InfoCard? infoCard;
  List<PrimaryButtons>? primaryButtons;
  Guarantee? guarantee;
  Misc? misc;
  int? listType;

  ShopeeOrders(
      {this.status,
      this.shipping,
      this.infoCard,
      this.primaryButtons,
      this.guarantee,
      this.misc,
      this.listType});

  ShopeeOrders.fromJson(Map<String, dynamic> json) {
    status =
        json['status'] != null ? new Status.fromJson(json['status']) : null;
    shipping = json['shipping'] != null
        ? new Shipping.fromJson(json['shipping'])
        : null;
    infoCard = json['info_card'] != null
        ? new InfoCard.fromJson(json['info_card'])
        : null;
    if (json['primary_buttons'] != null) {
      primaryButtons = <PrimaryButtons>[];
      json['primary_buttons'].forEach((v) {
        primaryButtons!.add(new PrimaryButtons.fromJson(v));
      });
    }
    guarantee = json['guarantee'] != null
        ? new Guarantee.fromJson(json['guarantee'])
        : null;
    misc = json['misc'] != null ? new Misc.fromJson(json['misc']) : null;
    listType = json['list_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.status != null) {
      data['status'] = this.status!.toJson();
    }
    if (this.shipping != null) {
      data['shipping'] = this.shipping!.toJson();
    }
    if (this.infoCard != null) {
      data['info_card'] = this.infoCard!.toJson();
    }
    if (this.primaryButtons != null) {
      data['primary_buttons'] =
          this.primaryButtons!.map((v) => v.toJson()).toList();
    }
    if (this.guarantee != null) {
      data['guarantee'] = this.guarantee!.toJson();
    }
    if (this.misc != null) {
      data['misc'] = this.misc!.toJson();
    }
    data['list_type'] = this.listType;
    return data;
  }
}

class Status {
  StatusLabel? statusLabel;
  StatusLabel? listViewStatusLabel;

  Status({this.statusLabel, this.listViewStatusLabel});

  Status.fromJson(Map<String, dynamic> json) {
    statusLabel = json['status_label'] != null
        ? new StatusLabel.fromJson(json['status_label'])
        : null;
    listViewStatusLabel = json['list_view_status_label'] != null
        ? new StatusLabel.fromJson(json['list_view_status_label'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.statusLabel != null) {
      data['status_label'] = this.statusLabel!.toJson();
    }
    if (this.listViewStatusLabel != null) {
      data['list_view_status_label'] = this.listViewStatusLabel!.toJson();
    }
    return data;
  }
}

class StatusLabel {
  String? text;
  bool? tl;

  StatusLabel({this.text, this.tl});

  StatusLabel.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    tl = json['tl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['tl'] = this.tl;
    return data;
  }
}

class Shipping {
  TrackingInfo? trackingInfo;
  bool? isMultiParcel;
  int? numParcels;
  int? parcelNo;

  Shipping(
      {this.trackingInfo, this.isMultiParcel, this.numParcels, this.parcelNo});

  Shipping.fromJson(Map<String, dynamic> json) {
    trackingInfo = json['tracking_info'] != null
        ? new TrackingInfo.fromJson(json['tracking_info'])
        : null;
    isMultiParcel = json['is_multi_parcel'];
    numParcels = json['num_parcels'];
    parcelNo = json['parcel_no'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.trackingInfo != null) {
      data['tracking_info'] = this.trackingInfo!.toJson();
    }
    data['is_multi_parcel'] = this.isMultiParcel;
    data['num_parcels'] = this.numParcels;
    data['parcel_no'] = this.parcelNo;
    return data;
  }
}

class TrackingInfo {
  String? driverPhone;
  String? driverName;
  int? ctime;
  String? description;
  int? type;

  TrackingInfo(
      {this.driverPhone,
      this.driverName,
      this.ctime,
      this.description,
      this.type});

  TrackingInfo.fromJson(Map<String, dynamic> json) {
    driverPhone = json['driver_phone'];
    driverName = json['driver_name'];
    ctime = json['ctime'];
    description = json['description'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['driver_phone'] = this.driverPhone;
    data['driver_name'] = this.driverName;
    data['ctime'] = this.ctime;
    data['description'] = this.description;
    data['type'] = this.type;
    return data;
  }
}

class InfoCard {
  int? orderId;
  List<OrderListCards>? orderListCards;
  int? productCount;
  int? subtotal;
  int? finalTotal;

  InfoCard(
      {this.orderId,
      this.orderListCards,
      this.productCount,
      this.subtotal,
      this.finalTotal});

  InfoCard.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    if (json['order_list_cards'] != null) {
      orderListCards = <OrderListCards>[];
      json['order_list_cards'].forEach((v) {
        orderListCards!.add(new OrderListCards.fromJson(v));
      });
    }
    productCount = json['product_count'];
    subtotal = json['subtotal'];
    finalTotal = json['final_total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    if (this.orderListCards != null) {
      data['order_list_cards'] =
          this.orderListCards!.map((v) => v.toJson()).toList();
    }
    data['product_count'] = this.productCount;
    data['subtotal'] = this.subtotal;
    data['final_total'] = this.finalTotal;
    return data;
  }
}

class OrderListCards {
  ShopInfo? shopInfo;
  List<Items>? items;
  int? orderId;
  List<ParcelCards>? parcelCards;

  OrderListCards({this.shopInfo, this.items, this.orderId, this.parcelCards});

  OrderListCards.fromJson(Map<String, dynamic> json) {
    shopInfo = json['shop_info'] != null
        ? new ShopInfo.fromJson(json['shop_info'])
        : null;
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
    orderId = json['order_id'];
    if (json['parcel_cards'] != null) {
      parcelCards = <ParcelCards>[];
      json['parcel_cards'].forEach((v) {
        parcelCards!.add(new ParcelCards.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.shopInfo != null) {
      data['shop_info'] = this.shopInfo!.toJson();
    }
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    data['order_id'] = this.orderId;
    if (this.parcelCards != null) {
      data['parcel_cards'] = this.parcelCards!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ShopInfo {
  int? shopId;
  String? shopName;
  int? userId;
  String? username;
  String? portrait;
  int? shopTag;

  ShopInfo(
      {this.shopId,
      this.shopName,
      this.userId,
      this.username,
      this.portrait,
      this.shopTag});

  ShopInfo.fromJson(Map<String, dynamic> json) {
    shopId = json['shop_id'];
    shopName = json['shop_name'];
    userId = json['user_id'];
    username = json['username'];
    portrait = json['portrait'];
    shopTag = json['shop_tag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['shop_id'] = this.shopId;
    data['shop_name'] = this.shopName;
    data['user_id'] = this.userId;
    data['username'] = this.username;
    data['portrait'] = this.portrait;
    data['shop_tag'] = this.shopTag;
    return data;
  }
}

class Items {
  int? itemId;
  int? modelId;
  int? shopId;
  String? name;
  String? modelName;
  String? image;
  int? amount;
  int? status;
  int? itemPrice;
  int? priceBeforeDiscount;
  int? orderPrice;
  int? snapshotId;

  Items(
      {this.itemId,
      this.modelId,
      this.shopId,
      this.name,
      this.modelName,
      this.image,
      this.amount,
      this.status,
      this.itemPrice,
      this.priceBeforeDiscount,
      this.orderPrice,
      this.snapshotId});

  Items.fromJson(Map<String, dynamic> json) {
    itemId = json['item_id'];
    modelId = json['model_id'];
    shopId = json['shop_id'];
    name = json['name'];
    modelName = json['model_name'];
    image = json['image'];
    amount = json['amount'];
    status = json['status'];
    itemPrice = json['item_price'];
    priceBeforeDiscount = json['price_before_discount'];
    orderPrice = json['order_price'];
    snapshotId = json['snapshot_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['item_id'] = this.itemId;
    data['model_id'] = this.modelId;
    data['shop_id'] = this.shopId;
    data['name'] = this.name;
    data['model_name'] = this.modelName;
    data['image'] = this.image;
    data['amount'] = this.amount;
    data['status'] = this.status;
    data['item_price'] = this.itemPrice;
    data['price_before_discount'] = this.priceBeforeDiscount;
    data['order_price'] = this.orderPrice;
    data['snapshot_id'] = this.snapshotId;
    return data;
  }
}

class ParcelCards {
  int? parcelNo;
  String? forderId;
  ProductInfo? productInfo;

  ParcelCards({this.parcelNo, this.forderId, this.productInfo});

  ParcelCards.fromJson(Map<String, dynamic> json) {
    parcelNo = json['parcel_no'];
    forderId = json['forder_id'];
    productInfo = json['product_info'] != null
        ? new ProductInfo.fromJson(json['product_info'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['parcel_no'] = this.parcelNo;
    data['forder_id'] = this.forderId;
    if (this.productInfo != null) {
      data['product_info'] = this.productInfo!.toJson();
    }
    return data;
  }
}

class ProductInfo {
  List<ItemGroups>? itemGroups;
  int? totalNumItems;

  ProductInfo({this.itemGroups, this.totalNumItems});

  ProductInfo.fromJson(Map<String, dynamic> json) {
    if (json['item_groups'] != null) {
      itemGroups = <ItemGroups>[];
      json['item_groups'].forEach((v) {
        itemGroups!.add(new ItemGroups.fromJson(v));
      });
    }
    totalNumItems = json['total_num_items'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.itemGroups != null) {
      data['item_groups'] = this.itemGroups!.map((v) => v.toJson()).toList();
    }
    data['total_num_items'] = this.totalNumItems;
    return data;
  }
}

class ItemGroups {
  List<Items>? items;
  int? numItems;

  ItemGroups({this.items, this.numItems});

  ItemGroups.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
    numItems = json['num_items'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    data['num_items'] = this.numItems;
    return data;
  }
}

class ExtInfo {
  int? addOnDealId;
  bool? isAddOnSubItem;
  int? freeReturnDay;
  bool? isWholesale;
  bool? isPreOrder;

  ExtInfo(
      {this.addOnDealId,
      this.isAddOnSubItem,
      this.freeReturnDay,
      this.isWholesale,
      this.isPreOrder});

  ExtInfo.fromJson(Map<String, dynamic> json) {
    addOnDealId = json['add_on_deal_id'];
    isAddOnSubItem = json['is_add_on_sub_item'];
    freeReturnDay = json['free_return_day'];
    isWholesale = json['is_wholesale'];
    isPreOrder = json['is_pre_order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['add_on_deal_id'] = this.addOnDealId;
    data['is_add_on_sub_item'] = this.isAddOnSubItem;
    data['free_return_day'] = this.freeReturnDay;
    data['is_wholesale'] = this.isWholesale;
    data['is_pre_order'] = this.isPreOrder;
    return data;
  }
}

class PrimaryButtons {
  int? id;

  PrimaryButtons({this.id});

  PrimaryButtons.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    return data;
  }
}

class Guarantee {
  String? learnMoreUrl;
  bool? isExtendEnabled;

  Guarantee({this.learnMoreUrl, this.isExtendEnabled});

  Guarantee.fromJson(Map<String, dynamic> json) {
    learnMoreUrl = json['learn_more_url'];
    isExtendEnabled = json['is_extend_enabled'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['learn_more_url'] = this.learnMoreUrl;
    data['is_extend_enabled'] = this.isExtendEnabled;
    return data;
  }
}

class Misc {
  Urls? urls;

  Misc({this.urls});

  Misc.fromJson(Map<String, dynamic> json) {
    urls = json['urls'] != null ? new Urls.fromJson(json['urls']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.urls != null) {
      data['urls'] = this.urls!.toJson();
    }
    return data;
  }
}

class Urls {
  String? guaranteeLearnMore;

  Urls({this.guaranteeLearnMore});

  Urls.fromJson(Map<String, dynamic> json) {
    guaranteeLearnMore = json['guarantee_learn_more'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['guarantee_learn_more'] = this.guaranteeLearnMore;
    return data;
  }
}
