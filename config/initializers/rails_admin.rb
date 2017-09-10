include RailsAdminTagList::SuggestionsHelper

RailsAdmin.config do |config|

  config.authorize_with do
    if user_signed_in?
      redirect_to main_app.root_path unless current_user.admin == true
    else
      redirect_to main_app.root_path
    end
  end


  ### Popular gems integration
  config.model Article do
    list do 
      field :title
      field :body
      field :writer do 
        searchable :firstname
        pretty_value do
          value.try(:firstname)
        end
      end
    end
    # configure :body do
    #   html_attributes rows: 50, cols: 70
    # end

    edit do
      fields_of_type :tag_list do
        partial 'tag_list_with_suggestions'        
      end
    end
  end


  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
