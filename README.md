# MobileDev Studio - Сайт студии мобильной разработки

Современный, адаптивный HTML сайт для студии мобильной разработки с красивым дизайном и интерактивными элементами.

## 🚀 Особенности

- **Современный дизайн** - Использует градиенты, тени и современные CSS техники
- **Полностью адаптивный** - Оптимизирован для всех устройств
- **Интерактивные элементы** - Анимации, hover эффекты, плавная прокрутка
- **SEO оптимизирован** - Семантическая HTML разметка
- **Быстрая загрузка** - Оптимизированные стили и скрипты

## 📁 Структура проекта

```
├── index.html          # Главная страница
├── styles.css          # Основные стили
├── script.js           # JavaScript функциональность
└── README.md           # Документация
```

## 🎨 Секции сайта

1. **Header** - Навигационное меню с логотипом
2. **Hero** - Главный экран с призывом к действию
3. **Услуги** - 6 карточек с описанием услуг
4. **Портфолио** - Примеры работ
5. **О нас** - Информация о студии и статистика
6. **Контакты** - Контактная информация и форма
7. **Footer** - Дополнительные ссылки и социальные сети

## 🛠 Технологии

- **HTML5** - Семантическая разметка
- **CSS3** - Flexbox, Grid, анимации, переменные
- **JavaScript ES6+** - Современный синтаксис
- **Font Awesome** - Иконки
- **Google Fonts** - Шрифт Inter

## 📱 Адаптивность

Сайт адаптирован для следующих разрешений:
- Desktop: 1200px+
- Tablet: 768px - 1199px
- Mobile: 320px - 767px

## 🚀 Развертывание на DigitalOcean

### Вариант 1: App Platform (Рекомендуется)

1. **Создайте аккаунт на DigitalOcean**
   - Перейдите на [digitalocean.com](https://digitalocean.com)
   - Зарегистрируйтесь и подтвердите email

2. **Создайте новое приложение**
   - В панели управления выберите "Apps"
   - Нажмите "Create App"

3. **Настройте источник**
   - Выберите "GitHub" или "GitLab"
   - Подключите ваш репозиторий
   - Выберите ветку (обычно `main` или `master`)

4. **Настройте приложение**
   - Имя: `mobiledev-studio`
   - Регион: выберите ближайший к вашей аудитории
   - План: Basic ($5/месяц)

5. **Настройте сборку**
   - Build Command: оставьте пустым (статический сайт)
   - Run Command: оставьте пустым
   - Output Directory: оставьте пустым

6. **Задеплойте**
   - Нажмите "Create Resources"
   - Дождитесь завершения деплоя

### Вариант 2: Droplet (VPS)

1. **Создайте Droplet**
   - Выберите Ubuntu 22.04 LTS
   - Размер: Basic ($6/месяц)
   - Регион: выберите ближайший

2. **Подключитесь к серверу**
   ```bash
   ssh root@your-server-ip
   ```

3. **Установите Nginx**
   ```bash
   sudo apt update
   sudo apt install nginx -y
   sudo systemctl enable nginx
   sudo systemctl start nginx
   ```

4. **Загрузите файлы сайта**
   ```bash
   sudo mkdir -p /var/www/mobiledev-studio
   cd /var/www/mobiledev-studio
   # Загрузите файлы index.html, styles.css, script.js
   ```

5. **Настройте Nginx**
   ```bash
   sudo nano /etc/nginx/sites-available/mobiledev-studio
   ```

   Добавьте конфигурацию:
   ```nginx
   server {
       listen 80;
       server_name your-domain.com www.your-domain.com;
       root /var/www/mobiledev-studio;
       index index.html;

       location / {
           try_files $uri $uri/ =404;
       }

       # Кэширование статических файлов
       location ~* \.(css|js|png|jpg|jpeg|gif|ico|svg)$ {
           expires 1y;
           add_header Cache-Control "public, immutable";
       }
   }
   ```

6. **Активируйте сайт**
   ```bash
   sudo ln -s /etc/nginx/sites-available/mobiledev-studio /etc/nginx/sites-enabled/
   sudo nginx -t
   sudo systemctl reload nginx
   ```

7. **Настройте SSL (HTTPS)**
   ```bash
   sudo apt install certbot python3-certbot-nginx -y
   sudo certbot --nginx -d your-domain.com -d www.your-domain.com
   ```

### Вариант 3: Spaces (CDN)

1. **Создайте Space**
   - В панели управления выберите "Spaces"
   - Нажмите "Create a Space"

2. **Загрузите файлы**
   - Загрузите все файлы сайта в Space
   - Установите публичный доступ

3. **Настройте CDN**
   - Включите CDN для Space
   - Получите URL для доступа к сайту

## 🔧 Настройка домена

1. **Купите домен** (например, на Namecheap, GoDaddy)
2. **Настройте DNS записи**:
   - A запись: IP вашего сервера (для Droplet)
   - CNAME: URL вашего приложения (для App Platform)
3. **Подождите обновления DNS** (до 24 часов)

## 📊 Мониторинг и аналитика

### Google Analytics
Добавьте в `<head>` секцию `index.html`:

```html
<!-- Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=GA_MEASUREMENT_ID"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'GA_MEASUREMENT_ID');
</script>
```

### Uptime мониторинг
- **DigitalOcean Monitoring** - встроенный мониторинг
- **UptimeRobot** - бесплатный внешний мониторинг
- **Pingdom** - профессиональный мониторинг

## 🚀 Оптимизация производительности

1. **Сжатие файлов**
   ```bash
   # Установите gzip
   sudo apt install gzip
   
   # Сожмите CSS и JS файлы
   gzip -k styles.css
   gzip -k script.js
   ```

2. **Кэширование браузера**
   - Файлы уже настроены для кэширования на 1 год

3. **Минификация**
   - Используйте онлайн инструменты для минификации CSS/JS

## 🔒 Безопасность

1. **HTTPS** - Обязательно включите SSL сертификат
2. **Заголовки безопасности** - Добавьте в Nginx:
   ```nginx
   add_header X-Frame-Options "SAMEORIGIN" always;
   add_header X-XSS-Protection "1; mode=block" always;
   add_header X-Content-Type-Options "nosniff" always;
   ```

## 📈 Масштабирование

- **App Platform**: Автоматическое масштабирование
- **Droplet**: Ручное масштабирование через Load Balancer
- **Spaces**: Автоматическое масштабирование CDN

## 💰 Стоимость

- **App Platform**: $5/месяц
- **Droplet**: $6/месяц
- **Spaces**: $5/месяц + $0.02/GB
- **Домен**: $10-15/год

## 🆘 Поддержка

При возникновении проблем:
1. Проверьте логи Nginx: `sudo tail -f /var/log/nginx/error.log`
2. Проверьте статус сервисов: `sudo systemctl status nginx`
3. Обратитесь в поддержку DigitalOcean

## 📝 Лицензия

Этот проект создан для демонстрации и может быть использован в коммерческих целях.

---

**Удачи с вашим сайтом! 🚀**
