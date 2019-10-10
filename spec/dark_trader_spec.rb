require_relative '../lib/dark_trader'
require 'rubygems'
require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))

describe "names" do
	it "should return an array of currency names" do
		currency_names = names(page)
		expect(currency_names).to include("Bitcoin")
		expect(currency_names).to include("Ethereum")
		expect(currency_names.length).to be > 2000
	end
end

describe "prices"do
	it "should return an array of currency prices" do
		currency_prices = names(page)
		expect(currency_prices.length).to be > 2000
	end
end