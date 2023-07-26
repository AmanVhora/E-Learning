ActiveAdmin.register Teacher do
  actions :index, :show, :edit, :update, :destroy
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :email, :first_name, :last_name, :phone_no, :gender, :education, :birth_date, :profile_photo
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :first_name, :last_name, :phone_no, :gender, :education, :birth_date]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
  index do
    selectable_column
    id_column
    column :email
    column :first_name
    column :last_name
    column :phone_no
    column :gender
    column :education
    column :birth_date
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :profile_photo do |photo|
        image_tag(photo.profile_photo, width: 200, height: 150)
      end 
      row :email
      row :first_name
      row :last_name
      row :phone_no
      row :gender
      row :education
      row :birth_date
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end

  filter :email
  filter :first_name
  filter :last_name
  filter :education
  filter :gender
  filter :birth_date
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :first_name
      f.input :last_name
      f.input :phone_no
      f.input :gender
      f.input :education
      f.input :birth_date, as: :datepicker
      f.input :profile_photo, as: :file
      f.actions
    end
  end

  controller do
    def update
      @teacher = Teacher.find(params[:id])
      @teacher.admin_teacher = true
      if @teacher.update!(teacher_params)
        redirect_to admin_teacher_path(@teacher)
      else
        render :edit, status: :unprocessable_entity
      end
    end

    private
    def teacher_params
      params.require(:teacher).permit(:email, :first_name, :last_name, :phone_no, :gender, :education, :birth_date, :profile_photo)
    end
  end
end
