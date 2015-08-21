package org.skc.admin.coupon;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/skc/*")
public class CouponController {

	@RequestMapping("coupon")
	public String skcCouponList(){
		return "admin/coupon/couponList";
	}
}
