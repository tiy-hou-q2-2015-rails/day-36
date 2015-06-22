(1..10).to_a.each do |i|
  Photo.create! url: "http://lorempixel.com/output/food-q-c-1000-800-#{i}.jpg"
end
