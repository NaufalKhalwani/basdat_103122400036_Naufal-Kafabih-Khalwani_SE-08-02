SQL> CREATE TABLE film (
  2      id_film NUMBER PRIMARY KEY,
  3      judul VARCHAR2(100),
  4      sinopsis VARCHAR2(255),
  5      tahun NUMBER,
  6      durasi NUMBER
  7  );

Table created.

SQL> CREATE TABLE theater (
  2      id_theater NUMBER PRIMARY KEY,
  3      harga NUMBER,
  4      kapasitas NUMBER,
  5      kelas VARCHAR2(20)
  6  );

Table created.

SQL> CREATE TABLE member (
  2      id_member NUMBER PRIMARY KEY,
  3      nama VARCHAR2(100),
  4      no_hp VARCHAR2(15),
  5      tgl_lahir DATE,
  6      email VARCHAR2(100)
  7  );

Table created.

SQL> CREATE TABLE jadwal (
  2      id_jadwal NUMBER PRIMARY KEY,
  3      id_film NUMBER,
  4      id_theater NUMBER,
  5      periode_start DATE,
  6      periode_end DATE,
  7      FOREIGN KEY (id_film) REFERENCES film(id_film),
  8      FOREIGN KEY (id_theater) REFERENCES theater(id_theater)
  9  );

Table created.

SQL> CREATE TABLE inventaris (
  2      id_inventaris NUMBER PRIMARY KEY,
  3      id_theater NUMBER,
  4      nomor_kursi NUMBER,
  5      FOREIGN KEY (id_theater) REFERENCES theater(id_theater)
  6  );

Table created.

SQL> CREATE TABLE transaksi (
  2      kode_pemesanan NUMBER PRIMARY KEY,
  3      id_jadwal NUMBER,
  4      id_member NUMBER,
  5      status VARCHAR2(20),
  6      tanggal DATE,
  7      total_harga NUMBER,
  8      FOREIGN KEY (id_jadwal) REFERENCES jadwal(id_jadwal),
  9      FOREIGN KEY (id_member) REFERENCES member(id_member)
 10  );

Table created.

SQL> INSERT INTO film VALUES (1,'Avengers','Film superhero Marvel',2019,180);

1 row created.

SQL> INSERT INTO film VALUES (2,'Inception','Film mimpi dalam mimpi',2010,148);

1 row created.

SQL> INSERT INTO film VALUES (3,'Interstellar','Film perjalanan luar angkasa',2014,169);

1 row created.

SQL> INSERT INTO theater VALUES (1,50000,100,'Regular');

1 row created.

SQL> INSERT INTO theater VALUES (2,75000,80,'VIP');

1 row created.

SQL> INSERT INTO member VALUES (1,'Andi','081234567','01-JAN-2000','andi@gmail.com');

1 row created.

SQL> INSERT INTO member VALUES (2,'Budi','081234568','05-MAY-1999','budi@gmail.com');

1 row created.

SQL> INSERT INTO member VALUES (3,'Citra','081234569','10-OCT-2001','citra@gmail.com');

1 row created.

SQL> INSERT INTO jadwal VALUES (1,1,1,'01-JUN-2025','30-JUN-2025');

1 row created.

SQL> INSERT INTO jadwal VALUES (2,2,2,'01-JUL-2025','31-JUL-2025');

1 row created.

SQL> INSERT INTO inventaris VALUES (1,1,1);

1 row created.

SQL> INSERT INTO inventaris VALUES (2,1,2);

1 row created.

SQL> INSERT INTO inventaris VALUES (3,2,1);

1 row created.

SQL> INSERT INTO transaksi VALUES (1001,1,1,'LUNAS',SYSDATE,50000);

1 row created.

SQL> INSERT INTO transaksi VALUES (1002,2,2,'PENDING',SYSDATE,75000);

1 row created.

SQL> UPDATE film
  2  SET durasi = 185
  3  WHERE id_film = 1;

1 row updated.

