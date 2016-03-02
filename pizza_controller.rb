require('sinatra')
require('sinatra/contrib/all') if development?
require('json')

require_relative('models/pizza')

get '/pizza' do
# content_type(:json)
@pizzas = Pizza.all()
erb(:index)
end
# result = @pizzas.map do |p|
#   {:first_name => p.first_name,
#     :last_name => p.last_name
#   }
# end
# return result.to_json



get '/pizza/new' do
  erb(:new)
end

post '/pizza' do
  @pizza = Pizza.new( params )
  @pizza.save()
  erb(:create)
end