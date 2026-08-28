// Add PEDIDO record
query pedido verb=POST {
  api_group = "API_CRUD"

  input {
    dblink {
      table = ""
    }
  }

  stack {
    db.add "" {
      enforce_hidden_fields = false
      data = {created_at: "now"}
    } as $pedido
  }

  response = $pedido
}