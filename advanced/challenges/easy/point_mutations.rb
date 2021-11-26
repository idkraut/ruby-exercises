class DNA
  attr_reader :strand

  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(other_strand)
    result = 0
    min_length = min_length(strand, other_strand)

    min_length.times do |idx|
      result += 1 unless strand[idx] == other_strand[idx]
    end

    result
  end

  def min_length(strand1, strand2)
    strand1.size <= strand2.size ? strand1.size : strand2.size
  end
end

# LS
class DNA
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(comparison)
    shorter = @strand.length < comparison.length ? @strand : comparison
    differences = 0

    shorter.length.times do |index|
      differences += 1 unless @strand[index] == comparison[index]
    end

    differences
  end
end