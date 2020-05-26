require_relative('models/property')

@property1 =  Property.new({"address" => "GH7 DH3", "value" => 20000, "square_footage" => 6500, "build" => "flat"})
@property1.save

@property1.address = 'EH3 9DR'

@property1.update()

@property2 =  Property.new({"address" => "BD7 OD3", "value" => 3000, "square_footage" => 2222, "build" => "flat"})
@property2.save
@property2.delete

puts Property.find(2)
puts Property.find(999)
