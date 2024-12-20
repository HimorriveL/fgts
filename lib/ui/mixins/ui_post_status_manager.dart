import 'package:flutter/material.dart';

import '../../domain/entities/all.dart';
import '../components/post_status_message.dart';

mixin UIPostStatusManager {
  void handlePostStatus(BuildContext context, Stream<DocumentEntity?> stream) {
    stream.listen((status) {
      if (status != null) {
        postStatusMessage(context, status);
      }
    });
  }
}
