README.md
markdown
Copy
Edit
# n8n Dart Client

A Dart client package for interacting with the [n8n Public API](https://docs.n8n.io/api/).

Built and maintained by **Spinex IO**.

---

## 📦 Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  n8n_client:
    git:
      url: https://github.com/spinex-io/n8n_client.git
or simply clone it.

🚀 Quick Start
1. Initialize the Client
dart
Copy
Edit
import 'package:n8n_client/n8n_client.dart';

final client = N8NClient(
  baseUrl: 'https://your-n8n-instance.com/api/v1', // Important: Ends with /api/v1
  apiKey: 'your-n8n-api-key-here',
);
🔒 Authentication is handled via X-N8N-API-KEY header automatically.

🔐 Authentication
Authentication with n8n's API uses an API Key.

You can find or generate your API Key inside your n8n User Settings (Settings -> API Key).

Once you have it, you pass it during client creation:

dart
Copy
Edit
final client = N8NClient(
  baseUrl: 'https://your-n8n-instance.com/api/v1',
  apiKey: 'your-api-key',
);
Done. All future requests are authenticated. ✅

🧰 Common Usage Examples
✨ Create a New Credential
dart
Copy
Edit
final credentialData = {
  'name': 'My Github Credential',
  'type': 'github',
  'data': {
    'token': 'your-github-token-here',
  },
};

try {
  final response = await client.credentials.createCredential(credentialData);
  print('Created Credential: ${response.data}');
} catch (e) {
  print('Error creating credential: $e');
}
🔄 Generate a Security Audit Report
dart
Copy
Edit
try {
  final response = await client.audit.generateAudit();
  print('Audit Result: ${response.data}');
} catch (e) {
  print('Error generating audit: $e');
}
📄 Create a New Workflow
dart
Copy
Edit
final workflowData = {
  'name': 'New Workflow',
  'nodes': [],
  'connections': {},
  'settings': {},
};

try {
  final response = await client.workflows.createWorkflow(workflowData);
  print('Created Workflow: ${response.data}');
} catch (e) {
  print('Error creating workflow: $e');
}
🏷️ Create and List Tags
dart
Copy
Edit
// Create a Tag
final newTag = {
  'name': 'Production',
};

try {
  final createTagResponse = await client.tags.createTag(newTag);
  print('Created Tag: ${createTagResponse.data}');
} catch (e) {
  print('Error creating tag: $e');
}

// List Tags
try {
  final listTagsResponse = await client.tags.getTags();
  print('Tags: ${listTagsResponse.data}');
} catch (e) {
  print('Error listing tags: $e');
}
🏁 Retrieve All Executions
dart
Copy
Edit
try {
  final executions = await client.executions.getExecutions(limit: 5);
  print('Executions: ${executions.data}');
} catch (e) {
  print('Error retrieving executions: $e');
}
🛡️ Error Handling
All API calls are wrapped safely with try/catch.

You can also catch specific network errors:

dart
Copy
Edit
try {
  final workflows = await client.workflows.getWorkflows();
  print(workflows.data);
} on ApiException catch (e) {
  print('API Exception: ${e.message}');
} catch (e) {
  print('Unexpected error: $e');
}
📚 Full API Coverage
This client supports:

Users

Workflows

Executions

Credentials

Tags

Variables

Projects

Source Control

Security Audit

🛠️ Contributing
PRs are welcome!
Feel free to open issues and make suggestions at GitHub Issues.

⚖️ License
This project is licensed under the MIT License.

Built with ❤️ by Spinex IO

yaml
Copy
Edit

---

# 📢 **Changes compared to old README:**
- More detailed sections
- Authentication guide
- API examples for workflows, credentials, audit, tags, executions
- Example of safe error handling
- Professional Spinex IO credits

---

✅ Now your Dart SDK looks **enterprise-grade** and **ready for developers**.

---

Would you also like a bonus **GitHub folder structure + suggested repo structure** so if you upload it, it looks even better? 📂✨  
I can suggest that in one quick shot too! 🚀  
Want it?





You said:
