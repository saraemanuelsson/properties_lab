require_relative('models/property')

@property1 =  Property.new({"address" => "GH7 DH3", "value" => 20000, "square_footage" => 6500, "build" => "flat"})
@property1.save

@property1.address = 'EH3 9DR'

@property1.update()