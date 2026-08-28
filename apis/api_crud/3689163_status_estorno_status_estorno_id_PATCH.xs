// Edit STATUS_ESTORNO record
query "status_estorno/{status_estorno_id}" verb=PATCH {
  api_group = "API_CRUD"

  input {
    int status_estorno_id? filters=min:1
    dblink {
      table = "STATUS_ESTORNO"
    }
  }

  stack {
    util.get_raw_input {
      encoding = "json"
      exclude_middleware = false
    } as $raw_input
  
    db.patch STATUS_ESTORNO {
      field_name = "id"
      field_value = $input.status_estorno_id
      data = `$input|pick:($raw_input|keys)`|filter_null|filter_empty_text
    } as $status_estorno
  }

  response = $status_estorno
}