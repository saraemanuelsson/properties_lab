require('pg')

class Property

    attr_accessor :address, :value, :square_footage, :build
    attr_reader :id

    def initialize(options)
        @id = options['id'].to_i if options['id']
        @address = options['address']
        @value = options['value']
        @square_footage = options['square_footage']
        @build = options['build']
    end

    def save
        db = PG.connect( { dbname: 'properties', host: 'localhost' } )
        sql = "INSERT INTO properties
            (
            address,
            value,
            square_footage,
            build
            )
            VALUES ($1,$2,$3,$4)
            RETURNING id"
        values = [@address, @value, @square_footage, @build]
        db.prepare("save", sql)
        @id = db.exec_prepared("save", values)[0]["id"].to_i
        db.close
    end
end
