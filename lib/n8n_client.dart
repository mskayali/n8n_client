// lib/n8n_client.dart

library n8n_client;

import 'package:dio/dio.dart';

import 'api/api_client.dart';
import 'api/audit_api.dart';
import 'api/credentials_api.dart';
import 'api/executions_api.dart';
import 'api/projects_api.dart';
import 'api/source_control_api.dart';
import 'api/tags_api.dart';
import 'api/users_api.dart';
import 'api/variables_api.dart';
import 'api/workflows_api.dart';

// Export all models
export 'models/audit.dart';
export 'models/credential.dart';
export 'models/execution.dart';
export 'models/import_result.dart';
export 'models/pagination.dart';
export 'models/project.dart';
export 'models/pull.dart';
export 'models/tag.dart';
export 'models/user.dart';
export 'models/variable.dart';
export 'models/workflow.dart';

// Export API classes
export 'api/audit_api.dart';
export 'api/credentials_api.dart';
export 'api/executions_api.dart';
export 'api/projects_api.dart';
export 'api/source_control_api.dart';
export 'api/tags_api.dart';
export 'api/users_api.dart';
export 'api/variables_api.dart';
export 'api/workflows_api.dart';

// Export utilities
export 'utils/api_exception.dart';

class N8NClient {
  final Dio _dio;
  late final AuditApi audit;
  late final CredentialsApi credentials;
  late final ExecutionsApi executions;
  late final TagsApi tags;
  late final UsersApi users;
  late final WorkflowsApi workflows;
  late final VariablesApi variables;
  late final ProjectsApi projects;
  late final SourceControlApi sourceControl;

  N8NClient({
    required String baseUrl,
    required String apiKey,
  }) : _dio = ApiClient(baseUrl: baseUrl, apiKey: apiKey).dio {
    audit = AuditApi(_dio);
    credentials = CredentialsApi(_dio);
    executions = ExecutionsApi(_dio);
    tags = TagsApi(_dio);
    users = UsersApi(_dio);
    workflows = WorkflowsApi(_dio);
    variables = VariablesApi(_dio);
    projects = ProjectsApi(_dio);
    sourceControl = SourceControlApi(_dio);
  }
}
