// Add tokens record
query tokens verb=POST {
  api_group = "API_CRUD"

  input {
    dblink {
      table = "tokens"
    }
  }

  stack {
    db.add tokens {
      enforce_hidden_fields = false
      data = {created_at: "now"}
    } as $tokens
  }

  response = $tokens
}