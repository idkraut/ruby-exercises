class TextAnalyzer
  # def process
  #   text = File.read ('text.txt')
  #   yield(text)
  # end

  # LS
  def process
    file = File.open('text.txt', 'r')
    yield(file.read)
    file.close
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |text| puts "#{text.split("\n").size} lines"}
analyzer.process { |text| puts "#{text.split(' ').size} words"}
analyzer.process { |text| puts "#{text.split("\n\n").size} paragraphs"}