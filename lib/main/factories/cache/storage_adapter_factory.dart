import 'package:get_storage/get_storage.dart';

import '../../../infra/cache/all.dart';

StorageAdapter makeStorageAdapter() => StorageAdapter(storage: GetStorage());
