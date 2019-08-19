module Api
    module V1
      class QuotesController < ApplicationController
        before_action :find_quote, only: [:show, :update, :delete]

        def index
            quotes = Quote.all
            render json: quotes
        end

        def show
            render json: quote
        end

        def create
            quote = Quote.new(quote_params)
            if quote.save
                render json:quote
            else
                render json: {status: 'ERROR', message: 'A new quote was not able to be created', data: quote.errors}, status: :unproccessable_entity
            end
        end

        def update
            if quote.update(quote_params)
              render json: quote
            else
              render json: {status: 'ERROR', message: 'Quote not updated', data: quote.errors}, status: :unproccessable_entity
            end
        end

        def delete
            quote.destroy
            render json: quote
        end


        private

        def find_quote
            quote = Quote.find_by(id: params[:id])
        end

        def quote_params
            params.require(:quote).permit(:content, :character, :season, :episode)
        end

      end
    end
  end