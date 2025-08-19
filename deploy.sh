#!/bin/bash

# Скрипт для автоматического развертывания сайта на DigitalOcean
# MobileDev Studio - Студия мобильной разработки

echo "🚀 Начинаем развертывание сайта MobileDev Studio на DigitalOcean..."

# Проверяем, что скрипт запущен от root
if [ "$EUID" -ne 0 ]; then
    echo "❌ Этот скрипт должен быть запущен от имени root"
    echo "Используйте: sudo ./deploy.sh"
    exit 1
fi

# Обновляем систему
echo "📦 Обновляем систему..."
apt update && apt upgrade -y

# Устанавливаем необходимые пакеты
echo "🔧 Устанавливаем необходимые пакеты..."
apt install -y nginx curl wget unzip

# Создаем директорию для сайта
echo "📁 Создаем директорию для сайта..."
mkdir -p /var/www/mobiledev-studio
cd /var/www/mobiledev-studio

# Создаем файлы сайта
echo "📝 Создаем файлы сайта..."

# Создаем index.html
cat > index.html << 'EOF'
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MobileDev Studio - Студия мобильной разработки</title>
    <link rel="stylesheet" href="styles.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
    <!-- Header -->
    <header class="header">
        <nav class="nav">
            <div class="nav-container">
                <div class="logo">
                    <i class="fas fa-mobile-alt"></i>
                    <span>MobileDev Studio</span>
                </div>
                <ul class="nav-menu">
                    <li><a href="#home">Главная</a></li>
                    <li><a href="#services">Услуги</a></li>
                    <li><a href="#portfolio">Портфолио</a></li>
                    <li><a href="#about">О нас</a></li>
                    <li><a href="#contact">Контакты</a></li>
                </ul>
                <div class="nav-toggle">
                    <span></span>
                    <span></span>
                    <span></span>
                </div>
            </div>
        </nav>
    </header>

    <!-- Hero Section -->
    <section id="home" class="hero">
        <div class="hero-container">
            <div class="hero-content">
                <h1 class="hero-title">
                    Создаем <span class="highlight">инновационные</span> мобильные приложения
                </h1>
                <p class="hero-description">
                    Мы специализируемся на разработке качественных мобильных приложений для iOS и Android, 
                    которые помогают бизнесу расти и развиваться в цифровом мире.
                </p>
                <div class="hero-buttons">
                    <a href="#contact" class="btn btn-primary">Начать проект</a>
                    <a href="#portfolio" class="btn btn-secondary">Посмотреть работы</a>
                </div>
            </div>
            <div class="hero-image">
                <div class="phone-mockup">
                    <div class="phone-screen">
                        <div class="app-preview">
                            <div class="app-header"></div>
                            <div class="app-content">
                                <div class="content-item"></div>
                                <div class="content-item"></div>
                                <div class="content-item"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Services Section -->
    <section id="services" class="services">
        <div class="container">
            <div class="section-header">
                <h2>Наши услуги</h2>
                <p>Полный цикл разработки мобильных приложений</p>
            </div>
            <div class="services-grid">
                <div class="service-card">
                    <div class="service-icon">
                        <i class="fas fa-mobile-alt"></i>
                    </div>
                    <h3>iOS Разработка</h3>
                    <p>Создание нативных приложений для iPhone и iPad с использованием Swift и SwiftUI</p>
                </div>
                <div class="service-card">
                    <div class="service-icon">
                        <i class="fab fa-android"></i>
                    </div>
                    <h3>Android Разработка</h3>
                    <p>Разработка приложений для Android с использованием Kotlin и Jetpack Compose</p>
                </div>
                <div class="service-card">
                    <div class="service-icon">
                        <i class="fas fa-code"></i>
                    </div>
                    <h3>Кроссплатформенная разработка</h3>
                    <p>Создание приложений для обеих платформ с помощью React Native и Flutter</p>
                </div>
                <div class="service-card">
                    <div class="service-icon">
                        <i class="fas fa-paint-brush"></i>
                    </div>
                    <h3>UI/UX Дизайн</h3>
                    <p>Создание интуитивных и красивых интерфейсов для мобильных приложений</p>
                </div>
                <div class="service-card">
                    <div class="service-icon">
                        <i class="fas fa-server"></i>
                    </div>
                    <h3>Backend Разработка</h3>
                    <p>Создание серверной части для мобильных приложений</p>
                </div>
                <div class="service-card">
                    <div class="service-icon">
                        <i class="fas fa-tools"></i>
                    </div>
                    <h3>Поддержка и обновления</h3>
                    <p>Техническая поддержка и регулярные обновления приложений</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Portfolio Section -->
    <section id="portfolio" class="portfolio">
        <div class="container">
            <div class="section-header">
                <h2>Наши работы</h2>
                <p>Примеры успешно реализованных проектов</p>
            </div>
            <div class="portfolio-grid">
                <div class="portfolio-item">
                    <div class="portfolio-image">
                        <div class="app-mockup app-1"></div>
                    </div>
                    <div class="portfolio-info">
                        <h3>FoodDelivery App</h3>
                        <p>Приложение для доставки еды с геолокацией и онлайн-оплатой</p>
                        <div class="portfolio-tags">
                            <span>iOS</span>
                            <span>Android</span>
                            <span>React Native</span>
                        </div>
                    </div>
                </div>
                <div class="portfolio-item">
                    <div class="portfolio-image">
                        <div class="app-mockup app-2"></div>
                    </div>
                    <div class="portfolio-info">
                        <h3>Fitness Tracker</h3>
                        <p>Приложение для отслеживания тренировок и здоровья</p>
                        <div class="portfolio-tags">
                            <span>iOS</span>
                            <span>Swift</span>
                            <span>HealthKit</span>
                        </div>
                    </div>
                </div>
                <div class="portfolio-item">
                    <div class="portfolio-image">
                        <div class="app-mockup app-3"></div>
                    </div>
                    <div class="portfolio-info">
                        <h3>E-commerce Platform</h3>
                        <p>Мобильная платформа для онлайн-торговли</p>
                        <div class="portfolio-tags">
                            <span>Android</span>
                            <span>Kotlin</span>
                            <span>Firebase</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- About Section -->
    <section id="about" class="about">
        <div class="container">
            <div class="about-content">
                <div class="about-text">
                    <h2>О нашей студии</h2>
                    <p>MobileDev Studio - это команда опытных разработчиков, дизайнеров и менеджеров проектов, 
                    специализирующихся на создании качественных мобильных приложений.</p>
                    <p>Мы работаем с 2018 года и успешно реализовали более 50 проектов для клиентов из различных отраслей.</p>
                    <div class="stats">
                        <div class="stat">
                            <h3>50+</h3>
                            <p>Реализованных проектов</p>
                        </div>
                        <div class="stat">
                            <h3>5+</h3>
                            <p>Лет опыта</p>
                        </div>
                        <div class="stat">
                            <h3>100%</h3>
                            <p>Довольных клиентов</p>
                        </div>
                    </div>
                </div>
                <div class="about-image">
                    <div class="team-illustration">
                        <div class="team-member"></div>
                        <div class="team-member"></div>
                        <div class="team-member"></div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Contact Section -->
    <section id="contact" class="contact">
        <div class="container">
            <div class="section-header">
                <h2>Свяжитесь с нами</h2>
                <p>Готовы обсудить ваш проект? Давайте поговорим!</p>
            </div>
            <div class="contact-content">
                <div class="contact-info">
                    <div class="contact-item">
                        <div class="contact-icon">
                            <i class="fas fa-envelope"></i>
                        </div>
                        <div>
                            <h3>Email</h3>
                            <p>hello@mobiledevstudio.com</p>
                        </div>
                    </div>
                    <div class="contact-item">
                        <div class="contact-icon">
                            <i class="fas fa-phone"></i>
                        </div>
                        <div>
                            <h3>Телефон</h3>
                            <p>+7 (999) 123-45-67</p>
                        </div>
                    </div>
                    <div class="contact-item">
                        <div class="contact-icon">
                            <i class="fas fa-map-marker-alt"></i>
                        </div>
                        <div>
                            <h3>Адрес</h3>
                            <p>Москва, ул. Примерная, д. 123</p>
                        </div>
                    </div>
                </div>
                <form class="contact-form">
                    <div class="form-group">
                        <input type="text" placeholder="Ваше имя" required>
                    </div>
                    <div class="form-group">
                        <input type="email" placeholder="Email" required>
                    </div>
                    <div class="form-group">
                        <input type="text" placeholder="Тема проекта">
                    </div>
                    <div class="form-group">
                        <textarea placeholder="Расскажите о вашем проекте" rows="5" required></textarea>
                    </div>
                    <button type="submit" class="btn btn-primary">Отправить сообщение</button>
                </form>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="footer">
        <div class="container">
            <div class="footer-content">
                <div class="footer-section">
                    <div class="logo">
                        <i class="fas fa-mobile-alt"></i>
                        <span>MobileDev Studio</span>
                    </div>
                    <p>Создаем инновационные мобильные решения для вашего бизнеса</p>
                </div>
                <div class="footer-section">
                    <h3>Услуги</h3>
                    <ul>
                        <li><a href="#services">iOS Разработка</a></li>
                        <li><a href="#services">Android Разработка</a></li>
                        <li><a href="#services">UI/UX Дизайн</a></li>
                        <li><a href="#services">Backend Разработка</a></li>
                    </ul>
                </div>
                <div class="footer-section">
                    <h3>Компания</h3>
                    <ul>
                        <li><a href="#about">О нас</a></li>
                        <li><a href="#portfolio">Портфолио</a></li>
                        <li><a href="#contact">Контакты</a></li>
                        <li><a href="#careers">Карьера</a></li>
                    </ul>
                </div>
                <div class="footer-section">
                    <h3>Социальные сети</h3>
                    <div class="social-links">
                        <a href="#"><i class="fab fa-telegram"></i></a>
                        <a href="#"><i class="fab fa-vk"></i></a>
                        <a href="#"><i class="fab fa-github"></i></a>
                        <a href="#"><i class="fab fa-linkedin"></i></a>
                    </div>
                </div>
            </div>
            <div class="footer-bottom">
                <p>&copy; 2024 MobileDev Studio. Все права защищены.</p>
            </div>
        </div>
    </footer>

    <script src="script.js"></script>
