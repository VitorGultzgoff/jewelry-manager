# frozen_string_literal: true

class SeedBrazilianStatesAndCities < ActiveRecord::Migration[7.0]
  def up
    brazil = Country.create(name: 'Brazil')
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
      state = brazil.states.create(name: state_name)
      cities.each do |city_name|
        state.cities.create(name: city_name)
      end
    end
  end

  def down
    brazil = Country.find_by(name: 'Brazil')
    brazil.states.each do |state|
      state.cities.destroy_all
    end
    brazil.states.destroy_all
    brazil.destroy
  end
end
