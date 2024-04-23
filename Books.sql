create table Article
(
    article_id int auto_increment
        primary key,
    title      varchar(255) not null,
    word_count int          not null,
    views      int          not null,
    author_id  int          null,
    constraint article_ibfk_1
        foreign key (author_id) references lab_sql.Author (author_id)
);

create index author_id
    on Article (author_id);

create table Author
(
    author_id int auto_increment
        primary key,
    name      varchar(255) not null
);

