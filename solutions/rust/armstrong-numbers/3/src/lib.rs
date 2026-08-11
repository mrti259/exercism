pub fn is_armstrong_number(num: u32) -> bool {
    if num == 0 {
        return true;
    }
    let count = num.ilog(10) + 1;
    let mut sum = 0;
    for c in num.to_string().chars() {
        if let Some(n) = c.to_digit(10) {
            sum += n.pow(count);
        }
    }
    sum == num
}
