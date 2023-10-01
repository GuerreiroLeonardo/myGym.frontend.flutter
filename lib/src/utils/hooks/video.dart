import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:video_player/video_player.dart';

/// Creates a [FlickManager] that will be disposed automatically.
///
/// See also:
/// - [FlickManager]
FlickManager useFlickManager({
  required VideoPlayerController videoPlayerController,
  List<Object?>? keys,
}) {
  return use(
    _FlickManagerHook(
      videoPlayerController: videoPlayerController,
      keys: keys,
    ),
  );
}

class _FlickManagerHook extends Hook<FlickManager> {
  const _FlickManagerHook({
    required this.videoPlayerController,
    List<Object?>? keys,
  }) : super(keys: keys);

  final VideoPlayerController videoPlayerController;

  @override
  HookState<FlickManager, Hook<FlickManager>> createState() =>
      _FlickManagerHookState();
}

class _FlickManagerHookState
    extends HookState<FlickManager, _FlickManagerHook> {
  late final flickManager = FlickManager(
    videoPlayerController: hook.videoPlayerController,
  );

  @override
  FlickManager build(BuildContext context) => flickManager;

  @override
  void dispose() => flickManager.dispose();

  @override
  String get debugLabel => 'useFlickManager';
}
