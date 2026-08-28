// Get STATUS_ESTORNO record
query "status_estorno/{status_estorno_id}" verb=GET {
  api_group = "API_CRUD"

  input {
    int status_estorno_id? filters=min:1
  }

  stack {
    db.get STATUS_ESTORNO {
      field_name = "id"
      field_value = $input.status_estorno_id
    } as $status_estorno
  
    precondition ($status_estorno != null) {
      error_type = "notfound"
      error = "Not Found."
    }
  }

  response = $status_estorno
}