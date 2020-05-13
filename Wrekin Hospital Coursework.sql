/*DROP TABLE Staff;
DROP TABLE Patient;
DROP TABLE Drug;
DROP TABLE Prescription;
DROP TABLE Ward;
DROP TABLE Bed;
DROP TABLE Patient_Occupancy;
DROP TABLE Rota;
*/

CREATE TABLE Staff(
  staff_no NUMBER(8,2),
  staff_name VARCHAR2 (50 CHAR) NOT NULL,
  phone NUMBER(8,2) NOT NULL UNIQUE,
  grade VARCHAR2 (20 CHAR) NOT NULL,
    CONSTRAINT staff_pk PRIMARY KEY (staff_no)
  );
  
CREATE TABLE Patient(
  patient_no VARCHAR2(20 CHAR),
  patient_name VARCHAR2(50 CHAR) NOT NULL,
  addressl1 VARCHAR2(50 CHAR) NOT NULL,
  addressl2 VARCHAR2(50 CHAR) ,
  adressl3 VARCHAR2(50 CHAR),
  sex VARCHAR2(50 CHAR) NOT NULL,
  dob DATE NOT NULL,
  status VARCHAR2(50 CHAR) NOT NULL,
  CONSTRAINT patient_pk PRIMARY KEY (patient_no)
 
  );
CREATE TABLE Drug(
  drug_no NUMBER(8,2), 
  drug_name VARCHAR2 (50 CHAR) NOT NULL, 
  dosage NUMBER(8,2) NOT NULL,
  CONSTRAINT drug_pk PRIMARY KEY (drug_no)
  );
CREATE TABLE Prescription(
  patient_no VARCHAR2(20 CHAR), 
  drug_no NUMBER(8,2), 
  drug_start_date DATE, 
  units_per_day NUMBER(8,2), 
  drug_end_date DATE NOT NULL,
  CONSTRAINT prescription_patient_fk FOREIGN KEY (patient_no) REFERENCES Patient(patient_no),
  CONSTRAINT prescription_pk PRIMARY KEY (patient_no, drug_no, drug_start_date),
  CONSTRAINT prescription_check CHECK (drug_start_date < drug_end_date)
  
);
CREATE TABLE Ward(
  ward_no NUMBER(8,2),
  ward_name VARCHAR2 (50 CHAR) NOT NULL,
  CONSTRAINT ward_pk PRIMARY KEY (ward_no)
);
CREATE TABLE Bed(
  ward_no NUMBER(8,2),
  bed_no NUMBER(8,2),
  CONSTRAINT bed_ward_fk FOREIGN KEY (ward_no) REFERENCES Ward(ward_no),
  CONSTRAINT bed_pk PRIMARY KEY (ward_no, bed_no),
  CONSTRAINT bed_check CHECK (bed_no >=1 AND bed_no <=20)
  

);
CREATE TABLE Patient_Occupancy (
patient_no VARCHAR2(20 CHAR),
date_admitted DATE, 
ward_no NUMBER(8,2), 
bed_no NUMBER(8,2) NOT NULL, 
discharge_date DATE,
CONSTRAINT patient_occupancy_patient_fk FOREIGN KEY (patient_no) REFERENCES Patient(patient_no),
CONSTRAINT patient_occupancy_ward_fk FOREIGN KEY (ward_no) REFERENCES Ward(ward_no),
CONSTRAINT patient_occupancy_pk PRIMARY KEY (patient_no, date_admitted, ward_no),
CONSTRAINT patient_occupancy_check_bed CHECK (bed_no >=1 AND bed_no <=20),
CONSTRAINT patient_occupancy_check_date CHECK (date_admitted < discharge_date)

);

CREATE TABLE Rota(
  staff_no NUMBER(8,2),
  week_no NUMBER(8,2),
  ward_no NUMBER (8,2) NOT NULL,
  shift_type VARCHAR2(50 CHAR) NOT NULL,
  CONSTRAINT rota_ward_fk FOREIGN KEY (ward_no) REFERENCES Ward(ward_no),
  CONSTRAINT rota_staff_fk FOREIGN KEY (staff_no) REFERENCES Staff(staff_no),
  CONSTRAINT rota_pk PRIMARY KEY (staff_no, week_no)
  );


