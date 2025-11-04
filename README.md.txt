# Glow Beauty – ICT171 Cloud Server Project

**Student:** Farida Abdul (35435951)  
**Live URL:** http://3.249.120.238  
**GitHub Repo:** https://github.com/farida533/GlowBeauty-ICT171  
**Video Demo:** *(link will be added after recording)*

---

## 1. Overview
Cloud-based cosmetics store landing page deployed on **AWS EC2 (IaaS)**.  
Built with pure HTML/CSS, no external dependencies, no localStorage.

---

## 2. Server Setup – Step-by-Step

| Step | Command / Action |
|------|------------------|
| **Launch EC2** | Region: Europe (Ireland), Ubuntu 22.04 LTS, t2.micro, Security Group: ports 22, 80, 443 open |
| **Connect** | `ssh -i Glowbeauty-Key.pem ubuntu@3.249.120.238` |
| **Update OS** | `sudo apt update && sudo apt install apache2 -y` |
| **Start Apache** | `sudo systemctl enable --now apache2` |
| **Upload Site** | `sudo tee /var/www/html/index.html &lt; glowbeauty.html` |
| **Permissions** | `sudo chmod 644 /var/www/html/index.html` |
| **Restart Apache** | `sudo systemctl restart apache2` |

---

## 3. File List
- `index.html` – single-page Glow Beauty site (embedded CSS)
- `README.md` – this documentation
- `Glowbeauty-Key.pem` – **never commit private key** (add to `.gitignore`)

---

## 4. Script / Automation Snippet
**One-liner to recreate the site if wiped:**

```bash
#!/bin/bash
# save as rebuild.sh
sudo rm -f /var/www/html/index.html
sudo curl -o /var/www/html/index.html https://raw.githubusercontent.com/farida533/GlowBeauty-ICT171/main/index.html
sudo chmod 644 /var/www/html/index.html
sudo systemctl restart apache2
echo "Glow Beauty restored at http://3.249.120.238"