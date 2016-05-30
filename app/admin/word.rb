ActiveAdmin.register Word do
  permit_params :id, :kana, :word_jp, :word_ch, :classify, :location, :level

  index do
    selectable_column
    id_column
    column "读音", :kana
    column "日语", :word_jp
    column "中文", :word_ch
    column "词类", :classify
    column "位置", :location
    column "难易度", :level
    column "创建时间", :created_at
    actions
  end

  filter :kana, :label => "读音"
  filter :word_jp, :label => "日语"
  filter :word_ch, :label => "中文"
  filter :classify, :label => "词类"
  filter :location, :label => "位置"
  filter :level, :label => "难易度"
  filter :created_at, :label => "创建时间"

  form do |f|
    f.inputs "word Details" do
      f.input :kana, :label => "读音"
      f.input :word_jp, :label => "日语"
      f.input :word_ch, :label => "中文"
      f.input :classify, :label => "词类"
      f.input :location, :label => "位置"
      f.input :level, :label => "难易度"
    end
    f.actions
  end

end
