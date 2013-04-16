ActiveAdmin::Dashboards.build do
  section "Recent Orders" do
    table_for Order.order("created_at desc").limit(5) do
      column :client do |order|
        link_to order.client.name, [:admin, order.client]
      end
      column :status
      column :total
      column :created_at
    end
    strong { link_to "View All Orders", admin_orders_path }
  end
end