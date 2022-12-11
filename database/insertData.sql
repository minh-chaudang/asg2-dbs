INSERT INTO Person VALUES (1001, 'Huynh Thuy Tien', '023202111234', CONVERT(date, '22-05-1997', 105),'Quan 9', 'Tien123', '978hello', 1, 0, 0, 'Master123', null);
INSERT INTO Person VALUES (1002, 'Tran Thanh Tung', '023222000234', CONVERT(date, '24-09-1990', 105),'Thu Duc', 'TrungChina', 'gdtr1123', 1, 0, 0, 'bachelor', null);
INSERT INTO Person VALUES (1003, 'Trinh Tien Dat', '007202111456', CONVERT(date, '01-03-1987', 105),'Quan 6', 'Dat09', 'meomeo11', 1, 0, 0, 'bachelor', null);
INSERT INTO Person VALUES (1004, 'Cao Duc Huy', '009202111734', CONVERT(date, '03-02-1996', 105),'Quan 7', 'HuySchannel', 'xinchaohehe', 1, 0, 0, 'Master', null);
EXEXEC InsertTeacher @FullName='Hoang Cong Dai Hiep',@SSN = '012121313133',@username = 'daihiep',@password ='hiephiep123',@CertID='Master',@Bdate = '01-01-1993',@Address='Quan 1'
EXEXEC InsertTeacher @FullName='Le Thi Loan',@SSN = '012121232333',@username = 'loanle',@password ='loanle01',@CertID='Master2',@Bdate = '08-09-1994',@Address='Quan 2';
 
INSERT INTO Person VALUES (2001, 'Nguyen Dang Minh', '056202111222', CONVERT(date, '22-05-2002', 105),'Thu Duc', 'minhcute', '1234', 0, 1, 0, null, null);
INSERT INTO Person VALUES (2002, 'Phan Quoc Bao', '991201111733', CONVERT(date, '12-03-2001', 105),'Quan 9', 'bao1103', 'ok123zo', 0, 1, 0, null, null);
INSERT INTO Person VALUES (2003, 'Chu Dinh Chien', '345202111666', CONVERT(date, '26-04-2002', 105),'Binh Duong', 'Chienquatroi', '5678', 0, 1, 0, null, null);
INSERT INTO Person VALUES (2004, 'Duong Van Nghia', '789202111890', CONVERT(date, '27-05-2002', 105),'Dong Nai', 'Nghia123', 'ok123123', 0, 1, 0, null, null);
EXEXEC InsertStudent @FullName='Le Trong Tan' , @username='Trongtan' , @password='1000Kg', @SSN='098756252535', @Bdate='06-05-2004', @Address='Trai Dat';

INSERT INTO Person VALUES (3001, 'Nguyen Cong Le', '345098123234', CONVERT(date, '05-07-1998', 105),'Quan 9', 'Conlehehe', '123gh', 0, 0, 1, null, 'Quan Ly');
INSERT INTO Person VALUES (3002, 'Tran Thien Ly', '078899111900', CONVERT(date, '26-09-1991', 105),'Quan 7', 'Lydeptrai', 'ghk23788', 0, 0, 1, null, 'Quan Ly');
INSERT INTO Person VALUES (3003, 'Nguyen Thanh Cong', '006782734234', CONVERT(date, '27-05-1980', 105),'Bien Hoa', 'Cong147', 'ddjd900', 0, 0, 1, null, 'Thu Ngan');
INSERT INTO Person VALUES (3004, 'Trinh Hai Yen', '900203881290', CONVERT(date, '30-04-1979', 105),'Thu Duc', 'Yendangbay', 'hdj897', 0, 0, 1, null, 'Quan Ly');
EXEXEC InsertStaff @FullName='Nguyen Cong Ly',@SSN='012346789090', @username='congly', @password='5anhemsieunhan', @Work='Thu Ngan', @Bdate='02-03-1997', @Address='Quan 8';

