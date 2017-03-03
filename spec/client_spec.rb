require("spec_helper")


describe(Client) do
    describe(".all") do
      it("is empty at first") do
        expect(Client.all()).to(eq([]))
      end
    end

    describe("#save") do
      it("adds a client to the array of saved client") do
        test_client = Client.new({:name => "Ken", :stylist_id => 1})
        test_client.save()
        expect(Client.all()).to(eq([test_client]))
      end
    end

    describe("#name") do
      it("lets you read the name out") do
        test_client = Client.new({:name => "Ken", :stylist_id => 1})
        expect(test_client.name()).to(eq("Ken"))
      end
    end

    describe("#id") do
      it("lets you read the stylist ID out") do
        test_client = Client.new({:name=> "Ken", :stylist_id => 1})
        expect(test_client.stylist_id()).to(eq(1))
      end
    end

    describe("#==") do
      it("is the same client if it has the same name and stylist ID") do
        client1 = Client.new({:name => "Ken", :stylist_id => 1})
        client2 = Client.new({:name => "Ken", :stylist_id => 1})
        expect(client1).to(eq(client2))
      end
    end
    describe("#update") do
        it("lets you update client in the database") do
          client = Client.new({:name => "Mary", :stylist_id => 1})
          client.save()
          client.update({:name => "Mary"})
          expect(client.name()).to(eq("Mary"))
        end
      end
    describe("#delete") do
        it("lets you delete a client from the database") do
          client = Client.new({:name => "Mary", :stylist_id =>1})
          client.save()
          client2 = Client.new({:name => "Kamau", :stylist_id => 1})
          client2.save()
          client.delete()
          expect(Client.all()).to(eq([client2]))
        end
      end
  end
