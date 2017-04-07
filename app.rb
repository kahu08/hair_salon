require('sinatra')
  require('sinatra/reloader')
  require('./lib/client')
  require('./lib/stylist')
  also_reload('lib/**/*.rb')
  require("pg")

DB = PG.connect({:dbname => "hair_salon"})


  get("/") do
    @stylists = Stylist.all()
    erb(:index)
  end

  get("/stylists") do
    @stylists = Stylist.all()
    erb(:stylists)
  end

  get("/stylists/new") do
    erb(:stylist_form)
  end

  post("/stylists") do
    name = params.fetch("name")
    stylist = Stylist.new({:name => name, :id => nil})
    stylist.save()
    @stylists = Stylist.all()
    erb(:stylists)
  end

  get("/stylists/:id") do
    @stylist = Stylist.find(params.fetch("id").to_i())
    erb(:stylist)
  end



  get("/stylists/:id/edit") do
    @stylist = Stylist.find(params.fetch("id").to_i())
    erb(:stylist_edit)
  end

  patch("/stylists/:id") do
   name = params.fetch("name")
   @stylist = Stylist.find(params.fetch("id").to_i())
   @stylist.update({:name => name})
   erb(:stylist)
 end

 delete("/stylists/:id") do
    @stylist = Stylist.find(params.fetch("id").to_i())
    @stylist.delete()
    @stylists = Stylist.all()
    erb(:index)
  end

  post("/clients") do
    name = params.fetch("name")
    stylist_id = params.fetch("stylist_id").to_i()
    client = Client.new({:name=> name, :stylist_id => stylist_id})
    client.save()
    @stylist = Stylist.find(stylist_id)
    erb(:stylist)
  end

  get("/clients/new") do
    #displays all stylists for the client to chose
    @stylists = Stylist.all()
    erb(:client_form)
  end

  # get("/clients") do
  #   @clients = Client.all()
  #   erb(:clients)
  # end

  delete("/clients/:id") do
    @stylist = Stylist.find(params.fetch("id").to_i())
    @client = Client.find(params.fetch("id").to_i())
    @client.delete()
    erb(:clients)
  end
