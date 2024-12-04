import 'package:all_of_them/festival/view/festival_category_screen.dart';
import 'package:all_of_them/festival/view/festival_detail_screen.dart';
import 'package:all_of_them/festival/view/festival_screen.dart';
import 'package:all_of_them/partner/view/partner_category_screen.dart';
import 'package:all_of_them/partner/view/partner_detail_screen.dart';
import 'package:all_of_them/partner/view/partner_screen.dart';
import 'package:all_of_them/place/view/place_category_screen.dart';
import 'package:all_of_them/place/view/place_detail_screen.dart';
import 'package:all_of_them/place/view/place_screen.dart';
import 'package:all_of_them/profile/view/chat_screen.dart';
import 'package:all_of_them/profile/view/consulting_screen.dart';
import 'package:all_of_them/profile/view/create_item_screen.dart';
import 'package:all_of_them/profile/view/order_detail_screen.dart';
import 'package:all_of_them/profile/view/order_screen.dart';
import 'package:all_of_them/profile/view/payment_screen.dart';
import 'package:all_of_them/profile/view/register_completion_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../home/view/home_screen.dart';
import '../../notification/view/notification_detail_screen.dart';
import '../../notification/view/notification_screen.dart';
import '../../user/view/certification_screen.dart';
import '../../user/view/custom_sns_screen.dart';
import '../../user/view/edit_profile_screen.dart';
import '../../user/view/email_login_screen.dart';
import '../../user/view/find_id_screen.dart';
import '../../user/view/find_password_input_screen.dart';
import '../../user/view/find_password_screen.dart';
import '../../user/view/input_info_screen.dart';
import '../../user/view/login_screen.dart';
import '../../user/view/profile_screen.dart';
import '../../user/view/term_detail_screen.dart';
import '../../user/view/term_screen.dart';
import '../view/completion_screen.dart';
import '../view/completion_screen_to_email_login.dart';
import '../view/error_screen.dart';
import '../view/scaffold_with_nav.dart';
import '../view/splash_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  redirect: null,
  // initialLocation: '/splash',
  initialLocation: '/splash',
  routes: routes,
  errorBuilder: (context, state) => ErrorScreen(
    error: state.error.toString(),
  ),
  debugLogDiagnostics: true,
);

