// Get cadastro_clientes record
query "cadastro_clientes/{cadastro_clientes_id}" verb=GET {
  api_group = "Members & Accounts"

  input {
    int cadastro_clientes_id? filters=min:1
  }

  stack {
    db.get "" {
      field_name = "id"
      field_value = $input.cadastro_clientes_id
    } as $cadastro_clientes
  
    precondition ($cadastro_clientes != null) {
      error_type = "notfound"
      error = "Not Found."
    }
  }

  response = $cadastro_clientes
}