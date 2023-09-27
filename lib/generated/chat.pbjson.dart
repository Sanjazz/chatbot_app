//
//  Generated code. Do not modify.
//  source: chat.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use promptDescriptor instead')
const Prompt$json = {
  '1': 'Prompt',
  '2': [
    {'1': 'prompt', '3': 1, '4': 1, '5': 9, '10': 'prompt'},
    {'1': 'collection_id', '3': 2, '4': 1, '5': 9, '10': 'collectionId'},
    {'1': 'options', '3': 3, '4': 1, '5': 11, '6': '.endpoint.brainboost.chat.v1.PromptOptions', '10': 'options'},
    {'1': 'documents', '3': 4, '4': 3, '5': 11, '6': '.endpoint.brainboost.chat.v1.Prompt.Document', '10': 'documents'},
  ],
  '3': [Prompt_Document$json],
};

@$core.Deprecated('Use promptDescriptor instead')
const Prompt_Document$json = {
  '1': 'Document',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'filename', '3': 2, '4': 1, '5': 9, '10': 'filename'},
    {'1': 'pages', '3': 3, '4': 3, '5': 13, '10': 'pages'},
  ],
};

/// Descriptor for `Prompt`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List promptDescriptor = $convert.base64Decode(
    'CgZQcm9tcHQSFgoGcHJvbXB0GAEgASgJUgZwcm9tcHQSIwoNY29sbGVjdGlvbl9pZBgCIAEoCV'
    'IMY29sbGVjdGlvbklkEkQKB29wdGlvbnMYAyABKAsyKi5lbmRwb2ludC5icmFpbmJvb3N0LmNo'
    'YXQudjEuUHJvbXB0T3B0aW9uc1IHb3B0aW9ucxJKCglkb2N1bWVudHMYBCADKAsyLC5lbmRwb2'
    'ludC5icmFpbmJvb3N0LmNoYXQudjEuUHJvbXB0LkRvY3VtZW50Uglkb2N1bWVudHMaTAoIRG9j'
    'dW1lbnQSDgoCaWQYASABKAlSAmlkEhoKCGZpbGVuYW1lGAIgASgJUghmaWxlbmFtZRIUCgVwYW'
    'dlcxgDIAMoDVIFcGFnZXM=');

@$core.Deprecated('Use promptOptionsDescriptor instead')
const PromptOptions$json = {
  '1': 'PromptOptions',
  '2': [
    {'1': 'model', '3': 1, '4': 1, '5': 9, '10': 'model'},
    {'1': 'temperature', '3': 2, '4': 1, '5': 2, '10': 'temperature'},
    {'1': 'max_tokens', '3': 3, '4': 1, '5': 13, '10': 'maxTokens'},
    {'1': 'threshold', '3': 4, '4': 1, '5': 2, '10': 'threshold'},
    {'1': 'limit', '3': 5, '4': 1, '5': 13, '10': 'limit'},
  ],
};

/// Descriptor for `PromptOptions`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List promptOptionsDescriptor = $convert.base64Decode(
    'Cg1Qcm9tcHRPcHRpb25zEhQKBW1vZGVsGAEgASgJUgVtb2RlbBIgCgt0ZW1wZXJhdHVyZRgCIA'
    'EoAlILdGVtcGVyYXR1cmUSHQoKbWF4X3Rva2VucxgDIAEoDVIJbWF4VG9rZW5zEhwKCXRocmVz'
    'aG9sZBgEIAEoAlIJdGhyZXNob2xkEhQKBWxpbWl0GAUgASgNUgVsaW1pdA==');

@$core.Deprecated('Use chatMessageDescriptor instead')
const ChatMessage$json = {
  '1': 'ChatMessage',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'collection_id', '3': 2, '4': 1, '5': 9, '10': 'collectionId'},
    {'1': 'prompt', '3': 3, '4': 1, '5': 11, '6': '.endpoint.brainboost.chat.v1.Prompt', '10': 'prompt'},
    {'1': 'text', '3': 4, '4': 1, '5': 9, '10': 'text'},
    {'1': 'documents', '3': 5, '4': 3, '5': 11, '6': '.endpoint.brainboost.chat.v1.ChatMessage.Document', '10': 'documents'},
    {'1': 'timestamp', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 0, '10': 'timestamp', '17': true},
  ],
  '3': [ChatMessage_Document$json],
  '8': [
    {'1': '_timestamp'},
  ],
};

@$core.Deprecated('Use chatMessageDescriptor instead')
const ChatMessage_Document$json = {
  '1': 'Document',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'filename', '3': 2, '4': 1, '5': 9, '10': 'filename'},
    {'1': 'pages', '3': 3, '4': 3, '5': 13, '10': 'pages'},
    {'1': 'scores', '3': 4, '4': 3, '5': 2, '10': 'scores'},
  ],
};

/// Descriptor for `ChatMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatMessageDescriptor = $convert.base64Decode(
    'CgtDaGF0TWVzc2FnZRIOCgJpZBgBIAEoCVICaWQSIwoNY29sbGVjdGlvbl9pZBgCIAEoCVIMY2'
    '9sbGVjdGlvbklkEjsKBnByb21wdBgDIAEoCzIjLmVuZHBvaW50LmJyYWluYm9vc3QuY2hhdC52'
    'MS5Qcm9tcHRSBnByb21wdBISCgR0ZXh0GAQgASgJUgR0ZXh0Ek8KCWRvY3VtZW50cxgFIAMoCz'
    'IxLmVuZHBvaW50LmJyYWluYm9vc3QuY2hhdC52MS5DaGF0TWVzc2FnZS5Eb2N1bWVudFIJZG9j'
    'dW1lbnRzEj0KCXRpbWVzdGFtcBgGIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBIAF'
    'IJdGltZXN0YW1wiAEBGmQKCERvY3VtZW50Eg4KAmlkGAEgASgJUgJpZBIaCghmaWxlbmFtZRgC'
    'IAEoCVIIZmlsZW5hbWUSFAoFcGFnZXMYAyADKA1SBXBhZ2VzEhYKBnNjb3JlcxgEIAMoAlIGc2'
    'NvcmVzQgwKCl90aW1lc3RhbXA=');

@$core.Deprecated('Use messageIDDescriptor instead')
const MessageID$json = {
  '1': 'MessageID',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `MessageID`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messageIDDescriptor = $convert.base64Decode(
    'CglNZXNzYWdlSUQSDgoCaWQYASABKAlSAmlk');

@$core.Deprecated('Use chatMessagesDescriptor instead')
const ChatMessages$json = {
  '1': 'ChatMessages',
  '2': [
    {'1': 'ids', '3': 1, '4': 3, '5': 9, '10': 'ids'},
  ],
};

/// Descriptor for `ChatMessages`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatMessagesDescriptor = $convert.base64Decode(
    'CgxDaGF0TWVzc2FnZXMSEAoDaWRzGAEgAygJUgNpZHM=');

