// Query all STATUS_PEDIDO records
query status_pedido verb=GET {
  api_group = "API_CRUD"

  input {
  }

  stack {
    db.query "" {
      return = {type: "list"}
    } as $status_pedido
  }

  response = $status_pedido
}