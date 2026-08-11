use std::fmt;

#[derive(Debug,PartialEq)]
pub struct Clock {
    hours: u8,
    minutes: u8,
}

impl Clock {
    pub fn new(hours: i32, minutes: i32) -> Self {
        let hours_offset = minutes / 60 - (minutes.is_negative() && (minutes % 60 != 0)) as i32;
        Clock {
            hours: Self::in_range(hours + hours_offset, 24),
            minutes: Self::in_range(minutes, 60)
        }
    }

    pub fn add_minutes(&self, minutes: i32) -> Self {
        println!("{}", self);
        Self::new(self.hours as i32, self.minutes as i32 + minutes)
    }

    fn in_range(num: i32, range: u8) -> u8 {
        ((range as i32 + num % range as i32) % range as i32) as u8
    }
}

impl fmt::Display for Clock {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "{:0>2}:{:0>2}", self.hours, self.minutes)
    }
}