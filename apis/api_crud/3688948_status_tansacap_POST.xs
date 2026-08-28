// Add STATUS_TANSACAP record
query status_tansacap verb=POST {
  api_group = "API_CRUD"

  input {
    dblink {
      table = ""
    }
  }

  stack {
    db.add "" {
      enforce_hidden_fields = false
      data = {created_at: "now"}
    } as $status_tansacap
  }

  response = $status_tansacap
}