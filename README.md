# n8n Dart Client

A comprehensive Dart client package for interacting with the [n8n Public API](https://docs.n8n.io/api/).

Built and maintained by **Spinex IO**.

---

## Features

- Full coverage of n8n Public API endpoints
- Type-safe models with JSON serialization
- Pagination support
- Comprehensive error handling
- Easy-to-use client interface

## Supported APIs

| API | Methods |
|-----|---------|
| Workflows | Create, Get, Update, Delete, Activate, Deactivate, Transfer, Tags, Versions |
| Executions | List, Get, Delete, Retry |
| Users | List, Create, Get, Delete, Change Role |
| Credentials | Create, Update, Delete, Get Schema, Transfer |
| Tags | Create, List, Get, Update, Delete |
| Variables | Create, List, Update, Delete |
| Projects | Create, List, Update, Delete, Manage Users |
| Audit | Generate Security Audit |
| Source Control | Pull Changes |

---

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  n8n_client:
    git:
      url: https://github.com/spinex-io/n8n_client.git
```

Then run:

```bash
dart pub get
```

---

## Quick Start

```dart
import 'package:n8n_client/n8n_client.dart';

void main() async {
  final client = N8NClient(
    baseUrl: 'https://your-n8n-instance.com/api/v1',
    apiKey: 'your-api-key-here',
  );

  // Get all workflows
  final response = await client.workflows.getWorkflows(limit: 10);
  print('Workflows: ${response.data}');
}
```

---

## Usage Examples

### Workflows

```dart
// List workflows
final workflows = await client.workflows.getWorkflows(
  active: true,
  limit: 20,
  tags: 'production',
);

// Get a single workflow
final workflow = await client.workflows.getWorkflow('workflow-id');

// Create a workflow
final newWorkflow = await client.workflows.createWorkflow({
  'name': 'My Workflow',
  'nodes': [],
  'connections': {},
  'settings': {},
});

// Activate/Deactivate workflow
await client.workflows.activateWorkflow('workflow-id');
await client.workflows.deactivateWorkflow('workflow-id');

// Get workflow version
final version = await client.workflows.getWorkflowVersion('workflow-id', 'version-id');

// Transfer workflow to another project
await client.workflows.transferWorkflow('workflow-id', 'destination-project-id');
```

### Executions

```dart
// List executions
final executions = await client.executions.getExecutions(
  status: 'success',
  workflowId: 'workflow-id',
  limit: 50,
);

// Get a single execution
final execution = await client.executions.getExecution('execution-id', includeData: true);

// Retry a failed execution
await client.executions.retryExecution('execution-id', loadWorkflow: true);

// Delete an execution
await client.executions.deleteExecution('execution-id');
```

### Users

```dart
// List users
final users = await client.users.getUsers(limit: 10, includeRole: true);

// Get a user by ID or email
final user = await client.users.getUser('user@example.com');

// Create users (invite)
final newUsers = await client.users.createUsers([
  {'email': 'newuser@example.com', 'role': 'global:member'},
]);

// Change user role
await client.users.changeRole('user-id', 'global:admin');
```

### Credentials

```dart
// Create a credential
final credential = await client.credentials.createCredential({
  'name': 'My API Key',
  'type': 'httpHeaderAuth',
  'data': {'name': 'Authorization', 'value': 'Bearer xxx'},
});

// Update a credential
await client.credentials.updateCredential('credential-id',
  name: 'Updated Name',
  data: {'key': 'new-value'},
);

// Get credential schema
final schema = await client.credentials.getCredentialType('httpHeaderAuth');

// Transfer credential to another project
await client.credentials.transferCredential('credential-id', 'project-id');
```

### Tags

```dart
// Create a tag
final tag = await client.tags.createTag({'name': 'production'});

// List all tags
final tags = await client.tags.getTags(limit: 50);

// Update a tag
await client.tags.updateTag('tag-id', {'name': 'staging'});

// Delete a tag
await client.tags.deleteTag('tag-id');
```

### Variables

```dart
// Create a variable
final variable = await client.variables.createVariable({
  'key': 'API_URL',
  'value': 'https://api.example.com',
});

// List variables
final variables = await client.variables.getVariables(limit: 100);

// Update a variable
await client.variables.updateVariable('variable-id',
  key: 'API_URL',
  value: 'https://new-api.example.com',
);

// Delete a variable
await client.variables.deleteVariable('variable-id');
```

### Projects

```dart
// Create a project
final project = await client.projects.createProject({'name': 'My Project'});

// List projects
final projects = await client.projects.getProjects(limit: 20);

// Update a project
await client.projects.updateProject('project-id', {'name': 'Renamed Project'});

// Add users to a project
await client.projects.addUsersToProject('project-id', [
  {'userId': 'user-id', 'role': 'project:editor'},
]);

// Change user role in project
await client.projects.changeUserRoleInProject('project-id', 'user-id', 'project:admin');

// Remove user from project
await client.projects.removeUserFromProject('project-id', 'user-id');
```

### Audit

```dart
// Generate a security audit
final audit = await client.audit.generateAudit({
  'daysAbandonedWorkflow': 90,
  'categories': ['credentials', 'nodes'],
});
```

### Source Control

```dart
// Pull changes from remote repository
final result = await client.sourceControl.pullChanges({
  'force': false,
  'variables': {'ENV': 'production'},
});
```

---

## Models

The SDK includes type-safe models for all API responses:

```dart
// Parse workflow response into model
final response = await client.workflows.getWorkflow('workflow-id');
final workflow = Workflow.fromJson(response.data);

print('Name: ${workflow.name}');
print('Active: ${workflow.active}');
print('Nodes: ${workflow.nodes.length}');

// Parse execution response
final execResponse = await client.executions.getExecution('exec-id');
final execution = Execution.fromJson(execResponse.data);

print('Status: ${execution.status}'); // ExecutionStatus.success
print('Mode: ${execution.mode}');
```

### Available Models

- `Workflow`, `Node`, `WorkflowSettings`, `WorkflowShare`, `ActiveVersion`
- `Execution`, `ExecutionStatus`, `ExecutionMode`
- `User`
- `Credential`, `CredentialSchema`, `CredentialProperty`
- `Tag`
- `Variable`
- `Project`, `ProjectRelation`
- `AuditReport`, `RiskReport`, `RiskSection`, `RiskLocation`
- `ImportResult`, `PullOptions`
- `PaginatedList<T>` and typed list responses

---

## Error Handling

```dart
try {
  final workflow = await client.workflows.getWorkflow('invalid-id');
} catch (e) {
  print('Error: $e');
  // Output: Exception: Failed to retrieve workflow: ...
}
```

---

## API Reference

For detailed API documentation, see the [n8n API Reference](https://docs.n8n.io/api/api-reference/).

---

## License

MIT License - see LICENSE file for details.

---

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

---

## Support

For issues and feature requests, please use the [GitHub Issues](https://github.com/spinex-io/n8n_client/issues) page.

---

**Built with ❤️ by [Spinex IO](https://spinex.io)**
