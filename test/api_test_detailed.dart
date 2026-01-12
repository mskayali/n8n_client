// test/api_test_detailed.dart

import 'package:n8n_client/n8n_client.dart';

void main() async {
  final client = N8NClient(
    baseUrl: 'https://n8n.spinex.io/api/v1',
    apiKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhODQxN2ZkZi04ZWFkLTRlYmYtYmRiYS04ZWEwYjZmY2EzZTEiLCJpc3MiOiJuOG4iLCJhdWQiOiJwdWJsaWMtYXBpIiwiaWF0IjoxNzY4MjIzNTU5fQ.QJhWFbWV9tN4jlzcSI0BISgfV3EhqkY80kz-z5VXxT0',
  );

  print('=== n8n API Detailed Tests ===\n');

  // Test: Get single workflow
  print('1. Testing getWorkflow(id)...');
  try {
    final response = await client.workflows.getWorkflow('1okDIQIYmKXqS2cr');
    print('   Status: ${response.statusCode}');
    final data = response.data;
    print('   Workflow Name: ${data['name']}');
    print('   Active: ${data['active']}');
    print('   Nodes Count: ${(data['nodes'] as List?)?.length ?? 0}');
    print('   SUCCESS\n');
  } catch (e) {
    print('   ERROR: $e\n');
  }

  // Test: Get workflow tags
  print('2. Testing getWorkflowTags(id)...');
  try {
    final response = await client.workflows.getWorkflowTags('1okDIQIYmKXqS2cr');
    print('   Status: ${response.statusCode}');
    print('   Tags: ${response.data}');
    print('   SUCCESS\n');
  } catch (e) {
    print('   ERROR: $e\n');
  }

  // Test: Create and delete a tag
  print('3. Testing createTag() and deleteTag()...');
  try {
    final createResponse = await client.tags.createTag({'name': 'test-tag-sdk'});
    print('   Create Status: ${createResponse.statusCode}');
    final tagId = createResponse.data['id'];
    print('   Created Tag ID: $tagId');

    // Delete the tag
    final deleteResponse = await client.tags.deleteTag(tagId);
    print('   Delete Status: ${deleteResponse.statusCode}');
    print('   SUCCESS\n');
  } catch (e) {
    print('   ERROR: $e\n');
  }

  // Test: Parse workflow into model
  print('4. Testing Workflow model parsing...');
  try {
    final response = await client.workflows.getWorkflow('1okDIQIYmKXqS2cr');
    final workflow = Workflow.fromJson(response.data);
    print('   Workflow ID: ${workflow.id}');
    print('   Workflow Name: ${workflow.name}');
    print('   Active: ${workflow.active}');
    print('   Nodes: ${workflow.nodes.length}');
    print('   First Node Type: ${workflow.nodes.isNotEmpty ? workflow.nodes.first.type : "N/A"}');
    print('   Settings Timezone: ${workflow.settings.timezone ?? "default"}');
    print('   SUCCESS\n');
  } catch (e) {
    print('   ERROR: $e\n');
  }

  // Test: Parse users into model
  print('5. Testing User model parsing...');
  try {
    final response = await client.users.getUsers(limit: 5);
    final usersData = response.data['data'] as List;
    for (var userData in usersData) {
      final user = User.fromJson(userData);
      print('   User: ${user.email} (${user.firstName ?? ""} ${user.lastName ?? ""}) - Role: ${user.role ?? "N/A"}');
    }
    print('   SUCCESS\n');
  } catch (e) {
    print('   ERROR: $e\n');
  }

  // Test: Parse executions into model
  print('6. Testing Execution model parsing...');
  try {
    final response = await client.executions.getExecutions(limit: 3);
    final executionsData = response.data['data'] as List;
    for (var execData in executionsData) {
      final exec = Execution.fromJson(execData);
      print('   Execution #${exec.id}: mode=${exec.mode}, status=${exec.status}, finished=${exec.finished}');
    }
    print('   SUCCESS\n');
  } catch (e) {
    print('   ERROR: $e\n');
  }

  // Test: Generate Audit
  print('7. Testing generateAudit()...');
  try {
    final response = await client.audit.generateAudit();
    print('   Status: ${response.statusCode}');
    print('   Audit Keys: ${(response.data as Map).keys.toList()}');
    print('   SUCCESS\n');
  } catch (e) {
    print('   ERROR: $e\n');
  }

  print('=== Detailed Tests Complete ===');
}
