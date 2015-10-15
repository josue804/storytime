
require 'json'
require 'open-uri'


gallery = JSON.parse(open('http://imgur.com/gallery.json').read)["data"]

# construct URLs
gallery.each {|i| i['url'] = "http://imgur.com/#{i['hash']}#{i['ext']}" }



# select only ACTIVE non-gifs
gallery = gallery.select {|i| i['ext'] != '.gif' && i['bandwidth'] != nil}

# seed all the images
for i in 0..(gallery.length - 1)
  Image.create!(url: gallery[i]['url'])
end
