import 'package:flutter/material.dart';
import 'package:flutter_test_app/data/repositories/api_interface.dart';
import 'package:flutter_test_app/domain/models/card.dart';
import 'package:flutter_test_app/domain/models/home.dart';

class MockRepository extends ApiInterface {
  @override
  Future<HomeData?> loadData({OnErrorCallback? onError}) async {
    return HomeData(
      data: [
        CardData(
          'Freeze',
          descriptionText: 'so cold..',
          imageUrl:
              'https://www.skedaddlewildlife.com/wp-content/uploads/2018/09/depositphotos_22425309-stock-photo-a-lonely-raccoon-in-winter.jpg',
        ),
        CardData(
          'Hi',
          descriptionText: 'pretty face',
          icon: Icons.hail,
          imageUrl:
              'https://www.thesprucepets.com/thmb/nKNaS4I586B_H7sEUw9QAXvWM_0=/2121x0/filters:no_upscale():strip_icc()/GettyImages-135630198-5ba7d225c9e77c0050cff91b.jpg',
        ),
        CardData(
          'Orange',
          descriptionText: 'I like autumn',
          icon: Icons.warning_amber,
          imageUrl: 'https://furmanagers.com/wp-content/uploads/2019/11/dreamstime_l_22075357.jpg',
        ),
      ],
    );
  }
}
