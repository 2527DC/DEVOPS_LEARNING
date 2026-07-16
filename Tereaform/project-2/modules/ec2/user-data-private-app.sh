#!/bin/bash
yum update -y
yum install -y httpd php

systemctl start httpd
systemctl enable httpd

cat > /var/www/html/app.php << 'EOF'
<?php
echo "<html><body>";
echo "<h1>Private Application Server</h1>";
echo "<p>Instance ID: " . file_get_contents('http://169.254.169.254/latest/meta-data/instance-id') . "</p>";
echo "<p>Private IP: " . file_get_contents('http://169.254.169.254/latest/meta-data/local-ipv4') . "</p>";
echo "<p>Availability Zone: " . file_get_contents('http://169.254.169.254/latest/meta-data/placement/availability-zone') . "</p>";
echo "<p>Status: Healthy</p>";
echo "</body></html>";
?>
EOF

echo "<?php echo 'OK'; ?>" > /var/www/html/health