INSERT INTO Promotion VALUES(0, 'Khong km', 1000, 00, CONVERT(date, '1-1-2015', 105));
INSERT INTO Promotion VALUES(1, 'Ho ngheo', 30, 0.2, CONVERT(date, '22-12-2022', 105));
INSERT INTO Promotion VALUES(2, 'Hoc gioi', 50, 0.3, CONVERT(date, '22-12-2022', 105));
INSERT INTO Promotion VALUES(3, 'Gioi thieu', 30, 0.2, CONVERT(date, '30-12-2023', 105));
INSERT INTO Promotion VALUES(4, 'Sinh nhat', 100, 0.1, CONVERT(date, '30-12-2024', 105));

INSERT INTO Program VALUES ('Toeic 550', 'English', '550+', null);
INSERT INTO Program VALUES ('Toeic 600', 'English', '600+', null);
INSERT INTO Program VALUES ('Toeic 750', 'English', '750+', 'Toeic 550');
INSERT INTO Program VALUES ('Ielts 5.5', 'English', '6.5+', null);
INSERT INTO Program VALUES ('Ielts 7.5', 'English', '6.5+', 'Ielts 5.5');

INSERT INTO WorkShift VALUES (1, 15, CONVERT(time, '7:30', 108), CONVERT(time, '11:30', 108));
INSERT INTO WorkShift VALUES (2, 16, CONVERT(time, '7:30', 108), CONVERT(time, '11:30', 108));
INSERT INTO WorkShift VALUES (3, 17, CONVERT(time, '7:30', 108), CONVERT(time, '11:30', 108));
INSERT INTO WorkShift VALUES (4, 18, CONVERT(time, '7:30', 108), CONVERT(time, '11:30', 108));
INSERT INTO WorkShift VALUES (5, 19, CONVERT(time, '7:30', 108), CONVERT(time, '11:30', 108));
INSERT INTO WorkShift VALUES (6, 20, CONVERT(time, '7:30', 108), CONVERT(time, '11:30', 108));
INSERT INTO WorkShift VALUES (101, 15, CONVERT(time, '7:30', 108), CONVERT(time, '17:00', 108));
INSERT INTO WorkShift VALUES (102, 16, CONVERT(time, '7:30', 108), CONVERT(time, '17:00', 108));
INSERT INTO WorkShift VALUES (103, 17, CONVERT(time, '7:30', 108), CONVERT(time, '17:00', 108));
INSERT INTO WorkShift VALUES (201, 15, CONVERT(time, '9:00', 108), CONVERT(time, '17:00', 108));
INSERT INTO WorkShift VALUES (202, 16, CONVERT(time, '9:00', 108), CONVERT(time, '17:00', 108));

INSERT INTO Branch VALUES (1, 3001, '0343123456', '1 Dang Van Bi, Truong Tho, Thu Duc');
INSERT INTO Branch VALUES (2, 3002, '022789123', '1 Vo Van Ngan, Binh Tho, Thu Duc');
INSERT INTO Branch VALUES (3, 3004, '077868888', '1 Tran Van Ba, Phu Nhuan');

INSERT INTO Document VALUES (1001, 'Toeic 550', 'Toeic 550 Reading', 'http://Thanhcongenglish.abc.com', CONVERT(date, '22-05-2018', 105));
INSERT INTO Document VALUES (1002, 'Toeic 600', 'Toeic 600 Listening', 'http://Thanhcongenglish-xyz.com', CONVERT(date, '23-06-2017', 105));
INSERT INTO Document VALUES (1003, 'Toeic 750', 'Toeic 750 Speaking', 'http://Thanhcongenglish-toeic-750.com', CONVERT(date, '24-08-2018', 105));
INSERT INTO Document VALUES (1004, 'Ielts 7.5', 'Ielts pro', 'http://Thanhcongenglish-Ielts-pro.com', CONVERT(date, '22-05-2018', 105));
INSERT INTO Document VALUES (1005, 'Ielts 5.5', 'Ielts pre', 'http://Thanhcongenglish-Ielts-pre.com', CONVERT(date, '26-01-2016', 105));
INSERT INTO Document VALUES (1006, 'Ielts 5.5', 'Ielts basic', 'http://Thanhcongenglish-Ielts-basic.com', CONVERT(date, '15-04-2016', 105));

