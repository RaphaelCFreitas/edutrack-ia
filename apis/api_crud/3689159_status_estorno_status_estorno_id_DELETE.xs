// Delete STATUS_ESTORNO record.
query "status_estorno/{status_estorno_id}" verb=DELETE {
  api_group = "API_CRUD"

  input {
    int status_estorno_id? filters=min:1
  }

  stack {
    db.del STATUS_ESTORNO {
      field_name = "id"
      field_value = $input.status_estorno_id
    }
  }

  response = null
}