class CardsController < ApplicationController
  
  def index
    @cards = Card.all
  end

  def show
    @card = Card.find(params[:id])
  end

  def new
    @card = Card.new
  end

  def edit
    @card = Card.find(params[:id])
  end

  def create
    @card = Card.new(params[:card])
    if @card.save
      format.html { redirect_to @card, notice: 'Card was successfully created.' }
    else
      format.html { render action: "new" }
    end
  end

  def update
    @card = Card.find(params[:id])
    if @card.update_attributes(params[:card])
      format.html { redirect_to @card, notice: 'Card was successfully updated.' }
    else
      format.html { render action: "edit" }
    end
  end

  def destroy
    @card = Card.find(params[:id])
    @card.destroy
  end
end
