class ToppagesController < ApplicationController
  def index
    if logged_in?
      if params[:degree].present?
        @degree = params[:degree].to_i
        temps = []
        current_user.temps.each do |temp|
          if temp.max.present? && temp.min.nil?
            if temp.max >= @degree
              temps.push(temp)
            end
          elsif temp.max.nil? && temp.min.present?
            if temp.min <= @degree
              temps.push(temp)
            end
          else
            if temp.max >= @degree && temp.min <= @degree
              temps.push(temp)
            end
          end
        end
        if temps.present?
          @temp = temps[rand(0..temps.length-1)]
        end
        @cloths = []
        if @temp.present?
          @temp.temps_category.each do |category|
            if category.categorized_cloths.present?
              @cloths.push(category.categorized_cloths[rand(0..category.categorized_cloths.length-1)])
            end
          end
        end
      end
    end
  end
end
