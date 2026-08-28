// Query all STATUS_CLIENTE records
query status_cliente verb=GET {
  api_group = "API_CRUD"

  input {
  }

  stack {
    db.query STATUS_CLIENTE {
      return = {type: "list"}
    } as $status_cliente
  }

  response = $status_cliente
}