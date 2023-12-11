import 'package:bookly_app/constants.dart';
import 'package:fluttertoast/fluttertoast.dart';

customToast({required String msg}) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 1,
    backgroundColor: kPrimaryColor,
    textColor: kPrimaryColor,
    fontSize: 16.0,
  );
}
