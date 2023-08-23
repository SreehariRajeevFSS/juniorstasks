import 'package:get/get.dart';
import '../models/instagram_modeel.dart';

class StoriesController extends GetxController {
  var storiesItems = <CircleAvatarStories>[].obs;

  @override
  void onInit() {
    storiesItems.addAll([
      CircleAvatarStories(
        title: 'Your story',
        thumbnail:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJK6gp6k2yzpl7fPF8g_PgU0r3GXCABq_t_g&usqp=CAU',
      ),
      CircleAvatarStories(
    title: 'RamCharan',
    thumbnail:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8O2kBMMlg7R3Efe495TFEEU9nxPKA5MTI_Q&usqp=CAU',
  ),
  CircleAvatarStories(
      title: 'PawanKalyan',
      thumbnail:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRzZexHKWHoMw92lh7a0Qg04-7l7r9eCY3WLw&usqp=CAU'),
  CircleAvatarStories(
      title: 'Chiranjeevi',
      thumbnail:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwT7VUlXwOLTQd1jRdZmhIDzbTee3yRMgeng&usqp=CAU'),
  CircleAvatarStories(
      title: 'Vinod',
      thumbnail:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNBq7RneFCJl_MUdWU8mS8H19yYL6d1jg-Mg&usqp=CAU'),
  CircleAvatarStories(
      title: 'RajKumar',
      thumbnail:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBAJ5ZAVOFMfzWCoT1epLjonvz_EnRMDoVJA&usqp=CAU'),
  CircleAvatarStories(
      title: 'Hema',
      thumbnail:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTlqJ0smfEFETV2uuZxsSD8tFcOiGGIUJicgg&usqp=CAU'),
  CircleAvatarStories(
      title: 'Venkatesh',
      thumbnail:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnFAGYTyb6imfp42t1LWsdHVa7QYwIv2H8-w&usqp=CAU'),
    ]);
    super.onInit();
  }
}
