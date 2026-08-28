// Add cadastro_clientes record
query cadastro_clientes verb=POST {
  api_group = "Members & Accounts"

  input {
    dblink {
      table = ""
    }
  }

  stack {
    db.add "" {
      enforce_hidden_fields = false
      data = {created_at: "now"}
    } as $cadastro_clientes
  }

  response = $cadastro_clientes
}