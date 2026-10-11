data "oci_dataintegration_workspace_tasks" "dataintegration_workspace_tasks_lookup" {
  for_each = var.dataintegration_workspace_tasks_lookup

  workspace_id = each.value.workspace_id
  fields       = each.value.fields
  folder_id    = each.value.folder_id
  identifier   = each.value.identifier
  key          = each.value.key
  name         = each.value.name
  type         = each.value.type

  dynamic "filter" {
    for_each = each.value.filter != null ? each.value.filter : []
    content {
      name   = filter.value.name
      regex  = filter.value.regex
      values = filter.value.values
    }
  }
}

