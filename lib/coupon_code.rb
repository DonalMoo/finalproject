require "coupon_code/version"

module CouponCode
	 require 'coupon_code'
	code = CouponCode::Generator.generate
	CouponCode::Validator.validate(code)

end