List<RouteBase> get routes => [
      StatefulShellRoute.indexedStack(
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: "/home",
                name: HomeScreen.routeName,
                builder: (context, state) => HomeScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: "/partner",
                name: PartnerScreen.routeName,
                builder: (context, state) => PartnerScreen(),
                routes: [
                  GoRoute(
                    path: "category",
                    name: PartnerCategoryScreen.routeName,
                    builder: (context, state) => PartnerCategoryScreen(),
                  ),
                  GoRoute(
                    parentNavigatorKey: _rootNavigatorKey,
                    path: ":id",
                    name: PartnerDetailScreen.routeName,
                    builder: (context, state) {
                      final id = state.pathParameters['id']!;
                      return PartnerDetailScreen(id: id);
                    },
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: "/place",
                name: PlaceScreen.routeName,
                builder: (context, state) => PlaceScreen(),
                routes: [
                  GoRoute(
                    path: "category",
                    name: PlaceCategoryScreen.routeName,
                    builder: (context, state) => PlaceCategoryScreen(),
                  ),
                  GoRoute(
                    parentNavigatorKey: _rootNavigatorKey,
                    path: ":id",
                    name: PlaceDetailScreen.routeName,
                    builder: (context, state) {
                      final id = state.pathParameters['id']!;
                      return PlaceDetailScreen(id: id);
                    },
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: "/festival",
                name: FestivalScreen.routeName,
                builder: (context, state) => FestivalScreen(),
                routes: [
                  GoRoute(
                    path: "category",
                    name: FestivalCategoryScreen.routeName,
                    builder: (context, state) => FestivalCategoryScreen(),
                  ),
                  GoRoute(
                    parentNavigatorKey: _rootNavigatorKey,
                    path: ":id",
                    name: FestivalDetailScreen.routeName,
                    builder: (context, state) {
                      final id = state.pathParameters['id']!;
                      return FestivalDetailScreen(id: id);
                    },
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/profile',
                name: ProfileScreen.routeName,
                builder: (context, state) => ProfileScreen(),
                routes: [
                  GoRoute(
                    parentNavigatorKey: _rootNavigatorKey,
                    path: 'edit',
                    name: EditProfileScreen.routeName,
                    builder: (context, state) => EditProfileScreen(),
                  ),
                  GoRoute(
                    parentNavigatorKey: _rootNavigatorKey,
                    path: 'order',
                    name: OrderScreen.routeName,
                    builder: (context, state) => OrderScreen(),
                    routes: [
                      GoRoute(
                        parentNavigatorKey: _rootNavigatorKey,
                        path: ':id',
                        name: OrderDetailScreen.routeName,
                        builder: (context, state) {
                          final id = state.pathParameters['id']!;
                          return OrderDetailScreen(id: id);
                        },
                        routes: [
                          GoRoute(
                            parentNavigatorKey: _rootNavigatorKey,
                            path: 'payment',
                            name: PaymentScreen.routeName,
                            builder: (context, state) {
                              final id = state.pathParameters['id']!;
                              return PaymentScreen(id: id);
                            },
                          ),
                          GoRoute(
                            parentNavigatorKey: _rootNavigatorKey,
                            path: 'chat',
                            name: ChatScreen.routeName,
                            builder: (context, state) {
                              final id = state.pathParameters['id']!;
                              return ChatScreen(id: id);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
        builder: (BuildContext context, GoRouterState state,
            StatefulNavigationShell navigationShell) {
          return ScaffoldWithNav(navigationShell: navigationShell);
        },
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/splash',
        name: SplashScreen.routeName,
        builder: (context, state) => SplashScreen(),
      ),
      GoRoute(
        path: '/completion/:title',
        name: CompletionScreen.routeName,
        builder: (context, state) {
          final String title = state.pathParameters['title']!;

          return CompletionScreen(title: title);
        },
      ),
      GoRoute(
        path: '/completion_find/:title',
        name: CompletionScreenToEmailLogin.routeName,
        builder: (context, state) {
          final parameters = GoRouterState.of(context).pathParameters;

          return CompletionScreenToEmailLogin(title: parameters['title']!);
        },
      ),
      GoRoute(
        path: '/sns/:title',
        name: CustomSnsScreen.routeName,
        builder: (context, state) => CustomSnsScreen(),
      ),
      GoRoute(
        path: '/login',
        name: LoginScreen.routeName,
        builder: (context, state) => LoginScreen(),
        routes: [
          GoRoute(
            path: 'email_login',
            name: EmailLoginScreen.routeName,
            builder: (context, state) => EmailLoginScreen(),
            routes: [
              GoRoute(
                path: 'term',
                name: TermScreen.routeName,
                builder: (context, state) => TermScreen(),
                routes: [
                  GoRoute(
                    path: 'detail/:id',
                    name: TermDetailScreen.routeName,
                    builder: (context, state) => TermDetailScreen(),
                  ),
                ],
              ),
              GoRoute(
                path: 'certification',
                name: CertificationScreen.routeName,
                builder: (context, state) => CertificationScreen(),
                routes: [
                  GoRoute(
                    path: 'input_info',
                    name: InputInfoScreen.routeName,
                    builder: (context, state) => InputInfoScreen(),
                    routes: [
                      GoRoute(
                        path: 'register_completion',
                        name: RegisterCompletionScreen.routeName,
                        builder: (context, state) => RegisterCompletionScreen(),
                      ),
                    ],
                  ),
                ],
              ),
              GoRoute(
                path: 'find_id',
                name: FindIdScreen.routeName,
                builder: (context, state) => FindIdScreen(),
              ),
              GoRoute(
                path: 'find_password',
                name: FindPasswordScreen.routeName,
                builder: (context, state) => FindPasswordScreen(),
                routes: [
                  GoRoute(
                    path: 'input',
                    name: FindPasswordInputScreen.routeName,
                    builder: (context, state) => FindPasswordInputScreen(),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/notification',
        name: NotificationScreen.routeName,
        builder: (context, state) => NotificationScreen(),
        routes: [
          GoRoute(
            parentNavigatorKey: _rootNavigatorKey,
            path: ':id',
            name: NotificationDetailScreen.routeName,
            builder: (context, state) {
              final id = state.pathParameters['id']!;
              return NotificationDetailScreen(id: id);
            },
          ),
        ],
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/create_item',
        name: CreateItemScreen.routeName,
        builder: (context, state) => CreateItemScreen(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/consulting',
        name: ConsultingScreen.routeName,
        builder: (context, state) => ConsultingScreen(),
      ),
    ];
