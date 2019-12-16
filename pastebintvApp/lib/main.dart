import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pastebintv/blocs/channels_bloc/bloc.dart';
import 'package:pastebintv/routes.dart';
import 'package:pastebintv/screens/channels_screen.dart';
import 'package:pastebintv/theme/style.dart';

void main() => runApp(PastebinTV());

class PastebinTV extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ChannelsBloc>(
        builder: (context) {
          return ChannelsBloc()..add(LoadChannels());
        },
        child: MaterialApp(
          title: 'PastebinTV',
          theme: theme,
          initialRoute: '/',
          routes: routes,
        ));
  }
}
