ActiveAdmin.register Purchase do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :id, :date, :title, :user_id, amounts_attributes: [:id, :price, :purchase_id,:_destroy]

  controller do
    def find_resource
      scoped_collection.where(slug: params[:id]).first!
    end
  end

  index do
    column :id
    column :date
    column :title
    column :user_id
    column 'amounts' do |purchase|
      purchase.amounts.map(&:price).join(', ') if !purchase.amounts.map(&:price).nil?
    end 
    column :created_at
    actions  
  end

    
  form do |f|
    f.inputs "Details" do
      f.input :user_id, :label => 'User', :as => :select, :collection => User.all.map{|u| ["#{u.name}", u.id]}
      f.input :date
      f.input :title
    end
    f.has_many :amounts do |ff|
        ff.input :price 
        #repeat as necessary for all fields
    end
  actions
  end

  show do
    attributes_table do
      row :date
      row :title
      row :user
      row "amounts" do
        purchase.amounts.map(&:price).join(', ') if !purchase.amounts.map(&:price).nil?
      end
      row :created_at
    end
    active_admin_comments
  end
end
