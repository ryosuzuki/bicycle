class Power < ActiveRecord::Base
  validates :watt, :presence => true

  after_create :hoge
  def hoge
    Power.where(:id => self.id - 5000).destroy_all
  end

end
