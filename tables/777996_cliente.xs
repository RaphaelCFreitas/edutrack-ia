// Clientes que se cadastraram como User e que podem fazer pedidos
// 
table CLIENTE {
  auth = false

  schema {
    int id
    timestamp created_at?=now {
      visibility = "private"
    }
  
    text nome? filters=trim
    text celular? filters=trim
    text cpf? filters=trim
    int status_cliente_id? {
      table = "STATUS_CLIENTE"
    }
  
    int user_id? {
      table = "USER"
    }
  }

  index = [
    {type: "primary", field: [{name: "id"}]}
    {type: "btree", field: [{name: "created_at", op: "desc"}]}
  ]
}