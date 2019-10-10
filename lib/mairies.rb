require 'rubygems'
require 'nokogiri'
require 'open-uri'

def get_townhalls_urls(department_url)
	page = Nokogiri::HTML(open(department_url))
	townhalls_urls = []
	page.xpath("//a[@class = 'lientxt']/@href").each do |url|
		townhalls_urls.push(url.text)
	end
	townhalls_urls.map! do |townhall_url|
		townhall_url.slice!(0)
		townhall_url = "http://annuaire-des-mairies.com" + townhall_url
	end
	return townhalls_urls
end


def get_city_names(departement_url)
	page = Nokogiri::HTML(open(departement_url))
	names = []
	page.xpath("//a[@class = 'lientxt']").each do |nom|
		names.push(nom.text)
	end
	return names
end


def get_townhall_email(townhall_url)
	page = Nokogiri::HTML(open(townhall_url))

	info = page.xpath("//section[2]/div/table/tbody/tr[4]/td[2]")
		return info.text
end


def scrapping(department_url)
	townhalls_urls = get_townhalls_urls(department_url)
	email = townhalls_urls.map {|townhall_url| get_townhall_email(townhall_url)}

	emails = []
	emails.push(email)
	return emails.flatten!
	return names

end

def perform(department_url)
	emails = scrapping(department_url)
	names = get_city_names(department_url)

	final_array = []
	i = 0
	(names.length).times do
		couple = {names[i] => emails[i]}
		final_array.push(couple)
		i += 1
	end
puts final_array
end

perform("http://annuaire-des-mairies.com/val-d-oise.html")

