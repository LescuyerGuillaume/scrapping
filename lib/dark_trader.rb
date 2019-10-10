require 'rubygems'
require 'nokogiri'
require 'open-uri'


page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))

def names(page)
#Récupération des noms de cryptomonnaies
	currency_names = [] 
	page.xpath("//a[@class = 'currency-name-container link-secondary']").each do |link|
#On les stocke dans un tableau
	currency_names.push(link.text)
	end
	return currency_names
end

def prices(page)
#Récupération des valeurs en $ de cryptomonnaies
	currency_prices = []
	page.xpath("//a[@class = 'price']").each do |link|
#On les stocke dans un tableau
	currency_prices.push(link.text)
	end
	return currency_prices
end

def result(currency_names, currency_prices)
	final_array = []
	currency = 0
	price = 0

#On boucle autant de fois qu'il y a de cryptomonnaies
	(currency_names.length).times do
#A chaque tour de boucle on crée un array associant une cryptomonnaie et la valeur en $ ayant le même index
	couple = {currency_names[currency] => currency_prices[price]}
#On pousse l'array ainsi créé dans un tableau
	final_array.push(couple)
	currency += 1
	price += 1
	end
	return final_array
end

def perform(page)
	currency_names = names(page)
	currency_prices = prices(page)
	final_array = result(currency_names, currency_prices) 
	puts final_array
end

perform(page)