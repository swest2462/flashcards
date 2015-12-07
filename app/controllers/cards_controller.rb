class CardsController < ApplicationController

  def index
    @card = Card.cards_older_today
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
    @card = Card.new(card_params)

    if @card.save
      redirect_to cards_path
    else
      render 'new'
    end
  end

  def update
    @card = Card.find(params[:id])

    if @card.update(card_params)
      redirect_to cards_path
    else
      render 'edit'
    end
  end

  def destroy
    @card = Card.find(params[:id])
    @card.destroy

    redirect_to cards_path
  end

  def check
    @user_answer = params[:user_answer]
    @card = Card.find(params[:card_id])
    flash[:notice] = "not right"  if @card.original_text != @user_answer
  end


private
  def card_params
    params.require(:card).permit(:original_text, :translated_text, :review_date)
  end
end
