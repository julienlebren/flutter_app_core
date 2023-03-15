library settings;

import 'dart:async';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_core/extensions/extensions.dart';
import 'package:flutter_app_core/firebase_auth/firebase_auth_service.dart';
import 'package:flutter_app_core/layout_builder/layout_builder.dart';
import 'package:flutter_app_core/localization/flutter_app_core_l10n.dart';
import 'package:flutter_app_core/localization/localization.dart';
import 'package:flutter_app_core/sign_in/sign_in.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'controllers/settings_account_controller.dart';
part 'controllers/settings_delete_controller.dart';
part 'controllers/settings_email_controller.dart';
part 'controllers/settings_password_controller.dart';
part 'core/extensions/sign_in_suppliers.dart';
part 'core/models/settings_state.dart';
part 'presentation/views/settings_account_page.dart';
part 'presentation/views/settings_delete_page.dart';
part 'presentation/views/settings_email_page.dart';
part 'presentation/views/settings_password_page.dart';
part 'presentation/widgets/anonymous_badge.dart';
part 'presentation/widgets/settings_page_builder.dart';
part 'router/settings_router.dart';

part 'settings.freezed.dart';
