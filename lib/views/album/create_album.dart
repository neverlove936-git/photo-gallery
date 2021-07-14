import 'package:flutter/material.dart';
import 'package:photo_gallery/controllers/create_album_controller.dart';
import 'package:photo_gallery/utils/constants/index.dart';
import 'package:photo_gallery/views/widgets/default_icon_button.dart';
import 'package:photo_gallery/views/widgets/loading.dart';

class CreateAlbumPage extends StatelessWidget {
  CreateAlbumPage({Key? key}) : super(key: key);

  final CreateAlbumController createAlbumController =
      Get.put(CreateAlbumController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: _appBar(),
        ),
        body: _bodyContent(),
      ),
    );
  }

  Widget _appBar() {
    return AppBar(
      elevation: 5,
      title: Text(
        'createAlbumTitle'.tr,
        style: TextThemeStyles.appBarTitle,
      ),
      centerTitle: true,
    );
  }

  Widget _bodyContent() {
    return Obx(
      () {
        return createAlbumController.isLoading.value
            ? LoadingIndicator()
            : Padding(
                padding: const EdgeInsets.all(10.0),
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 40),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: TextFormField(
                          controller:
                              createAlbumController.albumFormFieldController,
                          autocorrect: true,
                          onChanged: (_) {
                            createAlbumController.checkValidButton();
                          },
                          decoration: const InputDecoration(
                            hintText: 'Album Name',
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 15,
                        ),
                        child: const Text(
                          'This will create a album in your Google Photos account',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                      Center(
                        child: DefaultIconButton(
                          onPressed: createAlbumController.isDisableButton.value
                              ? null
                              : () {
                                  createAlbumController.createAlbum();
                                },
                          label: const Text('Submit'),
                        ),
                      ),
                    ],
                  ),
                ),
              );
      },
    );
  }
}
