class Item < ActiveRecord::Base
  has_many :loans , :class_name => "ItemLoan" , :foreign_key => "item_id" , :dependent => :destroy
  has_many :requests , :class_name => "ItemRequest" , :foreign_key => "item_id" , :dependent => :destroy
  
  belongs_to :procurer, :class_name => "Member" , :foreign_key => "procurer_id"
  
  has_and_belongs_to_many :projects, :join_table => "items_projects"
  has_and_belongs_to_many :fieldworks, :join_table => "items_fieldworks"
 
  validates_presence_of :inventory_number, :name
end