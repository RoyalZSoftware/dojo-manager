class DatePipeComponent
  def initialize()
  end

  def transform(date, with_time = false)
    with_time ? date.strftime('%d.%m.%Y - %H:%M') : date.strftime('%d.%m.%Y')
  end
end
