require("spec_helper")

describe(Stylist) do
  describe("#==") do
    it("is the same stylist if it has the same description") do
      stylist1 = Stylist.new({:name => "Mary",:id => nil})
      stylist2 = Stylist.new({:name => "Mary", :id => nil})
      expect(stylist1).to(eq(stylist2))
    end
  end

    describe(".all") do
      it("starts off with no lists") do
        expect(Stylist.all()).to(eq([]))
      end
    end

  describe("#name") do
    it("tells you its name") do
      stylist = Stylist.new({:name => "Mary", :id => nil})
      expect(stylist.name()).to(eq("Mary"))
    end
  end

  describe("#id") do
    it("sets its ID when you save it") do
      stylist = Stylist.new({:name => "Mary", :id => nil})
      stylist.save()
      expect(stylist.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe("#save") do
    it("lets you save lists to the database") do
      stylist = Stylist.new({:name => "Mary", :id => nil})
      stylist.save()
      expect(Stylist.all()).to(eq([stylist]))
    end
  end

  describe("#update") do
      it("lets you update stylist in the database") do
        stylist = Stylist.new({:name => "Mary", :id => nil})
        stylist.save()
        stylist.update({:name => "Mary"})
        expect(stylist.name()).to(eq("Mary"))
      end
    end
  describe("#delete") do
      it("lets you delete a stylist from the database") do
        stylist = Stylist.new({:name => "Mary", :id => nil})
        stylist.save()
        stylist2 = Stylist.new({:name => "Kamau", :id => nil})
        stylist2.save()
        stylist.delete()
        expect(Stylist.all()).to(eq([stylist2]))
      end
    end

end
