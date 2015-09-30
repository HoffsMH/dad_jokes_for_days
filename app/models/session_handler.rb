class SessionHandler

  def initialize(session)
    @session = session
  end

  def amethod
    @session[:test] = "something"
  end

  def add_cart_item(item)
    if order_item_in_session(item)
      increment_order_item_quantity
    else
      ensure_joke
      create_a_new_order_item
    end
  end

  def increment_order_item_quantity
    OrderItem.increment_counter(:quantity, order_item_in_session.id)
  end

  def ensure_joke
      @session[:joke_id] ||= Joke.all.sample.id
  end

  def create_a_new_order_item
    order_item = OrderItem.create(item_id: item.id,
                                  joke_id: @session[:joke_id], quantity: 1)
    @session[:cart] << order_item.id
  end

  def order_item_in_session(item)
    if !@session[:cart].empty?
      OrderItem.where(id: @session[:cart], joke_id: @session[:joke_id], item_id: item.id).first
    else
      false
    end
  end

end
