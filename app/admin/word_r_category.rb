ActiveAdmin.register WordRCategory do
  permit_params :id

  index do
    selectable_column
    id_column
    column "类名", :name
    column "创建时间", :created_at
    actions
  end

  filter :name, :label => "类名"
  filter :created_at, :label => "创建时间"

  form do |f|
    f.inputs "word Details" do
      f.input :name, :label => "类名"
    end
    f.actions
  end

end
