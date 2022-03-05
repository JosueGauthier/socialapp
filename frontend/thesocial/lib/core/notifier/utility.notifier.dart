
import 'package:cloudinary_sdk/cloudinary_sdk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thesocial/app/credentials/cloudinary.credentials.dart';
import 'package:thesocial/meta/utils/pick.image.utils.dart';
import 'package:thesocial/meta/utils/snackbar.dart';

class UtilityNotifier extends ChangeNotifier {

  String? _userimage ="";
  String? get userimage => _userimage;


  Future uploadUserImage({
  required BuildContext context})
  async{
    final _cloudinary = Cloudinary(CloudinaryCredentials.APIKEY, CloudinaryCredentials.APISecret, CloudinaryCredentials.APIName);

    try{
      final _image = await ImageUtility.getImage();
      await _cloudinary.uploadFile(
        filePath: _image!.path,
        resourceType: CloudinaryResourceType.image,
        folder: "theSocial").then((value){
          _userimage = value.url;
          print(_userimage);
          notifyListeners();
          return _userimage;
      });
    }catch (e){
      SnackbarUtility.showsnackbar(message: e.toString(), context: context);

    }

  }

}
