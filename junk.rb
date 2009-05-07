
  case
  when @days_until_camp > 0
    "#{@days_until_camp} sleeps to go!"
  when days_until_camp == 0
    "Railscamp starts today!"
  when days_until_camp > -3
    "Railscamp is on!"
  else
    "#{days_until_camp} Railscamp is over :("
  end