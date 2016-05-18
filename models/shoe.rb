require('pg')

class Shoe

  attr_reader :first_name, :last_name, :quantity, :size

  def initialize(options)
    @first_name = options['first_name']
    @last_name = options['last_name']
    @size = options['size']
    @quantity = options['quantity'].to_i
  end 

  def pretty_name
   @pretty_name = @first_name + " " + @last_name
  end

  def save
    db = PG.connect( {dbname: 'shoe_shop', host: 'localhost'})
    sql = "INSERT INTO shoes(
    first_name,
    last_name,
    size,
    quantity
    )
    VALUES (
    '#{@first_name}',
    '#{@last_name}',
    '#{@size}',
    #{@quantity}
    )"
    db.exec(sql)
    db.close
  end

  def self.all
   db = PG.connect( {dbname: 'shoe_shop', host: 'localhost'})
   sql = "SELECT * FROM shoes"
   shoes = db.exec(sql)
   result = shoes.map {|shoe| Shoe.new(shoe)}
   db.close
   return result
  end


end