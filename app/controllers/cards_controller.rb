class CardsController < ApplicationController

  def index
    @card = Card.cards_older_today.first
  end

  def all
    @card = Card.all
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

    @card = Card.find(params[:card_id])

      if @card.original_text.downcase.strip == params[:user_answer].downcase.strip
        flash[:notice] = "well done"
        @card.days3
        @card.save
      else
        flash[:error] = "not right"
      end
      redirect_to root_path
    end

private
  def card_params
    params.require(:card).permit(:original_text, :translated_text, :review_date)
  end
end