</body>
</html>
EOF

# Создаем styles.css
cat > styles.css << 'EOF'
/* Reset and Base Styles */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

html {
    scroll-behavior: smooth;
}

body {
    font-family: 'Inter', sans-serif;
    line-height: 1.6;
    color: #333;
    overflow-x: hidden;
}

.container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 20px;
}

/* Header Styles */
.header {
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    background: rgba(255, 255, 255, 0.95);
    backdrop-filter: blur(10px);
    z-index: 1000;
    transition: all 0.3s ease;
}

.nav-container {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 1rem 2rem;
    max-width: 1200px;
    margin: 0 auto;
}

.logo {
    display: flex;
    align-items: center;
    font-size: 1.5rem;
    font-weight: 700;
    color: #2563eb;
}

.logo i {
    margin-right: 0.5rem;
    font-size: 2rem;
}

.nav-menu {
    display: flex;
    list-style: none;
    gap: 2rem;
}

.nav-menu a {
    text-decoration: none;
    color: #333;
    font-weight: 500;
    transition: color 0.3s ease;
}

.nav-menu a:hover {
    color: #2563eb;
}

.nav-toggle {
    display: none;
    flex-direction: column;
    cursor: pointer;
}

.nav-toggle span {
    width: 25px;
    height: 3px;
    background: #333;
    margin: 3px 0;
    transition: 0.3s;
}

