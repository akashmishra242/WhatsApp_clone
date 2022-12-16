import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clone/config/agora_config.dart';
import 'package:whatsapp_clone/constants.dart' as c;
import 'package:whatsapp_clone/models/call.dart';

import '../../../common/utility/circularloader.dart';
import '../controller/call_controller.dart';

class CallScreen extends ConsumerStatefulWidget {
  final String channelId;
  final Call call;
  final bool isGroupChat;
  const CallScreen({
    Key? key,
    required this.channelId,
    required this.call,
    required this.isGroupChat,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CallScreenState();
}

class _CallScreenState extends ConsumerState<CallScreen> {
  AgoraClient? client;
  //String baseUrl = 'https://whatsapp-clone-rrr.herokuapp.com';
  String baseUrl = c.baseUrl;

  @override
  void initState() {
    super.initState();
    client = AgoraClient(
      agoraConnectionData: AgoraConnectionData(
        appId: AgoraConfig.appId,
        channelName: 'channel_2',
        //channelName: widget.channelId,
        tempToken:
            '007eJxTYNio8+Wp0Lvlt84rB5Uefn3EZGF98BOFbSbVs2y+8R7nu8uuwJBomZhoZmxqkGpskWZibpJqYWxqZJZkYGFqbGaWbJxkcLJgTnJDICNDdFwGEyMDBIL4nAzJGYl5eak58UYMDABpzyHt',

        //tokenUrl: baseUrl,
      ),
    );
    initAgora();
  }

  void initAgora() async {
    await client!.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: client == null
          ? const Loader()
          : SafeArea(
              child: Stack(
                children: [
                  AgoraVideoViewer(client: client!),
                  AgoraVideoButtons(
                    client: client!,
                    disconnectButtonChild: IconButton(
                      onPressed: () async {
                        await client!.engine.leaveChannel();
                        // ignore: use_build_context_synchronously
                        ref.read(callControllerProvider).endCall(
                              widget.call.callerId,
                              widget.call.receiverId,
                              context,
                            );
                        ref.read(callControllerProvider).endGroupCall(
                            widget.call.callerId,
                            widget.call.receiverId,
                            context);
                        // ignore: use_build_context_synchronously
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.call_end),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
