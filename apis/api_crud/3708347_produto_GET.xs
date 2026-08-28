// Query all PRODUTO records
query produto verb=GET {
  api_group = "API_CRUD"

  input {
  }

  stack {
    db.query PRODUTO {
      return = {type: "list"}
    } as $produto
  }

  response = $produto
}