/* Hero Section */
.hero {
    padding: 120px 0 80px;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    color: white;
    min-height: 100vh;
    display: flex;
    align-items: center;
}

.hero-container {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 4rem;
    align-items: center;
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 2rem;
}

.hero-title {
    font-size: 3.5rem;
    font-weight: 700;
    line-height: 1.2;
    margin-bottom: 1.5rem;
}

.highlight {
    color: #fbbf24;
}

.hero-description {
    font-size: 1.2rem;
    margin-bottom: 2rem;
    opacity: 0.9;
}

.hero-buttons {
    display: flex;
    gap: 1rem;
    flex-wrap: wrap;
}

.btn {
    padding: 1rem 2rem;
    border-radius: 50px;
    text-decoration: none;
    font-weight: 600;
    transition: all 0.3s ease;
    display: inline-block;
    border: none;
    cursor: pointer;
}

.btn-primary {
    background: #fbbf24;
    color: #1f2937;
}

.btn-primary:hover {
    background: #f59e0b;
    transform: translateY(-2px);
}

.btn-secondary {
    background: transparent;
    color: white;
    border: 2px solid white;
}

.btn-secondary:hover {
    background: white;
    color: #1f2937;
}

/* Phone Mockup */
.phone-mockup {
    display: flex;
    justify-content: center;
    align-items: center;
}

