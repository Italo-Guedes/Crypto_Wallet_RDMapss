# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cadastrando moedas...."

Coin.create!(
    description: "Bitcoin",
    acronym: "BTC",
    url_image: "https://as1.ftcdn.net/v2/jpg/01/88/16/50/1000_F_188165041_C4LeZPJhrtGSy1hRRk0w77K4b2zA9nUB.jpg"
)

Coin.create!(
    description: "Etherum",
    acronym: "ETH",
    url_image: "https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Ethereum_logo_2014.svg/471px-Ethereum_logo_2014.svg.png"
)

Coin.create!(
    description: "Dash",
    acronym: "Dash",
    url_image: "https://logowik.com/content/uploads/images/dash9065.jpg"
)

puts "Moedas cadastradas com sucesso!"