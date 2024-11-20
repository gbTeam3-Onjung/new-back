show databases;

create database test2;

use test2;

create table tbl_post (
    id bigint unsigned auto_increment primary key,
    post_title varchar(255) not null,
    post_content varchar(1000) not null,
    post_summary varchar(255),
    post_type varchar(100) not null,
    post_status varchar(100) default 'VISIBLE',
    post_view_count bigint default 0,
    member_id bigint unsigned not null ,
    created_date datetime default current_timestamp,
    updated_date datetime default  current_timestamp,
    constraint tbl_post_member foreign key (member_id)
      references tbl_member (id)
);

select * from tbl_post;


insert into tbl_post(id, post_title, post_summary, post_content,post_view_count, post_type, post_status, member_id)
values(151,'제목입니다zz','후원 요약zz1','후원 내용z1z',100,'VOLUNTEER','VISIBLE',2);

insert into tbl_post(id, post_title, post_summary, post_content,post_view_count, post_type, post_status, member_id)
values(79,'아픈 딸에게 아무 것도 해줄 수가 없습니다.',  '딸이 아파요','딸을 위해 후원 부탁드립니다',1,'SUPPORT','VISIBLE',22);


SELECT * FROM tbl_post WHERE id = 1;


SHOW CREATE TABLE tbl_notice;
SHOW CREATE TABLE tbl_post;


drop table tbl_post;

insert into tbl_post(id, post_title, post_summary, post_content,post_view_count, post_type, post_status, member_id)
values(40,'뭐 어쩌구 도와주세요','기부요약','기부 내용1323',35,'DONATION',0,23);


DELIMITER $$

CREATE PROCEDURE insert_multiple_posts()
BEGIN
    DECLARE i INT DEFAULT 201;
    WHILE i <= 220 DO
            INSERT INTO tbl_post(id, post_title, post_summary, post_content, post_view_count, post_type, post_status, member_id)
            VALUES (i, CONCAT('제목입니다 ', i), CONCAT('후원 요약', i), CONCAT('후원 내용', i), i, 'INQUIRY', 'VISIBLE', 2);
            SET i = i + 1;
        END WHILE;
END$$

DELIMITER ;

CALL insert_multiple_posts();
DROP PROCEDURE insert_multiple_posts;


SELECT MAX(id) FROM tbl_post;
SELECT LAST_INSERT_ID();

INSERT INTO tbl_post (id, post_title, post_summary, post_content, post_view_count, post_type, post_status, member_id)
VALUES
(81, '대한적십자사에 도움을 요청합니다', '적십자사 활동에 필요한 지원이 필요합니다', '대한적십자사의 자원봉사 활동에 필요한 물품과 자금을 지원받고 싶습니다. 여러분의 도움이 큰 힘이 됩니다.', 120, 'VOLUNTEER', 'VISIBLE', 16),
(82, '유니세프 어린이를 위한 캠페인', '어린이를 위한 후원에 동참해주세요', '유니세프 한국위원회와 함께 전 세계 어린이들에게 따뜻한 손길을 건네주세요. 작은 도움이 큰 변화를 만듭니다.', 85, 'VOLUNTEER', 'VISIBLE', 17),
(83, '월드비전과 함께하는 희망 나눔', '지구촌 아이들에게 희망을 선물해주세요', '월드비전의 다양한 활동에 참여하여 아이들에게 미래의 꿈을 지원해주세요.', 92, 'VOLUNTEER', 'VISIBLE', 18),
(84, '굿네이버스와 함께하는 따뜻한 세상', '굿네이버스의 꿈을 현실로', '굿네이버스와 함께 지역사회의 어려운 아이들에게 필요한 지원을 제공해주세요.', 70, 'VOLUNTEER', 'VISIBLE', 19),
(85, '초록우산 어린이재단 사랑 나눔', '어린이들의 밝은 미래를 위해', '초록우산 어린이재단과 함께 아이들이 꿈을 키워갈 수 있도록 지원해주세요.', 77, 'VOLUNTEER', 'VISIBLE', 20),
(86, '푸드뱅크를 통해 식량을 지원해주세요', '식량이 필요한 사람들에게 손길을', '푸드뱅크와 함께 도움이 필요한 이웃들에게 따뜻한 식사를 제공해주세요.', 60, 'VOLUNTEER', 'VISIBLE', 21),
(87, '세이브더칠드런 어린이 보호 활동', '어린이들이 안전하게 자라도록', '세이브더칠드런의 보호 활동에 참여하여 모든 어린이가 안전하게 성장할 수 있도록 도와주세요.', 95, 'VOLUNTEER', 'VISIBLE', 22),
(88, '밀알복지재단 장애인 지원 캠페인', '장애인들의 자립을 위한 도움', '밀알복지재단과 함께 장애인들이 자립할 수 있는 환경을 조성해주세요.', 78, 'VOLUNTEER', 'VISIBLE', 23),
(89, '국제구호개발기구와 함께하는 구호 활동', '재난지역에 필요한 도움', '국제구호개발기구의 구호 활동에 참여하여 재난지역에 필요한 물품과 지원을 제공해주세요.', 105, 'VOLUNTEER', 'VISIBLE', 24),
(90, '굿네이버스의 아동 후원 활동', '어린이들에게 희망을', '굿네이버스와 함께 어려운 환경에 처한 어린이들에게 새로운 희망을 선물해주세요.', 88, 'VOLUNTEER', 'VISIBLE', 25);