INSERT INTO Rota VALUES (34, 1, 4, 'Day');
INSERT INTO Rota VALUES (35, 1, 3, 'Late');
INSERT INTO Rota VALUES (36, 1, 5, 'Night');
INSERT INTO Rota VALUES (37, 2, 1, 'Early');
INSERT INTO Rota VALUES (38, 2, 2, 'Late');



INSERT INTO Staff VALUES (34, 'Steph Curry', 14, 'Staff');
INSERT INTO Staff VALUES (35, 'Will Macintosh', 21, 'Charge');
INSERT INTO Staff VALUES (36, 'Eleanor Fuchs', 34, 'Nurse');
INSERT INTO Staff VALUES (37, 'Steven Longbottom', 12, 'Staff');
INSERT INTO Staff VALUES (38, 'Alan Sugar', 16, 'Nurse');

INSERT INTO Ward VALUES (1, 'Pediatrics');
INSERT INTO Ward VALUES (2, 'Maternity');
INSERT INTO Ward VALUES (3, 'Geriatrics');
INSERT INTO Ward VALUES (4, 'Psychiatric');
INSERT INTO Ward VALUES (5, 'A and E');
INSERT INTO Ward VALUES (6, 'Intensive Care');
INSERT INTO Ward VALUES (7, 'Cardiology');
INSERT INTO Ward VALUES (8, 'ENT');
INSERT INTO Ward VALUES (9, 'Gynaecology');
INSERT INTO Ward VALUES (10, 'Neurology');
INSERT INTO Ward VALUES (11, 'Orthopaedic');

