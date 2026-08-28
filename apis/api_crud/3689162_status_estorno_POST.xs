// Add STATUS_ESTORNO record
query status_estorno verb=POST {
  api_group = "API_CRUD"

  input {
    dblink {
      table = "STATUS_ESTORNO"
    }
  }

  stack {
    db.add STATUS_ESTORNO {
      enforce_hidden_fields = false
      data = {created_at: "now"}
    } as $status_estorno
  }

  response = $status_estorno
}