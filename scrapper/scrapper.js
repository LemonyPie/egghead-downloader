const osmosis = require('osmosis');
const fs = require('fs');
const regLink = /^https:\/\/[\w\d\.]*\/[\w\d\-]*/i;

URL = process.argv[2];

osmosis
    .get(URL)
    .set({'content': '.js-react-on-rails-component'})   // альтернатива: `.find('title').set('Title')`
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
      links = links.join('\n');
      fs.writeFileSync("task.txt", links);

    })
