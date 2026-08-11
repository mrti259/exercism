pub fn reverse(input: &str) -> String {
    let mut v = Vec::new();
    let mut chars = input.chars();
    while let Some(char) = chars.next_back() {
        v.push(char.to_string());
    }
    v.join("")
}
