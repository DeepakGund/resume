sudo -i
sudo yum install git -y
sudo yum install httpd -y
sudo systemctl start httpd
chkconfig httpd on
cd /var/www/http
git clone https://github.com/DeepakGund/resume.git
mv resume/* .