INSERT INTO tbl_vt (id, recruitment_count, vt_s_date, vt_e_date)
VALUES
    (81, 15, '2024-10-03', '2024-10-05'),
    (82, 20, '2024-10-10', '2024-10-12'),
    (83, 12, '2024-10-15', '2024-10-17'),
    (84, 18, '2024-10-20', '2024-10-22'),
    (85, 10, '2024-10-25', '2024-10-27'),
    (86, 25, '2024-11-01', '2024-11-03'),
    (87, 14, '2024-11-08', '2024-11-10'),
    (88, 30, '2024-11-15', '2024-11-17'),
    (89, 22, '2024-11-20', '2024-11-22'),
    (90, 16, '2024-11-25', '2024-11-27');

select * from tbl_vt;

select * from tbl_vt_application;

insert into tbl_vt_application(created_date, application_status, vt_id, member_id)
VALUES ('2024-10-01', 'APPROVED',81,6);
insert into tbl_vt_record(id, vt_time, vt_date)
VALUES (1,1, '2024-10-06');
insert into tbl_vt_application(created_date, application_status, vt_id, member_id)
VALUES ('2024-10-02', 'APPROVED',82,7);
insert into tbl_vt_record(id, vt_time, vt_date)
VALUES (2,2, '2024-10-07');
insert into tbl_vt_application(created_date, application_status, vt_id, member_id)
VALUES ('2024-10-03', 'APPROVED',83,8);
insert into tbl_vt_record(id, vt_time, vt_date)
VALUES (3,3, '2024-10-08');
insert into tbl_vt_application(created_date, application_status, vt_id, member_id)
VALUES ('2024-10-04', 'APPROVED',84,9);
insert into tbl_vt_record(id, vt_time, vt_date)
VALUES (4,4, '2024-10-09');
insert into tbl_vt_application(created_date, application_status, vt_id, member_id)
VALUES ('2024-10-05', 'APPROVED',85,10);
insert into tbl_vt_record(id, vt_time, vt_date)
VALUES (5,5, '2024-10-10');
insert into tbl_vt_application(created_date, application_status, vt_id, member_id)
VALUES ('2024-11-01', 'APPROVED',86,11);
insert into tbl_vt_record(id, vt_time, vt_date)
VALUES (6,6, '2024-11-06');
insert into tbl_vt_application(created_date, application_status, vt_id, member_id)
VALUES ('2024-11-02', 'APPROVED',87,12);
insert into tbl_vt_record(id, vt_time, vt_date)
VALUES (7,7, '2024-11-07');
insert into tbl_vt_application(created_date, application_status, vt_id, member_id)
VALUES ('2024-11-03', 'APPROVED',88,13);
insert into tbl_vt_record(id, vt_time, vt_date)
VALUES (8,8, '2024-11-08');
insert into tbl_vt_application(created_date, application_status, vt_id, member_id)
VALUES ('2024-11-04', 'APPROVED',89,14);
insert into tbl_vt_record(id, vt_time, vt_date)
VALUES (9,9, '2024-11-09');
insert into tbl_vt_application(created_date, application_status, vt_id, member_id)
VALUES ('2024-11-05', 'APPROVED',90,26);
insert into tbl_vt_record(id, vt_time, vt_date)
VALUES (10,10, '2024-11-10');




INSERT INTO tbl_post (id, post_title, post_summary, post_content, post_view_count, post_type, post_status, member_id)
VALUES
    (91, '따뜻한 겨울을 위한 난방비 지원 요청', '난방비를 지원받아 따뜻한 겨울을 보내고 싶습니다.', '추운 겨울 난방비가 부족해 어려움을 겪고 있습니다. 여러분의 작은 손길이 큰 힘이 됩니다.', 110, 'SUPPORT', 'VISIBLE', 16),
    (92, '아이들에게 학용품을 선물해주세요', '학용품 후원이 필요합니다.', '학교에 다니는 아이들이 공부에 필요한 학용품을 지원받을 수 있도록 도와주세요.', 95, 'SUPPORT', 'VISIBLE', 17),
    (93, '의료비 지원이 필요한 가족의 이야기', '의료비 후원을 간절히 기다립니다.', '큰 병으로 어려움을 겪고 있는 가족의 의료비를 지원받아 치료를 이어갈 수 있도록 도와주세요.', 120, 'SUPPORT', 'VISIBLE', 18),
    (94, '식료품 지원을 기다리는 이웃들', '식료품 후원이 절실합니다.', '기본적인 식료품조차 부족한 이웃들에게 작은 도움의 손길을 건네주세요.', 88, 'SUPPORT', 'VISIBLE', 19),
    (95, '농촌마을 어르신들을 위한 생필품 후원', '어르신들을 위한 생필품이 필요합니다.', '농촌마을의 홀로 계신 어르신들이 필요한 생필품을 지원받을 수 있도록 도와주세요.', 77, 'SUPPORT', 'VISIBLE', 20),
    (96, '장애인 자립을 위한 경제적 지원 요청', '자립을 위한 경제적 후원이 필요합니다.', '장애인들이 자립할 수 있도록 필요한 지원을 받을 수 있게 도와주세요.', 102, 'SUPPORT', 'VISIBLE', 21),
    (97, '외로운 독거노인을 위한 도시락 지원', '독거노인들에게 따뜻한 도시락을 선물해주세요.', '외롭게 지내시는 독거노인들에게 하루 한 끼의 따뜻한 도시락을 제공할 수 있도록 후원해주세요.', 65, 'SUPPORT', 'VISIBLE', 22),
    (98, '어려운 가정을 위한 교육비 지원', '아이들의 교육비 후원이 필요합니다.', '어려운 환경에 놓인 가정의 아이들이 교육을 이어나갈 수 있도록 교육비를 지원해주세요.', 80, 'SUPPORT', 'VISIBLE', 23),
    (99, '취약계층 가정을 위한 주거환경 개선', '주거환경 개선을 위한 후원이 필요합니다.', '취약계층 가정이 안전하고 깨끗한 환경에서 살 수 있도록 주거환경 개선을 지원해주세요.', 72, 'SUPPORT', 'VISIBLE', 24),
    (100, '아이들에게 따뜻한 옷을 선물해주세요', '겨울 옷이 필요한 아이들에게 후원을 부탁드립니다.', '추운 겨울 옷이 부족한 아이들에게 따뜻한 옷을 선물할 수 있도록 도와주세요.', 94, 'SUPPORT', 'VISIBLE', 25);

