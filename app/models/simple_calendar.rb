class SimpleCalendar::BusinessWeekCalendar < SimpleCalendar::Calendar

  private

  def date_range
    @parking = Parking.find(params[:id])
    beginning = @parking.start_time
    ending    = @parking.finish_time
    (beginning..ending).to_a
  end
end
