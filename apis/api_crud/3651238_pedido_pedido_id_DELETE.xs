//  Delete PEDIDO record.
// coment
query "pedido/{pedido_id}" verb=DELETE {
  api_group = "API_CRUD"

  input {
    int pedido_id? filters=min:1
  }

  stack {
    db.del "" {
      field_name = "id"
      field_value = $input.pedido_id
    }
  }

  response = null
}