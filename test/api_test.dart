// test/api_test.dart

import 'package:n8n_client/n8n_client.dart';

void main() async {
  final client = N8NClient(
    baseUrl: 'https://n8n.spinex.io/api/v1',
    apiKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhODQxN2ZkZi04ZWFkLTRlYmYtYmRiYS04ZWEwYjZmY2EzZTEiLCJpc3MiOiJuOG4iLCJhdWQiOiJwdWJsaWMtYXBpIiwiaWF0IjoxNzY4MjIzNTU5fQ.QJhWFbWV9tN4jlzcSI0BISgfV3EhqkY80kz-z5VXxT0',
  );

  print('=== n8n API Test ===\n');

  // Test 1: Get Workflows
  print('1. Testing getWorkflows()...');
  try {
    final workflowsResponse = await client.workflows.getWorkflows(limit: 10);
    print('   Status: ${workflowsResponse.statusCode}');
    print('   Data: ${workflowsResponse.data}');
    print('   SUCCESS\n');
  } catch (e) {
    print('   ERROR: $e\n');
  }

  // Test 2: Get Users
  print('2. Testing getUsers()...');
  try {
    final usersResponse = await client.users.getUsers(limit: 10);
    print('   Status: ${usersResponse.statusCode}');
    print('   Data: ${usersResponse.data}');
    print('   SUCCESS\n');
  } catch (e) {
    print('   ERROR: $e\n');
  }

  // Test 3: Get Executions
  print('3. Testing getExecutions()...');
  try {
    final executionsResponse = await client.executions.getExecutions(limit: 5);
    print('   Status: ${executionsResponse.statusCode}');
    print('   Data: ${executionsResponse.data}');
    print('   SUCCESS\n');
  } catch (e) {
    print('   ERROR: $e\n');
  }

  // Test 4: Get Tags
  print('4. Testing getTags()...');
  try {
    final tagsResponse = await client.tags.getTags(limit: 10);
    print('   Status: ${tagsResponse.statusCode}');
    print('   Data: ${tagsResponse.data}');
    print('   SUCCESS\n');
  } catch (e) {
    print('   ERROR: $e\n');
  }

  // Test 5: Get Variables
  print('5. Testing getVariables()...');
  try {
    final variablesResponse = await client.variables.getVariables(limit: 10);
    print('   Status: ${variablesResponse.statusCode}');
    print('   Data: ${variablesResponse.data}');
    print('   SUCCESS\n');
  } catch (e) {
    print('   ERROR: $e\n');
  }

  // Test 6: Get Projects
  print('6. Testing getProjects()...');
  try {
    final projectsResponse = await client.projects.getProjects(limit: 10);
    print('   Status: ${projectsResponse.statusCode}');
    print('   Data: ${projectsResponse.data}');
    print('   SUCCESS\n');
  } catch (e) {
    print('   ERROR: $e\n');
  }

  print('=== Tests Complete ===');
}
