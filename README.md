# Flutter App Core

This repository is some kind of package that I import in all my personal Flutter projects because I reuse this code accross all my Flutter projects.
To avoid some copy/paste across all the projects and annoying updates, I have created this repository as a single source for my reusable code.

Also, since I write some articles about coding with Flutter, these packages are public so everybody can access it.

It currently includes:
- **ad_manager**: Google Mobile Ads utilities to display ads inside my apps
- **extensions**: Useful stuff to do some standard things that Flutter team did not implemented
- **firebase_storage_service**: A service class to perform upload and deletion on Firebase Cloud Storage
- **firestore_service**: A service class to perform reads and writes to a Firestore database
- **layout_builder**: My custom classes to display things the way I like in my Flutter apps
- **notifications**: A service class to handle notifications through Firebase Messaging
- **purchases**: A service class to handle in-app purchases and subscriptions with RevenueCat
- **sign_in**: A complete auth system including ui to authenticate users through Firebase Auth

NOTE: I will update and/or maintain these packages for my internal projects only, so breaking changes may be introduced at any time.

[LICENSE: MIT](LICENSE)
