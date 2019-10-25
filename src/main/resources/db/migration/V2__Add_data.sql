insert into user (id, active, birthd, fullname, level, password, username)
      values (1,true,'06.05.1997','Пшенин Владислав Игоревич',6,'$2a$08$lELh3yPqpGxU1EShgNtnaekg1rHg.W9y.UNsQIlUk/6Oe4AGlZzG.','admin');

insert into user_role (user_id, roles)
      values (1,'ADMIN');

insert into user (id, active, birthd, fullname, level, password, username)
      values (2,true,'23.07.1997','Раку Алексей Валерьевич',6,'$2a$08$Ic4bB26chPQYhWGCLUi2je3n9A7baIhE75.6ol8l3raGYqi8y7F9e','admin1');

insert into user_role (user_id, roles)
      values (2,'ADMIN');

insert into user (id, active, birthd, fullname, level, password, username)
      values (3,true,'06.06.1799','Пушкин Александр Сергеевич',6,'$2a$08$Ic4bB26chPQYhWGCLUi2je3n9A7baIhE75.6ol8l3raGYqi8y7F9e','ed');

insert into user_role (user_id, roles)
      values (3,'EDITOR');

insert into user (id, active, birthd, fullname, level, password, username)
      values (4,true,'20.03.1809','Гоголь Николай Васильевич',6,'$2a$08$Ic4bB26chPQYhWGCLUi2je3n9A7baIhE75.6ol8l3raGYqi8y7F9e','ed1');

insert into user_role (user_id, roles)
      values (4,'EDITOR');

insert into user (id, active, birthd, fullname, level, password, username, preferences)
      values (5,true,'03.02.1966','Жидченко Елена Константиновна',1,'$2a$08$Ic4bB26chPQYhWGCLUi2je3n9A7baIhE75.6ol8l3raGYqi8y7F9e','teach','только утром');

insert into user_role (user_id, roles)
      values (5,'TEACHER');

insert into user (id, active, birthd, fullname, level, password, username, preferences)
      values (6,true,'03.07.1994','Рунда Елена Николаевна',2,'$2a$08$Ic4bB26chPQYhWGCLUi2je3n9A7baIhE75.6ol8l3raGYqi8y7F9e','teach1','любое время, основные знания');

insert into user_role (user_id, roles)
      values (6,'TEACHER');

