class QuoteService

def get_quotes
    @resp = Faraday.get 'https://seinfeld-quotes.herokuapp.com/quotes'
    @hashes = JSON.parse(@resp.body)
    @hashes["quotes"].each do |hash|
        Quote.create(content: hash["quote"], character: hash["author"], season: hash["season"], episode: hash["episode"])
    end
end

end