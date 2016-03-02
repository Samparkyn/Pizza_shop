require('pg')
require('pry-byebug')

class Pizza

  attr_reader(:first_name, :last_name, :topping, :quantity)

  def initialize(options)
    @first_name = options['first_name']
    @last_name = options['last_name']
    @topping = options['topping']
    @quantity = options['quantity'].to_i
  end

  def space_between_names
    with_space = "#{first_name} #{last_name}"
    return with_space
  end

  def total
    return @quantity * 10
  end

  def save()
    db = PG.connect({dbname: 'pizza_shop', host: 'localhost'})
    sql = "INSERT INTO pizzas (
    first_name,
    last_name,
    topping,
    quantity) VALUES ('#{@first_name}', '#{@last_name}', '#{@topping}', #{@quantity})"

    db.exec(sql) #executes the sql command, making a connection to the database
    db.close #then need to close the connection to the database
  end

  def self.all()
    db = PG.connect({dbname: 'pizza_shop', host: 'localhost'})
    sql = "SELECT * FROM pizzas"
    pizzas = db.exec(sql)
    result = pizzas.map {|pizza| Pizza.new(pizza)}
    db.close
    return result
  end

end