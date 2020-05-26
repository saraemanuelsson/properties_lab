class Property

    attr_accessor :address, :value, :square_footage, :build

    def initialize(options)
        @address = options['address']
        @value = options['value']
        @square_footage = options['square_footage']
        @build = options['build']
    end
end