.phone-screen {
    width: 280px;
    height: 500px;
    background: #1f2937;
    border-radius: 30px;
    padding: 20px;
    box-shadow: 0 20px 40px rgba(0, 0, 0, 0.3);
}

.app-preview {
    background: white;
    height: 100%;
    border-radius: 20px;
    overflow: hidden;
}

.app-header {
    height: 60px;
    background: #2563eb;
    border-radius: 20px 20px 0 0;
}

.app-content {
    padding: 20px;
}

.content-item {
    height: 20px;
    background: #e5e7eb;
    margin-bottom: 15px;
    border-radius: 10px;
}

.content-item:nth-child(2) {
    width: 80%;
}

.content-item:nth-child(3) {
    width: 60%;
}

/* Section Headers */
.section-header {
    text-align: center;
    margin-bottom: 4rem;
}

.section-header h2 {
    font-size: 2.5rem;
    font-weight: 700;
    margin-bottom: 1rem;
    color: #1f2937;
}

.section-header p {
    font-size: 1.1rem;
    color: #6b7280;
    max-width: 600px;
    margin: 0 auto;
}

/* Services Section */
.services {
    padding: 80px 0;
    background: #f9fafb;
}

.services-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
    gap: 2rem;
}

.service-card {
    background: white;
    padding: 2rem;
    border-radius: 20px;
    text-align: center;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.service-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
}

.service-icon {
    width: 80px;
    height: 80px;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    margin: 0 auto 1.5rem;
}

.service-icon i {
    font-size: 2rem;
    color: white;
}

.service-card h3 {
    font-size: 1.5rem;
    font-weight: 600;
    margin-bottom: 1rem;
    color: #1f2937;
}

.service-card p {
    color: #6b7280;
    line-height: 1.6;
}

/* Portfolio Section */
.portfolio {
    padding: 80px 0;
}

.portfolio-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(400px, 1fr));
    gap: 2rem;
}

.portfolio-item {
    background: white;
    border-radius: 20px;
    overflow: hidden;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
    transition: transform 0.3s ease;
}

.portfolio-item:hover {
    transform: translateY(-5px);
}

.portfolio-image {
    height: 250px;
    background: #f3f4f6;
    display: flex;
    align-items: center;
    justify-content: center;
}

.app-mockup {
    width: 120px;
    height: 200px;
    border-radius: 15px;
    position: relative;
}

