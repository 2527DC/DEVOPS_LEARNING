#!/bin/bash
yum update -y
yum install -y httpd php

systemctl start httpd
systemctl enable httpd

echo "<html><body><h1>Private Instance</h1><p>This is a private EC2 instance deployed via Terraform</p><p>Instance ID: $(curl -s http://169.254.169.254/latest/meta-data/instance-id)</p><p>Accessible only via bastion host</p></body></html>" > /var/www/html/index.html

echo "<?php phpinfo(); ?>" > /var/www/html/info.php

yum install -y telnet nc