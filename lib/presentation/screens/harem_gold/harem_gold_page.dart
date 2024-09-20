import 'dart:convert';
import 'dart:io';

import 'package:asset_tracker/models/harem_response_model.dart';
import 'package:asset_tracker/utils/enums/asset_type.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class HaremGoldPage extends StatefulWidget {
  const HaremGoldPage({super.key});

  @override
  _HaremGoldPageState createState() => _HaremGoldPageState();
}

class _HaremGoldPageState extends State<HaremGoldPage> {
  late WebSocketChannel channel;
  late HaremResponseModel _responseModel;

  @override
  void initState() {
    super.initState();
    _responseModel = const HaremResponseModel.empty();
    Future.microtask(() => setupSocket());
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }

  Future<void> setupSocket() async {
    channel = WebSocketChannel.connect(
      Uri.parse('wss://socket.haremaltin.com/socket.io/?EIO=4&transport=websocket'),
    );

    try {
      await channel.ready;
    } on SocketException catch (e) {
      debugPrint(e.message);
    } on WebSocketChannelException catch (e) {
      debugPrint(e.message ?? e.toString());
    }

    channel.stream.listen(
      (message) {
        if (message == null) {
          return;
        }

        final isFirstMessage = message.toString().startsWith('0');
        if (isFirstMessage) {
          channel.sink.add('40');
        } else if (message.toString().startsWith('42["price_changed",')) {
          var jsonString = message.toString().replaceAll('42["price_changed",', '');
          jsonString = jsonString.replaceAll(']', '');
          final json = jsonDecode(jsonString);
          _setResponseByJson(json);
        }
      },
      onDone: () {
        debugPrint('DONE!!');
        channel.sink.close();
        //channel.sink.add('40');
      },
      onError: (_) => debugPrint('ERROR'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Harem Altın Fiyat Tablosu')),
      body: _responseModel.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Center(child: Text('Güncelleme Tarihi: ${_responseModel.meta.dateTime}')),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: _responseModel.assets.length,
                    itemBuilder: (context, index) {
                      final item = _responseModel.assets[index];
                      return ListTile(
                        title: Text(item.code.toAssetType().name),
                        subtitle: Text('Alış: ${item.buyingPrice} / Satış: ${item.sellingPrice}'),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }

  void _setResponseByJson(Map<String, dynamic> json) {
    final updatedResponse = HaremResponseModel.fromJson(json);
    setState(() {
      _responseModel = _responseModel.copyWith(
        data: _responseModel.data.copyFromAnother(updatedResponse.data),
        meta: updatedResponse.meta,
      );
    });
  }
}
