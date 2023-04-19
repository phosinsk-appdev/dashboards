class CurrenciesController < ApplicationController

  def first_currency
    
    @raw_data = open("https://api.exchangerate.host/symbols").read
    @parsed_data = JSON.parse(@raw_data)

    @symbols_hash = @parsed_data.fetch("symbols")
    @array_of_symbols = @symbols_hash.keys

   render({:template => "currency_templates/step_one.html.erb"})

  end

  def drill_down

    @first_currency = params.fetch("first_currency")

    @raw_data = open("https://api.exchangerate.host/symbols").read
    @parsed_data = JSON.parse(@raw_data)

    @symbols_hash = @parsed_data.fetch("symbols")
    @array_of_symbols = @symbols_hash.keys

    render({:template => "currency_templates/drill_down.html.erb"})

  end

  def conversion_result

    @first_currency = params.fetch("first_currency")
    @second_currency = params.fetch("second_currency")

    @raw_data = open("https://api.exchangerate.host/convert?from=#{@first_currency}&to=#{@second_currency}").read
    @parsed_data = JSON.parse(@raw_data)
    @result = @parsed_data["result"]

    render({:template => "currency_templates/conversion_result.html.erb"})

  end

end 
