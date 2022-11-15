copy .env.example .env

copy docker\nginx\nginx_example.conf docker\nginx\nginx.conf
copy docker\mysql\config\mysqld-example.conf docker\mysql\config\mysqld.conf
copy application\phpunit.example.xml application\phpunit.xml
