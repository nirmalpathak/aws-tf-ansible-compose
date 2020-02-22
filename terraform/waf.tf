/*
module "owasp_top_10" {
  source  = "traveloka/waf-owasp-top-10-rules/aws" #"Using TF Module https://registry.terraform.io/modules/traveloka/waf-owasp-top-10-rules/aws/0.2.0"
  version = "0.2.0"

  product_domain                 = "tsi"
  service_name                   = "tsiwaf"
  environment                    = "staging"
  description                    = "OWASP Top 10 rules for tsiwaf"
  target_scope                   = "global"
  create_rule_group              = "true"
  max_expected_uri_size          = "512"
  max_expected_query_string_size = "1024"
  max_expected_body_size         = "4096"
  max_expected_cookie_size       = "4093"
  csrf_expected_header           = "x-csrf-token"
  csrf_expected_size             = "36"
}

resource "aws_wafregional_web_acl_association" "alb_sonicjob_waf" {
  resource_arn = "${aws_alb.alb_sonicjob.arn}"
  web_acl_id   = "${module.owasp_top_10.rule_group_id}"
}
*/
