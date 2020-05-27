//
//  Generated file. Do not edit.
//

#import "GeneratedPluginRegistrant.h"

#if __has_include(<cloud_firestore/FLTCloudFirestorePlugin.h>)
#import <cloud_firestore/FLTCloudFirestorePlugin.h>
#else
@import cloud_firestore;
#endif

#if __has_include(<firebase_auth/FLTFirebaseAuthPlugin.h>)
#import <firebase_auth/FLTFirebaseAuthPlugin.h>
#else
@import firebase_auth;
#endif

#if __has_include(<firebase_core/FLTFirebaseCorePlugin.h>)
#import <firebase_core/FLTFirebaseCorePlugin.h>
#else
@import firebase_core;
#endif

#if __has_include(<firebase_database/FLTFirebaseDatabasePlugin.h>)
#import <firebase_database/FLTFirebaseDatabasePlugin.h>
#else
@import firebase_database;
#endif

#if __has_include(<flutter_stripe_payment/FlutterStripePaymentPlugin.h>)
#import <flutter_stripe_payment/FlutterStripePaymentPlugin.h>
#else
@import flutter_stripe_payment;
#endif

#if __has_include(<square_in_app_payments/SquareInAppPaymentsFlutterPlugin.h>)
#import <square_in_app_payments/SquareInAppPaymentsFlutterPlugin.h>
#else
@import square_in_app_payments;
#endif

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [FLTCloudFirestorePlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTCloudFirestorePlugin"]];
  [FLTFirebaseAuthPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTFirebaseAuthPlugin"]];
  [FLTFirebaseCorePlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTFirebaseCorePlugin"]];
  [FLTFirebaseDatabasePlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTFirebaseDatabasePlugin"]];
  [FlutterStripePaymentPlugin registerWithRegistrar:[registry registrarForPlugin:@"FlutterStripePaymentPlugin"]];
  [SquareInAppPaymentsFlutterPlugin registerWithRegistrar:[registry registrarForPlugin:@"SquareInAppPaymentsFlutterPlugin"]];
}

@end