INSERT INTO Bed VALUES (1, 1);
INSERT INTO Bed VALUES (1, 2);
INSERT INTO Bed VALUES (1, 3);
INSERT INTO Bed VALUES (1, 4);
INSERT INTO Bed VALUES (1, 5);
INSERT INTO Bed VALUES (1, 6);
INSERT INTO Bed VALUES (1, 7);
INSERT INTO Bed VALUES (1, 8);
INSERT INTO Bed VALUES (1, 9);
INSERT INTO Bed VALUES (1, 10);
INSERT INTO Bed VALUES (1, 11);
INSERT INTO Bed VALUES (1, 12);
INSERT INTO Bed VALUES (1, 13);
INSERT INTO Bed VALUES (1, 14);
INSERT INTO Bed VALUES (1, 15);
INSERT INTO Bed VALUES (1, 16);
INSERT INTO Bed VALUES (2, 1);
INSERT INTO Bed VALUES (2, 2);
INSERT INTO Bed VALUES (2, 3);
INSERT INTO Bed VALUES (2, 4);
INSERT INTO Bed VALUES (2, 5);
INSERT INTO Bed VALUES (2, 6);
INSERT INTO Bed VALUES (2, 7);
INSERT INTO Bed VALUES (2, 8);
INSERT INTO Bed VALUES (2, 9);
INSERT INTO Bed VALUES (2, 10);
INSERT INTO Bed VALUES (3, 1);
INSERT INTO Bed VALUES (3, 2);
INSERT INTO Bed VALUES (3, 3);
INSERT INTO Bed VALUES (3, 4);
INSERT INTO Bed VALUES (3, 5);
INSERT INTO Bed VALUES (3, 6);
INSERT INTO Bed VALUES (3, 7);
INSERT INTO Bed VALUES (3, 8);
INSERT INTO Bed VALUES (4, 1);
INSERT INTO Bed VALUES (4, 2);
INSERT INTO Bed VALUES (4, 3);
INSERT INTO Bed VALUES (4, 4);
INSERT INTO Bed VALUES (5, 1);
INSERT INTO Bed VALUES (5, 2);
INSERT INTO Bed VALUES (5, 3);
INSERT INTO Bed VALUES (5, 4);
INSERT INTO Bed VALUES (5, 5);
INSERT INTO Bed VALUES (5, 6);
INSERT INTO Bed VALUES (5, 7);
INSERT INTO Bed VALUES (5, 8);
INSERT INTO Bed VALUES (5, 9);
INSERT INTO Bed VALUES (5, 10);
INSERT INTO Bed VALUES (5, 11);
INSERT INTO Bed VALUES (5, 12);
INSERT INTO Bed VALUES (6, 1);
INSERT INTO Bed VALUES (6, 2);
INSERT INTO Bed VALUES (6, 3);
INSERT INTO Bed VALUES (6, 4);
INSERT INTO Bed VALUES (6, 5);
INSERT INTO Bed VALUES (6, 6);
INSERT INTO Bed VALUES (6, 7);
INSERT INTO Bed VALUES (6, 8);
INSERT INTO Bed VALUES (6, 9);
INSERT INTO Bed VALUES (6, 10);
INSERT INTO Bed VALUES (6, 11);
INSERT INTO Bed VALUES (6, 12);
INSERT INTO Bed VALUES (6, 13);
INSERT INTO Bed VALUES (6, 14);
INSERT INTO Bed VALUES (6, 15);
INSERT INTO Bed VALUES (6, 16);
INSERT INTO Bed VALUES (6, 17);
INSERT INTO Bed VALUES (6, 18);
INSERT INTO Bed VALUES (6, 19);
INSERT INTO Bed VALUES (6, 20);
INSERT INTO Bed VALUES (7, 1);
INSERT INTO Bed VALUES (7, 2);
INSERT INTO Bed VALUES (7, 3);
INSERT INTO Bed VALUES (7, 4);
INSERT INTO Bed VALUES (7, 5);
INSERT INTO Bed VALUES (7, 6);
INSERT INTO Bed VALUES (7, 7);
INSERT INTO Bed VALUES (7, 8);
INSERT INTO Bed VALUES (7, 9);
INSERT INTO Bed VALUES (7, 10);
INSERT INTO Bed VALUES (8, 1);
INSERT INTO Bed VALUES (8, 2);
INSERT INTO Bed VALUES (8, 3);
INSERT INTO Bed VALUES (8, 4);
INSERT INTO Bed VALUES (8, 5);
INSERT INTO Bed VALUES (9, 1);
INSERT INTO Bed VALUES (9, 2);
INSERT INTO Bed VALUES (9, 3);
INSERT INTO Bed VALUES (9, 4);
INSERT INTO Bed VALUES (9, 5);
INSERT INTO Bed VALUES (9, 6);
INSERT INTO Bed VALUES (9, 7);
INSERT INTO Bed VALUES (9, 8);
INSERT INTO Bed VALUES (9, 9);
INSERT INTO Bed VALUES (9, 10);
INSERT INTO Bed VALUES (9, 11);
INSERT INTO Bed VALUES (10, 1);
INSERT INTO Bed VALUES (10, 2);
INSERT INTO Bed VALUES (10, 3);
INSERT INTO Bed VALUES (10, 4);
INSERT INTO Bed VALUES (10, 5);
INSERT INTO Bed VALUES (10, 6);
INSERT INTO Bed VALUES (11, 1);
INSERT INTO Bed VALUES (11, 2);
INSERT INTO Bed VALUES (11, 3);
INSERT INTO Bed VALUES (11, 4);
INSERT INTO Bed VALUES (11, 5);
INSERT INTO Bed VALUES (11, 6);
INSERT INTO Bed VALUES (11, 7);
INSERT INTO Bed VALUES (11, 8);
INSERT INTO Bed VALUES (11, 9);
INSERT INTO Bed VALUES (11, 10);
INSERT INTO Bed VALUES (11, 11);
INSERT INTO Bed VALUES (11, 12);
INSERT INTO Bed VALUES (11, 13);


