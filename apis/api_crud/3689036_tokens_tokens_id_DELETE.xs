// Delete tokens record.
query "tokens/{tokens_id}" verb=DELETE {
  api_group = "API_CRUD"

  input {
    int tokens_id? filters=min:1
  }

  stack {
    db.del tokens {
      field_name = "id"
      field_value = $input.tokens_id
    }
  }

  response = null
}