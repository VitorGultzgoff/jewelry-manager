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

# Seed products
statuses = %w[Stock Consigned Sold Dismantled Lost Canceled]

statuses.each do |status|
  Model.find_each do |model|
    Supplier.find_each do |supplier|
      Product.find_or_create_by(
        name: "#{model.name} #{status}",
        model:,
        supplier:
      ) do |prod|
        prod.status = status
        prod.cost_price = rand(100..500)
        prod.sale_price = rand(600..1000)
      end
    end
  end
end

puts 'Products have been seeded successfully.'

# Create roles
admin_role = Role.find_or_create_by(name: 'admin')
Role.find_or_create_by(name: 'client')

# Create users
vitor = User.find_or_create_by(email: 'vitor@email.com') do |user|
  user.password = '12345'
  user.password_confirmation = '12345'
end

# Assign roles to users
vitor.roles << admin_role unless vitor.roles.include?(admin_role)
puts "Created user: #{vitor.email} with roles: #{vitor.roles.map(&:name).join(', ')}"
