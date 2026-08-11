pub fn is_armstrong_number(num: u32) -> bool {
    if num == 0 {
        return true;
    }
    
    let count = num.ilog(10) + 1;
    let str = num.to_string();
    let mut chars = str.chars();
    let mut sum = 0;
    while let Some(c) = chars.next() {
        if let Some(n) = c.to_digit(10) {
            sum += n.pow(count);
        }
    }
    sum == num
}
