Rails.application.routes.draw do
  # Routes for the Board resource:

  # CREATE
  post("/create_board", { :controller => "boards", :action => "create" })

  post("/insert_post", {:controller => "posts", :action => "create"})
          
  # READ
  get("/", {:controller => "boards", :action => "index"})

  get("/boards", { :controller => "boards", :action => "index" })
  
  get("/boards/:path_id", { :controller => "boards", :action => "show" })
  
  # UPDATE
  
  post("/modify_board/:path_id", { :controller => "boards", :action => "update" })
  
  # DELETE
  get("/delete_board/:path_id", { :controller => "boards", :action => "destroy" })

  #------------------------------

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
