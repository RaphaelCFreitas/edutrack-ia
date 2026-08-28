// Query all PEDIDO records
query pedido verb=GET {
  api_group = "API_CRUD"

  input {
  }

  stack {
    db.query "" {
      return = {type: "list"}
    } as $pedido
  }

  response = $pedido
}