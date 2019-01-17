require 'nokogiri'
require 'open-uri'



ville = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
val_d_oise = []
ville.xpath('//a[@class="lientxt"]/text()').each do |y|
	val_d_oise<<y.text
end

commune =[]
ville.xpath('//a[@class="lientxt"]/@href').each do |c|
	commune<<c.text
end

hash_des_villes = Hash[val_d_oise.zip(commune)]

puts hash_des_villes 
