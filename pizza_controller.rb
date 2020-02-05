require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )

require_relative('./models/pizza_order')
also_reload('./models/*')

# read - all/index
get '/pizza-orders' do
  @orders = PizzaOrder.all()
  erb(:index)
end

# create - new
get '/pizza-orders/new' do
  erb(:new)
end

# create - create
post '/pizza-orders' do
  @order = PizzaOrder.new(params)
  @order.save()
  erb(:create)
end
# delete
post '/pizza-orders/:id/delete' do
  @order = PizzaOrder.find(params[:id])
  @order.delete()
  erb(:delete)
end

# read - one/show
get '/pizza-orders/:id' do
  @order = PizzaOrder.find(params[:id])
  erb(:show)
end

# update

get '/pizza-orders/:id/update' do
  @order = PizzaOrder.find(params[:id])
  erb(:update)
end

post '/pizza-orders/:id' do
  @order = PizzaOrder.new(params)
  @order.update()
  redirect "/pizza-orders"
end
