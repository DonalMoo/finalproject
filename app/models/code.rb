class Code < ActiveRecord::Base

  #Code from coupon code gem documentation - https://github.com/baxang/coupon-gen
  #@author Sanghyun Park [Accessed 25 June 2016]
  belongs_to :campaign
  validates :code, presence: true, uniqueness: { scope: :campaign }
  validate -> (r) { errors.add(:code, 'Code is not valid.') if CouponCode.validate(r.code).nil? }
  before_validation -> (r) { r.code = CouponCode.generate }, on: :create

  def redeem
    return false if redeemed?
    touch :redeemed_at
  end

  def redeemed?
    redeemed_at?
  end
end