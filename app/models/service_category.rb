class ServiceCategory < ActiveRecord::Base

  validates_presence_of :name
  
  has_many :services
  
  default_scope :order => 'position asc'
  
  acts_as_list
  
  def self.options_for_select
    all.collect { |sc| [sc.name, sc.id] }
  end
  
  def self.order(ids)
    update_all(
      ['position = FIND_IN_SET(id, ?)', ids.join(',')],
      { :id => ids }
    )
  end

end