INSERT INTO tbl_support (id, goal_point, support_s_date, support_e_date)
VALUES
    (91, 20000, '2024-10-01', '2024-10-15'),
    (92, 35000, '2024-10-05', '2024-10-20'),
    (93, 40000, '2024-10-10', '2024-10-25'),
    (94, 25000, '2024-10-15', '2024-10-30'),
    (95, 30000, '2024-10-20', '2024-11-05'),
    (96, 45000, '2024-11-01', '2024-11-15'),
    (97, 50000, '2024-11-05', '2024-11-20'),
    (98, 32000, '2024-11-10', '2024-11-25'),
    (99, 38000, '2024-11-15', '2024-11-30'),
    (100, 27000, '2024-11-20', '2024-12-05');

select * from tbl_support;

INSERT INTO tbl_support_record (member_id, support_id, support_amount)
VALUES
    (26, 91, 18000),
    (6, 92, 25000),
    (7, 93, 35000),
    (8, 94, 20000),
    (9, 95, 27000),
    (10, 96, 40000),
    (11, 97, 45000),
    (12, 98, 30000),
    (13, 99, 35000),
    (14, 100, 26000);

INSERT INTO tbl_support_record (member_id, support_id, support_amount, created_date)
VALUES
    (26, 91, 18000, '2024-10-01'),
    (6, 92, 25000, '2024-10-05'),
    (7, 93, 20000, '2024-10-10'),
    (8, 94, 27000, '2024-10-15'),
    (9, 95, 30000, '2024-10-20');

