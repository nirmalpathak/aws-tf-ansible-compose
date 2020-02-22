/*
resource "aws_alb" "alb_sonicjob" {
	name		=	"front-alb"
	internal	=	false
	security_groups	=	["${aws_security_group.web.id}"]
	#subnets		=	["${aws_subnet.public-1a.id}", "${aws_subnet.public-1b.id}"]
	enable_deletion_protection	=	true
}

resource "aws_alb_target_group" "alb_sonicjob_http" {
	name	= "alb-sonicjob-http"
	#vpc_id	= "${var.vpc_id}"
	port	= "80"
	protocol	= "HTTP"
	health_check {
                path = "/healthcheck"
                port = "80"
                protocol = "HTTP"
                healthy_threshold = 2
                unhealthy_threshold = 2
                interval = 5
                timeout = 4
                matcher = "200-308"
        }
}

resource "aws_alb_target_group_attachment" "alb_backend_http" {
  target_group_arn = "${aws_alb_target_group.alb_sonicjob_http.arn}"
  target_id        = "${aws_instance.my-web-instance.id}"
  port             = 80
}
*/
