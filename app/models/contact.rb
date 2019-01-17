class Contact < ActiveRecord::Base
# To check whether the entries are completely filled or not, 
# by the user 
  validates :name, presence: true
  validates :email, presence: true
  validates :comments, presence: true
end