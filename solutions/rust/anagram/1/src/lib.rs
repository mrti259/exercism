use std::collections::HashSet;

pub fn anagrams_for<'a>(word: &str, possible_anagrams: &[&'a str]) -> HashSet<&'a str> {
    let mut anagrams = HashSet::<&str>::new();
    for w in possible_anagrams {
        if are_anagrams(&w.to_lowercase(), &word.to_lowercase()) {
            anagrams.insert(w);
        }
    }
    anagrams
}

fn are_anagrams(word1: &str, word2: &str) -> bool {
    word1 != word2
        && word1.len() == word2.len()
        && word1.chars().all(|c| char_count(word1, c) == char_count(word2, c))
        && word2.chars().all(|c| char_count(word1, c) == char_count(word2, c))
}

fn char_count(word: &str, char: char) -> usize {
    word.chars().filter(|c| c == &char).count()
}