// Query all STATUS_TANSACAP records
query status_tansacap verb=GET {
  api_group = "API_CRUD"

  input {
  }

  stack {
    db.query "" {
      return = {type: "list"}
    } as $status_tansacap
  }

  response = $status_tansacap
}