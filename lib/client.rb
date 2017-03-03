class Client
    attr_reader(:name, :stylist_id)

    define_method(:initialize) do |attributes|
      @name = attributes.fetch(:name)
      @stylist_id = attributes.fetch(:stylist_id)
    end

    define_singleton_method(:all) do
      returned_clients = DB.exec("SELECT * FROM clients;")
      clients = []
      returned_clients.each() do |client|
        name = client.fetch("name")
        stylist_id = client.fetch("stylist_id").to_i() # The information comes out of the database as a string.
        clients.push(Client.new({:name => name, :stylist_id => stylist_id}))
      end
      clients
    end

    define_method(:save) do
      DB.exec("INSERT INTO clients (name, stylist_id) VALUES ('#{@name}', #{@stylist_id});")
    end

    define_method(:==) do |another_client|
      self.name().==(another_client.name()).&(self.stylist_id().==(another_client.stylist_id()))
    end

    define_method(:update) do |attributes|
      @name = attributes.fetch(:name)
      @stylist_id = self.stylist_id()
      DB.exec("UPDATE clients SET name = '#{@name}' WHERE id = #{@stylist_id};")
    end

    define_method(:delete) do
      DB.exec("DELETE FROM clients WHERE name = '#{self.name}';")
    end


end
