class CalculationsController < ApplicationController
  def flex_square_5
    @user_number = params["num"].to_f
    @square = @user_number ** 2
    render("calculations/flex_square_5.html.erb")
  end

  def flex_square_root
    @user_number = params["num"].to_f
    @square_root = Math.sqrt(@user_number)
    render("calculations/flex_square_root.html.erb")
  end

  def square_form
    render("calculations/square_form.html.erb")
  end

  def square
    @user_number = params[:user_number].to_f
    @square = @user_number ** 2
    render("calculations/square.html.erb")
  end

  def square_root_form
    render("calculations/square_root_form.html.erb")
  end

  def square_root
    @user_number = params[:user_number].to_f
    @square_root = (Math.sqrt(@user_number)).round(4)
    render("calculations/square_root.html.erb")
  end


  def flexible_pmt
    @basis_points = params["basis_points"].to_f
    @percent = @basis_points/100
    @percent_decimal_months = (@percent/100)/12
    @number_of_years = (params["number_of_years"].to_f).round()
    @periods = @number_of_years*12
    @present_value = (params["present_value"].to_f).round(2)
    @discount_factor = (((1+@percent_decimal_months)**@periods)-1)/(@percent_decimal_months*(1+@percent_decimal_months)**@periods)
    @monthly_pmt = (@present_value/@discount_factor).round(2)
    render("calculations/flexible_pmt.html.erb")
  end

  def flexible_random
    @min = params["min"].to_i
    @max = params["max"].to_i
    @random_number = rand(@min..@max)
    render("calculations/flexible_random.html.erb")
  end

  def payment_form
    render("calculations/payment_form.html.erb")
  end

  def payment
    @percent = params[:apr].to_f
    @percent_decimal_months = (@percent/100)/12
    @number_of_years = (params[:years].to_f).round()
    @periods = @number_of_years*12
    @present_value = (params[:principal].to_f).round(2)
    @discount_factor = (((1+@percent_decimal_months)**@periods)-1)/(@percent_decimal_months*(1+@percent_decimal_months)**@periods)
    @monthly_pmt = (@present_value/@discount_factor).round(2)
    render("calculations/payment.html.erb")
  end

  def random_form
    render("calculations/random_form.html.erb")
  end

  def random
    @min = params[:min].to_f
    @max = params[:max].to_f
    @random_number = (rand(@min..@max)).round(4)
    render("calculations/random.html.erb")
  end

  def word_count_form
    render("calculations/word_count_form.html.erb")
  end

  def word_count
    @text = params[:user_text].to_s
    @special_word = params[:user_word].to_s

    text_downcase = @text.downcase
    text_split_into_array = text_downcase.split
    @word_count = text_split_into_array.count

    text_chomp = @text.chomp
    @character_count_with_spaces = text_chomp.length

    text_no_whiteSpace = text_chomp.gsub(/\s+/, "")
    @character_count_without_spaces = text_no_whiteSpace.length

    special_word_downcase = @special_word.downcase
    @occurrences = text_downcase.scan(special_word_downcase).length

    render("calculations/word_count.html.erb")
end

def descriptive_stats_form
  render("calculations/descriptive_stats_form.html.erb")
end

def descriptive_stats
  @numbers = params[:list_of_numbers].gsub(',', '').split.map(&:to_f)

  @sorted_numbers = @numbers.sort

  @count = @numbers.count

  @minimum = @numbers.min

  @maximum = @numbers.max

  @range = @maximum - @minimum

  @median = (@sorted_numbers[(@numbers.count - 1) / 2] + @sorted_numbers[@count / 2]) / 2.0

  @sum = @numbers.sum

  @mean = @sum/@count

  all_diff_squared = []
  @numbers.each do |num|
    difference_squared = ((num - @mean) ** 2)
    all_diff_squared.push(difference_squared)
  end

  sum_of_squares = all_diff_squared.sum
  @variance = sum_of_squares/@count

  @standard_deviation = Math.sqrt(@variance)

  repeat_hash = Hash.new(0)
  @numbers.each do |num|
    repeat_hash [num] += 1
  end
    sorted_hash = repeat_hash.sort_by { |number, repeats| - repeats }
    most_repeat_array = sorted_hash[0]

  @mode = most_repeat_array[0]

  render("calculations/descriptive_stats.html.erb")
end



end
