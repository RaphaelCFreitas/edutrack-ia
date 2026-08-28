// Query all tokens records
query tokens verb=GET {
  api_group = "API_CRUD"

  input {
  }

  stack {
    db.query tokens {
      return = {type: "list"}
    } as $tokens
  }

  response = $tokens
}