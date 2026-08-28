// Query all STATUS_ESTORNO records
query status_estorno verb=GET {
  api_group = "API_CRUD"

  input {
  }

  stack {
    db.query STATUS_ESTORNO {
      return = {type: "list"}
    } as $status_estorno
  }

  response = $status_estorno
}