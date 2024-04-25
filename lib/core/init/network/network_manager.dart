import 'package:vexana/vexana.dart';

import '../../base/model/base_error_model.dart';
import '../../constants/app/app_constants.dart';

class VexanaManager extends NetworkManager<BaseErrorModel> {
  VexanaManager()
      : super(
            options: BaseOptions(
              baseUrl: AppConstants.instance!.baseUrl,
              followRedirects: true,
            ),
            errorModel: BaseErrorModel(),
            isEnableLogger: true,
            isEnableTest: true);
}
