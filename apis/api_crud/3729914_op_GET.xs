// Query all OP records
query op verb=GET {
  api_group = "API_CRUD"

  input {
  }

  stack {
    db.query OP {
      return = {type: "list"}
    } as $op
  }

  response = $op
}