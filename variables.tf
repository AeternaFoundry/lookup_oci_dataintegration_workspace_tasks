variable "dataintegration_workspace_tasks_lookup" {
  description = <<EOT
Map of dataintegration_workspace_tasks_lookup, attributes below
Required:
    - workspace_id
Optional:
    - fields
    - folder_id
    - identifier
    - key
    - name
    - type
    - filter (block):
        - name (required)
        - regex (optional)
        - values (required)
EOT

  type = map(object({
    workspace_id = string
    fields       = optional(list(string))
    folder_id    = optional(string)
    identifier   = optional(list(string))
    key          = optional(list(string))
    name         = optional(string)
    type         = optional(list(string))
    filter = optional(list(object({
      name   = string
      regex  = optional(bool)
      values = list(string)
    })))
  }))
  validation {
    condition = alltrue([
      for k, v in var.dataintegration_workspace_tasks_lookup : (
        alltrue([for item in v.task_summary_collection : (item.items == null || alltrue([for item in item.items : (item.model_type == null || (contains([for v in ["REST_TASK"] : lower(v)], lower(item.model_type))))]))])
      )
    ])
    error_message = "must be one of: \"REST_TASK\""
  }
  validation {
    condition = alltrue([
      for k, v in var.dataintegration_workspace_tasks_lookup : (
        alltrue([for item in v.task_summary_collection : (item.items == null || alltrue([for item in item.items : (item.api_call_mode == null || (contains(["SYNCHRONOUS", "ASYNC_GENERIC"], item.api_call_mode)))]))])
      )
    ])
    error_message = "must be one of: \"SYNCHRONOUS\", \"ASYNC_GENERIC\""
  }
  validation {
    condition = alltrue([
      for k, v in var.dataintegration_workspace_tasks_lookup : (
        alltrue([for item in v.task_summary_collection : (item.items == null || alltrue([for item in item.items : (item.auth_config == null || alltrue([for item in item.auth_config : (item.model_type == null || (contains([for v in ["OCI_RESOURCE_AUTH_CONFIG", "NO_AUTH_CONFIG"] : lower(v)], lower(item.model_type))))]))]))])
      )
    ])
    error_message = "must be one of: \"OCI_RESOURCE_AUTH_CONFIG\", \"NO_AUTH_CONFIG\""
  }
  validation {
    condition = alltrue([
      for k, v in var.dataintegration_workspace_tasks_lookup : (
        alltrue([for item in v.task_summary_collection : (item.items == null || alltrue([for item in item.items : (item.auth_config == null || alltrue([for item in item.auth_config : (item.resource_principal_source == null || (contains(["WORKSPACE", "APPLICATION"], item.resource_principal_source)))]))]))])
      )
    ])
    error_message = "must be one of: \"WORKSPACE\", \"APPLICATION\""
  }
  validation {
    condition = alltrue([
      for k, v in var.dataintegration_workspace_tasks_lookup : (
        alltrue([for item in v.task_summary_collection : (item.items == null || alltrue([for item in item.items : (item.cancel_rest_call_config == null || alltrue([for item in item.cancel_rest_call_config : (item.model_type == null || (contains(["CANCEL_REST_CALL_CONFIG"], item.model_type)))]))]))])
      )
    ])
    error_message = "must be one of: \"CANCEL_REST_CALL_CONFIG\""
  }
  validation {
    condition = alltrue([
      for k, v in var.dataintegration_workspace_tasks_lookup : (
        alltrue([for item in v.task_summary_collection : (item.items == null || alltrue([for item in item.items : (item.cancel_rest_call_config == null || alltrue([for item in item.cancel_rest_call_config : (item.config_values == null || alltrue([for item in item.config_values : (item.config_param_values == null || alltrue([for item in item.config_param_values : (item.request_payload == null || alltrue([for item in item.request_payload : (item.ref_value == null || alltrue([for item in item.ref_value : (item.model_type == null || (contains(["JSON_TEXT"], item.model_type)))]))]))]))]))]))]))])
      )
    ])
    error_message = "must be one of: \"JSON_TEXT\""
  }
  validation {
    condition = alltrue([
      for k, v in var.dataintegration_workspace_tasks_lookup : (
        alltrue([for item in v.task_summary_collection : (item.items == null || alltrue([for item in item.items : (item.cancel_rest_call_config == null || alltrue([for item in item.cancel_rest_call_config : (item.method_type == null || (contains(["POST", "PUT", "DELETE", "PATCH"], item.method_type)))]))]))])
      )
    ])
    error_message = "must be one of: \"POST\", \"PUT\", \"DELETE\", \"PATCH\""
  }
  validation {
    condition = alltrue([
      for k, v in var.dataintegration_workspace_tasks_lookup : (
        alltrue([for item in v.task_summary_collection : (item.items == null || alltrue([for item in item.items : (item.execute_rest_call_config == null || alltrue([for item in item.execute_rest_call_config : (item.model_type == null || (contains(["REST_CALL_CONFIG"], item.model_type)))]))]))])
      )
    ])
    error_message = "must be one of: \"REST_CALL_CONFIG\""
  }
  validation {
    condition = alltrue([
      for k, v in var.dataintegration_workspace_tasks_lookup : (
        alltrue([for item in v.task_summary_collection : (item.items == null || alltrue([for item in item.items : (item.execute_rest_call_config == null || alltrue([for item in item.execute_rest_call_config : (item.config_values == null || alltrue([for item in item.config_values : (item.config_param_values == null || alltrue([for item in item.config_param_values : (item.request_payload == null || alltrue([for item in item.request_payload : (item.ref_value == null || alltrue([for item in item.ref_value : (item.model_type == null || (contains(["JSON_TEXT"], item.model_type)))]))]))]))]))]))]))])
      )
    ])
    error_message = "must be one of: \"JSON_TEXT\""
  }
  validation {
    condition = alltrue([
      for k, v in var.dataintegration_workspace_tasks_lookup : (
        alltrue([for item in v.task_summary_collection : (item.items == null || alltrue([for item in item.items : (item.execute_rest_call_config == null || alltrue([for item in item.execute_rest_call_config : (item.method_type == null || (contains(["GET", "POST", "PUT", "DELETE", "PATCH"], item.method_type)))]))]))])
      )
    ])
    error_message = "must be one of: \"GET\", \"POST\", \"PUT\", \"DELETE\", \"PATCH\""
  }
  validation {
    condition = alltrue([
      for k, v in var.dataintegration_workspace_tasks_lookup : (
        alltrue([for item in v.task_summary_collection : (item.items == null || alltrue([for item in item.items : (item.parameters == null || alltrue([for item in item.parameters : (item.model_type == null || (contains(["PARAMETER"], item.model_type)))]))]))])
      )
    ])
    error_message = "must be one of: \"PARAMETER\""
  }
  validation {
    condition = alltrue([
      for k, v in var.dataintegration_workspace_tasks_lookup : (
        alltrue([for item in v.task_summary_collection : (item.items == null || alltrue([for item in item.items : (item.poll_rest_call_config == null || alltrue([for item in item.poll_rest_call_config : (item.model_type == null || (contains(["POLL_REST_CALL_CONFIG"], item.model_type)))]))]))])
      )
    ])
    error_message = "must be one of: \"POLL_REST_CALL_CONFIG\""
  }
  validation {
    condition = alltrue([
      for k, v in var.dataintegration_workspace_tasks_lookup : (
        alltrue([for item in v.task_summary_collection : (item.items == null || alltrue([for item in item.items : (item.poll_rest_call_config == null || alltrue([for item in item.poll_rest_call_config : (item.config_values == null || alltrue([for item in item.config_values : (item.config_param_values == null || alltrue([for item in item.config_param_values : (item.request_payload == null || alltrue([for item in item.request_payload : (item.ref_value == null || alltrue([for item in item.ref_value : (item.model_type == null || (contains(["JSON_TEXT"], item.model_type)))]))]))]))]))]))]))])
      )
    ])
    error_message = "must be one of: \"JSON_TEXT\""
  }
  validation {
    condition = alltrue([
      for k, v in var.dataintegration_workspace_tasks_lookup : (
        alltrue([for item in v.task_summary_collection : (item.items == null || alltrue([for item in item.items : (item.poll_rest_call_config == null || alltrue([for item in item.poll_rest_call_config : (item.config_values == null || alltrue([for item in item.config_values : (item.config_param_values == null || alltrue([for item in item.config_param_values : (item.poll_max_duration_unit == null || alltrue([for item in item.poll_max_duration_unit : (item.string_value == null || (contains(["SECONDS", "MINUTES", "HOURS", "DAYS"], item.string_value)))]))]))]))]))]))])
      )
    ])
    error_message = "must be one of: \"SECONDS\", \"MINUTES\", \"HOURS\", \"DAYS\""
  }
  validation {
    condition = alltrue([
      for k, v in var.dataintegration_workspace_tasks_lookup : (
        alltrue([for item in v.task_summary_collection : (item.items == null || alltrue([for item in item.items : (item.poll_rest_call_config == null || alltrue([for item in item.poll_rest_call_config : (item.config_values == null || alltrue([for item in item.config_values : (item.config_param_values == null || alltrue([for item in item.config_param_values : (item.poll_interval_unit == null || alltrue([for item in item.poll_interval_unit : (item.string_value == null || (contains(["SECONDS", "MINUTES", "HOURS", "DAYS"], item.string_value)))]))]))]))]))]))])
      )
    ])
    error_message = "must be one of: \"SECONDS\", \"MINUTES\", \"HOURS\", \"DAYS\""
  }
  validation {
    condition = alltrue([
      for k, v in var.dataintegration_workspace_tasks_lookup : (
        alltrue([for item in v.task_summary_collection : (item.items == null || alltrue([for item in item.items : (item.poll_rest_call_config == null || alltrue([for item in item.poll_rest_call_config : (item.config_values == null || alltrue([for item in item.config_values : (item.config_param_values == null || alltrue([for item in item.config_param_values : (item.poll_condition == null || alltrue([for item in item.poll_condition : (item.ref_value == null || alltrue([for item in item.ref_value : (item.model_type == null || (contains(["EXPRESSION"], item.model_type)))]))]))]))]))]))]))])
      )
    ])
    error_message = "must be one of: \"EXPRESSION\""
  }
  validation {
    condition = alltrue([
      for k, v in var.dataintegration_workspace_tasks_lookup : (
        alltrue([for item in v.task_summary_collection : (item.items == null || alltrue([for item in item.items : (item.poll_rest_call_config == null || alltrue([for item in item.poll_rest_call_config : (item.method_type == null || (contains(["GET", "POST", "PUT"], item.method_type)))]))]))])
      )
    ])
    error_message = "must be one of: \"GET\", \"POST\", \"PUT\""
  }
  validation {
    condition = alltrue([
      for k, v in var.dataintegration_workspace_tasks_lookup : (
        alltrue([for item in v.task_summary_collection : (item.items == null || alltrue([for item in item.items : (item.typed_expressions == null || alltrue([for item in item.typed_expressions : (item.model_type == null || (contains(["TYPED_EXPRESSION"], item.model_type)))]))]))])
      )
    ])
    error_message = "must be one of: \"TYPED_EXPRESSION\""
  }
}

