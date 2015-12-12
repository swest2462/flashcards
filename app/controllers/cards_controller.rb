class CardsController < ApplicationController

  def index
    @card = current_user.cards.cards_older_today.first
  end

  def all
    @card = current_user.cards.all
  end

  def show
    @card = Card.find(params[:id])
  end

  def new
    @card = Card.new
  end

  def edit
    @card = current_user.cards.find(params[:id])
  end

  def create
    @card = current_user.cards.new(card_params)

    if @card.save
      redirect_to cards_path
    else
      render 'new'
    end
  end

  def update
    @card = current_user.cards.find(params[:id])

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
    @card = Card.find(params[:card_id])

    if @card.original_text.downcase.strip == params[:user_answer].downcase.strip
      flash[:notice] = "well done"
      @card.increase_review_date
      @card.save
    else
      flash[:error] = "not right"
    end
    redirect_to root_path
  end

private
  def card_params
    params.require(:card).permit(:original_text, :translated_text, :review_date, :user_id)
  end
end