.app-1 {
    background: linear-gradient(135deg, #fbbf24 0%, #f59e0b 100%);
}

.app-2 {
    background: linear-gradient(135deg, #10b981 0%, #059669 100%);
}

.app-3 {
    background: linear-gradient(135deg, #8b5cf6 0%, #7c3aed 100%);
}

.portfolio-info {
    padding: 1.5rem;
}

.portfolio-info h3 {
    font-size: 1.3rem;
    font-weight: 600;
    margin-bottom: 0.5rem;
    color: #1f2937;
}

.portfolio-info p {
    color: #6b7280;
    margin-bottom: 1rem;
}

.portfolio-tags {
    display: flex;
    gap: 0.5rem;
    flex-wrap: wrap;
}

.portfolio-tags span {
    background: #e5e7eb;
    color: #374151;
    padding: 0.25rem 0.75rem;
    border-radius: 20px;
    font-size: 0.875rem;
    font-weight: 500;
}

/* About Section */
.about {
    padding: 80px 0;
    background: #f9fafb;
}

.about-content {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 4rem;
    align-items: center;
}

.about-text h2 {
    font-size: 2.5rem;
    font-weight: 700;
    margin-bottom: 1.5rem;
    color: #1f2937;
}

.about-text p {
    font-size: 1.1rem;
    color: #6b7280;
    margin-bottom: 1rem;
    line-height: 1.7;
}

.stats {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 2rem;
    margin-top: 2rem;
}

.stat {
    text-align: center;
}

.stat h3 {
    font-size: 2.5rem;
    font-weight: 700;
    color: #2563eb;
    margin-bottom: 0.5rem;
}

.stat p {
    color: #6b7280;
    font-weight: 500;
}

.team-illustration {
    display: flex;
    justify-content: center;
    gap: 1rem;
}

.team-member {
    width: 80px;
    height: 80px;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    border-radius: 50%;
}

/* Contact Section */
.contact {
    padding: 80px 0;
}

.contact-content {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 4rem;
}

.contact-info {
    display: flex;
    flex-direction: column;
    gap: 2rem;
}

.contact-item {
    display: flex;
    align-items: center;
    gap: 1rem;
}

.contact-icon {
    width: 60px;
    height: 60px;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
}

.contact-icon i {
    font-size: 1.5rem;
    color: white;
}

.contact-item h3 {
    font-size: 1.2rem;
    font-weight: 600;
    margin-bottom: 0.25rem;
    color: #1f2937;
}

.contact-item p {
    color: #6b7280;
}

.contact-form {
    display: flex;
    flex-direction: column;
    gap: 1.5rem;
}

.form-group input,
.form-group textarea {
    width: 100%;
    padding: 1rem;
    border: 2px solid #e5e7eb;
    border-radius: 10px;
    font-size: 1rem;
    transition: border-color 0.3s ease;
}

.form-group input:focus,
.form-group textarea:focus {
    outline: none;
    border-color: #2563eb;
}

.form-group textarea {
    resize: vertical;
    min-height: 120px;
}

/* Footer */
.footer {
    background: #1f2937;
    color: white;
    padding: 60px 0 20px;
}

.footer-content {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
    gap: 2rem;
    margin-bottom: 2rem;
}

.footer-section h3 {
    font-size: 1.2rem;
    font-weight: 600;
    margin-bottom: 1rem;
    color: #fbbf24;
}

.footer-section ul {
    list-style: none;
}

.footer-section ul li {
    margin-bottom: 0.5rem;
}

.footer-section ul li a {
    color: #d1d5db;
    text-decoration: none;
    transition: color 0.3s ease;
}

.footer-section ul li a:hover {
    color: white;
}

.social-links {
    display: flex;
    gap: 1rem;
}

.social-links a {
    width: 40px;
    height: 40px;
    background: #374151;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    color: white;
    text-decoration: none;
    transition: background 0.3s ease;
}

.social-links a:hover {
    background: #2563eb;
}

.footer-bottom {
    text-align: center;
    padding-top: 2rem;
    border-top: 1px solid #374151;
    color: #9ca3af;
}

/* Responsive Design */
@media (max-width: 768px) {
    .nav-menu {
        display: none;
    }
    
    .nav-toggle {
        display: flex;
    }
    
    .hero-container {
        grid-template-columns: 1fr;
        text-align: center;
        gap: 2rem;
    }
    
    .hero-title {
        font-size: 2.5rem;
    }
    
    .about-content {
        grid-template-columns: 1fr;
        gap: 2rem;
    }
    
    .contact-content {
        grid-template-columns: 1fr;
        gap: 2rem;
    }
    
    .stats {
        grid-template-columns: 1fr;
        gap: 1rem;
    }
    
    .services-grid {
        grid-template-columns: 1fr;
    }
    
    .portfolio-grid {
        grid-template-columns: 1fr;
    }
    
    .hero-buttons {
        justify-content: center;
    }
    
    .phone-screen {
        width: 240px;
        height: 400px;
    }
}

@media (max-width: 480px) {
    .container {
        padding: 0 15px;
    }
    
    .nav-container {
        padding: 1rem;
    }
    
    .hero {
        padding: 100px 0 60px;
    }
    
    .hero-title {
        font-size: 2rem;
    }
    
    .section-header h2 {
        font-size: 2rem;
    }
    
    .btn {
        padding: 0.875rem 1.5rem;
        font-size: 0.875rem;
    }
}
EOF

# Создаем script.js
cat > script.js << 'EOF'
// Mobile Navigation Toggle
const navToggle = document.querySelector('.nav-toggle');
const navMenu = document.querySelector('.nav-menu');

navToggle.addEventListener('click', () => {
    navMenu.classList.toggle('active');
    navToggle.classList.toggle('active');
});

// Close mobile menu when clicking on a link
document.querySelectorAll('.nav-menu a').forEach(link => {
    link.addEventListener('click', () => {
        navMenu.classList.remove('active');
        navToggle.classList.remove('active');
    });
});

// Smooth scrolling for navigation links
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
        e.preventDefault();
        const target = document.querySelector(this.getAttribute('href'));
        if (target) {
            target.scrollIntoView({
                behavior: 'smooth',
                block: 'start'
            });
        }
    });
});

