bundle exec middleman build --clean
rsync -rvu -e "ssh -p 32937" ./build/* deploy@saffron.fractel.net:/var/www/html/developer.fractel.net
