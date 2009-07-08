class Document < ActiveRecord::Base
  belongs_to :level, :class_name => "Level", :foreign_key => "classification"
  belongs_to :author, :class_name => "Subject", :foreign_key => "subject_id"
end