INSERT INTO Patient VALUES ('P10020', 'Jhon Cross', '12 Moreton Tower', 'London', 'W39DG', 'Male', TO_DATE('1990/05/19', 'yyyy/mm/dd'), 'Married');
INSERT INTO Patient VALUES ('P10021', 'Daley Blind', '8 Aviation Ave', 'Hatfield', 'AL109UF', 'Male', TO_DATE('1987/02/09', 'yyyy/mm/dd'), 'Single');
INSERT INTO Patient VALUES ('P10022', 'Abbey Livingstone', '23 Learner Road', 'Manchester', 'DW208FU', 'Female', TO_DATE('1960/03/23', 'yyyy/mm/dd'), 'Divorced');
INSERT INTO Patient VALUES ('P10023', 'Miranda Hearthstone', '55 Hopewell Close', 'Manchester', 'DW87GH', 'Female', TO_DATE('1997/04/01', 'yyyy/mm/dd'), 'Single');
INSERT INTO Patient VALUES ('P10024', 'Cristoph Merry', '1 Parkifeld Close', 'London', 'NW97UM', 'Male', TO_DATE('1992/11/12', 'yyyy/mm/dd'), 'Single');
INSERT INTO Patient VALUES ('P10025', 'Lorianne Guldwych', '3 Albert Road', 'Birmingham', 'NN58LG', 'Female', TO_DATE('1990/05/19', 'yyyy/mm/dd'), 'Divorced');
INSERT INTO Patient VALUES ('P10026', 'Hope Heaton', '6 Ferndell Road', 'Gravesend', 'DA79PG', 'Female', TO_DATE('1949/07/03', 'yyyy/mm/dd'), 'Widowed');
INSERT INTO Patient VALUES ('P10027', 'Ross Barkley', '82 Miranda Close', 'Brighton', 'BG55NR', 'Male', TO_DATE('2001/12/25', 'yyyy/mm/dd'), 'Single');
INSERT INTO Patient VALUES ('P10028', 'Adrian Laughton', '7 Bakewell Street', 'Luton', 'AA108AA', 'Male', TO_DATE('1974/04/29', 'yyyy/mm/dd'), 'Divorced');
INSERT INTO Patient VALUES ('P10029', 'Camille Gravestone', '4 Camberley Avenue', 'Southampton', 'SA98LW', 'Female', TO_DATE('1962/10/10', 'yyyy/mm/dd'), 'Married');
INSERT INTO Patient VALUES ('P10030', 'Gwendych Carter', '45 Crown Street', 'Liverpool', 'GH89FW', 'Female', TO_DATE('1988/09/09', 'yyyy/mm/dd'), 'Single');
INSERT INTO Patient VALUES ('P10031', 'Michael Plough', '5 Mosquito Way', 'Hatfield', 'AL107RT', 'Male', TO_DATE('1990/04/25', 'yyyy/mm/dd'), 'Single');
INSERT INTO Patient VALUES ('P10032', 'Victor Moss', '22 Palace Road', 'Birmingham', 'BL55TU', 'Male', TO_DATE('1955/05/07', 'yyyy/mm/dd'), 'Married');
INSERT INTO Patient VALUES ('P10033', 'Frank Pope', '57 Well Avenue', 'Birmingham', 'NN77JT', 'Male', TO_DATE('1939/07/22', 'yyyy/mm/dd'), 'Married');
INSERT INTO Patient VALUES ('P10034', 'Penelope Cruz', '9 Ashwell Close', 'London', 'TW88YU', 'Male', TO_DATE('1977/01/01', 'yyyy/mm/dd'), 'Single');

INSERT INTO Drug VALUES (10223, 'Morphine', 10.2);
INSERT INTO Drug VALUES (3421, 'Zithromycin', 7.5);
INSERT INTO Drug VALUES (33112, 'Tagamet', 25);
INSERT INTO Drug VALUES (42123, 'Lasix', 0.75);
INSERT INTO Drug VALUES (67554, 'Metformin', 3);
INSERT INTO Drug VALUES (2135, 'Heparin', 5);
INSERT INTO Drug VALUES (2345, 'Insulin', 1.5);
INSERT INTO Drug VALUES (10334, 'Tetracycline', 0.5);
INSERT INTO Drug VALUES (1199, 'Lexapro', 2.5);

INSERT INTO Prescription VALUES('P10020', 2345,TO_DATE('2016/05/26', 'yyyy/mm/dd'), 10, TO_DATE('2016/06/07', 'yyyy/mm/dd'));
INSERT INTO Prescription VALUES('P10025', 2345,TO_DATE('2016/07/01', 'yyyy/mm/dd'), 15, TO_DATE('2016/07/04', 'yyyy/mm/dd'));
INSERT INTO Prescription VALUES('P10031', 2345,TO_DATE('2016/06/29', 'yyyy/mm/dd'), 5, TO_DATE('2016/07/05', 'yyyy/mm/dd'));
INSERT INTO Prescription VALUES('P10028', 2345,TO_DATE('2016/05/29', 'yyyy/mm/dd'), 20, TO_DATE('2016/06/11', 'yyyy/mm/dd'));
INSERT INTO Prescription VALUES('P10022', 1199,TO_DATE('2016/01/15', 'yyyy/mm/dd'), 2, TO_DATE('2016/02/01', 'yyyy/mm/dd'));


