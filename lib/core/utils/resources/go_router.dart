import 'package:flutter/material.dart';
import 'package:food_app/core/utils/models/restaurant_model.dart';
import 'package:food_app/features/cart/view/cart_view.dart';
import 'package:food_app/features/chat/view/chat_view.dart';
import 'package:food_app/features/forget_password/view/forget_password_view.dart';
import 'package:food_app/features/home/view/home_view.dart';
import 'package:food_app/features/home/view/location_access.dart';
import 'package:food_app/features/login/view/login_view.dart';
import 'package:food_app/features/cart/view/popular_item_details.dart';
import 'package:food_app/features/cart/view/item_details.dart';
import 'package:food_app/features/my_orders/view/my_orders_view.dart';
import 'package:food_app/features/payment/view/add_new_card.dart';
import 'package:food_app/features/payment/view/confirm_payment.dart';
import 'package:food_app/features/payment/view/delivery_man_call_screen.dart';
import 'package:food_app/features/payment/view/payment_method.dart';
import 'package:food_app/features/payment/view/payment_view.dart';
import 'package:food_app/features/payment/view/track_order.dart';
import 'package:food_app/features/profile/view/edit_profile.dart';
import 'package:food_app/features/profile/view/my_address_component/add_new_address.dart';
import 'package:food_app/features/profile/view/my_address_view.dart';
import 'package:food_app/features/profile/view/personal_info_view.dart';
import 'package:food_app/features/profile/view/profile_view.dart';
import 'package:food_app/features/search/view/search_view.dart';
import 'package:food_app/features/sign_up/view/sign_up_view.dart';
import 'package:food_app/features/sign_up/view/verification_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kLoginView = '/loginView';
  static const kSignUpView = '/signUpView';
  static const kForgetPassword = '/forgetPassword';
  static const kVerificationView = '/verificationView';
  static const kLocationAccess = '/locationAccess';
  static const kSearchView = '/searchView';
  static const kItemDetails = '/itemDetails';
  static const kPopularItemDetails = '/popularItemDetails';
  static const kCartView = '/cartView';
  static const kPaymentView = '/paymentView';
  static const kPaymentMethod = '/paymentMethod';
  static const kAddCardView = '/addCardView';
  static const kConfirmPayment = '/confirmPayment';
  static const kTrackOrder = '/trackOrder';
  static const kDeliverCallScreen = '/deliverCallScreen';
  static const kChatView = '/chatView';
  static const kMyOrdersView ='/myOrdersView';
  static const kProfileView ='/profileView';
  static const kPersonalInfoView = '/personalInfoView';
  static const kEditProfile = '/editProfile';
  static const kMyAddressView = '/myAddressView';
  static const kAddNewAddressView = '/addNewAddressView';

  static GoRouter createRouter(Widget startWidget) {
    return GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) {
            return startWidget;
          },
        ),
        GoRoute(
          path: '/loginView',
          builder: (BuildContext context, GoRouterState state) {
            return const LoginView();
          },
        ),
        GoRoute(
          path: '/signUpView',
          builder: (BuildContext context, GoRouterState state) {
            return const SignUpView();
          },
        ),
        GoRoute(
          path: '/locationAccess',
          builder: (BuildContext context, GoRouterState state) {
            return const LocationAccess();
          },
        ),
        GoRoute(
          path: '/ForgetPassword',
          builder: (BuildContext context, GoRouterState state) {
            return const ForgetPasswordView();
          },
        ),
        GoRoute(
          path: '/verificationView',
          builder: (BuildContext context, GoRouterState state) {
            return VerificationView(
              email: state.extra as String,
            );
          },
        ),
        GoRoute(
          path: '/homeView',
          builder: (BuildContext context, GoRouterState state) {
            return const HomeView();
          },
        ),
        GoRoute(
          path: '/searchView',
          builder: (BuildContext context, GoRouterState state) {
            return SearchView();
          },
        ),
        GoRoute(
          path: '/itemDetails',
          builder: (BuildContext context, GoRouterState state) {
            return const ItemDetails();
          },
        ),
        GoRoute(
          path: '/popularItemDetails',
          builder: (BuildContext context, GoRouterState state) {
            return PopularItemDetails(restaurantModel: state.extra as RestaurantModel,);
          },
        ),
        GoRoute(
          path: '/cartView',
          builder: (BuildContext context, GoRouterState state) {
            return  const CartView();
          },
        ),
        GoRoute(
          path: '/paymentView',
          builder: (BuildContext context, GoRouterState state) {
            return  PaymentView(totalPrice: state.extra as num,);
          },
        ),
        GoRoute(
          path: '/paymentMethod',
          builder: (BuildContext context, GoRouterState state) {
            return  PaymentMethod(totalPrice: state.extra as num,);
          },
        ),
        GoRoute(
          path: '/addCardView',
          builder: (BuildContext context, GoRouterState state) {
            return AddNewCard(totalPrice: state.extra as num,);
          },
        ),
        GoRoute(
          path: '/confirmPayment',
          builder: (BuildContext context, GoRouterState state) {
            return  const ConfirmPayment();
          },
        ),
        GoRoute(
          path: '/trackOrder',
          builder: (BuildContext context, GoRouterState state) {
            return  const TrackOrder();
          },
        ),
        GoRoute(
          path: '/deliverCallScreen',
          builder: (BuildContext context, GoRouterState state) {
            return  const DeliveryManCallScreen();
          },
        ),
        GoRoute(
          path: '/chatView',
          builder: (BuildContext context, GoRouterState state) {
            return const ChatView();
          },
        ),
        GoRoute(
          path: '/myOrdersView',
          builder: (BuildContext context, GoRouterState state) {
            return const MyOrdersView();
          },
        ),
        GoRoute(
          path: '/profileView',
          builder: (BuildContext context, GoRouterState state) {
            return const ProfileView();
          },
        ),
        GoRoute(
          path: '/editProfile',
          builder: (BuildContext context, GoRouterState state) {
            return const EditProfileView();
          },
        ),
        GoRoute(
          path: '/personalInfoView',
          builder: (BuildContext context, GoRouterState state) {
            return const PersonalInfoView();
          },
        ),
        GoRoute(
          path: '/myAddressView',
          builder: (BuildContext context, GoRouterState state) {
            return const MyAddressView();
          },
        ),
        GoRoute(
          path: '/addNewAddressView',
          builder: (BuildContext context, GoRouterState state) {
            return const AddNewAddressView();
          },
        ),

      ],
    );
  }
}