INSERT INTO tbl_post(id, post_title, post_summary, post_content, post_view_count, post_type, post_status, member_id)
VALUES
    (121, '치료비를 마련하고 싶습니다', '갑작스러운 수술비를 마련할 수 있도록 도움을 주시면 감사하겠습니다.', '안녕하세요. 저는 지방에 거주하는 40대 가장입니다. 얼마 전 아이가 큰 사고를 당해 긴급 수술이 필요하게 되었습니다. 치료비를 마련해야 하는데, 가정 형편상 전액을 감당하기 어려운 상황입니다. 여러분의 작은 도움이라도 제 아이의 치료에 큰 힘이 될 것입니다.', 31, 'DONATION', 'VISIBLE', 6),
    (122, '대학 등록금을 마련하고 싶습니다.', '학업을 지속할 수 있도록 등록금 지원을 부탁드립니다.', '안녕하세요. 저는 대학에 다니며 미래를 준비하고 있는 20대 청년입니다. 부모님이 갑작스럽게 실직하셔서 이번 학기 등록금 마련이 어려운 상황입니다. 학업을 중단하지 않고 계속 이어갈 수 있도록 여러분의 도움을 간절히 부탁드립니다.', 30, 'DONATION', 'VISIBLE', 7),
    (123, '아이들 급식을 지원해주세요.', '급식비 지원이 필요한 아이들에게 도움을 주실 분을 찾습니다.', '안녕하세요. 저는 지역 아동센터에서 일하는 사회복지사입니다. 센터를 이용하는 아이들 중 일부는 가정 형편상 끼니를 거르는 일이 많습니다. 아이들이 건강한 식사를 할 수 있도록 급식비를 지원해주시면 큰 도움이 될 것입니다.', 29, 'DONATION', 'VISIBLE', 8),
    (124, '난방비를 지원받고 싶습니다.', '겨울철 난방비 마련에 도움을 주실 분을 찾고 있습니다.', '안녕하세요. 저는 혼자 사는 70대 노인입니다. 올해 유난히 추운 겨울이 예상되지만 난방비가 부족해 고민이 많습니다. 작은 도움이라도 주신다면 따뜻한 겨울을 보낼 수 있을 것 같습니다.', 28, 'DONATION', 'VISIBLE', 9),
    (125, '학교에 다닐 수 있도록 교복을 지원해주세요.', '새 교복이 필요한 아이에게 도움을 부탁드립니다.', '안녕하세요. 저는 초등학생 딸을 키우는 싱글맘입니다. 딸이 중학교에 진학하는데, 교복을 마련할 형편이 되지 않아 걱정이 많습니다. 여러분의 소중한 도움으로 아이가 학교를 자신 있게 다닐 수 있게 해주시면 감사하겠습니다.', 27, 'DONATION', 'VISIBLE', 10),
    (126, '유기견 보호소를 지원해주세요.', '유기견 보호소의 운영비 마련에 도움을 부탁드립니다.', '안녕하세요. 저는 소규모 유기견 보호소를 운영하고 있는 활동가입니다. 최근 보호소에 구조된 강아지들이 많아 사료비와 병원비 부담이 커지고 있습니다. 작은 도움이라도 보내주시면 아이들에게 더 나은 환경을 제공할 수 있을 것입니다.', 28, 'DONATION', 'VISIBLE', 11),
    (127, '고등학생의 해외 대회 참가를 도와주세요.', '대회 참가비 마련을 위해 도움을 주실 분을 찾습니다.', '안녕하세요. 저는 과학 고등학교에 재학 중인 학생입니다. 이번에 국제 과학 대회에 참가하게 되었지만, 항공료와 참가비를 부담하기 어려운 상황입니다. 여러분의 도움으로 제 꿈을 향해 나아갈 기회를 얻고 싶습니다.', 25, 'DONATION', 'VISIBLE', 12),
    (128, '의료 봉사를 위한 장비가 필요합니다.', '해외 의료 봉사 활동을 위한 지원을 부탁드립니다.', '안녕하세요. 저는 의료 봉사를 준비 중인 간호사입니다. 의료 장비와 의약품이 부족해 봉사 활동에 어려움을 겪고 있습니다. 작은 지원이라도 주시면 도움이 필요한 분들에게 더 많은 도움을 줄 수 있습니다.', 29, 'DONATION', 'VISIBLE', 13),
    (129, '책을 사서 공부를 이어가고 싶습니다.', '전공 서적 구입을 위한 도움을 부탁드립니다.', '안녕하세요. 저는 문학을 전공하는 대학생입니다. 이번 학기에 꼭 필요한 서적을 구입해야 하지만, 경제적인 어려움으로 힘든 상황입니다. 소중한 도움을 주시면 학업에 전념할 수 있을 것 같습니다.', 15, 'DONATION', 'VISIBLE', 14),
    (130, '농촌 마을에 깨끗한 물을 제공합니다', '식수 정화 설비를 설치할 수 있도록 도움을 주십시오.', '안녕하세요. 저는 농촌 마을의 환경 문제를 개선하는 활동가입니다. 마을 주민들이 깨끗한 식수를 사용할 수 있도록 정수 설비를 설치하려 하지만 예산이 부족합니다. 여러분의 도움으로 많은 사람이 건강하게 살아갈 수 있을 것입니다.', 57, 'DONATION', 'VISIBLE', 15),
    (131, '학교 음악실에 피아노를 지원해주세요.', '낡은 피아노를 교체하기 위한 도움을 부탁드립니다.', '안녕하세요. 저는 작은 초등학교의 음악 교사입니다. 학교 음악실에 있는 피아노가 너무 오래되어 연주가 어려운 상태입니다. 아이들이 좋은 환경에서 음악을 배울 수 있도록 새로운 피아노 구입에 도움을 주시면 감사하겠습니다.', 10, 'DONATION', 'VISIBLE', 16),
    (132, '장애 아동을 위한 휠체어를 지원해주세요.', '이동이 어려운 아이를 위한 휠체어가 필요합니다.', '안녕하세요. 저는 장애 아동을 돌보는 사회복지사입니다. 최근 저희 센터에 온 아이가 휠체어가 없어 외부 활동에 어려움을 겪고 있습니다. 여러분의 도움으로 아이가 자유롭게 움직일 수 있게 된다면 큰 힘이 될 것입니다.', 46, 'DONATION', 'VISIBLE', 26),
    (133, '농촌 도서관에 책을 기증해주세요.', '책이 부족한 마을 도서관에 도움을 부탁드립니다.', '안녕하세요. 저는 농촌 지역에서 작은 도서관을 운영하고 있는 자원봉사자입니다. 도서관에 책이 부족해 마을 아이들이 읽을 책이 없습니다. 다양한 도서를 구입할 수 있도록 작은 도움을 부탁드립니다.', 35, 'DONATION', 'VISIBLE', 6),
    (134, '유기묘를 위한 의료비를 지원해주세요.', '구조된 고양이들의 치료비가 필요합니다.', '안녕하세요. 저는 유기묘를 돌보는 보호소를 운영하고 있습니다. 구조된 고양이들 중 치료가 필요한 아이들이 많아 병원비 부담이 큽니다. 따뜻한 도움으로 아이들에게 건강을 찾아줄 수 있기를 바랍니다.', 25, 'DONATION', 'VISIBLE', 7),
    (135, '태양광 발전기를 설치하고 싶습니다.', '전기가 부족한 농가에 태양광 발전기를 지원해주세요.', '안녕하세요. 저는 에너지 자립을 돕는 단체에서 활동하고 있습니다. 전기가 부족한 농촌 가구에 태양광 발전기를 설치하려고 하지만 예산이 부족합니다. 여러분의 지원이 큰 힘이 될 것입니다.', 25, 'DONATION', 'VISIBLE', 8),
    (136, '독거노인을 위한 생필품을 지원해주세요.', '생필품이 부족한 어르신들에게 도움을 주십시오.', '안녕하세요. 저는 독거노인 분들께 생필품을 나눠드리는 봉사활동을 하고 있습니다. 어르신들이 필요로 하는 물품을 제공하기 위해 여러분의 도움을 부탁드립니다.', 47, 'DONATION', 'VISIBLE', 9),
    (137, '저소득층 아이들에게 미술 도구를 지원해주세요.', '그림을 그리고 싶어 하는 아이들에게 미술 도구를 지원하고 싶습니다.', '안녕하세요. 저는 지역 미술 학원에서 무료로 아이들을 가르치는 강사입니다. 경제적으로 어려운 아이들에게 필요한 미술 도구를 지원해주시면, 꿈을 키울 수 있는 기회를 줄 수 있을 것입니다.', 14, 'DONATION', 'VISIBLE', 10),
    (138, '야학 교재를 구입하고 싶습니다.', '성인 문해 교육을 위한 교재를 구입할 수 있도록 도와주세요.', '안녕하세요. 저는 문해 교육을 지원하는 야학에서 활동하고 있습니다. 성인 학생들에게 맞는 교재가 부족해 어려움을 겪고 있습니다. 도움을 주시면 많은 분들이 글을 배울 수 있는 기회를 얻을 것입니다.', 13, 'DONATION', 'VISIBLE', 11),
    (139, '출산 준비에 도움을 주십시오.', '산모를 위한 아기 용품을 지원해주세요.', '안녕하세요. 저는 임신 7개월째인 예비 엄마입니다. 경제적 어려움으로 아기 용품을 마련하지 못해 걱정이 큽니다. 작은 도움이라도 주신다면 무사히 아기를 맞이할 준비를 할 수 있을 것 같습니다.', 25, 'DONATION', 'VISIBLE', 12),
    (140, '청소년 축구팀을 도와주세요.', '장비 부족으로 어려움을 겪는 청소년 축구팀을 지원해주세요.', '안녕하세요. 저는 지역 청소년 축구팀의 코치입니다. 아이들이 훈련에 사용할 축구공과 유니폼이 부족한 상황입니다. 스포츠를 통해 꿈을 키울 수 있도록 여러분의 도움을 부탁드립니다.', 11, 'DONATION', 'VISIBLE', 13),
    (141, '소방대원들을 위한 장비를 지원해주세요.', '열악한 환경에서 일하는 소방대원들을 위해 도움을 주십시오.', '안녕하세요. 저는 지역 소방서에서 자원봉사로 활동하고 있습니다. 노후된 장비로 인해 소방대원들이 위험한 환경에서 일하고 있습니다. 여러분의 도움으로 더 안전한 환경을 만들 수 있도록 도와주세요.', 10, 'DONATION', 'VISIBLE', 14),
    (142, '수험생에게 필요한 강의 교재를 지원해주세요.', '공부를 계속할 수 있도록 강의 자료를 구입할 수 있게 도와주세요.', '안녕하세요. 저는 대학 입시를 준비하고 있는 고등학생입니다. 필요한 인강 교재를 구입할 형편이 되지 않아 공부에 어려움을 겪고 있습니다. 작은 도움이라도 주시면 정말 감사하겠습니다.', 15, 'DONATION', 'VISIBLE', 15),
    (143, '노숙인 쉼터에 침구를 지원해주세요.', '노숙인 쉼터에서 사용할 새 이불과 매트가 필요합니다.', '안녕하세요. 저는 노숙인 쉼터에서 봉사 활동을 하고 있습니다. 추운 날씨 속에서 노숙인분들이 따뜻한 잠자리를 마련할 수 있도록 침구류를 지원해주시면 감사하겠습니다.', 14, 'DONATION', 'VISIBLE', 26),
    (144, '청각장애인을 위한 보청기를 지원해주세요.', '어려운 가정의 청각장애인을 위해 보청기가 필요합니다.', '안녕하세요. 저는 장애인을 돕는 비영리 단체에서 활동 중입니다. 청각장애를 가진 분들에게 보청기를 제공하려고 하지만 예산이 부족합니다. 도움을 주시면 많은 분들이 소리를 되찾을 수 있을 것입니다.', 26, 'DONATION', 'VISIBLE', 6),
    (145, '위탁가정 아이들에게 장난감을 선물해주세요.', '위탁가정에서 자라는 아이들에게 장난감을 선물하고 싶습니다.', '안녕하세요. 저는 위탁가정을 돕는 단체에서 일하고 있습니다. 아이들에게 작은 기쁨을 선물하기 위해 장난감을 구입하려고 합니다. 여러분의 도움으로 아이들에게 행복을 전해줄 수 있기를 바랍니다.', 25, 'DONATION', 'VISIBLE', 7),
    (146, '헌혈 캠페인을 지원해주세요.', '혈액 부족 문제를 해결하기 위한 캠페인을 돕고 싶습니다.', '안녕하세요. 저는 지역에서 헌혈 캠페인을 주관하고 있습니다. 캠페인 운영비와 홍보물 제작비가 부족해 어려움을 겪고 있습니다. 여러분의 지원으로 생명을 살리는 캠페인을 이어갈 수 있도록 도와주세요.', 26, 'DONATION', 'VISIBLE', 8),
    (147, '도시에 나무를 심는 프로젝트를 지원해주세요.', '환경을 개선하기 위해 나무를 심는 프로젝트를 진행 중입니다.', '안녕하세요. 저는 도시 환경 개선을 목표로 활동하는 단체의 일원입니다. 도시에 나무를 심어 공기 질을 개선하고자 하나 예산이 부족합니다. 여러분의 도움으로 더 많은 나무를 심을 수 있습니다.', 25, 'DONATION', 'VISIBLE', 9),
    (148, '자원봉사자들을 위한 차량이 필요합니다.', '이동이 필요한 자원봉사자들을 위한 차량을 마련하려고 합니다.', '안녕하세요. 저는 봉사단체에서 활동하고 있습니다. 이동 거리 문제로 활동이 제한적인 자원봉사자들을 위해 차량을 구입하려고 합니다. 여러분의 지원이 큰 힘이 될 것입니다.', 14, 'DONATION', 'VISIBLE', 10),
    (149, '코로나로 어려움을 겪는 가정을 도와주세요.', '코로나로 생계가 어려운 가정에 식료품을 지원하고 싶습니다.', '안녕하세요. 저는 코로나로 피해를 입은 가정을 돕는 봉사활동을 하고 있습니다. 생필품이 부족한 가정에 도움을 줄 수 있도록 작은 손길을 부탁드립니다.', 13, 'DONATION', 'VISIBLE', 11),
    (150, '아동 교육 프로그램을 지원해주세요.', '지역 아이들을 위한 방과 후 수업을 진행하고자 합니다.', '안녕하세요. 저는 지역 아이들에게 방과 후 교육 프로그램을 제공하는 교사입니다. 교육 자료와 학습 도구가 부족해 프로그램 운영이 어려운 상황입니다. 여러분의 도움이 아이들에게 큰 꿈을 심어줄 수 있습니다.', 12, 'DONATION', 'VISIBLE', 12);


