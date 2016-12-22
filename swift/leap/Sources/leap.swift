class Year {
	var year : Int

	var isLeapYear : Bool {
		/*
			if year is divisible by 400 then
				is_leap_year
			else if year is divisible by 100 then
				not_leap_year
			else if year is divisible by 4 then
				is_leap_year
			else
				not_leap_year
		*/
		get {
			print(year)
			if year % 400 == 0 {
				return true
			} else if year % 100 == 0 {
				return false
			} else if year % 4 == 0 {
				return true
			} else {
				return false
			}
		}

	}

	init(calendarYear:Int) {
		year = calendarYear
	}
}
