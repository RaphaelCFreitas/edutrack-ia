// Query all TTOKENIZACAO records
query ttokenizacao verb=GET {
  api_group = "API_CRUD"

  input {
  }

  stack {
    db.query TTOKENIZACAO {
      return = {type: "list"}
    } as $ttokenizacao
  }

  response = $ttokenizacao
}