require 'pg'

class Table

  def new_table(table_name)
    # Conexão com o banco de dados
    conn = PG.connect(dbname: 'db', user: 'postgres', password:'')

    # Criação da tabela com os campos id, created_at e updated_at por default
    query = <<-SQL
      CREATE TABLE #{table_name} (
        ID int NOT NULL AUTO_INCREMENT,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        updated_at DATETIME DEFAULT ON UPDATE CURRENT_TIMESTAMP
      )
    SQL

    # Executa a consulta
    conn.exec(query)

    # Fecha a conexão com o banco de dados
    conn.close

    puts "Tabela #{table_name} criada com sucesso!"
  end
end

creator = Table.new
# Solicita o nome da tabela ao usuário
print "Digite o nome da tabela que deseja criar: "
table_name = gets.chomp

# Chama o método para criar a tabela
creator.new_table(table_name)
