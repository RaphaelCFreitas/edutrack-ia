// Get STATUS_TANSACAP record
query "status_tansacap/{status_tansacap_id}" verb=GET {
  api_group = "API_CRUD"

  input {
    int status_tansacap_id? filters=min:1
  }

  stack {
    db.get "" {
      field_name = "id"
      field_value = $input.status_tansacap_id
    } as $status_tansacap
  
    precondition ($status_tansacap != null) {
      error_type = "notfound"
      error = "Not Found."
    }
  }

  response = $status_tansacap
}