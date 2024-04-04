import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

import 'product_model.dart';

part 'result_model.g.dart';

@JsonSerializable()
class ResultModel extends INetworkModel<ResultModel> {
  List<ProductModel>? products;
  int? total;
  int? skip;
  int? limit;

  ResultModel({this.products, this.total, this.skip, this.limit});
  @override
  fromJson(Map<String, dynamic> json) {
    return _$ResultModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$ResultModelToJson(this);
  }

  factory ResultModel.fromJson(Map<String, dynamic> json) => _$ResultModelFromJson(json);
}
