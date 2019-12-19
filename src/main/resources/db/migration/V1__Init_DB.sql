create table lesson (
      id bigint not null auto_increment,
      local_date_time datetime not null,
      student_mark integer default null,
      teacher_mark integer default null,
      student_id bigint not null,
      teacher_id bigint not null,
      primary key (id));

create table logging (
      id bigint not null auto_increment,
      kind_of_change varchar(255) not null,
      name_Of_class varchar(255) not null,
      changes varchar(2048),
      primary key (id));

create table email (
      id bigint not null auto_increment,
      email_receiver varchar(255) not null,
      body varchar(255) not null,
      sender varchar(255) not null,
      primary key (id));

create table review (
      id bigint not null auto_increment,
      author varchar(255) not null,
      text varchar(2048) not null,
      primary key (id));

create table student (

      task bigint default null,
      teacherID bigint,
      id bigint not null,
      primary key (id));

create table task (
      id bigint not null auto_increment,
      level integer not null,
      taskname varchar(255) not null,
      type varchar(255) not null,
      text varchar(2048) not null,
      user_id bigint,
      primary key (id));

create table user (
      id bigint not null auto_increment,
      active bit not null,
      birthd varchar(255) not null,
      fullname varchar(255) not null,
      level integer not null,
      password varchar(255) not null,
      username varchar(255) not null,
      preferences varchar(255),
      primary key (id));

create table user_role (
      user_id bigint not null,
      roles varchar(255));

alter table lesson
      add constraint lesson_student_fk
      foreign key (student_id) references student (id);

alter table lesson
      add constraint lesson_teacher_fk
      foreign key (teacher_id) references user (id);

alter table student
      add constraint student_user_fk
      foreign key (id) references user (id);

alter table task
      add constraint task_user_fk
      foreign key (user_id) references user (id);

alter table user_role
      add constraint user_role_user_fk
      foreign key (user_id) references user (id);