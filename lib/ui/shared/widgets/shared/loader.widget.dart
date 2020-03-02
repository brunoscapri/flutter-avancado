import 'package:flutter/material.dart';
import 'package:shopping/ui/shared/widgets/shared/progress-indicator.widget.dart';

class Loader extends StatelessWidget {
  final object;
  final Function callback;

  Loader({@required this.object, this.callback});

  @override
  Widget build(BuildContext context) {
    if (object == null) {
      return Center(
        child: GenericProgressIndicator(),
      );
    }
    if (object.length == 0) {
      return Center(
        child: Text("Nenhum item foi encontrado."),
      );
    }

    return callback();
  }
}
