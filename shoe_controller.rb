require('sinatra')
require('sinatra/contrib/all') if development?
require('pry-byebug')
require_relative('./models/shoe')

get '/shoes/new' do
  erb( :new )
end

get '/shoes' do
  @shoes = Shoe.all()
  # binding.pry
  erb( :index)
end

post '/shoes' do
  # binding.pry
  @shoe = Shoe.new(params)
  @shoe.save()
  erb( :create )
end

get '/shoes/orders' do
  @shoes = Shoe.all()
  erb( :confirmation )
end



