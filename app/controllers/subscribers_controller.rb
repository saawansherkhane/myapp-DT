class SubscribersController < ApplicationController

  def index
  	@subscribers = Subscriber.all
  end

  def show
    @subscriber = Subscriber.find(params[:id])
  end

  def new
    @subscriber = Subscriber.new
  end 
  
  def edit
    @subscriber = Subscriber.find(params[:id])
  end

  def create
	 @subscriber = Subscriber.new(subscriber_params)
     if	@subscriber.save
  	  redirect_to @subscriber
     else
      render 'new'
     end 
  end

  def update
    @subscriber = Subscriber.find(params[:id])
      if @subscriber.update(subscriber_params)
        redirect_to @subscriber
      else
        render 'edit'
      end  
  end  

  def destroy
    @subscriber = Subscriber.find(params[:id])
    @subscriber.destroy
    redirect_to subscribers_path
  end  

  private
  def subscriber_params
    params.require(:subscriber).permit(:name, :body)
  end	

end
