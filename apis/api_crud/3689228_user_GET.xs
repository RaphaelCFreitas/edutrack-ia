// Query all USER records
query user verb=GET {
  api_group = "API_CRUD"

  input {
  }

  stack {
    db.query USER {
      return = {type: "list"}
    } as $user
  }

  response = $user
}