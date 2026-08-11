class HighScores
  def initialize(@scores : Array(Int32))
  end

  def scores
    @scores.clone
  end

  def latest
    @scores[-1]?
  end

  def personal_best
    @scores.max
  end

  def personal_top_three
    @scores.sort do |a,b| b <=> a end[0,3]
  end
end
