# 🚀 Быстрое развертывание на DigitalOcean

## Вариант 1: App Platform (Самый простой)

1. **Создайте аккаунт на DigitalOcean**
   - Перейдите на [digitalocean.com](https://digitalocean.com)
   - Зарегистрируйтесь и подтвердите email

2. **Создайте приложение**
   - В панели управления выберите "Apps"
   - Нажмите "Create App"
   - Выберите "GitHub" как источник
   - Подключите ваш репозиторий с этим кодом

3. **Настройте приложение**
   - Имя: `mobiledev-studio`
   - Регион: выберите ближайший
   - План: Basic ($5/месяц)

4. **Задеплойте**
   - Нажмите "Create Resources"
   - Дождитесь завершения

## Вариант 2: Droplet (VPS) - Автоматический

1. **Создайте Droplet**
   - Выберите Ubuntu 22.04 LTS
   - Размер: Basic ($6/месяц)
   - Регион: выберите ближайший

2. **Подключитесь к серверу**
   ```bash
   ssh root@your-server-ip
   ```

3. **Запустите автоматический скрипт**
   ```bash
   # Скачайте скрипт
   wget https://raw.githubusercontent.com/your-username/mobiledev-studio/main/deploy.sh
   
   # Сделайте исполняемым
   chmod +x deploy.sh
   
   # Запустите
   sudo ./deploy.sh
   ```

4. **Готово!**
   - Сайт будет доступен по IP адресу вашего сервера
   - Все настройки выполнены автоматически

## Вариант 3: Ручное развертывание

1. **Создайте Droplet** (как в варианте 2)

2. **Подключитесь к серверу**

3. **Установите Nginx**
   ```bash
   sudo apt update
   sudo apt install nginx -y
   ```

4. **Создайте директорию и файлы**
   ```bash
   sudo mkdir -p /var/www/mobiledev-studio
   cd /var/www/mobiledev-studio
   # Скопируйте файлы index.html, styles.css, script.js
   ```

5. **Настройте Nginx**
   ```bash
   sudo nano /etc/nginx/sites-available/mobiledev-studio
   # Добавьте конфигурацию из deploy.sh
   ```

6. **Активируйте сайт**
   ```bash
   sudo ln -s /etc/nginx/sites-available/mobiledev-studio /etc/nginx/sites-enabled/
   sudo nginx -t
   sudo systemctl reload nginx
   ```

## 🔧 После развертывания

### Установка SSL (HTTPS)
```bash
sudo apt install certbot python3-certbot-nginx -y
sudo certbot --nginx -d your-domain.com
```

### Настройка домена
1. Купите домен (Namecheap, GoDaddy)
2. Настройте DNS записи:
   - A запись: IP вашего сервера
   - CNAME: www → @

### Мониторинг
- **DigitalOcean Monitoring**: встроенный
- **UptimeRobot**: бесплатный внешний мониторинг

## 💰 Стоимость

- **App Platform**: $5/месяц
- **Droplet**: $6/месяц
- **Домен**: $10-15/год

## 🆘 Поддержка

- **DigitalOcean Docs**: [docs.digitalocean.com](https://docs.digitalocean.com)
- **Community**: [digitalocean.com/community](https://digitalocean.com/community)
- **Support**: через панель управления

---

**Выберите App Platform для простоты или Droplet для контроля! 🚀**