INSERT INTO Outline VALUES (5501, 'Toeic 550', 'Day bang chu cai');
INSERT INTO Outline VALUES (5502, 'Toeic 550', 'Day phat am');
INSERT INTO Outline VALUES (5503, 'Toeic 550', 'Day chuong 1');
INSERT INTO Outline VALUES (5504, 'Toeic 550', 'Day chuong 1 phan 2');
INSERT INTO Outline VALUES (5505, 'Toeic 550', 'Day chuong 2');
INSERT INTO Outline VALUES (5506, 'Toeic 550', 'Luyen de');
INSERT INTO Outline VALUES (5507, 'Toeic 550', 'Day chuong 2 phan 2');
INSERT INTO Outline VALUES (551, 'Ielts 5.5', 'Gioi thieu tong quat');
INSERT INTO Outline VALUES (552, 'Ielts 5.5', 'Day chuong 1');
INSERT INTO Outline VALUES (553, 'Ielts 5.5', 'Day chuong 1 phan 2');
INSERT INTO Outline VALUES (554, 'Ielts 5.5', 'Day chuong 2');
INSERT INTO Outline VALUES (751, 'Ielts 7.5', 'Gioi thieu tong quat');
INSERT INTO Outline VALUES (752, 'Ielts 7.5', 'Day chuong 1');


INSERT INTO Phone VALUES (1001, '0343125765');
INSERT INTO Phone VALUES (1002, '0126784523');
INSERT INTO Phone VALUES (1003, '0893125777');
INSERT INTO Phone VALUES (2001, '0993125678');
INSERT INTO Phone VALUES (2002, '0993112323');
INSERT INTO Phone VALUES (2003, '0773125788');

INSERT INTO Email VALUES (1001, 'tien123@mail.com');
INSERT INTO Email VALUES (1002, 'trunghehe@mail.com');
INSERT INTO Email VALUES (2001, 'minh123@mail.com');
INSERT INTO Email VALUES (2002, 'bao1103@mail.com');
INSERT INTO Email VALUES (2003, 'Chienok@mail.com');
INSERT INTO Email VALUES (3001, 'lecongminh@mail.com');


INSERT INTO Dependent VALUES (1, 2001, 'Trinh Hung', 'Cha', '0561231231', null);
INSERT INTO Dependent VALUES (2, 2002, 'Phan Thanh', 'Cha', '0881236473', null);
INSERT INTO Dependent VALUES (3, 2003, 'Vo Thi Ngan', 'Me', '0341231355', 'gaubaongan@gmail.com');
INSERT INTO Dependent VALUES (4, 2004, 'Hoang Phuc Anh', 'Cha', '0991237788', null);

INSERT INTO Course VALUES (550, 'Toeic 550', 1001, CONVERT(date, '22-12-2022', 105), CONVERT(date, '22-05-2023', 105), 9000000);
INSERT INTO Course VALUES (55, 'Ielts 5.5', 1002, CONVERT(date, '1-1-2023', 105), CONVERT(date, '01-06-2023', 105), 15000000);
INSERT INTO Course VALUES (75, 'Ielts 7.5', 1003, CONVERT(date, '3-1-2023', 105), CONVERT(date, '03-08-2023', 105), 20000000);
INSERT INTO Course VALUES (53, 'Toeic 600', 1002, CONVERT(date, '1-4-2023', 105), CONVERT(date, '1-6-2023', 105), 1000000);
INSERT INTO Course VALUES (22, 'Toeic 750', 1001, CONVERT(date, '22-1-2022', 105), CONVERT(date, '22-4-2022', 105), 15000000);
INSERT INTO Course VALUES (34, 'Ielts 5.5', 1003, CONVERT(date, '5-3-2023', 105), CONVERT(date, '5-6-2023', 105), 20000000);
INSERT INTO Course VALUES (67, 'Toeic 600', 1001, CONVERT(date, '10-12-2022', 105), CONVERT(date, '10-3-2023', 105), 15000000);
INSERT INTO Course VALUES (89, 'Toeic 550', 1002, CONVERT(date, '6-10-2022', 105), CONVERT(date, '6-6-2023', 105), 20000000);

