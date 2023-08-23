import 'package:get/get.dart';

class Stories {
  String thumbnail;

  String title;

  Stories({
    required this.thumbnail,
    required this.title,
  });
}

class Images {
  String imageUrl;

  String title;

  String comments;
  String text;

  Images(
      {required this.imageUrl,
      required this.title,
      required this.comments,
      required this.text});
}

class StoriesController extends GetxController {
  List<Stories> storiesItems = [
    Stories(
        title: 'Your story',
        thumbnail:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQofI18Wx0rgGamrxPa8ENWbT3JoRoFh6zL_g&usqp=CAU'),
    Stories(
        title: 'flutter',
        thumbnail:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTSrIOorMvDgYd5VunTWbiKuQBz14S417OhQ&usqp=CAU'),
    Stories(
      title: 'Channel',
      thumbnail:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSingpBie1tMNPg5dpmGqN5vcIxwMdKa4IzgA&usqp=CAU',
    ),
    Stories(
        title: 'SQL',
        thumbnail:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSJgFq4ro2w11I7CsP8cedAhJF5W8PjYZNKEg&usqp=CAU'),
    Stories(
        title: 'Musicman',
        thumbnail:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSVPB-3cPnN-SfWr1H-PYm_KHU4mr1epecjpg&usqp=CAU'),
    Stories(
        title: 'Jrntr',
        thumbnail:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFu5ZInPRkgG_ryvofY5sdJbuZz-Fq6v071A&usqp=CAU'),
    Stories(
        title: 'Varuntej',
        thumbnail:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKUxMYwP0EvtayBz-0eMYKl7PwBC9AwU6U-w&usqp=CAU'),
    Stories(
        title: 'Dart',
        thumbnail:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfFI9s2x_jlzzIr2oRs78pSu4aYHbZ-4Es2w&usqp=CAU'),
    Stories(
        title: 'Varuntej',
        thumbnail:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKUxMYwP0EvtayBz-0eMYKl7PwBC9AwU6U-w&usqp=CAU'),
    Stories(
        title: 'flutter',
        thumbnail:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTSrIOorMvDgYd5VunTWbiKuQBz14S417OhQ&usqp=CAU'),
    Stories(
        title: 'Jrntr',
        thumbnail:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFu5ZInPRkgG_ryvofY5sdJbuZz-Fq6v071A&usqp=CAU'),
    Stories(
        title: 'SQL',
        thumbnail:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSJgFq4ro2w11I7CsP8cedAhJF5W8PjYZNKEg&usqp=CAU'),
  ].obs;

  List<Images> imagesitems = [
    Images(
      imageUrl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrYRG75X0eu9un4Sn34PVBuOl959zXG2ZF2VCpJ8c00RuDV7h9qm8UWkpN_5FkhWZe_rM&usqp=CAU",
      title: "A boy has handsome",
      text: "Flutter",
      comments: "View all 8 comments",
    ),
    Images(
        imageUrl:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS2ccDA0Tl-Ttu18o8rOoIPark-5N0LQaQpjw&usqp=CAU",
        title: ' Car is very nice',
        text: "SQl",
        comments: "View all 6 comments"),
    Images(
      imageUrl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZl25rQArtXar5k383QO5ZRen8YNEkXeEXYg&usqp=CAU",
      title: ' She is so pretty',
      text: "Channel",
      comments: "View all 8 comments",
    ),
    Images(
      imageUrl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT9Lp_vpjcJFZDWE_C0lyv5SjGWuZR3J_AtP7_ydmA2mqnRRlXdmwzVsdaCjp8LbIM-6Qk&usqp=CAU",
      title: 'Nice place',
      text: "Music",
      comments: "View all 5 comments",
    ),
    Images(
      imageUrl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSff8JL9ALjQrQ11mS8MNLOGgyOXjRTJEckCA&usqp=CAU",
      title: 'Nice place ',
      text: "Dart",
      comments: "View all 16 comments",
    ),
    Images(
      imageUrl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQVIkeiwbu6hn5zP31DgzDZ0VnJhRf6jYyC8A&usqp=CAU",
      title: 'Butterfly is so nice',
      text: "JrNtr",
      comments: "View all 20 comments",
    )
  ].obs;
}
