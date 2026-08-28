// Delete cadastro_clientes record.
query "cadastro_clientes/{cadastro_clientes_id}" verb=DELETE {
  api_group = "Members & Accounts"

  input {
    int cadastro_clientes_id? filters=min:1
  }

  stack {
    db.del "" {
      field_name = "id"
      field_value = $input.cadastro_clientes_id
    }
  }

  response = null
}