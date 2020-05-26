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

    def update()
        db = PG.connect( { dbname: 'properties', host: 'localhost' } )
        sql = "UPDATE properties
        SET
        (address, value, square_footage, build)
        =
        ($1, $2, $3, $4)
        WHERE id = $5"
        values = [@address, @value, @square_footage, @build, @id]
        db.prepare("update", sql)
        db.exec_prepared("update", values)
        db.close()
    end

    def delete()
        db = PG.connect( { dbname: 'properties', host: 'localhost' } )
        sql = "DELETE FROM properties
        WHERE id = $1"
        values = [@id]
        db.prepare("delete", sql)
        db.exec_prepared("delete", values)
        db.close()
    end

    def Property.find(id)
        db = PG.connect( { dbname: 'properties', host: 'localhost' } )
        sql = "SELECT * FROM properties
        WHERE id = $1"
        value = [id]
        db.prepare("find", sql)
        property = db.exec_prepared("find", value)
        db.close()
        return Property.new(property[0])
    end

end

