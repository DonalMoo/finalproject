class Campaign < ActiveRecord::Base

  #adapted code from coupon code gem documentation - https://github.com/baxang/coupon-gen
  #@author Sanghyun Park [Accessed 25 June 2016]
  DEFAULT_MAX_CODE = 1000
  has_many :codes,  dependent: :delete_all

  before_validation -> (r) { r.max_code ||= DEFAULT_MAX_CODE }, on: :create
  after_create :generate_default_codes

  def generate_default_codes
    1.upto(max_code).each { codes.create! }
  end
end