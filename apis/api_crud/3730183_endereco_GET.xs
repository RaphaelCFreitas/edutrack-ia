// Query all ENDERECO records
query endereco verb=GET {
  api_group = "API_CRUD"

  input {
  }

  stack {
    db.query ENDERECO {
      return = {type: "list"}
    } as $endereco
  }

  response = $endereco
}