// Header background change on scroll
window.addEventListener('scroll', () => {
    const header = document.querySelector('.header');
    if (window.scrollY > 100) {
        header.style.background = 'rgba(255, 255, 255, 0.98)';
        header.style.boxShadow = '0 2px 20px rgba(0, 0, 0, 0.1)';
    } else {
        header.style.background = 'rgba(255, 255, 255, 0.95)';
        header.style.boxShadow = 'none';
    }
});

// Form submission handling
const contactForm = document.querySelector('.contact-form');
if (contactForm) {
    contactForm.addEventListener('submit', function(e) {
        e.preventDefault();
        
        // Get form data
        const formData = new FormData(this);
        const name = this.querySelector('input[type="text"]').value;
        const email = this.querySelector('input[type="email"]').value;
        const subject = this.querySelectorAll('input[type="text"]')[1].value;
        const message = this.querySelector('textarea').value;
        
        // Simple validation
        if (!name || !email || !message) {
            alert('Пожалуйста, заполните все обязательные поля');
            return;
        }
        
        // Email validation
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailRegex.test(email)) {
            alert('Пожалуйста, введите корректный email адрес');
            return;
        }
        
        // Simulate form submission
        const submitBtn = this.querySelector('button[type="submit"]');
        const originalText = submitBtn.textContent;
        
        submitBtn.textContent = 'Отправляется...';
        submitBtn.disabled = true;
        
        // Simulate API call
        setTimeout(() => {
            alert('Спасибо! Ваше сообщение отправлено. Мы свяжемся с вами в ближайшее время.');
            this.reset();
            submitBtn.textContent = originalText;
            submitBtn.disabled = false;
        }, 2000);
    });
}

// Animate elements on scroll
const observerOptions = {
    threshold: 0.1,
    rootMargin: '0px 0px -50px 0px'
};

