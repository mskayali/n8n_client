// example/example.dart

import 'package:n8n_client/n8n_client.dart';

void main() async {
  final client = N8NClient(
    baseUrl: 'https://your-n8n-instance.com/api/v1',
    apiKey: 'your-api-key-here',
  );

  try {
    // Example: Retrieve all workflows
    final workflowsResponse = await client.workflows.getWorkflows(limit: 10);
    print('Workflows: ${workflowsResponse.data}');

    // Example: Create a new variable
    final newVariable = {
      'key': 'ENV_MODE',
      'value': 'production',
    };
    final variableResponse = await client.variables.createVariable(newVariable);
    print('Created Variable: ${variableResponse.data}');
  } catch (e) {
    print('Error: $e');
  }
}
