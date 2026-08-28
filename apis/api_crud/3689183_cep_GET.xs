// Query all CEP records
query cep verb=GET {
  api_group = "API_CRUD"

  input {
  }

  stack {
    db.query CEP {
      return = {type: "list"}
    } as $cep
  }

  response = $cep
}