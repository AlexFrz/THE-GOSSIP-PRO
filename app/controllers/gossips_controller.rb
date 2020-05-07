class GossipsController < ApplicationController
  # View list of gossips (order most recents first)
  def index
    @gossips = Gossip.all.order("created_at DESC")
  end

  # View a gossip
  def show
    @gossip = Gossip.find(params[:id])
  end

  # Display a view to create a gossip
  def new
    @gossip = Gossip.new(title: "null", content: "null", user: User.last)
  end

  # Create a new gossip
  def create
    @gossip = Gossip.new(title: params[:title],
                         content: params[:content],
                         user: User.new(params[:username]))

    # @gossip = Gossip.new(params[:post])
    if @gossip.save
      redirect_to gossips_path
    else
      render 'new'
    end
  end

  # Display a view with a form to edit an existing gossip
  def edit
    @gossip = Gossip.find(params[:id])
  end

  # Edit an existing gossip
  def update
    def update
      @gossip = Gossip.find(params[:id])
      gossip_params = params.require(:gossip).permit(:title, :content, :user)
      @gossip.update(gossip_params)
      if @gossip.update(gossip_params)
        redirect_to @gossip
      else
        render :edit
      end
    end
  end

  # Delete a gossip
  def destroy
    Gossip.find(params[:id]).delete
    redirect_to gossips_path
  end
end
