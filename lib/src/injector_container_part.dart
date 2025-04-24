import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_retry_plus/dio_retry_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rick_and_morty/src/core/constants/constants.dart';


import 'config/router/app_routes.dart';

import 'core/platform/network_info.dart';
import 'data/source/local_source.dart';
import 'presentation/bloc/main_bloc/main_bloc.dart';
import 'presentation/bloc/splash_bloc/splash_bloc.dart';

part 'injector_container.dart';