require "csv"
require_relative "./models/meeting"
require "json"
require "open-uri"
require "date"

@meetings = []
csv_file_path = "speakers_planery.csv"
CSV.foreach(csv_file_path, headers: true, header_converters: :symbol) do |row|
  raw_date = row[:smeetingdate]
  year, month, day = raw_date.split("/")
  western_year = year.to_i + 1911
  date = Date.new(western_year, month.to_i, day.to_i)
  if date > Date.new(2025, 1, 1)
    @meetings << row[:legislatornamelist]
  end
end

# counts = Hash.new(0)
# @meetings.each do |name|
#   if meeting.committee == committee && meeting.date > date
#     next if meeting.legislator.nil?
#     meeting.legislator.split(";").each do |name|
#       counts[name] += 1
#     end
#   end
# end
@meetings.class
plenary = @meetings.tally
committee =  {"羅美玲"=>63, "王義川"=>15, "黃仁"=>44, "沈伯洋"=>59, "林楚茵"=>61, "王定宇"=>64, "林憶君"=>33, "馬文君"=>59, "陳冠廷"=>63, "徐巧芯"=>57, "羅智強"=>3, "張啓楷"=>6, "葉元之"=>36, "鍾佳濱"=>44, "賴士葆"=>32, "陳培瑜"=>4, "蘇清泉"=>39, "洪孟楷"=>22, "楊瓊瓔"=>36, "鄭正鈐"=>30, "陳永康"=>41, "陳俊宇"=>59, "黃國昌"=>13, "黃捷"=>2, "賴惠員"=>4, "何欣純"=>4, "林俊憲"=>1, "羅明才"=>7, "李昆澤"=>1, "邱志偉"=>15, "蔡易餘"=>17, "徐欣瑩"=>5, "翁曉玲"=>6, "王鴻薇"=>25, "李坤城"=>21, "高金素梅"=>4, "麥玉珍"=>2, "鄭天財Sra Kacaw"=>11, "林倩綺"=>25, "張嘉郡"=>2, "吳宗憲"=>5, "廖先翔"=>1, "吳思瑤"=>9, "郭昱晴"=>3, "林岱樺"=>5, "劉建國"=>1, "郭國文"=>1, "張雅琳"=>1, "陳雪生"=>1, "李彥秀"=>1, "傅崐萁"=>1, "林德福"=>2, "謝龍介"=>6, "范雲"=>1, "牛煦庭"=>16, "羅廷瑋"=>3, "謝衣鳯"=>6, "萬美玲"=>1, "徐富癸"=>4, "柯志恩"=>1, "伍麗華Saidhai Tahovecahe"=>1, "盧縣一"=>1, "王安祥"=>15, "黃建賓"=>14, "蔡春綢"=>1, "陳清龍"=>1, "洪毓祥"=>2, "劉書彬"=>1}
plenary.sort_by { |_name, count| -count }

common_speakers = plenary.keys & committee.keys
p common_speakers

# from planery meetings - SAVED TO DB DO NOT EXECUTE
@legislators = []
csv_file_path = "speakers_planery.csv"
CSV.foreach(csv_file_path, headers: true, header_converters: :symbol) do |row|
  raw_date = row[:smeetingdate]
  year, month, day = raw_date.split("/")
  western_year = year.to_i + 1911
  date = Date.new(western_year, month.to_i, day.to_i)
  if date > Date.new(2025, 1, 1)
    @legislators << row[:legislatornamelist]
  end
end

legislators_clean = @legislators.flat_map do |name|
  name.split(/[,、，;]/).map(&:strip)
end

legislators_clean.uniq.each do |name|
  new_legislator = Legislator.new(name: name)
  new_legislator.save!

end
