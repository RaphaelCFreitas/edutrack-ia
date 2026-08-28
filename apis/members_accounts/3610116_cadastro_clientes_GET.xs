// Query all cadastro_clientes records
query cadastro_clientes verb=GET {
  api_group = "Members & Accounts"

  input {
  }

  stack {
    db.query "" {
      return = {type: "list"}
    } as $cadastro_clientes
  }

  response = $cadastro_clientes
}