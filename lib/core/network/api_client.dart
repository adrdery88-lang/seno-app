class ApiClient {
  Future<Map<String, dynamic>> callEdgeFunction(String functionName, Map<String, dynamic> body) async {
    // Simulated proxy edge function call for Gemini, Cloud TTS, Cloud STT
    await Future.delayed(const Duration(milliseconds: 300));
    return {
      'status': 'success',
      'function': functionName,
      'data': body,
    };
  }
}