INSERT INTO Work VALUES (3001, 1, 1, 1);
INSERT INTO Work VALUES (3001, 1, 2, 1);
INSERT INTO Work VALUES (3002, 3, 201, 1);
INSERT INTO Work VALUES (3003, 3, 202, 0);
INSERT INTO Work VALUES (3004, 2, 5, 1);
INSERT INTO Work VALUES (3004, 2, 3, 0);
INSERT INTO Work VALUES (3004, 3, 102, 1);
INSERT INTO Work VALUES (3002, 1, 1, 0);
INSERT INTO Work VALUES (3002, 2, 5, 1);

INSERT INTO Registration VALUES (2001,550,1, 7200000, null, null);
INSERT INTO Registration VALUES (2003,550,0, 9000000, 350, null);
INSERT INTO Registration VALUES (2002,75,3, 16000000, 5.5, null);
INSERT INTO Registration VALUES (2004,55,4, 13500000, null, null);

INSERT INTO Room VALUES (11, 1, 40);
INSERT INTO Room VALUES (12, 1, 40);
INSERT INTO Room VALUES (13, 1, 40);
INSERT INTO Room VALUES (14, 1, 40);
INSERT INTO Room VALUES (15, 1, 40);
INSERT INTO Room VALUES (16, 1, 40);
INSERT INTO Room VALUES (21, 2, 50);
INSERT INTO Room VALUES (22, 2, 50);
INSERT INTO Room VALUES (23, 2, 50);
INSERT INTO Room VALUES (25, 2, 50);
INSERT INTO Room VALUES (26, 2, 50);
INSERT INTO Room VALUES (27, 2, 50);
INSERT INTO Room VALUES (31, 3, 35);
INSERT INTO Room VALUES (32, 3, 40);
INSERT INTO Room VALUES (33, 3, 35);

INSERT INTO Lesson VALUES (55011, 550, 11, 1, 1001, CONVERT(date, '22-12-2022', 105), CONVERT(time, '7:30', 108), CONVERT(time, '9:30', 108), 'Gioi thieu khoa hoc');
INSERT INTO Lesson VALUES (55012, 550, 11, 1, 1001, CONVERT(date, '24-12-2022', 105), CONVERT(time, '7:30', 108), CONVERT(time, '9:30', 108), 'Day chuong 1');
INSERT INTO Lesson VALUES (55013, 550, 11, 1, 1001, CONVERT(date, '27-12-2022', 105), CONVERT(time, '7:30', 108), CONVERT(time, '9:30', 108), 'Day');
INSERT INTO Lesson VALUES (7511, 75, 31, 3, 1002, CONVERT(date, '19-12-2022', 105), CONVERT(time, '9:30', 108), CONVERT(time, '11:30', 108), 'Gioi thieu khoa hoc');
INSERT INTO Lesson VALUES (7512, 75, 31, 3, 1002, CONVERT(date, '21-12-2022', 105), CONVERT(time, '9:30', 108), CONVERT(time, '11:30', 108), 'Tap phat am');

INSERT INTO Attendance VALUES (2001, 55011, 1, 'Hoc nghiem tuc');
INSERT INTO Attendance VALUES (2001, 55012, 0, 'Hoc sinh vang');
INSERT INTO Attendance VALUES (2002, 7511, 1, 'Hoc nghiem tuc');
INSERT INTO Attendance VALUES (2002, 7512, 1, 'Hoc nghiem tuc');

INSERT INTO Payment VALUES (55020011, 2001, 550, 3000000, CONVERT(date, '22-12-2022', 105), 'Tien mat', 4200000);
INSERT INTO Payment VALUES (55020012, 2001, 550, 3000000, CONVERT(date, '30-12-2022', 105), 'Tien mat', 12000000);
INSERT INTO Payment VALUES (7520021, 2002, 75, 16000000, CONVERT(date, '1-12-2022', 105), 'Tien mat', 0);
INSERT INTO Payment VALUES (5520041, 2004, 55, 5000000, CONVERT(date, '22-12-2022', 105), 'Tien mat', 8500000);
