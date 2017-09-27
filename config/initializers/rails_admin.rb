include RailsAdminTagList::SuggestionsHelper

RailsAdmin.config do |config|

  config.authorize_with do
    if user_signed_in?
      redirect_to main_app.root_path unless current_user.admin == true
    else
      redirect_to main_app.root_path
    end
  end

  config.model Article do
    exclude_fields :views, :comments, :popularity, :last_decay

    field :writer, :belongs_to_association

    edit do
      fields_of_type :tag_list do
        partial 'tag_list_with_suggestions'        
      end
    end
  end

  config.model Writer do
    exclude_fields :fullname
    object_label_method :fullname
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
end
