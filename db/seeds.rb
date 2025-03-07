# Seed Brazilian states and cities
brazil = Country.find_or_create_by(name: 'Brazil')

states_with_cities = {
  'Acre' => %w[Rio_Branco Cruzeiro_do_Sul Sena_Madureira],
  'Alagoas' => %w[Maceió Arapiraca Palmeira_dos_Índios],
  'Amapá' => %w[Macapá Santana Oiapoque],
  'Amazonas' => %w[Manaus Parintins Itacoatiara],
  'Bahia' => %w[Salvador Feira_de_Santana Vitória_da_Conquista],
  'Ceará' => %w[Fortaleza Caucaia Juazeiro_do_Norte],
  'Distrito_Federal' => %w[Brasília Ceilândia Taguatinga],
  'Espírito_Santo' => %w[Vitória Vila_Velha Serra],
  'Goiás' => %w[Goiânia Aparecida_de_Goiânia Anápolis],
  'Maranhão' => %w[São_Luís Imperatriz Timon],
  'Mato_Grosso' => %w[Cuiabá Várzea_Grande Rondonópolis],
  'Mato_Grosso_do_Sul' => %w[Campo_Grande Dourados Três_Lagoas],
  'Minas_Gerais' => %w[Belo_Horizonte Uberlândia Uberaba],
  'Pará' => %w[Belém Ananindeua Santarém],
  'Paraíba' => %w[João_Pessoa Campina_Grande Santa_Rita],
  'Paraná' => %w[Curitiba Londrina Maringá],
  'Pernambuco' => %w[Recife Jaboatão_dos_Guararapes Olinda],
  'Piauí' => %w[Teresina Parnaíba Picos],
  'Rio_de_Janeiro' => %w[Rio_de_Janeiro Niterói Petrópolis],
  'Rio_Grande_do_Norte' => %w[Natal Mossoró Parnamirim],
  'Rio_Grande_do_Sul' => %w[Porto_Alegre Caxias_do_Sul Pelotas],
  'Rondônia' => %w[Porto_Velho Ji-Paraná Ariquemes],
  'Roraima' => %w[Boa_Vista Rorainópolis Caracaraí],
  'Santa_Catarina' => %w[Florianópolis Joinville Blumenau],
  'São_Paulo' => %w[São_Paulo Campinas Santos],
  'Sergipe' => %w[Aracaju Nossa_Senhora_do_Socorro Lagarto],
  'Tocantins' => %w[Palmas Araguaína Gurupi]
}

states_with_cities.each do |state_name, cities|
  state = brazil.states.find_or_create_by(name: state_name)
  cities.each do |city_name|
    state.cities.find_or_create_by(name: city_name)
  end
end

puts 'Brazilian states and cities have been seeded successfully.'

# Seed jewelry models
models = %w[Chain Bracelet Choker Ring Pendant Earring]

models.each do |model_name|
  Model.find_or_create_by(name: model_name)
end

puts 'Jewelry models have been seeded successfully.'

# Seed suppliers
suppliers = %w[Haig Paulo Leilão_da_Caixa]

suppliers.each do |supplier_name|
  Supplier.find_or_create_by(name: supplier_name.gsub('_', ' '))
end

puts 'Suppliers have been seeded successfully.'

# Seed products & inventory
statuses = %w[Stock Consigned Sold Dismantled Lost Canceled]

statuses.each do |status|
  Model.find_each do |model|
    Supplier.find_each do |supplier|
      product = Product.find_or_create_by(
        name: "#{Faker::Commerce.material} - #{model.name}",
        model:,
        supplier:
      ) do |prod|
        prod.status = status
        prod.cost_price = rand(100..500)
        prod.sale_price = rand(600..1000)
      end

      product.save! if product.new_record?
      Inventory.find_or_create_by(product:, location: Faker::Address.city, quantity: rand(10..100))
    end
  end
end

puts 'Products & Inventory have been seeded successfully.'

# Seed roles
Role.find_or_create_by(name: 'admin')
Role.find_or_create_by(name: 'client')

# Seed users
created_admin = User.create_user_and_generate_token(email: 'admin@email.com', password: '123456', roles: %w[admin client])
created_client = User.create_user_and_generate_token(email: 'client@email.com', password: '123456', roles: %w[client])

# Assign roles to users
puts "Created user: #{created_admin[:user].email} with roles: #{created_admin[:user].roles.map(&:name).join(', ')}"
puts "Created user: #{created_client[:user].email} with roles: #{created_client[:user].roles.map(&:name).join(', ')}"

# Seed customers
customer_created = Customer.find_or_create_by(name: 'Golden Glimmers') do |customer|
  customer.document = '316.428.270-29'
  customer.email = 'goldenglimmers@email.com'
  customer.phone = '9999999999999'
end
puts "Created customer: #{customer_created.email} - #{customer_created.name}"

# Seed actions for products
action_types = %w[cancel consign dismantle lost sell stock]

Product.find_each do |product|
  action_types.each do |action_type|
    customer = nil

    # Only assign a customer for 'consign' or 'sell'
    if %w[consign sell].include?(action_type)
      customer = Customer.order('RANDOM()').first # Randomly assign a customer
    end

    Action.find_or_create_by(
      product:,
      action_type:,
      customer:,
      executed_at: Faker::Date.backward(days: 30) # Random date within the last 30 days
    )
  end
end

puts 'Actions have been seeded successfully.'

# Seed sales for customers
customers = Customer.all
products = Product.all

customers.each do |customer|
  rand(1..5).times do
    sale = Sale.create!(
      customer: customer,
      discount: rand(0..10) * 0.1,
      final_price: rand(100..500),
      payment_method: ['Credit Card', 'Cash', 'Bank Transfer'].sample,
      payment_status: %w[Pending Paid Failed].sample,
      schedule_payment_date: Faker::Date.forward(days: rand(1..30)),
      completed_at: rand(1..5).odd? ? Faker::Date.backward(days: rand(1..30)) : nil
    )

    products.sample(rand(1..3)).each do |product|
      quantity = rand(1..5)
      discount = rand(0..10) * 0.1
      final_price = product.sale_price * quantity - discount

      SaleProduct.create!(
        sale:,
        product:,
        quantity:,
        discount:,
        final_price:
      )
    end
  end
end

puts 'Sales have been seeded successfully.'
