import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';
part 'base_error_model.g.dart';

@JsonSerializable()
class BaseErrorModel extends INetworkModel<BaseErrorModel> {
    String? message;
BaseErrorModel({this.message});
@override
 fromJson(Map<String, dynamic> json) {
return _$BaseErrorModelFromJson(json);
}
@override
Map<String, dynamic> toJson() {
return _$BaseErrorModelToJson(this);
}
factory BaseErrorModel.fromJson(Map<String, dynamic> json) => _$BaseErrorModelFromJson(json);
}