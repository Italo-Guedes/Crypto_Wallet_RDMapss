namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando o BD...") {%x(rails db:drop)}      
      show_spinner("Criando BD...") {%x(rails db:create)}
      show_spinner("Migrando BD...") {%x(rails db:migrate)}         
      %x(rails dev:add_mining_types)
      %x(rails dev:add_coins)
      

    else
      puts "Você não está em ambiente de desenvolvimento!"
    end
  end

  desc "Cadastra as moedas"
  task add_coins: :environment do
    show_spinner("Cadastrando moedas") do       
      coins = [
                { 
                  description: "Bitcoin",
                  acronym: "BTC",
                  url_image: "https://as1.ftcdn.net/v2/jpg/01/88/16/50/1000_F_188165041_C4LeZPJhrtGSy1hRRk0w77K4b2zA9nUB.jpg",
                  mining_type: MiningType.find_by(acronym: 'PoW')
                },
                {
                  description: "Etherum",
                  acronym: "ETH",
                  url_image: "https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Ethereum_logo_2014.svg/471px-Ethereum_logo_2014.svg.png",
                  mining_type: MiningType.all.sample
                },
                {
                  description: "Dash",
                  acronym: "DASH",
                  url_image: "https://logowik.com/content/uploads/images/dash9065.jpg",
                  mining_type: MiningType.all.sample
                },
                {
                  description: "Iota",
                  acronym: "IOT",
                  url_image: "https://cdn.iconscout.com/icon/premium/png-256-thumb/iota-coin-779603.png",
                  mining_type: MiningType.all.sample
                },
                {
                  description: "ZCash",
                  acronym: "ZEC",
                  url_image: "https://seeklogo.com/images/Z/zcash-zec-logo-B77DE94668-seeklogo.com.png",
                  mining_type: MiningType.all.sample
                }
              ]

      coins.each do |coin|
        Coin.find_or_create_by!(coin)
      end
    end
  end


  desc "Cadastro os tipos de mineração"
  task add_mining_types: :environment do
    show_spinner("Cadastrando tipos de mineração") do  
      mining_types = [
        {description: "Proof of Work", acronym: "PoW"},
        {description: "Proof of Stake", acronym: "PoS"},
        {description: "Proof of Capacity", acronym: "PoC"},
      ]

      mining_types.each do |mining_type|
        MiningType.find_or_create_by!(mining_type)
      end
    end
  end



private

  def show_spinner(msg_start, msg_end = "Concluído")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin # Automatic animation with default interval
    yield
    spinner.success("(#{msg_end})")
  end
end
