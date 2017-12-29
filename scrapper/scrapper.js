const osmosis = require('osmosis');
const fs = require('fs');
const regLink = /^https:\/\/[\w\d\.]*\/[\w\d\-]*/i;

const URL = process.argv[2];
const USERDATA = JSON.parse(fs.readFileSync('userdata.txt'));

osmosis
    .get(URL)
    .delay(1)
    .follow('a[href="\/users\/sign_in"]@href')
    .submit('#new_user', {
      'user[email]': USERDATA.login,
      'user[password]': USERDATA.password
    })
    .delay(1)
    .set({'content': '.js-react-on-rails-component'})
    .data(function(data){

      let data_parsed = JSON.parse(data.content);

      if(URL.includes('courses')){
        var lessons = data_parsed.course.course.lessons;
      } else if (URL.includes('lessons')){
        var lessons = data_parsed.lesson;
      } else {
        throw new Error('неизвестный тип ссылки');
      }
      let links = [];

      for(let k in lessons){
        let lesson_url = lessons[k].media_urls.dash_url;
        links[k] = regLink.exec(lesson_url)[0];
      }
      links = links.join('\n') + '\n';
      fs.writeFileSync("task.txt", links);

    })
    .log(console.log)   // включить логи
