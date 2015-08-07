ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    # div class: "blank_slate_container", id: "dashboard_default_message" do
    #   span class: "blank_slate" do
    #     span I18n.t("active_admin.dashboard_welcome.welcome")
    #     small I18n.t("active_admin.dashboard_welcome.call_to_action")
    #   end
    # end


    section h2 "Recent Purchases" do  
    table_for Purchase.order("created_at desc").limit(5) do  
      column :title do |purchase|  
        link_to purchase.title, admin_purchase_path(purchase)  
      end  
      column :date  
    end  
      strong { link_to "View All Purchases", admin_purchases_path }  
    end  

    section h2 "users list" do  
    table_for User.order("created_at desc").limit(5) do  
      column :name do |user|  
        link_to user.email, admin_user_path(user)  
      end  
      column :is_admin  
    end  
      strong { link_to "View All Users", admin_users_path }  
    end  
    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end
