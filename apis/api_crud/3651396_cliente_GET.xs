// Query all CLIENTE records
query cliente verb=GET {
  api_group = "API_CRUD"

  input {
  }

  stack {
    db.query "" {
      return = {type: "list"}
    } as $cliente
  }

  response = $cliente
}