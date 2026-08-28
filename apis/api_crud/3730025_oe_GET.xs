// Query all OE records
query oe verb=GET {
  api_group = "API_CRUD"

  input {
  }

  stack {
    db.query OE {
      return = {type: "list"}
    } as $oe
  }

  response = $oe
}