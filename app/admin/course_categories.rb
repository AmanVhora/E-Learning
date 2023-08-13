ActiveAdmin.register CourseCategory do
  permit_params :name
  filter :name
end
