import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:pastebintv/models/channel.dart';
import 'package:pastebintv/models/channels.dart';
import 'package:pastebintv/services/service.dart';
import './bloc.dart';

class ChannelsBloc extends Bloc<ChannelsEvent, ChannelsState> {
  @override
  ChannelsState get initialState => ChannelsState.initialState();

  @override
  void onTransition(Transition<ChannelsEvent, ChannelsState> transition) {
    print(transition);
  }

  @override
  Stream<ChannelsState> mapEventToState(
    ChannelsEvent event,
  ) async* {
    final ChannelsState currentState = state;
    if (event is LoadChannels) {
      final newState = currentState.copyWith(isLoading: true);
      yield newState;
      Channels channels = await getChannels();
      yield newState.copyWith(channels: channels, isLoading: false);
      //Todo faire le call ici et faire un yield du nouveau state (si success ou error)
    }
    if (event is SelectChannel) {
      final newState = currentState.copyWith(
          channelSelected: event.channelSelected,
          isLoading: false,
          isPlayerInitialized: false);
      yield newState;
    }
    if (event is PlayerInitalized) {
      yield state.copyWith(isPlayerInitialized: true);
    }
  }
}
