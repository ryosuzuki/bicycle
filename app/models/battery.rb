class Battery < ActiveRecord::Base
  attr_accessible :watt
  validates :watt, :presence => true

  after_create :hoge
  def hoge
    Battery.where(:id => self.id - 5000).destroy_all
  end

end
