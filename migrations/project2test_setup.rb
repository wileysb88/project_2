Sequel.migration do
  change do
    create_table(:users) do
      primary_key :id
      String :username
      String :password
      Boolean :logged_in
    end
  end
end
