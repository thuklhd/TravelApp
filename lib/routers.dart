







import 'package:flutter/material.dart';
import 'package:travel_app/representation/screens/check_out_screen.dart';
import 'package:travel_app/representation/screens/guest_and_room_screen.dart';
import 'package:travel_app/representation/screens/hotel_booking_screen.dart';
import 'package:travel_app/representation/screens/hotel_detail.dart';
import 'package:travel_app/representation/screens/hotel_screen.dart';
import 'package:travel_app/representation/screens/intro_screen.dart';
import 'package:travel_app/representation/screens/main_app.dart';
import 'package:travel_app/representation/screens/rooms_sceen.dart';
import 'package:travel_app/representation/screens/select_date_screen.dart';
import 'package:travel_app/representation/screens/splash_screen.dart';

import 'data/model/hotel_model.dart';
import 'data/model/room_model.dart';


final Map<String,WidgetBuilder> routes={
  SplashScreen.routerName :(context) =>SplashScreen(),
  IntroScreen.routerName :(context) =>  IntroScreen(),
  MainApp.routerName :(context) => MainApp(),
  HotelScreen.routeName:(context)=> HotelScreen(),

  HotelBookingScreen.routeName :(context)=> const HotelBookingScreen(),
  SelectDateScreen.routeName:(context)=>SelectDateScreen(),
  GuestAndRoomBookingScreen.routeName:(context)=>GuestAndRoomBookingScreen(),
  RoomsScreen.routeName: (context) => RoomsScreen(),



};
MaterialPageRoute<dynamic>? generateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case DetailHotelScreen.routeName:
      final HotelModel hotelModel = (settings.arguments as HotelModel);
      return MaterialPageRoute<dynamic>(
        settings: settings,
        builder: (context) => DetailHotelScreen(
          hotelModel: hotelModel,
        ),
      );
    case CheckOutScreen.routeName:
      final RoomModel roomModel = (settings.arguments as RoomModel);
      return MaterialPageRoute<dynamic>(
        settings: settings,
        builder: (context) => CheckOutScreen(
          roomModel: roomModel,
        ),
      );

    case HotelBookingScreen.routeName:
      final String? destination = (settings.arguments as String?);
      return MaterialPageRoute<dynamic>(
        settings: settings,
        builder: (context) => HotelBookingScreen(
          destination: destination,
        ),
      );
    default:
      return null;
  }
}