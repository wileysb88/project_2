# Must be called 001_setup.rb before running sequel -m migrations/ sqlite://development.sqlite from console
# If you are getting a "Mass Migration" error or a "Corrupt Database" type error try deleting development.sqlite and rerunning sequel -m migrations/ sqlite://development.sqlite


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
