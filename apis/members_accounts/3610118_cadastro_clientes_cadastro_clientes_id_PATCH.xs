// Edit cadastro_clientes record
query "cadastro_clientes/{cadastro_clientes_id}" verb=PATCH {
  api_group = "Members & Accounts"

  input {
    int cadastro_clientes_id? filters=min:1
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
      field_value = $input.cadastro_clientes_id
      data = `$input|pick:($raw_input|keys)`|filter_null|filter_empty_text
    } as $cadastro_clientes
  }

  response = $cadastro_clientes
}