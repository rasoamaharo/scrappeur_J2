require 'nokogiri'
require 'open-uri'


page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))

cours = [] #creation de tableau 
page.xpath('//a[@class="link-secondary"]/text()').each do |x|  # incrementation des tableau
cours<<x.text #rempissage du tableau
end

monnaies= []
page.xpath('//a[@class="price"]/text()').each do |y|
monnaies<<y.text
end

hash_des_cours =Hash[cours.zip(monnaies)]

puts hash_des_cours