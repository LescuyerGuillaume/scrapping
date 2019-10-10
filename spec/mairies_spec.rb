require_relative '../lib/mairies'

describe "the get_townhall_email method" do
	it "should the email of the townhall" do
		expect(get_townhall_email("http://www.annuaire-des-mairies.com/95/ableiges.html")).to eq("mairie.ableiges95@wanadoo.fr")
		expect(get_townhall_email("http://www.annuaire-des-mairies.com/95/chatenay-en-france.html")).to eq("")
		expect(get_townhall_email("http://www.annuaire-des-mairies.com/95/saint-cyr-en-arthies.html")).to eq("mairie.stcyrenarthies@wanadoo.fr")
		expect(get_townhall_email("http://www.annuaire-des-mairies.com/95/sarcelles.html")).to eq("comsarcelles@yahoo.fr")
	end
end 
