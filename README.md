# egghead.io video downloader

Эти скрипты позволяют скачивать потоковое видео с сайта egghead.io

Возможно скачивать курсы и отдельные уроки размещенные в открытом доступе

## Использование

Точка входа plistrunner.sh

Для запуска требуется создать файл с плейлистом со списком ссылок на курсы, все файлы подхватываются автоматически

`sudo bash plistrunner.sh`

Видео будут сохранены в папке `result/название-курса` и пронумерованы с 0

### Дополнительные установки

Требуется установленный GPAC:

- Ubuntu: `sudo apt-get install gpac`

- MacOS: `brew install gpac`

Установить node.js. Выполнить `npm i` в папке `scrapper`

Создать файлы авторизации и листа загрузок:

- `touch userdata.txt && nano userdata.txt`

- `touch plist.txt && nano plist.txt`

#### Модули

В зависимости от версий модулей может потребоваться `npm rebuild libxmljs --update-binary`


## Авторизация

Для авторизации на сайте требуется файл `userdata.txt` в корне проекта

```
{
  "login":"your@email.com",
  "password":"your_password"
}
```

## Плейлист

Для скачивания нескольких курсов используется `plist.txt` в корне проекта

```
https://egghead.io/courses/start-learning-react
https://egghead.io/courses/getting-started-with-redux
https://egghead.io/courses/the-beginner-s-guide-to-reactjs
```
