# $ sequel -m migrations/ sqlite://development.sqlite

Sequel.migration do
  change do
    create_table(:users) do
      primary_key :id
      String :username
      String :password
      Boolean :logged_in
      Integer :karma
    end
    create_table(:restaurants) do
      primary_key :id
      Integer :poster_id
      String :name
      Text :description
      String :tags
      Integer :vote_amount
      String :neighborhood
    end
    create_table(:chats) do
      primary_key :id
      Integer :chatter_id
      Text :message
      Text :buffer
      Boolean :latest
    end
  end
end
