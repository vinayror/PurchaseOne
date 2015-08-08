ActiveAdmin.register User do
  

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :name, :email, :password, :password_confirmation, :is_admin


  index do
    column :id
    column :name
    column :email 
    column :created_at
    column :is_admin
    actions  
  end


  form do |f|
    f.inputs "Details" do
      f.input :name
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :is_admin
    end
  actions
  end
  show do
    attributes_table do
      row :id
      row :name
      row :email
      row :created_at
      bool_row :is_admin
    end
    #attributes_table :id, :name, :email, :created_at, :is_admin
    active_admin_comments
  end

end
