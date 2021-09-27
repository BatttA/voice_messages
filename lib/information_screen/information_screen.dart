import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import 'package:voice_messages/main.dart';
import 'package:voice_messages/ui_components/shimmer_loader.dart';

class InformationScreen extends StatefulWidget {
  const InformationScreen({Key? key}) : super(key: key);

  @override
  _InformationScreenState createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  MediaQueryData get _queryData => MediaQuery.of(context);

  String _appVersion = '';

  Future<String> getAppVersion() async {
    try {
      final PackageInfo packageInfo = await PackageInfo.fromPlatform();
      _appVersion = packageInfo.version;
      logger.i(_appVersion);
      return packageInfo.version;
    } catch (e) {
      logger.e(e);
      return '1.0.0';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Информация',
          style: TextStyle(color: Colors.black54),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(bottom: _queryData.size.height * 0.1),
        child: Stack(
          children: [
            Column(
              children: [

              ],
            ),
            Positioned(
              bottom: 0,
              right: 30,
              child: FutureBuilder<String>(
                future: getAppVersion(),
                initialData: _appVersion,
                builder: (context, snapshot) {
                  if (!snapshot.hasData || (snapshot.data?.isEmpty ?? true)) {
                    return const Center(
                      child: TextShimmerLoaderWidget(
                        text: 'Версия: 1.0.0',
                      ),
                    );
                  }
                  final version = snapshot.data ?? '1.0.0';
                  return Center(
                    child: Text('Версия: $version'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