INSERT INTO Patient_Occupancy VALUES ('P10020',TO_DATE('2016/04/21', 'yyyy/mm/dd'), 1, 5, TO_DATE('2016/04/28', 'yyyy/mm/dd'));
INSERT INTO Patient_Occupancy VALUES ('P10024',TO_DATE('2016/04/21', 'yyyy/mm/dd'), 4, 1, TO_DATE('2016/05/01', 'yyyy/mm/dd'));
INSERT INTO Patient_Occupancy VALUES ('P10028',TO_DATE('2016/04/21', 'yyyy/mm/dd'), 5, 3, TO_DATE('2016/04/22', 'yyyy/mm/dd'));
INSERT INTO Patient_Occupancy VALUES ('P10032',TO_DATE('2016/04/21', 'yyyy/mm/dd'), 7, 10, TO_DATE('2016/05/24', 'yyyy/mm/dd'));
INSERT INTO Patient_Occupancy VALUES ('P10023',TO_DATE('2016/07/11', 'yyyy/mm/dd'), 4, 1, TO_DATE('2016/07/15', 'yyyy/mm/dd'));
INSERT INTO Patient_Occupancy VALUES ('P10030',TO_DATE('2016/09/13', 'yyyy/mm/dd'), 10, 4, TO_DATE('2016/09/23', 'yyyy/mm/dd'));
INSERT INTO Patient_Occupancy VALUES ('P10033',TO_DATE('2016/03/29', 'yyyy/mm/dd'), 11, 13, TO_DATE('2016/04/03', 'yyyy/mm/dd'));

GRANT ALL ON Bed TO comtpmm;
GRANT ALL ON Drug TO comtpmm;
GRANT ALL ON Patient TO comtpmm;
GRANT ALL ON Patient_Occupancy TO comtpmm;
GRANT ALL ON Prescription TO comtpmm;
GRANT ALL ON Rota TO comtpmm;
GRANT ALL ON Staff TO comtpmm;
GRANT ALL ON Ward TO comtpmm;
GRANT ALL ON Bed TO rj14aab;
GRANT ALL ON Drug TO rj14aab;
GRANT ALL ON Patient TO rj14aab;
GRANT ALL ON Patient_Occupancy TO rj14aab;
GRANT ALL ON Prescription TO rj14aab;
GRANT ALL ON Rota TO rj14aab;
GRANT ALL ON Staff TO rj14aab;
GRANT ALL ON Ward TO rj14aab;


COMMIT;


SELECT staff_name, grade FROM Staff WHERE staff_no = 34;



SELECT Ward.ward_no, Ward.ward_name, Bed.bed_no
FROM Ward JOIN Bed
ON Ward.ward_no = Bed.ward_no;


SELECT ward.ward_name, COUNT(ward_name)
FROM Bed JOIN ward
ON bed.ward_no = ward.ward_no
GROUP BY ward.ward_name
ORDER BY COUNT(ward_name) DESC;


SELECT drug_no, patient_no FROM Prescription
WHERE drug_start_date >= '25-MAY-16' AND drug_start_date <= '05-JUL-16' AND drug_end_date >='25-MAY-16' AND drug_end_date <='05-JUL-16';


SELECT Prescription.drug_no, Drug.drug_name , Prescription.patient_no, Patient.patient_name
FROM Prescription 
JOIN Drug
ON Prescription.drug_no = Drug.drug_no
JOIN Patient
ON Prescription.patient_no = Patient.patient_no
WHERE Prescription.drug_start_date >= '25-MAY-16' AND Prescription.drug_start_date <= '05-JUL-16' AND Prescription.drug_end_date >='25-MAY-16' AND Prescription.drug_end_date <='05-JUL-16';


SELECT COUNT(patient_no) as "Number of Patients admitted on", date_admitted FROM Patient_Occupancy
WHERE date_admitted = '21-APR-16'
GROUP BY date_admitted;

SELECT Patient.patient_name, ward.ward_name, Patient_Occupancy.bed_no
FROM Prescription JOIN Patient
ON Prescription.patient_no = Patient.patient_no
JOIN Patient_Occupancy
On Prescription.patient_no = Patient_Occupancy.patient_no
JOIN Ward
ON Patient_Occupancy.ward_no = Ward.ward_no
WHERE drug_no != 1199;













SELECT * FROM Patient;




















  