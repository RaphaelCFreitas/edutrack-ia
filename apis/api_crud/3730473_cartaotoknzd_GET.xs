// Query all CARTAOTOKNZD records
query cartaotoknzd verb=GET {
  api_group = "API_CRUD"

  input {
  }

  stack {
    db.query CARTAOTOKNZD {
      return = {type: "list"}
    } as $cartaotoknzd
  }

  response = $cartaotoknzd
}