// Edit STATUS_TANSACAP record
query "status_tansacap/{status_tansacap_id}" verb=PATCH {
  api_group = "API_CRUD"

  input {
    int status_tansacap_id? filters=min:1
    dblink {
      table = ""
    }
  }

  stack {
    util.get_raw_input {
      encoding = "json"
      exclude_middleware = false
    } as $raw_input
  
    db.patch "" {
      field_name = "id"
      field_value = $input.status_tansacap_id
      data = `$input|pick:($raw_input|keys)`|filter_null|filter_empty_text
    } as $status_tansacap
  }

  response = $status_tansacap
}