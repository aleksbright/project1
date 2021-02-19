# Используем за основу контейнера Ubuntu
FROM ubuntu:latest
# Переключаем Ubuntu в неинтерактивный режим — чтобы избежать лишних запросов
ENV DEBIAN_FRONTEND noninteractive 
# Устанавливаем пакеты
RUN apt-get -y update
RUN apt-get -y install nmap apache2 wget nano
# Скачиваем статьи с сайта
RUN wget -mkEpnp -P /var/www/html/ https://www.chiark.greenend.org.uk/~sgtatham/bugs-ru.html || true
# Копируем настроенный файл конфига для апача
# COPY ./000-default.conf /etc/apache2/sites-available/
RUN sed -i "s|DocumentRoot [^ ]*|DocumentRoot /var/www/html/www.chiark.greenend.org.uk/~sgtatham/ |" /etc/apache2/sites-available/000-default.conf
# VOLUME ["/var/www/html/www.chiark.greenend.org.uk/~sgtatham/"]
# Объявляем, какой порт этот контейнер будет транслировать
EXPOSE 80
# Запуск apache при старте контейнера
CMD apachectl -D FOREGROUND
