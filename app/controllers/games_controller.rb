class GamesController < ApplicationController
  def index
    @games = Game.all
  end
  
  def play
    @game = Game.find(params[:id])
    @chosen = []
    
    if @game.level == 0
      if @game.category == 'none'
        cards = Card.all
      else
        cards = Card.where(category: @game.category)
      end
    else
      if @game.category == 'none'
        cards = Card.where(level: @game.level)
      else
        cards = Card.where(level: @game.level).where(category: @game.category)
      end
    end
    
    cards = cards.shuffle.slice(0, @game.size)

    cards.each do |card|
      @chosen << {es: card[:es], id: card[:id]}
      @chosen << {pic: card[:pic], id: card[:id]}
    end
  end

  def show
    @game = Game.find(params[:id])
  end

  def new
    @game = Game.new
  end

  def edit
    @game = Game.find(params[:id])
  end

  def create
    @game = Game.new(params[:game])

    if @game.save
      redirect_to @game, notice: 'Game was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @game = Game.find(params[:id])
    if @game.update_attributes(params[:game])
      redirect_to @game, notice: 'Game was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy
  end
end
