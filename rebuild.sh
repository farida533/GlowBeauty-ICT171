#!/bin/bash
sudo rm -f /var/www/html/index.html
sudo curl -s https://raw.githubusercontent.com/farida533/GlowBeauty-ICT171/main/index.html -o /var/www/html/index.html
sudo chmod 644 /var/www/html/index.html
sudo systemctl restart apache2
echo '? Glow Beauty restored at https://glowbeautyuae.it.com'