insert into user (id, active, birthd, fullname, level, password, username, preferences)
      values (7,true,'25.10.1984','Katheryn Elizabeth Hudson',3,'$2a$08$Ic4bB26chPQYhWGCLUi2je3n9A7baIhE75.6ol8l3raGYqi8y7F9e','teach2', 'evening,
musical talents');

insert into user_role (user_id, roles)
      values (7,'TEACHER');

insert into user (id, active, birthd, fullname, level, password, username, preferences)
      values (8,true,'17.02.1991','Edward Christopher Sheeran',4,'$2a$08$Ic4bB26chPQYhWGCLUi2je3n9A7baIhE75.6ol8l3raGYqi8y7F9e','teach3', 'evening');

insert into user_role (user_id, roles)
      values (8,'TEACHER');

insert into user (id, active, birthd, fullname, level, password, username)
      values (9,true,'04.03.1965','Robert John Downey Jr.',5,'$2a$08$Ic4bB26chPQYhWGCLUi2je3n9A7baIhE75.6ol8l3raGYqi8y7F9e','teach4');

insert into user_role (user_id, roles)
      values (9,'TEACHER');

insert into user (id, active, birthd, fullname, level, password, username)
      values (10,true,'04.09.1981','Beyonce Giselle Knowles-Carter',6,'$2a$08$Ic4bB26chPQYhWGCLUi2je3n9A7baIhE75.6ol8l3raGYqi8y7F9e','teach5');

insert into user_role (user_id, roles)
      values (10,'TEACHER');

insert into user (id, active, birthd, fullname, level, password, username, preferences)
      values (11,true,'13.12.1997','Пономарева Екатерина Дмитриевна',2,'$2a$08$Ic4bB26chPQYhWGCLUi2je3n9A7baIhE75.6ol8l3raGYqi8y7F9e','stu','вечером, добрый и чуткий учитель');

insert into user_role (user_id, roles)
      values (11,'STUDENT');

insert into student (id)
      values (11);

insert into user (id, active, birthd, fullname, level, password, username, preferences)
      values (12,true,'06.02.1998','Шепелёва Мария Павловна',3,'$2a$08$Ic4bB26chPQYhWGCLUi2je3n9A7baIhE75.6ol8l3raGYqi8y7F9e','stud1','днем');

insert into user_role (user_id, roles)
      values (12,'STUDENT');

insert into student (id)
      values (12);

insert into user (id, active, birthd, fullname, level, password, username, preferences)
      values (13,true,'13.09.1996','Петров Владимир Сергеевич',2,'$2a$08$Ic4bB26chPQYhWGCLUi2je3n9A7baIhE75.6ol8l3raGYqi8y7F9e','stud2','классный');

insert into user_role (user_id, roles)
      values (13,'STUDENT');

insert into student (id)
      values (13);

INSERT INTO task VALUES
      (1,1,'Перевести данное предложение','translate','I love you',1),(2,2,'Перевести текст','translate','The Rodriguez Brothers Circus is in town! Every year, the circus arrives and stays for a week. Then they go to the next town.\r\n\r\nThere are not many animals in the circus. People told the circus that they didn\'t like seeing animals performing. There is an elephant called Jacob and two old lions, Hattie and Meg.\r\n\r\nMost of the performers are human! There is Leopold, The Strongest Man In The World. His father also worked in the circus, but Leopold is stronger than him, he has bigger arms and bigger legs too! Leopold performs his act every night for the town\'s people who come to watch.\r\n\r\nAnother performer is Clara. She says she has the longest hair in the world. It\'s about 4 metres long! She also has a daughter who works in the circus. Her name is Sue-Ellen. Her hair is a lot shorter, but she wants to grow it as long as her mother\'s. Sue-Ellen helps look after the animals and she\'s also learning how to juggle.\r\n\r\nThe highlight of the circus are the three clowns, Pit, Pot and Pat. They all wear long red shoes, but Pat\'s shoes are the longest and sometimes, he falls over because they\'re so long! They perform for about twenty minutes and they are always the most popular act with the audience, especially the children. Many people think Pit, Pot and Pat are three brothers, but Pat is older than the other two - he\'s their father! He\'s the oldest clown in the country, but he has a lot of energy.\r\n\r\nTomorrow will be the longest day because the circus is leaving town and everything must be packed away into big trucks.',1),(3,2,'Перевести текст','translate','The first time I ever met Clare, she was working in a clothes store in Chicago. I was feeling pretty embarrassed because I had gone in to buy a scarf for my sister and there were 20 or 30 women in there and I was the only man. I was standing in the scarves, hats and gloves section feeling sorry for myself when Clare walked up to me and asked me if there was anything I needed.\r\n\r\nShe looked very beautiful and was dressed elegantly. I must admit that for a couple of seconds, I wasn\'t able to say anything. I just looked at her. Finally, I said, \"what size scarves do you have?\" and then realized that it was quite a stupid question. I left the store a few seconds later without buying anything.\r\n\r\nTwo days later, I was sitting in a coffee bar around the corner when I heard a voice behind me say, \"did you ever find the scarf you were looking for?\" I turned around and was amazed to see the same pretty girl from the clothes store. We laughed about it and shared a coffee together.\r\n\r\nTwo weeks later, I was brave enough to ask Clare to go to see a movie with me. You can imagine how unhappy I was when she said that she couldn\'t go with me. She promised to call me another time, but I didn\'t believe her. The next morning, my cell phone rang and I recognized her number on the screen. She said she was free and asked if I still wanted to go to the cinema. That was seven years ago and now we\'ve been married for nearly 5 years.',1),(4,2,'Рассказать диалог','dialog','Clerk: Good evening, sir. Can I help you?\r\n\r\nMr. Smith: Good evening, sir. Yes I’d like to know what plays are on this month.\r\n\r\nClerk: This month only two shows are on: \"Fiddler on the Roof\" and \"Sound of Music\".\r\n\r\nMr. Smith: Great. Which one would you advise my family and me to go to?\r\n\r\nClerk: Will you take you kids with you?\r\n\r\nMr. Smith: Yes, my wife and I are taking the son and daughter with us.\r\n\r\nClerk: Ok, then \"Sound of Music\" will be the best show for the whole family.\r\n\r\nMr. Smith: Very good. Can I get tickets for tonight’s show then?\r\n\r\nClerk: The front row of the dress circle is fairly free.\r\n\r\nMr. Smith: Are there any boxes?\r\n\r\nClerk: No, I’m afraid that’s all there is.\r\n\r\nMr. Smith: All right. Could I have four tickets for the front row, please?\r\n\r\nClerk: Yes, here you are. They are $22 altogether.\r\n\r\nMr. Smith: Thank you, sir.\r\n\r\nClerk: Enjoy the show!',1),(5,2,'Ответить на вопросы','question','1) Do they like dancing?\r\n2) Do you speak English?\r\n3) Are we learning?\r\n4) Does she like cycling?\r\n5) Can they swim?\r\n6) Does he like football?\r\n7) Can he play piano?\r\n8) Can she drive?',1),(6,2,'Какое предложение верно?','grammar','1) She like dancing\r\n2) She likes dancing\r\n3) She like dancings',1),(7,1,'Вставить букву','word','T..acher',1),(8,1,'Вставить букву','word','d..ntist',1),(9,3,'Вставить слово в нужной форме','grammar','1) Many rock stars say the real thrill is that they enjoy (watch) by thousands of adoring fans.\r\n2) Your car is a death trap. It (should/send) to the scrap yard years ago!\r\n3) I\'m sorry this office is so dirty but it can\'t (clean) until tomorrow morning at the earliest.\r\n4) Any teacher who hits a student should (sack) immediately.\r\n5) John\'s big dream is that he wants (discover) by a big time music producer',1),(10,3,'Вставить букву','word','1) n..rse\r\n2) med..cine\r\n3) in..ection\r\n4) X-r..y',1),(11,3,'Перевести текст','translate','Everybody loves a good wedding and I\'m no exception. I\'ve been to a load of them in my native Britain and I must say that I usually have a great time. I\'ve also been to a few abroad, including the Caribbean and Spain, and most recently (last week in fact) to one in the mountains of Sardinia. No two weddings are ever the same and I really enjoyed this one for one or two of the differences from those in the UK.',1),(12,3,'Перевести диалог','translate','Betsy: I telephoned you yesterday afternoon but you didn\'t answer? Where were you?\r\nBrian: I was in another room when you called. I didn\'t hear the phone ringing until it was too late.\r\n\r\n\r\nBetsy: What were you working on?​\r\nBrian: I was photocopying a report that I needed to send to a client. What were you doing when you telephoned?\r\n\r\nBetsy: I was looking for Tom and couldn\'t find him. Do you know where he was?\r\nBrian: Tom was driving to a meeting.\r\n\r\nBetsy: Oh, I see. What did you do yesterday?\r\nBrian: I met the representatives from Driver\'s in the morning. In the afternoon, I worked on the report and was just finishing when you telephoned. What did you do?\r\n\r\nBetsy: Well, at 9 I had a meeting with Ms. Anderson. After that, I did some research.​\r\nBrian: Sounds like a boring day!\r\n\r\nBetsy: Yes, I don\'t really like doing research. But it needs to be done.\r\nBrian: I agree with you on that, no research - no business!\r\n\r\nBetsy: Tell me about the report. What do you think of it?\r\nBrian: I think the report is a good. Tom believes it\'s good, too.\r\n\r\nBetsy: I know that every report you write is excellent.\r\nBrian: Thank you Betsy, you are always a good friend!',1);

