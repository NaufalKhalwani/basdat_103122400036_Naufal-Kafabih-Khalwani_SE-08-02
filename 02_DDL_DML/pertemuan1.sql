SQL> -- Naufal Kafabih Khalwani_103122400036
SQL> create table jurusan (id_jurusan VARCHAR2(15) PRIMARY KEY, nama_jurusan VARCHAR2(30));

Table created.

SQL> create table mahasiswa (nim VARCHAR2(15) PRIMARY KEY, nama VARCHAR2(50), umur NUMBER, id_jurusan VARCHAR(10),
  2  CONSTRAINT fk_jurusan,
  3  FOREIGN KEY (id_jurusan),
  4  REFERENCES jurusan(id_jurusan));
CONSTRAINT fk_jurusan,
                     *
ERROR at line 2:
ORA-00904: : invalid identifier 


SQL> create table mahasiswa (nim VARCHAR2(15) PRIMARY KEY, nama VARCHAR2(50), umur NUMBER, id_jurusan VARCHAR(10),
  2  CONSTRAINT fk_jurusan
  3  FOREIGN KEY (id_jurusan)
  4  REFERENCES jurusan(id_jurusan));

Table created.

SQL> insert iinto jurusan
  2  VALUES ('J01', 'Informatika');
insert iinto jurusan
       *
ERROR at line 1:
ORA-00925: missing INTO keyword 


SQL> insert into jurusan
  2  VALUES ('J01', 'Informatika');

1 row created.

SQL> insert into jurusan
  2  VALUES ('J02', 'Rekayasa Perangkat Lunak');

1 row created.

SQL> insert into jurusan
  2  VALUES ('J03', 'Teknik Komputer');

1 row created.

SQL> insert into mahasiswa VALUES ('101', 'andi', 20, 'J01');

1 row created.

SQL> insert into mahasiswa VALUES ('102', 'budi', 21, 'J02');

1 row created.

SQL> insert into mahasiswa VALUES ('103', 'ahmad', 19, 'J03');

1 row created.

SQL> select * from jurusan;

ID_JURUSAN      NAMA_JURUSAN                                                    
--------------- ------------------------------                                  
J01             Informatika                                                     
J02             Rekayasa Perangkat Lunak                                        
J03             Teknik Komputer                                                 

SQL> select * from mahasiswa;

NIM             NAMA                                                     UMUR   
--------------- -------------------------------------------------- ----------   
ID_JURUSAN                                                                      
----------                                                                      
101             andi                                                       20   
J01                                                                             
                                                                                
102             budi                                                       21   
J02                                                                             
                                                                                
103             ahmad                                                      19   
J03                                                                             
                                                                                

SQL> update mahasiswa
  2  SET umur = 21
  3  WHERE nim = '103';

1 row updated.

SQL> DELETE FROM mahasiswa
  2  WHERE nim = '102';

1 row deleted.

SQL> CREATE VIEW view_mahasiswa AS
  2  SELECT m.nim, m.namam j.nama_jurusan
  3  FROM mahasiswa m
  4  JOIN jurusan j
  5  ON m.id_jurusan = j.id_jurusan;
SELECT m.nim, m.namam j.nama_jurusan
                       *
ERROR at line 2:
ORA-00923: FROM keyword not found where expected 


SQL> CREATE VIEW view_mahasiswa AS
  2  SELECT m.nim, m.nama, j.nama_jurusan
  3  FROM mahasiswa m
  4  JOIN jurusan j
  5  ON m.id_jurusan = j.id_jurusan;

View created.

SQL> SELECT * FROM view_mahasiswa;

NIM             NAMA                                                            
--------------- --------------------------------------------------              
NAMA_JURUSAN                                                                    
------------------------------                                                  
101             andi                                                            
Informatika                                                                     
                                                                                
103             ahmad                                                           
Teknik Komputer                                                                 
                                                                                

SQL> SPOOL OF
