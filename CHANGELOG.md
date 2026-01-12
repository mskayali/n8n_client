# Change Log

All notable changes to this project will be documented in this file.

## [0.2.0] - 2025-01-12

### Added

- **New API Methods:**
  - `WorkflowsApi.getWorkflowVersion()` - Retrieve specific workflow version
  - `ExecutionsApi.retryExecution()` - Retry failed executions
  - `CredentialsApi.updateCredential()` - Update existing credentials
  - `VariablesApi.updateVariable()` - Update existing variables
  - `ProjectsApi.addUsersToProject()` - Add users to a project
  - `ProjectsApi.removeUserFromProject()` - Remove user from project
  - `ProjectsApi.changeUserRoleInProject()` - Change user role in project

- **New Models:**
  - `Node` - Workflow node with full property support
  - `WorkflowSettings` - Workflow configuration settings
  - `WorkflowShare` - Workflow sharing/permissions
  - `ActiveVersion` - Workflow version tracking
  - `ExecutionStatus` enum - Execution state values
  - `ExecutionMode` enum - Execution trigger types
  - `CredentialSchema` - Credential type schema definition
  - `CredentialProperty` - Credential property definition
  - `CredentialPropertyOption` - Credential property options
  - `ProjectRelation` - Project user relations
  - `AuditReport` - Security audit report
  - `RiskReport`, `RiskSection`, `RiskLocation` - Audit risk details
  - `AuditOptions` - Audit generation options
  - `PaginatedList<T>` - Generic paginated response
  - Typed list responses for all entities

- **Enhanced Models:**
  - `Workflow` - Added `shared`, `activeVersion` fields, proper `Node` typing
  - `Execution` - Added `status` enum, `workflowName`, String IDs
  - `Credential` - Added `isResolvable`, `isGlobal`, `isPartialData`
  - `Variable` - Added `projectId`, `project` relation
  - `Project` - Added `createdAt`, `updatedAt`, `relations`

- **Enhanced API Methods:**
  - `WorkflowsApi.activateWorkflow()` - Added `versionId`, `name`, `description` params
  - `VariablesApi.getVariables()` - Added `projectId`, `state` params

- **Library Exports:**
  - All models now exported from main `n8n_client.dart`
  - All API classes exported for direct access
  - Utilities exported (`ApiException`)

### Changed

- `ExecutionsApi` methods now use `String` for ID parameters (n8n uses alphanumeric IDs)
- `Execution` model uses `String` for `id`, `workflowId`, `retryOf`, `retrySuccessId`
- `Node.typeVersion` changed to `dynamic` to support both int and object values

### Fixed

- Workflow model parsing with real n8n API responses
- Execution model parsing with alphanumeric IDs
- Node typeVersion field type compatibility

## [0.1.0] - 2025-05-13

### Initial Release

- Basic API client with authentication
- Workflows API (CRUD, activate, deactivate, transfer, tags)
- Executions API (list, get, delete)
- Users API (list, create, get, delete, change role)
- Credentials API (create, delete, get schema, transfer)
- Tags API (CRUD)
- Variables API (create, list, delete)
- Projects API (CRUD)
- Audit API (generate)
- Source Control API (pull)
- Basic models for all entities
