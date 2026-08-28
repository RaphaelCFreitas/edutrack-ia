// Query all TRANSACAO records
query transacao verb=GET {
  api_group = "API_CRUD"

  input {
  }

  stack {
    db.query TRANSACAO {
      return = {type: "list"}
    } as $transacao
  }

  response = $transacao
}