// Delete STATUS_TANSACAP record.
query "status_tansacap/{status_tansacap_id}" verb=DELETE {
  api_group = "API_CRUD"

  input {
    int status_tansacap_id? filters=min:1
  }

  stack {
    db.del "" {
      field_name = "id"
      field_value = $input.status_tansacap_id
    }
  }

  response = null
}