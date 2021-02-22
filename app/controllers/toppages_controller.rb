class ToppagesController < ApplicationController
  def index
    if params[:degree].present?
      @degree = params[:degree].to_i
      @temps = []
      current_user.temps.each do |temp|
        if temp.max.present? && temp.min.nil?
          if temp.max >= @degree
            @temps.push(temp)
          end
        elsif temp.max.nil? && temp.min.present?
          if temp.min <= @degree
            @temps.push(temp)
          end
        else
          if temp.max >= @degree && temp.min <= @degree
            @temps.push(temp)
          end
        end
      end
    end
  end
end
