# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'json'
require 'open-uri'


gallery = JSON.parse(open('http://imgur.com/gallery.json').read)["data"]

# construct URLs
gallery.each {|i| i['url'] = "http://imgur.com/#{i['hash']}#{i['ext']}" }


# select images that aren't too big
# gallery.select {|i| i['size'] < 200_000 }
# or images that aren't too small
# gallery = gallery.select {|i| i['width'] > 400 && i['height'] > 400 }

# select only PNG images
gallery = gallery.select {|i| i['ext'] != '.gif'}

# create image url
# 1000.times do
#   Image.create!(url: gallery.sample['url'])
# end

for i in 0..(gallery.length - 1)
  Image.create!(url: gallery[i]['url'])
end



# for i in 0..10000
#
#
#   Image.create!(url: "http://imgur.com/#{rand(1e9).to_s(36)[0,6]}.png")
# end
