import 'package:flutter/material.dart';
import 'package:ruta_go/model/dbz_model.dart';
import 'package:ruta_go/service/dbz_service.dart';

class DbzScreen extends StatefulWidget {
  const DbzScreen({super.key});

  @override
  State<DbzScreen> createState() => _DbzScreenState();
}

class _DbzScreenState extends State<DbzScreen> {
  int page = 1;
  List<DbzModel> dbzList = [];
  final ScrollController _scroll = ScrollController();

  bool isLoading = false;
  bool isFirstLoad = true;

  // 🔥 Cargar datos (paginación)
  Future<void> getData() async {
    if (isLoading) return;

    isLoading = true;

    try {
      final dbzService = DbzService();
      final response = await dbzService.getDbz(page);

      if (!mounted) return;

      setState(() {
        page++;
        dbzList.addAll(response);
        isFirstLoad = false;
      });
    } catch (e) {
      debugPrint('Error getData: $e');
    }

    isLoading = false;
  }

  Future<void> onRefresh() async {
    try {
      final dbzService = DbzService();
      final response = await dbzService.getDbz(1);

      if (!mounted) return;

      setState(() {
        page = 2;
        dbzList = response;
      });

      _scroll.jumpTo(0);
    } catch (e) {
      debugPrint('Error refresh: $e');
    }
  }

  @override
  void initState() {
    super.initState();

    getData();

    _scroll.addListener(() {
      if (_scroll.position.pixels >= _scroll.position.maxScrollExtent - 200) {
        getData();
      }
    });
  }

  @override
  void dispose() {
    _scroll.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dragon Ball')),

      body: isFirstLoad
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: onRefresh,
              child: ListView.builder(
                controller: _scroll,
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: dbzList.length + (isLoading ? 1 : 0),
                itemBuilder: (context, index) {
                  // 🔄 Loader al final (infinite scroll)
                  if (index == dbzList.length) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }

                  final item = dbzList[index];

                  return ListTile(
                    title: Text(item.name),
                    subtitle: Text(
                      item.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    leading: Image.network(
                      item.image,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => const Icon(Icons.error),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
