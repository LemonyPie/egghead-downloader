# egghead.io video downloader

Эти скрипты позволяют скачивать потоковое видео с сайта egghead.io

Возможно скачивать курсы и отдельные уроки размещенные в открытом доступе

## Использование

Точка входа taskrunner.sh

Для запуска требуется указать страницу с плейлистом, все файлы в нем подхватываются автоматически

`sudo bash taskrunner.sh https://egghead.io/courses/the-beginner-s-guide-to-reactjs`

Видео будут пронумерованы с 0

## Авторизация

Для авторизации на сайте требуется файл `userdata.txt` в корне проекта

```{
  "login":"your@email.com",
  "password":"your_password"
}```
