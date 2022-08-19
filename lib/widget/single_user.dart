import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:sample_demo/database/database_helper.dart';
import 'package:sample_demo/model/single_user_model.dart';
import 'package:sample_demo/model/user_details.dart';
import 'package:sample_demo/utils/image_utils.dart';
import 'package:sample_demo/utils/ui_colors.dart';
import 'package:sample_demo/utils/custom_text.dart';

class SingleUser extends StatelessWidget {
  const SingleUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SingleUserModel?>(
      builder: (BuildContext context, value, Widget? child) {
        if (value == null) {
          return const Text("loading");
        }
        return InkWell(
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
                textColor: Colors.black,
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
                msg: "User added successfully",
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: UIColors.background_colour,
                textColor: UIColors.text_colour_black,
                fontSize: 16.0
            );
          },
        );
      },
    );
  }
}