const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
        if (entry.isIntersecting) {
            entry.target.style.opacity = '1';
            entry.target.style.transform = 'translateY(0)';
        }
    });
}, observerOptions);

// Observe elements for animation
document.addEventListener('DOMContentLoaded', () => {
    const animateElements = document.querySelectorAll('.service-card, .portfolio-item, .stat');
    
    animateElements.forEach(el => {
        el.style.opacity = '0';
        el.style.transform = 'translateY(30px)';
        el.style.transition = 'opacity 0.6s ease, transform 0.6s ease';
        observer.observe(el);
    });
});

// Add hover effects to service cards
document.querySelectorAll('.service-card').forEach(card => {
    card.addEventListener('mouseenter', function() {
        this.style.transform = 'translateY(-10px) scale(1.02)';
    });
    
    card.addEventListener('mouseleave', function() {
        this.style.transform = 'translateY(0) scale(1)';
    });
});

// Add click effects to portfolio items
document.querySelectorAll('.portfolio-item').forEach(item => {
    item.addEventListener('click', function() {
        // Add a subtle click animation
        this.style.transform = 'scale(0.98)';
        setTimeout(() => {
            this.style.transform = 'scale(1)';
        }, 150);
    });
});

// Counter animation for stats
function animateCounter(element, target, duration = 2000) {
    let start = 0;
    const increment = target / (duration / 16);
    
    function updateCounter() {
        start += increment;
        if (start < target) {
            element.textContent = Math.floor(start) + '+';
            requestAnimationFrame(updateCounter);
        } else {
            element.textContent = target + '+';
        }
    }
    
    updateCounter();
}

// Trigger counter animation when stats section is visible
const statsSection = document.querySelector('.stats');
if (statsSection) {
    const statsObserver = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                const counters = entry.target.querySelectorAll('.stat h3');
                counters.forEach(counter => {
                    const target = parseInt(counter.textContent);
                    animateCounter(counter, target);
                });
                statsObserver.unobserve(entry.target);
            }
        });
    }, { threshold: 0.5 });
    
    statsObserver.observe(statsSection);
}

// Add loading animation for images
document.addEventListener('DOMContentLoaded', () => {
    const images = document.querySelectorAll('img');
    images.forEach(img => {
        img.addEventListener('load', function() {
            this.style.opacity = '1';
        });
        
        img.style.opacity = '0';
        img.style.transition = 'opacity 0.3s ease';
    });
});

// Smooth reveal animation for sections
const revealSections = document.querySelectorAll('section');
revealSections.forEach(section => {
    const sectionObserver = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.classList.add('revealed');
            }
        });
    }, { threshold: 0.1 });
    
    sectionObserver.observe(section);
});

// Add CSS for revealed sections
const style = document.createElement('style');
style.textContent = `
    section {
        opacity: 0;
        transform: translateY(30px);
        transition: opacity 0.8s ease, transform 0.8s ease;
    }
    
    section.revealed {
        opacity: 1;
        transform: translateY(0);
    }
    
    .hero {
        opacity: 1 !important;
        transform: none !important;
    }
`;
document.head.appendChild(style);

// Parallax effect for hero section
window.addEventListener('scroll', () => {
    const scrolled = window.pageYOffset;
    const hero = document.querySelector('.hero');
    if (hero) {
        const rate = scrolled * -0.5;
        hero.style.transform = `translateY(${rate}px)`;
    }
});

// Add active state to navigation links
function updateActiveNavLink() {
    const sections = document.querySelectorAll('section[id]');
    const navLinks = document.querySelectorAll('.nav-menu a');
    
    let current = '';
    sections.forEach(section => {
        const sectionTop = section.offsetTop;
        const sectionHeight = section.clientHeight;
        if (window.pageYOffset >= sectionTop - 200) {
            current = section.getAttribute('id');
        }
    });
    
    navLinks.forEach(link => {
        link.classList.remove('active');
        if (link.getAttribute('href') === `#${current}`) {
            link.classList.add('active');
        }
    });
}