INSERT INTO tbl_donation(id, goal_point, current_point, donation_s_date, donation_e_date)
VALUES
    (121, 200000, 180000, '2024-10-01', '2024-10-08'),
    (122, 300000, 60000, '2024-10-02', '2024-10-09'),
    (123, 200000, 180000, '2024-10-03', '2024-10-10'),
    (124, 300000, 60000, '2024-10-04', '2024-10-11'),
    (125, 200000, 180000, '2024-10-05', '2024-10-12'),
    (126, 300000, 60000, '2024-10-06', '2024-10-13'),
    (127, 200000, 180000, '2024-10-07', '2024-10-14'),
    (128, 300000, 60000, '2024-10-08', '2024-10-15'),
    (129, 200000, 180000, '2024-10-09', '2024-10-16'),
    (130, 300000, 60000, '2024-10-10', '2024-10-17'),
    (131, 200000, 180000, '2024-11-01', '2024-11-08'),
    (132, 300000, 60000, '2024-11-02', '2024-11-09'),
    (133, 200000, 180000, '2024-11-03', '2024-11-10'),
    (134, 300000, 60000, '2024-11-04', '2024-11-11'),
    (135, 200000, 180000, '2024-11-05', '2024-11-12'),
    (136, 300000, 60000, '2024-11-06', '2024-11-13'),
    (137, 200000, 180000, '2024-11-07', '2024-11-14'),
    (138, 300000, 60000, '2024-11-08', '2024-11-15'),
    (139, 200000, 180000, '2024-11-09', '2024-11-16'),
    (140, 300000, 60000, '2024-11-10', '2024-11-17'),
    (141, 200000, 180000, '2024-11-11', '2024-11-18'),
    (142, 300000, 60000, '2024-11-12', '2024-11-19'),
    (143, 200000, 180000, '2024-11-13', '2024-11-20'),
    (144, 300000, 60000, '2024-11-14', '2024-11-21'),
    (145, 200000, 180000, '2024-11-15', '2024-11-22'),
    (146, 300000, 60000, '2024-11-16', '2024-11-23'),
    (147, 200000, 180000, '2024-11-17', '2024-11-24'),
    (148, 300000, 60000, '2024-11-18', '2024-11-25'),
    (149, 200000, 180000, '2024-11-19', '2024-11-26'),
    (150, 300000, 120000, '2024-11-20', '2024-11-27');


