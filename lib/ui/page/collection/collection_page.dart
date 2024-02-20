import 'package:braingain_app/generated/collection_service.pb.dart';
import 'package:braingain_app/generated/document_service.pb.dart';
import 'package:braingain_app/service/brainboost.dart';
import 'package:braingain_app/ui/page/upload/upload_body.dart';
import 'package:braingain_app/ui/page/upload/upload_page.dart';
import 'package:braingain_app/ui/widget/confirm_dialog.dart';
import 'package:braingain_app/ui/widget/constrained_list_view.dart';
import 'package:braingain_app/ui/widget/error_bar.dart';
import 'package:braingain_app/ui/widget/simple_scaffold.dart';
import 'package:braingain_app/ui/widget/webpage_index_dialog.dart';
import 'package:flutter/material.dart';

class CollectionPage extends StatelessWidget {
  const CollectionPage({super.key});

  static const route = 'documents';

  static Future<Object?> open(
    BuildContext context,
    Collection collection,
  ) =>
      Navigator.of(context).pushNamed(route, arguments: collection);

  @override
  Widget build(BuildContext context) {
    final collection =
        ModalRoute.of(context)?.settings.arguments as Collection?;

    if (collection == null) {
      return const ErrorScaffold(
        title: 'Collection',
        error: 'No collection found',
      );
    }

    return _CollectionPage(
      collection: collection,
    );
  }
}

class _CollectionPage extends StatefulWidget {
  const _CollectionPage({
    required this.collection,
  });

  final Collection collection;

  @override
  State createState() => _CollectionPageState();
}

class _CollectionPageState extends State<_CollectionPage> {
  void _onUpload() {
    UploadPage.openWithDialog(context, widget.collection)
        .then((_) => setState(() {}));
  }

  void _onIndexWebpage() {
    WebpageIndexDialog.show(context).then((url) {
      if (url == null || url.isEmpty) {
        return;
      }

      final page = Webpage()..url = url;
      final meta = DocumentMetadata()..web = page;

      final request = IndexJob()
        ..collectionId = widget.collection.id
        ..document = meta;

      documents.indexDocument(request).then((_) {
        SimpleSnackBar.show(
          context,
          'Indexed $url',
        );
      }).catchError((error) {
        ErrorSnackBar.show(context, error);
      });
    });
  }

  Future<void> _onEditDocument(String docId, String filename) async {
    // final ref = Document()
    //   ..collectionId = widget.collection.id
    //   ..filename = doc.filename
    //   ..id = doc.id;
    //
    // final filename = await EditDocumentDialog.show(context, ref);
    // if (filename == null || filename.isEmpty) {
    //   return;
    // }
    //
    // ref.filename = filename;
    //
    // documents.update(ref).then((_) {
    //   SimpleSnackBar.show(
    //     context,
    //     'Updated ${doc.filename}',
    //   );
    //   setState(() {});
    // }).catchError((error) {
    //   ErrorSnackBar.show(context, error);
    // });
  }

  Future<void> _onDelete(String docId, String filename) async {
    final delete = await ConfirmDialog.show(
      context,
      title: 'Delete $filename?',
      content: 'This action cannot be undone',
    );
    if (delete == null || !delete) {
      return;
    }

    final ref = DocumentID()..id = docId;
    documents.delete(ref).then((_) {
      SimpleSnackBar.show(
        context,
        'Deleted $filename',
      );
      setState(() {});
    }).catchError((error) {
      ErrorSnackBar.show(context, error);
    });
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.collection.name),
        actions: [
          IconButton(
            icon: const Icon(Icons.travel_explore_outlined),
            tooltip: 'Index Web Page',
            onPressed: _onIndexWebpage,
          ),
          IconButton(
            icon: const Icon(Icons.upload_file_outlined),
            tooltip: 'Upload Documents',
            onPressed: _onUpload,
          ),
        ],
      ),
      body: FutureBuilder<DocumentList>(
        future: documents.list(
          DocumentFilter()..collectionId = widget.collection.id,
        ),
        builder: (context, snap) {
          if (!snap.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snap.data!.items.isEmpty) {
            return UploadBody(
              collection: widget.collection,
            );
          }

          return ConstrainedListView(
              children: snap.data!.items.entries
                  .map(
                    (doc) => ListTile(
                      leading: Icon(
                        Icons.description_outlined,
                        color: color.primary,
                      ),
                      title: Text(
                        doc.value,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      subtitle: Text(
                        doc.key,
                        style: text.bodySmall?.merge(TextStyle(
                          color: color.outline,
                        )),
                      ),
                      trailing: PopupMenuButton(
                        itemBuilder: (context) => const [
                          PopupMenuItem(
                            value: 'edit',
                            child: Text('Edit'),
                          ),
                          PopupMenuItem(
                            value: 'delete',
                            child: Text('Delete'),
                          ),
                        ],
                        onSelected: (value) {
                          switch (value) {
                            case 'edit':
                              _onEditDocument(doc.key, doc.value);
                              break;
                            case 'delete':
                              _onDelete(doc.key, doc.value);
                              break;
                          }
                        },
                      ),
                    ),
                  )
                  .toList());
        },
      ),
    );
  }
}
