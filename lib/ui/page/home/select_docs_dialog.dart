import 'package:braingain_app/generated/braingain.pb.dart';
import 'package:braingain_app/service/braingain.dart';
import 'package:braingain_app/utils/page_numbers.dart';
import 'package:flutter/material.dart';

class SelectDocsDialog extends StatefulWidget {
  const SelectDocsDialog({
    super.key,
    this.preSelected,
  });

  final Map<String, List<int>>? preSelected;

  static Future<List<Prompt_Document>?> show(
    BuildContext context, [
    List<Prompt_Document>? documents,
  ]) {
    return showDialog<List<Prompt_Document>?>(
      context: context,
      builder: (context) {
        return SelectDocsDialog(
          preSelected: parseDocuments(documents ?? []),
        );
      },
    );
  }

  @override
  State createState() => _SelectDocsDialogState();
}

class _SelectDocsDialogState extends State<SelectDocsDialog> {
  String _query = '';
  final _formKey = GlobalKey<FormState>();

  Map<String, List<int>> _selectedDocs = <String, List<int>>{};

  @override
  void initState() {
    super.initState();

    if (widget.preSelected != null) {
      _selectedDocs = widget.preSelected!;
    }
  }

  @override
  Widget build(BuildContext context) {
    final request = DocumentQuery();
    request.query = _query;

    return AlertDialog(
      title: TextField(
        onChanged: (value) {
          setState(() => _query = value);
        },
        decoration: const InputDecoration(
          hintText: 'Search',
          border: InputBorder.none,
          prefixIcon: Icon(Icons.search),
        ),
      ),
      content: SizedBox(
        height: 400,
        width: 400,
        child: SingleChildScrollView(
          child: FutureBuilder<Documents>(
            future: braingain.getDocuments(request),
            builder: (context, snap) {
              if (snap.hasError) {
                return Center(
                  child: Text('Error: ${snap.error}'),
                );
              }

              if (!snap.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              return Form(
                key: _formKey,
                child: _DocumentsBody(
                  documents: snap.data!,
                  selected: _selectedDocs,
                  onChanged: (value) {
                    setState(() {
                      _selectedDocs = value;
                    });
                  },
                ),
              );
            },
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              Navigator.pop(context, formatDocuments(_selectedDocs));
            }
          },
          child: const Text('Submit'),
        ),
      ],
    );
  }
}

class _DocumentsBody extends StatefulWidget {
  const _DocumentsBody({
    required this.documents,
    required this.selected,
    required this.onChanged,
  });

  final Documents documents;
  final Map<String, List<int>> selected;
  final ValueChanged<Map<String, List<int>>> onChanged;

  @override
  State<_DocumentsBody> createState() => _DocumentsBodyState();
}

class _DocumentsBodyState extends State<_DocumentsBody> {
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;

    return Column(
      children: widget.documents.items
          .map((doc) => ListTile(
                leading: widget.selected.containsKey(doc.id)
                    ? Icon(
                        Icons.check_circle,
                        size: 16,
                        color: color.primary,
                      )
                    : const Icon(Icons.description, size: 16),
                title: Text(
                  doc.filename,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: text.bodySmall?.merge(TextStyle(
                    color: widget.selected.containsKey(doc.id)
                        ? color.primary
                        : color.onSurface,
                  )),
                ),
                subtitle: widget.selected.containsKey(doc.id)
                    ? TextFormField(
                        controller: TextEditingController(
                          text: formatPageList(widget.selected[doc.id]!),
                        ),
                        decoration: const InputDecoration.collapsed(
                          hintText: 'Pages',
                        ),
                        style: text.bodySmall?.merge(TextStyle(
                          color: color.outline,
                        )),
                        onFieldSubmitted: (text) {
                          widget.selected[doc.id] = parsePageList(text);
                          widget.onChanged(widget.selected);
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter page numbers';
                          }

                          final reg =
                              RegExp(r'^\d+(-\d+)?,?( *\d+(-\d+)?,?)*$');
                          if (!reg.hasMatch(value)) {
                            return 'Please enter page numbers correctly';
                          }

                          return null;
                        },
                      )
                    : Text(
                        'Pages: ${doc.pages}',
                        style: text.bodySmall?.merge(TextStyle(
                          color: color.outline,
                        )),
                      ),
                onTap: () {
                  if (widget.selected.containsKey(doc.id)) {
                    widget.selected.remove(doc.id);
                  } else {
                    widget.selected[doc.id] = [
                      for (int i = 1; i <= doc.pages; i++) i
                    ];
                  }

                  widget.onChanged(widget.selected);
                },
              ))
          .toList(),
    );
  }
}