SQL> UPDATE theater
  2  SET harga = 55000
  3  WHERE id_theater = 1;

1 row updated.

SQL> UPDATE member
  2  SET email = 'andi_new@gmail.com'
  3  WHERE id_member = 1;

1 row updated.

SQL> UPDATE jadwal
  2  SET periode_end = '31-JUL-2025'
  3  WHERE id_jadwal = 1;

1 row updated.

SQL> UPDATE transaksi
  2  SET status = 'LUNAS'
  3  WHERE kode_pemesanan = 1002;

1 row updated.

SQL> DELETE FROM inventaris
  2  WHERE id_inventaris = 3;

1 row deleted.

SQL> DELETE FROM member
  2  WHERE id_member = 3;

1 row deleted.

SQL> SELECT * FROM film;

   ID_FILM                                                                      
----------                                                                      
JUDUL                                                                           
--------------------------------------------------------------------------------
SINOPSIS                                                                        
--------------------------------------------------------------------------------
     TAHUN     DURASI                                                           
---------- ----------                                                           
         1                                                                      
Avengers                                                                        
Film superhero Marvel                                                           
      2019        185                                                           
                                                                                

   ID_FILM                                                                      
----------                                                                      
JUDUL                                                                           
--------------------------------------------------------------------------------
SINOPSIS                                                                        
--------------------------------------------------------------------------------
     TAHUN     DURASI                                                           
---------- ----------                                                           
         2                                                                      
Inception                                                                       
Film mimpi dalam mimpi                                                          
      2010        148                                                           
                                                                                

   ID_FILM                                                                      
----------                                                                      
JUDUL                                                                           
--------------------------------------------------------------------------------
SINOPSIS                                                                        
--------------------------------------------------------------------------------
     TAHUN     DURASI                                                           
---------- ----------                                                           
         3                                                                      
Interstellar                                                                    
Film perjalanan luar angkasa                                                    
      2014        169                                                           
                                                                                

SQL> SELECT * FROM theater;

ID_THEATER      HARGA  KAPASITAS KELAS                                          
---------- ---------- ---------- --------------------                           
         1      55000        100 Regular                                        
         2      75000         80 VIP                                            

SQL> SELECT * FROM member;

 ID_MEMBER                                                                      
----------                                                                      
NAMA                                                                            
--------------------------------------------------------------------------------
NO_HP           TGL_LAHIR                                                       
--------------- ---------                                                       
EMAIL                                                                           
--------------------------------------------------------------------------------
         1                                                                      
Andi                                                                            
081234567       01-JAN-00                                                       
andi_new@gmail.com                                                              
                                                                                

 ID_MEMBER                                                                      
----------                                                                      
NAMA                                                                            
--------------------------------------------------------------------------------
NO_HP           TGL_LAHIR                                                       
--------------- ---------                                                       
EMAIL                                                                           
--------------------------------------------------------------------------------
         2                                                                      
Budi                                                                            
081234568       05-MAY-99                                                       
budi@gmail.com                                                                  
                                                                                

SQL> SELECT * FROM jadwal;

 ID_JADWAL    ID_FILM ID_THEATER PERIODE_S PERIODE_E                            
---------- ---------- ---------- --------- ---------                            
         1          1          1 01-JUN-25 31-JUL-25                            
         2          2          2 01-JUL-25 31-JUL-25                            

SQL> SELECT * FROM inventaris;

ID_INVENTARIS ID_THEATER NOMOR_KURSI                                            
------------- ---------- -----------                                            
            1          1           1                                            
            2          1           2                                            

SQL> SELECT * FROM transaksi;

KODE_PEMESANAN  ID_JADWAL  ID_MEMBER STATUS               TANGGAL   TOTAL_HARGA 
-------------- ---------- ---------- -------------------- --------- ----------- 
          1001          1          1 LUNAS                10-MAR-26       50000 
          1002          2          2 LUNAS                10-MAR-26       75000 

SQL> -- SEKIAN TERIMAKASIH
SQL> SPOOL OFF