-- 10월 데이터 삽입
INSERT INTO tbl_donation_record (member_id, donation_id, donation_amount, created_date) VALUES
                                                                                            (7, 121, 45000, '2024-10-01 09:30:00'),
                                                                                            (8, 122, 30000, '2024-10-02 14:45:00'),
                                                                                            (9, 123, 25000, '2024-10-03 11:20:00'),
                                                                                            (10, 124, 50000, '2024-10-04 16:10:00'),
                                                                                            (11, 125, 15000, '2024-10-05 13:55:00');

-- 11월 데이터 삽입
INSERT INTO tbl_donation_record (member_id, donation_id, donation_amount, created_date) VALUES
                                                                                            (12, 126, 40000, '2024-11-01 08:25:00'),
                                                                                            (13, 127, 20000, '2024-11-02 12:00:00'),
                                                                                            (14, 128, 35000, '2024-11-03 17:30:00'),
                                                                                            (15, 129, 10000, '2024-11-04 10:50:00'),
                                                                                            (26, 130, 45000, '2024-11-05 15:40:00');


INSERT INTO tbl_post (id, post_title, post_summary, post_content, post_view_count, post_type, post_status, member_id) VALUES
      (151, '사이트 점검 안내', '정기적인 시스템 점검을 안내드립니다.', '안녕하세요, 사용자 여러분. 시스템 안정성을 위해 2024년 12월 1일 오전 2시부터 오후 4시까지 사이트 점검을 실시합니다. 이 시간 동안 서비스 이용이 일시적으로 제한될 수 있으니 양해 부탁드립니다.', 0, 'NOTICE', 'VISIBLE', 777),
      (152, '새로운 기능 업데이트', '사이트에 새로운 기능이 추가되었습니다.', '안녕하세요, 사용자 여러분. 여러분의 피드백을 반영하여 새로운 검색 기능과 사용자 대시보드를 업데이트하였습니다. 새로운 기능을 통해 보다 편리하게 서비스를 이용하실 수 있습니다.', 0, 'NOTICE', 'VISIBLE', 777),
      (153, '개인정보 보호정책 변경', '개인정보 보호정책이 업데이트되었습니다.', '안녕하세요. 개인정보 보호를 위해 개인정보 보호정책을 일부 수정하였습니다. 변경된 내용을 확인하시고 동의해 주시기 바랍니다. 자세한 내용은 홈페이지의 개인정보 보호정책 페이지를 참고해주세요.', 0, 'NOTICE', 'VISIBLE', 777),
      (154, '봄맞이 이벤트 개최', '봄을 맞아 특별한 이벤트를 진행합니다.', '안녕하세요, 사용자 여러분. 봄을 맞아 다양한 이벤트를 준비하였습니다. 참여하시면 추첨을 통해 다양한 경품을 드립니다. 많은 참여 부탁드립니다.', 0, 'NOTICE', 'VISIBLE', 777),
      (155, '회원 등급 시스템 도입', '새로운 회원 등급 시스템이 도입되었습니다.', '안녕하세요. 사용자 여러분께 더 나은 서비스를 제공하기 위해 새로운 회원 등급 시스템을 도입하였습니다. 등급에 따라 다양한 혜택을 누리실 수 있습니다. 자세한 내용은 홈페이지의 회원 등급 안내 페이지를 참고해주세요.', 0, 'NOTICE', 'VISIBLE', 777),
      (156, '긴급 보안 업데이트', '보안 강화를 위한 긴급 업데이트가 실시됩니다.', '안녕하세요, 사용자 여러분. 보안 강화를 위해 긴급 업데이트를 실시합니다. 2024년 12월 5일 오전 1시부터 오후 3시까지 서비스 이용이 제한될 수 있으니 미리 대비해 주시기 바랍니다.', 0, 'NOTICE', 'VISIBLE', 777),
      (157, '휴가 기간 안내', '연말 휴가 기간 동안의 서비스 운영 안내.', '안녕하세요. 연말 연시에 휴가를 맞아 2024년 12월 20일부터 2025년 1월 5일까지 서비스 운영이 제한될 예정입니다. 이 기간 동안 긴급 문의는 이메일로만 접수됩니다. 양해 부탁드립니다.', 0, 'NOTICE', 'VISIBLE', 777),
      (158, '고객 지원 센터 운영 시간 변경', '고객 지원 센터의 운영 시간이 변경되었습니다.', '안녕하세요, 사용자 여러분. 고객 지원 센터의 운영 시간이 2024년 12월 1일부터 변경됩니다. 새로운 운영 시간은 평일 오전 9시부터 오후 6시까지입니다. 참고 부탁드립니다.', 0, 'NOTICE', 'VISIBLE', 777),
      (159, '서비스 약관 업데이트', '서비스 약관이 일부 수정되었습니다.', '안녕하세요. 서비스 이용 약관을 일부 수정하여 업데이트하였습니다. 변경된 약관은 2024년 12월 10일부터 적용됩니다. 자세한 내용은 홈페이지의 서비스 약관 페이지를 확인해 주세요.', 0, 'NOTICE', 'VISIBLE', 777),
      (160, '봄맞이 혜택 제공', '봄을 맞아 특별한 혜택을 제공합니다.', '안녕하세요, 사용자 여러분. 봄을 맞아 신규 가입자에게 특별한 혜택을 제공합니다. 지금 가입하시면 추가 포인트와 할인 쿠폰을 드립니다. 많은 관심과 참여 부탁드립니다.', 0, 'NOTICE', 'VISIBLE', 777),

      (161, '중요 공지: 서비스 종료 안내', '일부 서비스가 종료됩니다.', '안녕하세요, 사용자 여러분. 서비스 향상을 위해 일부 오래된 서비스를 2025년 1월 15일부터 종료하게 되었습니다. 영향을 받는 서비스는 홈페이지에서 확인하실 수 있으며, 이용에 참고 부탁드립니다.', 0, 'NOTICE', 'VISIBLE', 777),
      (162, '신규 파트너사 협약 체결', '새로운 파트너사와의 협약 소식을 전합니다.', '안녕하세요, 사용자 여러분. 저희는 이번에 XYZ 파트너사와 협약을 체결하게 되었습니다. 이를 통해 더욱 다양한 서비스와 혜택을 제공할 수 있게 되었습니다. 많은 기대 부탁드립니다.', 0, 'NOTICE', 'VISIBLE', 777),
      (163, '웹사이트 디자인 변경', '웹사이트의 새로운 디자인을 소개합니다.', '안녕하세요. 사용자 여러분께 더 나은 사용 경험을 제공하기 위해 웹사이트의 디자인을 새롭게 변경하였습니다. 새로운 디자인을 확인하시고, 의견을 보내주시면 감사하겠습니다.', 0, 'NOTICE', 'VISIBLE', 777),
      (164, '정기 점검 완료', '정기적인 시스템 점검이 완료되었습니다.', '안녕하세요, 사용자 여러분. 지난 12월 1일부터 진행된 정기 시스템 점검이 무사히 완료되었습니다. 현재 모든 서비스가 정상적으로 운영 중입니다. 이용에 참고 부탁드립니다.', 0, 'NOTICE', 'VISIBLE', 777),
      (165, '이용자 대상 만족도 조사', '서비스 개선을 위한 만족도 조사를 실시합니다.', '안녕하세요, 사용자 여러분. 서비스 개선을 위해 이용자 대상 만족도 조사를 실시하고 있습니다. 설문에 참여하시면 소정의 상품을 드립니다. 많은 참여 부탁드립니다.', 0, 'NOTICE', 'VISIBLE', 777),
      (166, '신규 결제 방법 도입', '다양한 결제 방법을 추가했습니다.', '안녕하세요, 사용자 여러분. 더 편리한 결제 경험을 제공하기 위해 새로운 결제 방법을 도입하였습니다. 이제 신용카드 외에도 다양한 결제 수단을 이용하실 수 있습니다.', 0, 'NOTICE', 'VISIBLE', 777),
      (167, '모바일 앱 업데이트', '모바일 앱의 새로운 기능을 소개합니다.', '안녕하세요, 사용자 여러분. 모바일 앱의 최신 버전이 출시되었습니다. 새로운 기능과 향상된 성능을 경험해 보세요. 앱 스토어에서 업데이트를 진행해 주세요.', 0, 'NOTICE', 'VISIBLE', 777),
      (168, '재택근무 정책 변경', '재택근무 관련 새로운 정책을 안내드립니다.', '안녕하세요, 사용자 여러분. 재택근무 관련 새로운 정책이 시행됩니다. 자세한 내용은 인사부 홈페이지에서 확인하실 수 있습니다. 참고 부탁드립니다.', 0, 'NOTICE', 'VISIBLE', 777),
      (169, '고객 감사 이벤트', '고객 감사의 의미로 특별 이벤트를 진행합니다.', '안녕하세요, 사용자 여러분. 고객 감사의 의미로 다양한 이벤트를 준비하였습니다. 참여하시면 특별한 선물과 혜택을 드립니다. 많은 참여 부탁드립니다.', 0, 'NOTICE', 'VISIBLE', 777),
      (170, '업데이트 알림: 새로운 버전 출시', '새로운 버전의 소프트웨어가 출시되었습니다.', '안녕하세요, 사용자 여러분. 저희 소프트웨어의 새로운 버전이 출시되었습니다. 새로운 기능과 버그 수정 사항을 확인하시고, 최신 버전을 사용해 주세요.', 0, 'NOTICE', 'VISIBLE', 777),

      (171, '긴급 공지: 서비스 장애 발생', '일시적인 서비스 장애가 발생했습니다.', '안녕하세요, 사용자 여러분. 현재 일시적인 서비스 장애가 발생하여 일부 기능이 정상적으로 작동하지 않고 있습니다. 문제 해결을 위해 최선을 다하고 있으며, 빠른 시일 내에 정상화될 수 있도록 노력하겠습니다. 불편을 드려 죄송합니다.', 0, 'NOTICE', 'VISIBLE', 777),
      (172, '신규 기능 베타 테스트 모집', '새로운 기능의 베타 테스트 참가자를 모집합니다.', '안녕하세요, 사용자 여러분. 새로운 기능의 베타 테스트를 진행하고자 합니다. 참여하시면 최신 기능을 먼저 사용해보실 수 있으며, 피드백을 주시면 서비스 개선에 큰 도움이 됩니다. 관심 있으신 분들의 많은 지원 바랍니다.', 0, 'NOTICE', 'VISIBLE', 777),
      (173, '봄맞이 서비스 할인 행사', '봄을 맞아 서비스 할인 행사를 진행합니다.', '안녕하세요, 사용자 여러분. 봄을 맞아 다양한 서비스 할인 행사를 진행하고 있습니다. 기간 동안 가입하시면 특별 할인을 받을 수 있으니 많은 이용 부탁드립니다.', 0, 'NOTICE', 'VISIBLE', 777),
      (174, '이용 약관 변경 안내', '서비스 이용 약관이 변경되었습니다.', '안녕하세요. 서비스 이용 약관을 일부 수정하여 업데이트하였습니다. 변경된 약관은 2024년 12월 15일부터 적용됩니다. 자세한 내용은 홈페이지의 이용 약관 페이지를 확인해 주세요.', 0, 'NOTICE', 'VISIBLE', 777),
      (175, '이벤트 결과 발표', '최근 진행된 이벤트의 결과를 발표합니다.', '안녕하세요, 사용자 여러분. 지난 봄맞이 이벤트의 결과가 나왔습니다. 당첨자 분들께는 개별적으로 연락드릴 예정이니, 잠시만 기다려 주세요. 참여해 주신 모든 분들께 감사드립니다.', 0, 'NOTICE', 'VISIBLE', 777),
      (176, '고객 지원 강화 안내', '고객 지원 서비스를 강화합니다.', '안녕하세요, 사용자 여러분. 더 나은 고객 지원을 제공하기 위해 지원 인력을 추가로 배치하고, 응답 시간을 단축하였습니다. 언제든지 궁금한 점이나 문제가 있으시면 고객 지원 센터로 연락해 주세요.', 0, 'NOTICE', 'VISIBLE', 777),
      (177, '재고 정리 판매 시작', '일부 상품의 재고 정리 판매를 시작합니다.', '안녕하세요, 사용자 여러분. 재고 정리를 위해 일부 상품의 특별 할인 판매를 시작합니다. 품절되기 전에 좋은 기회이니 많은 관심과 이용 부탁드립니다.', 0, 'NOTICE', 'VISIBLE', 777),
      (178, '파트너사 소개', '새롭게 협력하게 된 파트너사를 소개합니다.', '안녕하세요, 사용자 여러분. 저희는 이번에 ABC 파트너사와 협력하게 되었습니다. 이를 통해 더욱 다양한 서비스와 혜택을 제공할 수 있게 되었습니다. 많은 기대 부탁드립니다.', 0, 'NOTICE', 'VISIBLE', 777),
      (179, '연말 감사 이벤트', '연말을 맞아 감사 이벤트를 진행합니다.', '안녕하세요, 사용자 여러분. 연말을 맞아 감사의 의미로 다양한 이벤트를 준비하였습니다. 참여하시면 특별한 선물과 혜택을 드립니다. 많은 참여 부탁드립니다.', 0, 'NOTICE', 'VISIBLE', 777),
      (180, '새해 맞이 서비스 업데이트', '새해를 맞아 서비스 업데이트 소식을 전합니다.', '안녕하세요, 사용자 여러분. 새해를 맞아 서비스의 주요 기능을 업데이트하였습니다. 더 나은 사용 경험을 제공하기 위해 지속적으로 노력하겠습니다. 업데이트된 내용을 확인해 주세요.', 0, 'NOTICE', 'VISIBLE', 777);



INSERT INTO tbl_notice (id) VALUES
                                (151),
                                (152),
                                (153),
                                (154),
                                (155),
                                (156),
                                (157),
                                (158),
                                (159),
                                (160),
                                (161),
                                (162),
                                (163),
                                (164),
                                (165),
                                (166),
                                (167),
                                (168),
                                (169),
                                (170),
                                (171),
                                (172),
                                (173),
                                (174),
                                (175),
                                (176),
                                (177),
                                (178),
                                (179),
                                (180);




