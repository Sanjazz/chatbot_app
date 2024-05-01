class LLMModel {
  const LLMModel({
    required this.title,
    required this.model,
    required this.provider,
  });

  final String title;
  final String model;
  final String provider;
}

class LLMModels {
  static const LLMModel gpt4 = LLMModel(
    title: 'GPT 4 Turbo',
    model: 'openai.gpt-4-turbo',
    provider: 'OpenAI',
  );

  static const LLMModel claudeOpus = LLMModel(
    title: 'Claude Opus',
    model: 'anthropic.claude-3-opus-20240229-v1:0',
    provider: 'Anthropic',
  );

  static const LLMModel claudeSonnet = LLMModel(
    title: 'Claude 3 Sonnet',
    model: 'anthropic.claude-3-sonnet-20240229-v1:0',
    provider: 'Anthropic',
  );

  static const LLMModel claudeHaiku = LLMModel(
    title: 'Claude 3 Haiku',
    model: 'anthropic.claude-3-haiku-20240307-v1:0',
    provider: 'Anthropic',
  );

  static const LLMModel geminiPro = LLMModel(
    title: 'Gemini Pro 1.0',
    model: 'google.gemini-1.0-pro',
    provider: 'Google',
  );

  static const LLMModel geminiPro15 = LLMModel(
    title: 'Gemini Pro 1.5',
    model: 'google.gemini-1.5-pro-preview-0409',
    provider: 'Google',
  );

  static const List<LLMModel> all = [
    gpt4,
    claudeOpus,
    claudeSonnet,
    claudeHaiku,
    geminiPro,
    geminiPro15,
  ];

  static LLMModel fromModel(String model) {
    return all.firstWhere(
      (element) => element.model == model,
      orElse: () => gpt4,
    );
  }
}
