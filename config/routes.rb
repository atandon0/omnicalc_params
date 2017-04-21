Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get("/flexible/square/:num", {:controller => "calculations", :action => "flex_square_5"})
  get("/flexible/square_root/:num", {:controller => "calculations", :action => "flex_square_root"})
  get("/square/new/", {:controller => "calculations", :action => "square_form"})
  get("/square/results/", {:controller => "calculations", :action => "square"})
  get("/flexible/payment/:basis_points/:number_of_years/:present_value", {:controller => "calculations", :action => "flexible_pmt"})
  get("/flexible/random/:min/:max", {:controller => "calculations", :action => "flexible_random"})
  get("/square_root/new/", {:controller => "calculations", :action => "square_root_form"})
  get("/square_root/results/", {:controller => "calculations", :action => "square_root"})
  get("/payment/new/", {:controller => "calculations", :action => "payment_form"})
  get("/payment/results/", {:controller => "calculations", :action => "payment"})
  get("/random/new/", {:controller => "calculations", :action => "random_form"})
  get("/random/results/", {:controller => "calculations", :action => "random"})

  get("/word_count/new/", {:controller => "calculations", :action => "word_count_form"})
  get("/word_count/results/", {:controller => "calculations", :action => "word_count"})
  get("/descriptive_statistics/new/", {:controller => "calculations", :action => "descriptive_stats_form"})
  get("/descriptive_statistics/results/", {:controller => "calculations", :action => "descriptive_stats"})

end
