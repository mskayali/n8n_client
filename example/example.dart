// example/example.dart

import 'package:n8n_client/n8n_client.dart';

void main() async {
  // Initialize the client
  final client = N8NClient(
    baseUrl: 'https://your-n8n-instance.com/api/v1',
    apiKey: 'your-api-key-here',
  );

  // ============================================
  // WORKFLOWS
  // ============================================

  try {
    // List all workflows
    print('--- Workflows ---');
    final workflowsResponse = await client.workflows.getWorkflows(limit: 10);
    final workflowsData = workflowsResponse.data['data'] as List;

    for (var wfData in workflowsData) {
      final workflow = Workflow.fromJson(wfData);
      print('Workflow: ${workflow.name} (${workflow.id}) - Active: ${workflow.active}');
    }

    // Get a specific workflow with parsed model
    if (workflowsData.isNotEmpty) {
      final firstId = workflowsData.first['id'];
      final singleResponse = await client.workflows.getWorkflow(firstId);
      final workflow = Workflow.fromJson(singleResponse.data);

      print('\nWorkflow Details:');
      print('  Name: ${workflow.name}');
      print('  Nodes: ${workflow.nodes.length}');
      print('  Settings Timezone: ${workflow.settings.timezone ?? "default"}');

      // List node types
      for (var node in workflow.nodes) {
        print('  - Node: ${node.name} (${node.type})');
      }
    }
  } catch (e) {
    print('Workflows Error: $e');
  }

  // ============================================
  // EXECUTIONS
  // ============================================

  try {
    print('\n--- Executions ---');
    final executionsResponse = await client.executions.getExecutions(
      limit: 5,
      status: 'success',
    );
    final executionsData = executionsResponse.data['data'] as List;

    for (var execData in executionsData) {
      final execution = Execution.fromJson(execData);
      print('Execution #${execution.id}: ${execution.status} (${execution.mode})');
    }
  } catch (e) {
    print('Executions Error: $e');
  }

  // ============================================
  // USERS
  // ============================================

  try {
    print('\n--- Users ---');
    final usersResponse = await client.users.getUsers(limit: 10);
    final usersData = usersResponse.data['data'] as List;

    for (var userData in usersData) {
      final user = User.fromJson(userData);
      print('User: ${user.email} - ${user.firstName ?? ""} ${user.lastName ?? ""}');
    }
  } catch (e) {
    print('Users Error: $e');
  }

  // ============================================
  // TAGS
  // ============================================

  try {
    print('\n--- Tags ---');

    // Create a new tag
    final createResponse = await client.tags.createTag({'name': 'example-tag'});
    final tagId = createResponse.data['id'];
    print('Created tag: ${createResponse.data['name']} (ID: $tagId)');

    // List all tags
    final tagsResponse = await client.tags.getTags();
    final tagsData = tagsResponse.data['data'] as List;
    print('Total tags: ${tagsData.length}');

    for (var tagData in tagsData) {
      final tag = Tag.fromJson(tagData);
      print('  - ${tag.name} (${tag.id})');
    }

    // Delete the created tag
    await client.tags.deleteTag(tagId);
    print('Deleted tag: $tagId');
  } catch (e) {
    print('Tags Error: $e');
  }

  // ============================================
  // CREDENTIALS
  // ============================================

  try {
    print('\n--- Credentials ---');

    // Get credential schema for a type
    final schemaResponse =
        await client.credentials.getCredentialType('httpHeaderAuth');
    print('Schema for httpHeaderAuth: ${schemaResponse.data}');
  } catch (e) {
    print('Credentials Error: $e');
  }

  // ============================================
  // VARIABLES (requires elevated permissions)
  // ============================================

  try {
    print('\n--- Variables ---');
    final variablesResponse = await client.variables.getVariables(limit: 10);
    final variablesData = variablesResponse.data['data'] as List;

    for (var varData in variablesData) {
      final variable = Variable.fromJson(varData);
      print('Variable: ${variable.key} = ${variable.value}');
    }
  } catch (e) {
    print('Variables Error: $e');
  }

  // ============================================
  // PROJECTS (requires elevated permissions)
  // ============================================

  try {
    print('\n--- Projects ---');
    final projectsResponse = await client.projects.getProjects(limit: 10);
    final projectsData = projectsResponse.data['data'] as List;

    for (var projData in projectsData) {
      final project = Project.fromJson(projData);
      print('Project: ${project.name} (${project.id})');
    }
  } catch (e) {
    print('Projects Error: $e');
  }

  // ============================================
  // AUDIT
  // ============================================

  try {
    print('\n--- Security Audit ---');
    final auditResponse = await client.audit.generateAudit();
    final auditData = auditResponse.data as Map<String, dynamic>;

    print('Audit Report Categories:');
    for (var key in auditData.keys) {
      print('  - $key');
    }
  } catch (e) {
    print('Audit Error: $e');
  }

  print('\n--- Example Complete ---');
}
