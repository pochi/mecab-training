require "MeCab"

mecab = MeCab::Tagger.new("-Owakati")
sentence = "昨日の夜ご飯はサンマでした。
モーニング娘。’14のコンサートを見に行きたいです。"

#puts mecab.parse(sentence)
node = mecab.parseToNode(sentence)

nodes = []

while node do
  word_options = node.feature.split(",")
  word_type = word_options.first
  if word_type != "助動詞" and word_type != "助詞" and word_type != "BOS/EOS" and word_type != "記号"
    puts word_options.inspect
    if word_options[-1] == "hatena"
      nodes << word_options[-4]
    else
      nodes << word_options[-3]
    end
  end
  node = node.next
end

puts "---"
puts nodes.join(" ")