window.addEventListener('scroll', updateActiveNavLink);

// Add CSS for active navigation link
const navStyle = document.createElement('style');
navStyle.textContent = `
    .nav-menu a.active {
        color: #2563eb !important;
        font-weight: 600;
    }
    
    .nav-menu a.active::after {
        content: '';
        position: absolute;
        bottom: -5px;
        left: 0;
        width: 100%;
        height: 2px;
        background: #2563eb;
        border-radius: 1px;
    }
    
    .nav-menu li {
        position: relative;
    }
`;
document.head.appendChild(navStyle);
EOF

# Настраиваем права доступа
echo "🔐 Настраиваем права доступа..."
chown -R www-data:www-data /var/www/mobiledev-studio
chmod -R 755 /var/www/mobiledev-studio

# Создаем конфигурацию Nginx
echo "⚙️ Создаем конфигурацию Nginx..."
cat > /etc/nginx/sites-available/mobiledev-studio << 'EOF'
server {
    listen 80;
    server_name _;
    root /var/www/mobiledev-studio;
    index index.html;

    # Gzip compression
    gzip on;
    gzip_vary on;
    gzip_min_length 1024;
    gzip_types text/plain text/css text/xml text/javascript application/javascript application/xml+rss application/json;

    location / {
        try_files $uri $uri/ =404;
    }

    # Cache static files
    location ~* \.(css|js|png|jpg|jpeg|gif|ico|svg)$ {
        expires 1y;
        add_header Cache-Control "public, immutable";
        add_header X-Content-Type-Options "nosniff";
    }

    # Security headers
    add_header X-Frame-Options "SAMEORIGIN" always;
    add_header X-XSS-Protection "1; mode=block" always;
    add_header X-Content-Type-Options "nosniff" always;
    add_header Referrer-Policy "strict-origin-when-cross-origin" always;

    # Remove server signature
    server_tokens off;
}
EOF

# Активируем сайт
echo "🔗 Активируем сайт..."
ln -sf /etc/nginx/sites-available/mobiledev-studio /etc/nginx/sites-enabled/
rm -f /etc/nginx/sites-enabled/default

# Проверяем конфигурацию Nginx
echo "✅ Проверяем конфигурацию Nginx..."
nginx -t

if [ $? -eq 0 ]; then
    echo "✅ Конфигурация Nginx корректна"
    
    # Перезапускаем Nginx
    echo "🔄 Перезапускаем Nginx..."
    systemctl reload nginx
    
    # Проверяем статус
    echo "📊 Проверяем статус сервисов..."
    systemctl status nginx --no-pager -l
    
    # Получаем IP адрес сервера
    SERVER_IP=$(curl -s ifconfig.me)
    
    echo ""
    echo "🎉 Развертывание завершено успешно!"
    echo ""
    echo "🌐 Ваш сайт доступен по адресу:"
    echo "   http://$SERVER_IP"
    echo ""
    echo "📁 Файлы сайта находятся в: /var/www/mobiledev-studio"
    echo "⚙️ Конфигурация Nginx: /etc/nginx/sites-available/mobiledev-studio"
    echo ""
    echo "🔧 Полезные команды:"
    echo "   - Проверить статус Nginx: systemctl status nginx"
    echo "   - Перезапустить Nginx: systemctl reload nginx"
    echo "   - Посмотреть логи: tail -f /var/log/nginx/error.log"
    echo ""
    echo "🚀 Следующие шаги:"
    echo "   1. Настройте домен (если есть)"
    echo "   2. Установите SSL сертификат: sudo apt install certbot python3-certbot-nginx"
    echo "   3. Настройте мониторинг и аналитику"
    echo ""
    
else
    echo "❌ Ошибка в конфигурации Nginx"
    exit 1
fi

echo "✨ Готово! Ваш сайт успешно развернут на DigitalOcean!"
