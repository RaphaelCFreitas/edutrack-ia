// Query all ITEM records
query item verb=GET {
  api_group = "API_CRUD"

  input {
  }

  stack {
    db.query ITEM {
      return = {type: "list"}
    } as $item
  }

  response = $item
}