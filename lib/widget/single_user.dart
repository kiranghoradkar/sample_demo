import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:sample_demo/database/database_helper.dart';
import 'package:sample_demo/model/single_user_model.dart';
import 'package:sample_demo/model/user_details.dart';
import 'package:sample_demo/utils/change_theme.dart';
import 'package:sample_demo/utils/image_utils.dart';
import 'package:sample_demo/utils/ui_colors.dart';
import 'package:sample_demo/utils/custom_text.dart';
import 'package:sample_demo/widget/constants.dart';
import 'package:sample_demo/widget/custom_shimmer.dart';
import 'package:shimmer/shimmer.dart';

/// This is the class of single user from the list
class SingleUser extends StatelessWidget {
  const SingleUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appStyleMode = Provider.of<AppStyleModeNotifier>(context);
    return Consumer<SingleUserModel?>(
      builder: (BuildContext context, value, Widget? child) {
        if (value == null) {
          return const CustomShimmer();
        }
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            child: Row(
              children: [
                value.avatarUrl == null
                    ? const ImageUtils(
                        width: 50,
                        height: 50,
                        imageUrl: 'assets/user.png',
                        imageType: ImageType.image,
                      )
                    : ImageUtils(
                        width: 50,
                        height: 50,
                        imageUrl: value.avatarUrl!,
                        imageType: ImageType.network,
                      ),
                const SizedBox(
                  width: 10,
                ),
                CustomText(
                  text: value.name ?? '',
                  textColor: appStyleMode.primaryTextColor,
                  textSize: 16,
                  fontWeight: FontWeight.w500,
                )
              ],
            ),
            onLongPress: () async {
              var tempDetails = UserDetails(
                  avatarUrl: value.avatarUrl == null
                      ? 'assets/user.png'
                      : value.avatarUrl!,
                  name: value.name);
              await DataBaseHelper.instance.create(tempDetails);

              Fluttertoast.showToast(
                  msg: StringConstant.successMessage,
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: UIColors.background_colour,
                  textColor: UIColors.text_colour_black,
                  fontSize: 16.0);
            },
          ),
        );
      },
    );
  }
}


