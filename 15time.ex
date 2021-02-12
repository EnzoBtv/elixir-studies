Time.utc_now()
t = ~T{19:39:31.056226}

t.hour
t.minute

Date.utc_today()
{:ok, date} = Date.new(2020, 12, 12)
Date.day_of_week(date)
Date.leap_year?(date)

NaiveDateTime.utc_now
NaiveDateTime.add(~N[2018-10-01 00:00:14], 30)

DateTime.from_naive(~N[2016-05-24 13:26:08.003], "Etc/UTC")
