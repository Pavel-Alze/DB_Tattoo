toc.dat                                                                                             0000600 0004000 0002000 00000137600 14446036550 0014455 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP                           {            practice    15.2    15.2 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false         �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false         �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false         �           1262    24660    practice    DATABASE     �   CREATE DATABASE practice WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE practice;
                postgres    false         �            1255    33096 B   assmnt_proc(double precision, integer, integer, character varying) 	   PROCEDURE     ~  CREATE PROCEDURE public.assmnt_proc(IN assessment double precision, IN receipt_id integer, IN staff_id integer, IN service_codifier character varying)
    LANGUAGE plpgsql
    AS $$
begin
update procedures set procedures.assessment = assessment where procedures.receipt_id = receipt_id and procedures.staff_id = staff_id and procedures.service_codifier = service_codifier;
end; $$;
 �   DROP PROCEDURE public.assmnt_proc(IN assessment double precision, IN receipt_id integer, IN staff_id integer, IN service_codifier character varying);
       public          postgres    false         �           0    0 �   PROCEDURE assmnt_proc(IN assessment double precision, IN receipt_id integer, IN staff_id integer, IN service_codifier character varying)    ACL     �   GRANT ALL ON PROCEDURE public.assmnt_proc(IN assessment double precision, IN receipt_id integer, IN staff_id integer, IN service_codifier character varying) TO manager;
          public          postgres    false    253         �            1255    32855    create_cheque(integer) 	   PROCEDURE     �   CREATE PROCEDURE public.create_cheque(IN client_id integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
INSERT INTO receipts(client_id) VALUES(client_id);
END;
$$;
 ;   DROP PROCEDURE public.create_cheque(IN client_id integer);
       public          postgres    false         �           0    0 -   PROCEDURE create_cheque(IN client_id integer)    ACL     N   GRANT ALL ON PROCEDURE public.create_cheque(IN client_id integer) TO manager;
          public          postgres    false    227         �            1255    33039 F   create_client(character varying, character varying, character varying) 	   PROCEDURE       CREATE PROCEDURE public.create_client(IN firstname character varying, IN surname character varying, IN phone_number character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
INSERT INTO clients(firstname,surname,phone_number) VALUES(firstname,surname,phone_number);
END;
$$;
 �   DROP PROCEDURE public.create_client(IN firstname character varying, IN surname character varying, IN phone_number character varying);
       public          postgres    false         �           0    0 x   PROCEDURE create_client(IN firstname character varying, IN surname character varying, IN phone_number character varying)    ACL     �   GRANT ALL ON PROCEDURE public.create_client(IN firstname character varying, IN surname character varying, IN phone_number character varying) TO manager;
          public          postgres    false    230         �            1255    33092 '   create_duty(integer, character varying) 	   PROCEDURE     �   CREATE PROCEDURE public.create_duty(IN staff_id integer, IN office_codifier character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
INSERT INTO duty(staff_id,office_codifier) VALUES(staff_id,office_codifier);
END;
$$;
 ^   DROP PROCEDURE public.create_duty(IN staff_id integer, IN office_codifier character varying);
       public          postgres    false         �           0    0 P   PROCEDURE create_duty(IN staff_id integer, IN office_codifier character varying)    ACL     w   GRANT ALL ON PROCEDURE public.create_duty(IN staff_id integer, IN office_codifier character varying) TO administrator;
          public          postgres    false    252                    1255    35086 �   create_employee(character varying, character varying, character varying, character varying, character varying, character varying, character varying, money, smallint, smallint, character varying, smallint) 	   PROCEDURE     �  CREATE PROCEDURE public.create_employee(IN log character varying, IN password character varying, IN firstname character varying, IN surname character varying, IN patronymic character varying, IN email character varying, IN phone_number character varying, IN salary money, IN experience smallint, IN age smallint, IN description character varying, IN level smallint)
    LANGUAGE plpgsql
    AS $$
BEGIN
INSERT INTO logins(staff_login,password,level_sec) VALUES(log,password,level);
INSERT INTO 
staff(login,firstname,surname,patronymic,email,phone_number,salary,experience,age,description) 
VALUES(log,firstname,surname,patronymic,email,phone_number,salary,experience,age,description);
END;
$$;
 m  DROP PROCEDURE public.create_employee(IN log character varying, IN password character varying, IN firstname character varying, IN surname character varying, IN patronymic character varying, IN email character varying, IN phone_number character varying, IN salary money, IN experience smallint, IN age smallint, IN description character varying, IN level smallint);
       public          postgres    false         �           0    0 _  PROCEDURE create_employee(IN log character varying, IN password character varying, IN firstname character varying, IN surname character varying, IN patronymic character varying, IN email character varying, IN phone_number character varying, IN salary money, IN experience smallint, IN age smallint, IN description character varying, IN level smallint)    ACL     �  GRANT ALL ON PROCEDURE public.create_employee(IN log character varying, IN password character varying, IN firstname character varying, IN surname character varying, IN patronymic character varying, IN email character varying, IN phone_number character varying, IN salary money, IN experience smallint, IN age smallint, IN description character varying, IN level smallint) TO administrator;
          public          postgres    false    260         �            1255    33093 l   create_office(character varying, character varying, character varying, character varying, character varying) 	   PROCEDURE     �  CREATE PROCEDURE public.create_office(IN codifier character varying, IN description character varying, IN address character varying, IN post_index character varying, IN phone_number character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
INSERT INTO offices(codifier, description, address, post_index, phone_number) 
VALUES(codifier, description, address, post_index, phone_number);
END;
$$;
 �   DROP PROCEDURE public.create_office(IN codifier character varying, IN description character varying, IN address character varying, IN post_index character varying, IN phone_number character varying);
       public          postgres    false         �            1255    32862 0   create_proc(integer, integer, character varying)    FUNCTION     d  CREATE FUNCTION public.create_proc(staff_id integer, receipt_id integer, service_codifier character varying) RETURNS TABLE(cost money)
    LANGUAGE plpgsql
    AS $$
BEGIN
INSERT INTO procedures(staff_id,receipt_id,service_codifier) VALUES(staff_id,receipt_id,service_codifier);
SELECT cost FROM services WHERE services.codifier=service_codifier;
END;
$$;
 l   DROP FUNCTION public.create_proc(staff_id integer, receipt_id integer, service_codifier character varying);
       public          postgres    false         �            1255    32872 1   create_proce(integer, integer, character varying)    FUNCTION     y  CREATE FUNCTION public.create_proce(staff_id integer, receipt_id integer, service_codifier character varying) RETURNS TABLE(codifier character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
INSERT INTO procedures(staff_id,receipt_id,service_codifier) VALUES(staff_id,receipt_id,service_codifier);
SELECT codifier FROM services WHERE services.codifier=service_codifier;
END;
$$;
 m   DROP FUNCTION public.create_proce(staff_id integer, receipt_id integer, service_codifier character varying);
       public          postgres    false         �            1255    32864 2   create_proced(integer, integer, character varying)    FUNCTION     o  CREATE FUNCTION public.create_proced(staff_id integer, receipt_id integer, service_codifier character varying) RETURNS TABLE(cost money)
    LANGUAGE plpgsql
    AS $$
BEGIN
INSERT INTO procedures(staff_id,receipt_id,service_codifier) VALUES(staff_id,receipt_id,service_codifier);
SELECT services.cost FROM services WHERE services.codifier=service_codifier;
END;
$$;
 n   DROP FUNCTION public.create_proced(staff_id integer, receipt_id integer, service_codifier character varying);
       public          postgres    false         �            1255    33094 5   create_procedure(character varying, integer, integer) 	   PROCEDURE     �  CREATE PROCEDURE public.create_procedure(IN service_codifier character varying, IN staff_id integer, IN receipt_id integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
INSERT INTO procedures(service_codifier,staff_id,receipt_id) VALUES(service_codifier,staff_id,receipt_id);
UPDATE receipts SET final_cost = final_cost + services.cost FROM services WHERE services.codifier = 
service_codifier AND receipts.id = receipt_id;
END;
$$;
 {   DROP PROCEDURE public.create_procedure(IN service_codifier character varying, IN staff_id integer, IN receipt_id integer);
       public          postgres    false         �           0    0 m   PROCEDURE create_procedure(IN service_codifier character varying, IN staff_id integer, IN receipt_id integer)    ACL     �   GRANT ALL ON PROCEDURE public.create_procedure(IN service_codifier character varying, IN staff_id integer, IN receipt_id integer) TO manager;
          public          postgres    false    254         �            1255    33095 a   create_service(character varying, character varying, money, character varying, character varying) 	   PROCEDURE     g  CREATE PROCEDURE public.create_service(IN codifier character varying, IN title character varying, IN cost money, IN description character varying, IN office_codifier character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
INSERT INTO services(codifier,title,description,cost,office_codifier) 
VALUES(codifier,title,cost,description,office_codifier);
END;
$$;
 �   DROP PROCEDURE public.create_service(IN codifier character varying, IN title character varying, IN cost money, IN description character varying, IN office_codifier character varying);
       public          postgres    false         �            1255    32883    dup(character varying)    FUNCTION     �   CREATE FUNCTION public.dup(character varying) RETURNS TABLE(description character varying)
    LANGUAGE plpgsql
    AS $_$ BEGIN SELECT $1; END; $_$;
 -   DROP FUNCTION public.dup(character varying);
       public          postgres    false         �            1259    25587 
   procedures    TABLE     �   CREATE TABLE public.procedures (
    assessment double precision DEFAULT 0.0 NOT NULL,
    service_codifier character varying(5) NOT NULL,
    staff_id integer NOT NULL,
    receipt_id integer NOT NULL
);
    DROP TABLE public.procedures;
       public         heap    postgres    false         �           0    0    TABLE procedures    ACL     �   GRANT SELECT ON TABLE public.procedures TO analyst;
GRANT SELECT,INSERT,DELETE ON TABLE public.procedures TO manager;
GRANT SELECT,INSERT,UPDATE ON TABLE public.procedures TO employee;
GRANT SELECT,UPDATE ON TABLE public.procedures TO operator;
          public          postgres    false    224         �            1255    33100 "   find_procedures(character varying)    FUNCTION     �   CREATE FUNCTION public.find_procedures(input character varying) RETURNS SETOF public.procedures
    LANGUAGE plpgsql
    AS $$
BEGIN
  RETURN QUERY SELECT * FROM procedures where service_codifier = input;
END
$$;
 ?   DROP FUNCTION public.find_procedures(input character varying);
       public          postgres    false    224         �           0    0 1   FUNCTION find_procedures(input character varying)    ACL     R   GRANT ALL ON FUNCTION public.find_procedures(input character varying) TO manager;
          public          postgres    false    255                     1255    33101 +   find_procedures(character varying, integer)    FUNCTION     �   CREATE FUNCTION public.find_procedures(input character varying, input2 integer) RETURNS SETOF public.procedures
    LANGUAGE plpgsql
    AS $$
BEGIN
  RETURN QUERY SELECT * FROM procedures where service_codifier = input AND staff_id = input2;
END
$$;
 O   DROP FUNCTION public.find_procedures(input character varying, input2 integer);
       public          postgres    false    224         �           0    0 A   FUNCTION find_procedures(input character varying, input2 integer)    ACL     b   GRANT ALL ON FUNCTION public.find_procedures(input character varying, input2 integer) TO manager;
          public          postgres    false    256                    1255    33102 4   find_procedures(character varying, integer, integer)    FUNCTION     $  CREATE FUNCTION public.find_procedures(input character varying, input2 integer, input3 integer) RETURNS SETOF public.procedures
    LANGUAGE plpgsql
    AS $$
BEGIN
  RETURN QUERY SELECT * FROM procedures where service_codifier = input AND staff_id = input2 AND 
receipt_id = input3;
END
$$;
 _   DROP FUNCTION public.find_procedures(input character varying, input2 integer, input3 integer);
       public          postgres    false    224         �           0    0 Q   FUNCTION find_procedures(input character varying, input2 integer, input3 integer)    ACL     r   GRANT ALL ON FUNCTION public.find_procedures(input character varying, input2 integer, input3 integer) TO manager;
          public          postgres    false    257         �            1259    25574    receipts    TABLE     �   CREATE TABLE public.receipts (
    id integer NOT NULL,
    final_cost money DEFAULT 0.0 NOT NULL,
    date_open timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    client_id integer NOT NULL,
    date_close timestamp with time zone
);
    DROP TABLE public.receipts;
       public         heap    postgres    false         �           0    0    TABLE receipts    ACL     �   GRANT SELECT ON TABLE public.receipts TO analyst;
GRANT SELECT,INSERT,DELETE ON TABLE public.receipts TO manager;
GRANT SELECT,INSERT,UPDATE ON TABLE public.receipts TO employee;
GRANT SELECT,UPDATE ON TABLE public.receipts TO operator;
          public          postgres    false    223                    1255    33098     find_receipts_by_client(integer)    FUNCTION     �   CREATE FUNCTION public.find_receipts_by_client(client integer) RETURNS SETOF public.receipts
    LANGUAGE plpgsql
    AS $$
BEGIN
  RETURN QUERY SELECT * FROM receipts where client_id = client;
END
$$;
 >   DROP FUNCTION public.find_receipts_by_client(client integer);
       public          postgres    false    223         �           0    0 0   FUNCTION find_receipts_by_client(client integer)    ACL     �   GRANT ALL ON FUNCTION public.find_receipts_by_client(client integer) TO analyst;
GRANT ALL ON FUNCTION public.find_receipts_by_client(client integer) TO manager;
          public          postgres    false    258                    1255    33099 $   find_receipts_by_price(money, money)    FUNCTION     �   CREATE FUNCTION public.find_receipts_by_price(min_cost money, max_cost money) RETURNS SETOF public.receipts
    LANGUAGE plpgsql
    AS $$
BEGIN
  RETURN QUERY SELECT * FROM receipts where final_cost BETWEEN min_cost AND max_cost;
END
$$;
 M   DROP FUNCTION public.find_receipts_by_price(min_cost money, max_cost money);
       public          postgres    false    223         �           0    0 ?   FUNCTION find_receipts_by_price(min_cost money, max_cost money)    ACL     �   GRANT ALL ON FUNCTION public.find_receipts_by_price(min_cost money, max_cost money) TO analyst;
GRANT ALL ON FUNCTION public.find_receipts_by_price(min_cost money, max_cost money) TO manager;
          public          postgres    false    259         �            1255    33089    inc_bonus()    FUNCTION     �  CREATE FUNCTION public.inc_bonus() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
	begin
	update clients set bonus = bonus + new.final_cost * 0.05 where clients.id = new.client_id and status = 'Ordinary';
	update clients set bonus = bonus + new.final_cost * 0.10 where clients.id = new.client_id and status = 'Regular';
	update clients set bonus = bonus + new.final_cost * 0.15 where clients.id = new.client_id and status = 'Premium';
	return null;
	end;
$$;
 "   DROP FUNCTION public.inc_bonus();
       public          postgres    false         �            1255    33107    inc_count_staff()    FUNCTION     �   CREATE FUNCTION public.inc_count_staff() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
	begin
	update officies set staff_count = staff_count + 1
	where codifier = new.office_codifier;
	return null;
	end;
$$;
 (   DROP FUNCTION public.inc_count_staff();
       public          postgres    false         �            1255    33072    inc_staff_assmnt()    FUNCTION     S  CREATE FUNCTION public.inc_staff_assmnt() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
	begin
	update staff
	set count_assessment = count_assessment + 1 where staff.id = new.staff_id;
	update staff
	set rating = (rating * (count_assessment - 1) + new.assessment) / count_assessment where staff.id = new.staff_id;
	return null;
	end;
$$;
 )   DROP FUNCTION public.inc_staff_assmnt();
       public          postgres    false         �            1255    33177    receipt_close(integer) 	   PROCEDURE     �   CREATE PROCEDURE public.receipt_close(IN idr integer)
    LANGUAGE plpgsql
    AS $$
begin
update receipts set date_close = current_timestamp where id=idr;
end; 
$$;
 5   DROP PROCEDURE public.receipt_close(IN idr integer);
       public          postgres    false         �           0    0 '   PROCEDURE receipt_close(IN idr integer)    ACL     H   GRANT ALL ON PROCEDURE public.receipt_close(IN idr integer) TO manager;
          public          postgres    false    229         �            1255    32873    test(character varying)    FUNCTION     �   CREATE FUNCTION public.test(cod character varying) RETURNS TABLE(description character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
SELECT description FROM services WHERE services.codifier=cod;
END;
$$;
 2   DROP FUNCTION public.test(cod character varying);
       public          postgres    false         �            1255    32874    tests(character varying)    FUNCTION     �   CREATE FUNCTION public.tests(cod character varying) RETURNS TABLE(description character varying)
    LANGUAGE plpgsql
    AS $_$
BEGIN
SELECT $1;
END;
$_$;
 3   DROP FUNCTION public.tests(cod character varying);
       public          postgres    false         �            1255    33105    update_client_status()    FUNCTION     	  CREATE FUNCTION public.update_client_status() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
UPDATE clients
   SET status = 'Regular'  WHERE clients.count_visit > 15;
UPDATE clients
SET status = 'Premium'  WHERE clients.count_visit > 50;
RETURN NEW;
END;
$$;
 -   DROP FUNCTION public.update_client_status();
       public          postgres    false         �            1255    33103    visit_incrementation()    FUNCTION     �   CREATE FUNCTION public.visit_incrementation() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
UPDATE clients 
   SET count_visit = count_visit + 1
WHERE clients.id = NEW.client_id; 
RETURN NEW;
END;
$$;
 -   DROP FUNCTION public.visit_incrementation();
       public          postgres    false         �            1259    25565    clients    TABLE     h  CREATE TABLE public.clients (
    id integer NOT NULL,
    firstname character varying(20) NOT NULL,
    surname character varying(20) NOT NULL,
    phone_number character varying(12) NOT NULL,
    status character varying(10) DEFAULT 'Ordinary'::character varying NOT NULL,
    count_visit smallint DEFAULT 1 NOT NULL,
    bonus money DEFAULT 0.0 NOT NULL
);
    DROP TABLE public.clients;
       public         heap    postgres    false         �           0    0    TABLE clients    ACL       GRANT SELECT ON TABLE public.clients TO analyst;
GRANT SELECT,INSERT,DELETE ON TABLE public.clients TO manager;
GRANT SELECT,INSERT,UPDATE ON TABLE public.clients TO employee;
GRANT SELECT,UPDATE ON TABLE public.clients TO operator;
GRANT SELECT ON TABLE public.clients TO test1;
          public          postgres    false    221         �            1259    25564    clients_id_seq    SEQUENCE     �   CREATE SEQUENCE public.clients_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.clients_id_seq;
       public          postgres    false    221         �           0    0    clients_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.clients_id_seq OWNED BY public.clients.id;
          public          postgres    false    220         �            1259    25549    duty    TABLE     o   CREATE TABLE public.duty (
    staff_id integer NOT NULL,
    office_codifier character varying(5) NOT NULL
);
    DROP TABLE public.duty;
       public         heap    postgres    false         �           0    0 
   TABLE duty    ACL     �   GRANT SELECT ON TABLE public.duty TO analyst;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.duty TO administrator;
GRANT SELECT,UPDATE ON TABLE public.duty TO operator;
          public          postgres    false    219         �            1259    25518    logins    TABLE     �   CREATE TABLE public.logins (
    staff_login character varying(255) NOT NULL,
    password character varying,
    level_sec smallint
);
    DROP TABLE public.logins;
       public         heap    postgres    false         �           0    0    TABLE logins    ACL     �   GRANT SELECT,INSERT,UPDATE ON TABLE public.logins TO administrator;
GRANT SELECT ON TABLE public.logins TO analyst;
GRANT SELECT,UPDATE ON TABLE public.logins TO operator;
          public          postgres    false    216         �            1259    25503    offices    TABLE     +  CREATE TABLE public.offices (
    codifier character varying(5) NOT NULL,
    description character varying(40),
    address character varying(40) NOT NULL,
    post_index character varying(6) NOT NULL,
    phone_number character varying(12) NOT NULL,
    staff_count smallint DEFAULT 0 NOT NULL
);
    DROP TABLE public.offices;
       public         heap    postgres    false         �           0    0    TABLE offices    ACL     j   GRANT SELECT ON TABLE public.offices TO analyst;
GRANT SELECT,UPDATE ON TABLE public.offices TO operator;
          public          postgres    false    214         �            1259    25573    receipts_id_seq    SEQUENCE     �   CREATE SEQUENCE public.receipts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.receipts_id_seq;
       public          postgres    false    223         �           0    0    receipts_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.receipts_id_seq OWNED BY public.receipts.id;
          public          postgres    false    222         �            1259    25508    services    TABLE     �   CREATE TABLE public.services (
    codifier character varying(5) NOT NULL,
    title character varying(20) NOT NULL,
    cost money NOT NULL,
    description character varying(40) NOT NULL,
    office_codifier character varying(5) NOT NULL
);
    DROP TABLE public.services;
       public         heap    postgres    false         �           0    0    TABLE services    ACL     �   GRANT SELECT ON TABLE public.services TO analyst;
GRANT SELECT ON TABLE public.services TO manager;
GRANT SELECT ON TABLE public.services TO employee;
GRANT SELECT,UPDATE ON TABLE public.services TO operator;
          public          postgres    false    215         �            1259    25536    staff    TABLE     '  CREATE TABLE public.staff (
    id integer NOT NULL,
    firstname character varying(20) NOT NULL,
    surname character varying(20) NOT NULL,
    patronymic character varying(20) NOT NULL,
    email character varying(30) NOT NULL,
    phone_number character varying(12) NOT NULL,
    experience smallint NOT NULL,
    age smallint NOT NULL,
    rating double precision DEFAULT 0.0 NOT NULL,
    description character varying(40),
    login character varying(20) NOT NULL,
    salary money NOT NULL,
    count_assessment integer DEFAULT 0 NOT NULL
);
    DROP TABLE public.staff;
       public         heap    postgres    false         �           0    0    TABLE staff    ACL     �   GRANT SELECT,INSERT,UPDATE ON TABLE public.staff TO administrator;
GRANT SELECT ON TABLE public.staff TO analyst;
GRANT SELECT,UPDATE ON TABLE public.staff TO operator;
          public          postgres    false    218         �           0    0    COLUMN staff.rating    ACL     o   GRANT UPDATE(rating) ON TABLE public.staff TO employee;
GRANT UPDATE(rating) ON TABLE public.staff TO manager;
          public          postgres    false    218    3492         �           0    0    COLUMN staff.count_assessment    ACL     �   GRANT UPDATE(count_assessment) ON TABLE public.staff TO employee;
GRANT UPDATE(count_assessment) ON TABLE public.staff TO manager;
          public          postgres    false    218    3492         �            1259    25535    staff_id_seq    SEQUENCE     �   CREATE SEQUENCE public.staff_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.staff_id_seq;
       public          postgres    false    218         �           0    0    staff_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.staff_id_seq OWNED BY public.staff.id;
          public          postgres    false    217         �           2604    25568 
   clients id    DEFAULT     h   ALTER TABLE ONLY public.clients ALTER COLUMN id SET DEFAULT nextval('public.clients_id_seq'::regclass);
 9   ALTER TABLE public.clients ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    220    221         �           2604    25577    receipts id    DEFAULT     j   ALTER TABLE ONLY public.receipts ALTER COLUMN id SET DEFAULT nextval('public.receipts_id_seq'::regclass);
 :   ALTER TABLE public.receipts ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    222    223         �           2604    25539    staff id    DEFAULT     d   ALTER TABLE ONLY public.staff ALTER COLUMN id SET DEFAULT nextval('public.staff_id_seq'::regclass);
 7   ALTER TABLE public.staff ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    218    218         �          0    25565    clients 
   TABLE DATA           c   COPY public.clients (id, firstname, surname, phone_number, status, count_visit, bonus) FROM stdin;
    public          postgres    false    221       3461.dat �          0    25549    duty 
   TABLE DATA           9   COPY public.duty (staff_id, office_codifier) FROM stdin;
    public          postgres    false    219       3459.dat �          0    25518    logins 
   TABLE DATA           B   COPY public.logins (staff_login, password, level_sec) FROM stdin;
    public          postgres    false    216       3456.dat ~          0    25503    offices 
   TABLE DATA           h   COPY public.offices (codifier, description, address, post_index, phone_number, staff_count) FROM stdin;
    public          postgres    false    214       3454.dat �          0    25587 
   procedures 
   TABLE DATA           X   COPY public.procedures (assessment, service_codifier, staff_id, receipt_id) FROM stdin;
    public          postgres    false    224       3464.dat �          0    25574    receipts 
   TABLE DATA           T   COPY public.receipts (id, final_cost, date_open, client_id, date_close) FROM stdin;
    public          postgres    false    223       3463.dat           0    25508    services 
   TABLE DATA           W   COPY public.services (codifier, title, cost, description, office_codifier) FROM stdin;
    public          postgres    false    215       3455.dat �          0    25536    staff 
   TABLE DATA           �   COPY public.staff (id, firstname, surname, patronymic, email, phone_number, experience, age, rating, description, login, salary, count_assessment) FROM stdin;
    public          postgres    false    218       3458.dat �           0    0    clients_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.clients_id_seq', 3, true);
          public          postgres    false    220         �           0    0    receipts_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.receipts_id_seq', 4, true);
          public          postgres    false    222         �           0    0    staff_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.staff_id_seq', 3, true);
          public          postgres    false    217         �           2606    25572    clients clients_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.clients DROP CONSTRAINT clients_pkey;
       public            postgres    false    221         �           2606    25553    duty duty_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.duty
    ADD CONSTRAINT duty_pkey PRIMARY KEY (staff_id, office_codifier);
 8   ALTER TABLE ONLY public.duty DROP CONSTRAINT duty_pkey;
       public            postgres    false    219    219         �           2606    36231    logins logins_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.logins
    ADD CONSTRAINT logins_pkey PRIMARY KEY (staff_login);
 <   ALTER TABLE ONLY public.logins DROP CONSTRAINT logins_pkey;
       public            postgres    false    216         �           2606    25507    offices offices_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.offices
    ADD CONSTRAINT offices_pkey PRIMARY KEY (codifier);
 >   ALTER TABLE ONLY public.offices DROP CONSTRAINT offices_pkey;
       public            postgres    false    214         �           2606    25592    procedures procedures_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.procedures
    ADD CONSTRAINT procedures_pkey PRIMARY KEY (service_codifier, staff_id, receipt_id);
 D   ALTER TABLE ONLY public.procedures DROP CONSTRAINT procedures_pkey;
       public            postgres    false    224    224    224         �           2606    25581    receipts receipts_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.receipts
    ADD CONSTRAINT receipts_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.receipts DROP CONSTRAINT receipts_pkey;
       public            postgres    false    223         �           2606    25512    services services_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_pkey PRIMARY KEY (codifier);
 @   ALTER TABLE ONLY public.services DROP CONSTRAINT services_pkey;
       public            postgres    false    215         �           2606    35088    staff staff_login_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.staff
    ADD CONSTRAINT staff_login_key UNIQUE (login);
 ?   ALTER TABLE ONLY public.staff DROP CONSTRAINT staff_login_key;
       public            postgres    false    218         �           2606    25541    staff staff_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.staff
    ADD CONSTRAINT staff_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.staff DROP CONSTRAINT staff_pkey;
       public            postgres    false    218         �           1259    33169    chq_indx_id    INDEX     >   CREATE INDEX chq_indx_id ON public.receipts USING btree (id);
    DROP INDEX public.chq_indx_id;
       public            postgres    false    223         �           1259    33170    chq_indx_time    INDEX     H   CREATE INDEX chq_indx_time ON public.receipts USING btree (date_close);
 !   DROP INDEX public.chq_indx_time;
       public            postgres    false    223         �           1259    33167    cli_indx_frnm    INDEX     E   CREATE INDEX cli_indx_frnm ON public.clients USING hash (firstname);
 !   DROP INDEX public.cli_indx_frnm;
       public            postgres    false    221         �           1259    33166    cli_indx_id    INDEX     =   CREATE INDEX cli_indx_id ON public.clients USING btree (id);
    DROP INDEX public.cli_indx_id;
       public            postgres    false    221         �           1259    33168    cli_indx_stts    INDEX     B   CREATE INDEX cli_indx_stts ON public.clients USING hash (status);
 !   DROP INDEX public.cli_indx_stts;
       public            postgres    false    221         �           2620    33090    receipts trg_bonus    TRIGGER     y   CREATE TRIGGER trg_bonus AFTER UPDATE OF date_close ON public.receipts FOR EACH ROW EXECUTE FUNCTION public.inc_bonus();
 +   DROP TRIGGER trg_bonus ON public.receipts;
       public          postgres    false    223    223    249         �           2620    33108    duty trg_count_staff    TRIGGER     s   CREATE TRIGGER trg_count_staff AFTER INSERT ON public.duty FOR EACH ROW EXECUTE FUNCTION public.inc_count_staff();
 -   DROP TRIGGER trg_count_staff ON public.duty;
       public          postgres    false    228    219         �           2620    33073    procedures trg_staff_assmnt    TRIGGER     �   CREATE TRIGGER trg_staff_assmnt AFTER UPDATE OF assessment ON public.procedures FOR EACH ROW EXECUTE FUNCTION public.inc_staff_assmnt();
 4   DROP TRIGGER trg_staff_assmnt ON public.procedures;
       public          postgres    false    224    248    224         �           2620    33106 $   clients update_client_status_trigger    TRIGGER     �   CREATE TRIGGER update_client_status_trigger AFTER UPDATE OF count_visit ON public.clients FOR EACH ROW EXECUTE FUNCTION public.update_client_status();
 =   DROP TRIGGER update_client_status_trigger ON public.clients;
       public          postgres    false    226    221    221         �           2620    33104 %   receipts visit_incrementation_trigger    TRIGGER     �   CREATE TRIGGER visit_incrementation_trigger AFTER INSERT ON public.receipts FOR EACH ROW EXECUTE FUNCTION public.visit_incrementation();
 >   DROP TRIGGER visit_incrementation_trigger ON public.receipts;
       public          postgres    false    225    223         �           2606    25559    duty duty_office_codifier_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.duty
    ADD CONSTRAINT duty_office_codifier_fkey FOREIGN KEY (office_codifier) REFERENCES public.offices(codifier);
 H   ALTER TABLE ONLY public.duty DROP CONSTRAINT duty_office_codifier_fkey;
       public          postgres    false    219    3241    214         �           2606    25554    duty duty_staff_id_fkey    FK CONSTRAINT     w   ALTER TABLE ONLY public.duty
    ADD CONSTRAINT duty_staff_id_fkey FOREIGN KEY (staff_id) REFERENCES public.staff(id);
 A   ALTER TABLE ONLY public.duty DROP CONSTRAINT duty_staff_id_fkey;
       public          postgres    false    219    3249    218         �           2606    25603 %   procedures procedures_receipt_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.procedures
    ADD CONSTRAINT procedures_receipt_id_fkey FOREIGN KEY (receipt_id) REFERENCES public.receipts(id);
 O   ALTER TABLE ONLY public.procedures DROP CONSTRAINT procedures_receipt_id_fkey;
       public          postgres    false    3260    224    223         �           2606    25593 +   procedures procedures_service_codifier_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.procedures
    ADD CONSTRAINT procedures_service_codifier_fkey FOREIGN KEY (service_codifier) REFERENCES public.services(codifier);
 U   ALTER TABLE ONLY public.procedures DROP CONSTRAINT procedures_service_codifier_fkey;
       public          postgres    false    224    3243    215         �           2606    25598 #   procedures procedures_staff_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.procedures
    ADD CONSTRAINT procedures_staff_id_fkey FOREIGN KEY (staff_id) REFERENCES public.staff(id);
 M   ALTER TABLE ONLY public.procedures DROP CONSTRAINT procedures_staff_id_fkey;
       public          postgres    false    224    3249    218         �           2606    25582     receipts receipts_client_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.receipts
    ADD CONSTRAINT receipts_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.clients(id);
 J   ALTER TABLE ONLY public.receipts DROP CONSTRAINT receipts_client_id_fkey;
       public          postgres    false    221    3256    223         �           2606    25513 &   services services_office_codifier_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_office_codifier_fkey FOREIGN KEY (office_codifier) REFERENCES public.offices(codifier);
 P   ALTER TABLE ONLY public.services DROP CONSTRAINT services_office_codifier_fkey;
       public          postgres    false    3241    215    214         �           2606    36232    staff staff_login_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.staff
    ADD CONSTRAINT staff_login_fkey FOREIGN KEY (login) REFERENCES public.logins(staff_login);
 @   ALTER TABLE ONLY public.staff DROP CONSTRAINT staff_login_fkey;
       public          postgres    false    3245    218    216         _           0    25565    clients    ROW SECURITY     5   ALTER TABLE public.clients ENABLE ROW LEVEL SECURITY;          public          postgres    false    221         c           3256    33128    clients delete_clients    POLICY     F   CREATE POLICY delete_clients ON public.clients FOR INSERT TO manager;
 .   DROP POLICY delete_clients ON public.clients;
       public          postgres    false    221         e           3256    33132    duty delete_duty    POLICY     F   CREATE POLICY delete_duty ON public.duty FOR DELETE TO administrator;
 (   DROP POLICY delete_duty ON public.duty;
       public          postgres    false    219         k           3256    33156    logins delete_logins    POLICY     J   CREATE POLICY delete_logins ON public.logins FOR DELETE TO administrator;
 ,   DROP POLICY delete_logins ON public.logins;
       public          postgres    false    216         g           3256    33148    procedures delete_procedures    POLICY     L   CREATE POLICY delete_procedures ON public.procedures FOR DELETE TO manager;
 4   DROP POLICY delete_procedures ON public.procedures;
       public          postgres    false    224         m           3256    33160    receipts delete_receipts    POLICY     H   CREATE POLICY delete_receipts ON public.receipts FOR DELETE TO manager;
 0   DROP POLICY delete_receipts ON public.receipts;
       public          postgres    false    223         o           3256    33165    staff delete_staff    POLICY     H   CREATE POLICY delete_staff ON public.staff FOR DELETE TO administrator;
 *   DROP POLICY delete_staff ON public.staff;
       public          postgres    false    218         ^           0    25549    duty    ROW SECURITY     2   ALTER TABLE public.duty ENABLE ROW LEVEL SECURITY;          public          postgres    false    219         b           3256    33126    clients insert_clients    POLICY     P   CREATE POLICY insert_clients ON public.clients FOR INSERT TO manager, employee;
 .   DROP POLICY insert_clients ON public.clients;
       public          postgres    false    221         d           3256    33130    duty insert_duty    POLICY     F   CREATE POLICY insert_duty ON public.duty FOR INSERT TO administrator;
 (   DROP POLICY insert_duty ON public.duty;
       public          postgres    false    219         i           3256    33154    logins insert_logins    POLICY     J   CREATE POLICY insert_logins ON public.logins FOR INSERT TO administrator;
 ,   DROP POLICY insert_logins ON public.logins;
       public          postgres    false    216         f           3256    33146    procedures insert_procedures    POLICY     V   CREATE POLICY insert_procedures ON public.procedures FOR INSERT TO manager, employee;
 4   DROP POLICY insert_procedures ON public.procedures;
       public          postgres    false    224         l           3256    33158    receipts insert_receipts    POLICY     R   CREATE POLICY insert_receipts ON public.receipts FOR INSERT TO manager, employee;
 0   DROP POLICY insert_receipts ON public.receipts;
       public          postgres    false    223         n           3256    33163    staff insert_staff    POLICY     H   CREATE POLICY insert_staff ON public.staff FOR INSERT TO administrator;
 *   DROP POLICY insert_staff ON public.staff;
       public          postgres    false    218         \           0    25518    logins    ROW SECURITY     4   ALTER TABLE public.logins ENABLE ROW LEVEL SECURITY;          public          postgres    false    216         Z           0    25503    offices    ROW SECURITY     5   ALTER TABLE public.offices ENABLE ROW LEVEL SECURITY;          public          postgres    false    214         a           0    25587 
   procedures    ROW SECURITY     8   ALTER TABLE public.procedures ENABLE ROW LEVEL SECURITY;          public          postgres    false    224         `           0    25574    receipts    ROW SECURITY     6   ALTER TABLE public.receipts ENABLE ROW LEVEL SECURITY;          public          postgres    false    223         q           3256    33182    clients select_clients    POLICY     p   CREATE POLICY select_clients ON public.clients FOR SELECT TO analyst, manager, employee, operator USING (true);
 .   DROP POLICY select_clients ON public.clients;
       public          postgres    false    221         s           3256    33184    duty select_duty    POLICY     f   CREATE POLICY select_duty ON public.duty FOR SELECT TO analyst, administrator, operator USING (true);
 (   DROP POLICY select_duty ON public.duty;
       public          postgres    false    219         h           3256    33153    logins select_logins    POLICY     W   CREATE POLICY select_logins ON public.logins FOR SELECT TO administrator USING (true);
 ,   DROP POLICY select_logins ON public.logins;
       public          postgres    false    216         u           3256    33186    offices select_offices    POLICY     ]   CREATE POLICY select_offices ON public.offices FOR SELECT TO analyst, operator USING (true);
 .   DROP POLICY select_offices ON public.offices;
       public          postgres    false    214         w           3256    33188    procedures select_procedures    POLICY     v   CREATE POLICY select_procedures ON public.procedures FOR SELECT TO analyst, manager, employee, operator USING (true);
 4   DROP POLICY select_procedures ON public.procedures;
       public          postgres    false    224         y           3256    33190    receipts select_receipts    POLICY     r   CREATE POLICY select_receipts ON public.receipts FOR SELECT TO analyst, manager, employee, operator USING (true);
 0   DROP POLICY select_receipts ON public.receipts;
       public          postgres    false    223         {           3256    33192    services select_services    POLICY     r   CREATE POLICY select_services ON public.services FOR SELECT TO analyst, manager, employee, operator USING (true);
 0   DROP POLICY select_services ON public.services;
       public          postgres    false    215         |           3256    33193    staff select_staff    POLICY     {   CREATE POLICY select_staff ON public.staff FOR SELECT TO analyst, administrator, manager, employee, operator USING (true);
 *   DROP POLICY select_staff ON public.staff;
       public          postgres    false    218         [           0    25508    services    ROW SECURITY     6   ALTER TABLE public.services ENABLE ROW LEVEL SECURITY;          public          postgres    false    215         ]           0    25536    staff    ROW SECURITY     3   ALTER TABLE public.staff ENABLE ROW LEVEL SECURITY;          public          postgres    false    218         r           3256    33183    clients update_clients    POLICY     Z   CREATE POLICY update_clients ON public.clients FOR UPDATE TO manager, employee, operator;
 .   DROP POLICY update_clients ON public.clients;
       public          postgres    false    221         t           3256    33185    duty update_duty    POLICY     P   CREATE POLICY update_duty ON public.duty FOR UPDATE TO administrator, operator;
 (   DROP POLICY update_duty ON public.duty;
       public          postgres    false    219         j           3256    33155    logins update_logins    POLICY     J   CREATE POLICY update_logins ON public.logins FOR UPDATE TO administrator;
 ,   DROP POLICY update_logins ON public.logins;
       public          postgres    false    216         v           3256    33187    offices update_offices    POLICY     G   CREATE POLICY update_offices ON public.offices FOR UPDATE TO operator;
 .   DROP POLICY update_offices ON public.offices;
       public          postgres    false    214         x           3256    33189    procedures update_procedures    POLICY     `   CREATE POLICY update_procedures ON public.procedures FOR UPDATE TO manager, employee, operator;
 4   DROP POLICY update_procedures ON public.procedures;
       public          postgres    false    224         z           3256    33191    receipts update_receipts    POLICY     \   CREATE POLICY update_receipts ON public.receipts FOR UPDATE TO manager, employee, operator;
 0   DROP POLICY update_receipts ON public.receipts;
       public          postgres    false    223         p           3256    33176    services update_services    POLICY     I   CREATE POLICY update_services ON public.services FOR UPDATE TO operator;
 0   DROP POLICY update_services ON public.services;
       public          postgres    false    215         }           3256    33194    staff update_staff    POLICY     e   CREATE POLICY update_staff ON public.staff FOR UPDATE TO administrator, manager, employee, operator;
 *   DROP POLICY update_staff ON public.staff;
       public          postgres    false    218                                                                                                                                        3461.dat                                                                                            0000600 0004000 0002000 00000000202 14446036550 0014250 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Digo	Ruff	+7xxxxxxxxxx	Premium	100	$15.00
2	set	test	+value	Ordinary	1	$5.00
3	student	mirea	+74992156565	Ordinary	1	$0.00
\.


                                                                                                                                                                                                                                                                                                                                                                                              3459.dat                                                                                            0000600 0004000 0002000 00000000005 14446036550 0014260 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3456.dat                                                                                            0000600 0004000 0002000 00000000107 14446036550 0014260 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        porti	\N	\N
testlogin	testpassword	3
'; drop table users-- 	\N	\N
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                         3454.dat                                                                                            0000600 0004000 0002000 00000000056 14446036550 0014261 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        22202	tatoo	street	110011	+7xxxxxxxxxx	1
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  3464.dat                                                                                            0000600 0004000 0002000 00000000021 14446036550 0014252 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        4	11101	1	1
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               3463.dat                                                                                            0000600 0004000 0002000 00000000207 14446036550 0014257 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	$100.00	2023-05-28 00:00:00+03	1	2023-05-29 16:20:07.737091+03
2	$100.00	2023-05-28 00:00:00+03	2	2023-05-29 16:20:07.737091+03
\.


                                                                                                                                                                                                                                                                                                                                                                                         3455.dat                                                                                            0000600 0004000 0002000 00000000055 14446036550 0014261 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        11101	dragon	$1.00	cartoon dragon	22202
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   3458.dat                                                                                            0000600 0004000 0002000 00000000211 14446036550 0014256 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	set	test	staff	value	+ test	1	1	4.5	\N	porti	$1.00	2
3	elza	alze	chan	eve@123	+74990001122	8	35	0	tattoo nood	testlogin	$100.00	0
\.


                                                                                                                                                                                                                                                                                                                                                                                       restore.sql                                                                                         0000600 0004000 0002000 00000115644 14446036550 0015406 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE practice;
--
-- Name: practice; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE practice WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';


ALTER DATABASE practice OWNER TO postgres;

\connect practice

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: assmnt_proc(double precision, integer, integer, character varying); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.assmnt_proc(IN assessment double precision, IN receipt_id integer, IN staff_id integer, IN service_codifier character varying)
    LANGUAGE plpgsql
    AS $$
begin
update procedures set procedures.assessment = assessment where procedures.receipt_id = receipt_id and procedures.staff_id = staff_id and procedures.service_codifier = service_codifier;
end; $$;


ALTER PROCEDURE public.assmnt_proc(IN assessment double precision, IN receipt_id integer, IN staff_id integer, IN service_codifier character varying) OWNER TO postgres;

--
-- Name: create_cheque(integer); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.create_cheque(IN client_id integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
INSERT INTO receipts(client_id) VALUES(client_id);
END;
$$;


ALTER PROCEDURE public.create_cheque(IN client_id integer) OWNER TO postgres;

--
-- Name: create_client(character varying, character varying, character varying); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.create_client(IN firstname character varying, IN surname character varying, IN phone_number character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
INSERT INTO clients(firstname,surname,phone_number) VALUES(firstname,surname,phone_number);
END;
$$;


ALTER PROCEDURE public.create_client(IN firstname character varying, IN surname character varying, IN phone_number character varying) OWNER TO postgres;

--
-- Name: create_duty(integer, character varying); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.create_duty(IN staff_id integer, IN office_codifier character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
INSERT INTO duty(staff_id,office_codifier) VALUES(staff_id,office_codifier);
END;
$$;


ALTER PROCEDURE public.create_duty(IN staff_id integer, IN office_codifier character varying) OWNER TO postgres;

--
-- Name: create_employee(character varying, character varying, character varying, character varying, character varying, character varying, character varying, money, smallint, smallint, character varying, smallint); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.create_employee(IN log character varying, IN password character varying, IN firstname character varying, IN surname character varying, IN patronymic character varying, IN email character varying, IN phone_number character varying, IN salary money, IN experience smallint, IN age smallint, IN description character varying, IN level smallint)
    LANGUAGE plpgsql
    AS $$
BEGIN
INSERT INTO logins(staff_login,password,level_sec) VALUES(log,password,level);
INSERT INTO 
staff(login,firstname,surname,patronymic,email,phone_number,salary,experience,age,description) 
VALUES(log,firstname,surname,patronymic,email,phone_number,salary,experience,age,description);
END;
$$;


ALTER PROCEDURE public.create_employee(IN log character varying, IN password character varying, IN firstname character varying, IN surname character varying, IN patronymic character varying, IN email character varying, IN phone_number character varying, IN salary money, IN experience smallint, IN age smallint, IN description character varying, IN level smallint) OWNER TO postgres;

--
-- Name: create_office(character varying, character varying, character varying, character varying, character varying); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.create_office(IN codifier character varying, IN description character varying, IN address character varying, IN post_index character varying, IN phone_number character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
INSERT INTO offices(codifier, description, address, post_index, phone_number) 
VALUES(codifier, description, address, post_index, phone_number);
END;
$$;


ALTER PROCEDURE public.create_office(IN codifier character varying, IN description character varying, IN address character varying, IN post_index character varying, IN phone_number character varying) OWNER TO postgres;

--
-- Name: create_proc(integer, integer, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.create_proc(staff_id integer, receipt_id integer, service_codifier character varying) RETURNS TABLE(cost money)
    LANGUAGE plpgsql
    AS $$
BEGIN
INSERT INTO procedures(staff_id,receipt_id,service_codifier) VALUES(staff_id,receipt_id,service_codifier);
SELECT cost FROM services WHERE services.codifier=service_codifier;
END;
$$;


ALTER FUNCTION public.create_proc(staff_id integer, receipt_id integer, service_codifier character varying) OWNER TO postgres;

--
-- Name: create_proce(integer, integer, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.create_proce(staff_id integer, receipt_id integer, service_codifier character varying) RETURNS TABLE(codifier character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
INSERT INTO procedures(staff_id,receipt_id,service_codifier) VALUES(staff_id,receipt_id,service_codifier);
SELECT codifier FROM services WHERE services.codifier=service_codifier;
END;
$$;


ALTER FUNCTION public.create_proce(staff_id integer, receipt_id integer, service_codifier character varying) OWNER TO postgres;

--
-- Name: create_proced(integer, integer, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.create_proced(staff_id integer, receipt_id integer, service_codifier character varying) RETURNS TABLE(cost money)
    LANGUAGE plpgsql
    AS $$
BEGIN
INSERT INTO procedures(staff_id,receipt_id,service_codifier) VALUES(staff_id,receipt_id,service_codifier);
SELECT services.cost FROM services WHERE services.codifier=service_codifier;
END;
$$;


ALTER FUNCTION public.create_proced(staff_id integer, receipt_id integer, service_codifier character varying) OWNER TO postgres;

--
-- Name: create_procedure(character varying, integer, integer); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.create_procedure(IN service_codifier character varying, IN staff_id integer, IN receipt_id integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
INSERT INTO procedures(service_codifier,staff_id,receipt_id) VALUES(service_codifier,staff_id,receipt_id);
UPDATE receipts SET final_cost = final_cost + services.cost FROM services WHERE services.codifier = 
service_codifier AND receipts.id = receipt_id;
END;
$$;


ALTER PROCEDURE public.create_procedure(IN service_codifier character varying, IN staff_id integer, IN receipt_id integer) OWNER TO postgres;

--
-- Name: create_service(character varying, character varying, money, character varying, character varying); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.create_service(IN codifier character varying, IN title character varying, IN cost money, IN description character varying, IN office_codifier character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
INSERT INTO services(codifier,title,description,cost,office_codifier) 
VALUES(codifier,title,cost,description,office_codifier);
END;
$$;


ALTER PROCEDURE public.create_service(IN codifier character varying, IN title character varying, IN cost money, IN description character varying, IN office_codifier character varying) OWNER TO postgres;

--
-- Name: dup(character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.dup(character varying) RETURNS TABLE(description character varying)
    LANGUAGE plpgsql
    AS $_$ BEGIN SELECT $1; END; $_$;


ALTER FUNCTION public.dup(character varying) OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: procedures; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.procedures (
    assessment double precision DEFAULT 0.0 NOT NULL,
    service_codifier character varying(5) NOT NULL,
    staff_id integer NOT NULL,
    receipt_id integer NOT NULL
);


ALTER TABLE public.procedures OWNER TO postgres;

--
-- Name: find_procedures(character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.find_procedures(input character varying) RETURNS SETOF public.procedures
    LANGUAGE plpgsql
    AS $$
BEGIN
  RETURN QUERY SELECT * FROM procedures where service_codifier = input;
END
$$;


ALTER FUNCTION public.find_procedures(input character varying) OWNER TO postgres;

--
-- Name: find_procedures(character varying, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.find_procedures(input character varying, input2 integer) RETURNS SETOF public.procedures
    LANGUAGE plpgsql
    AS $$
BEGIN
  RETURN QUERY SELECT * FROM procedures where service_codifier = input AND staff_id = input2;
END
$$;


ALTER FUNCTION public.find_procedures(input character varying, input2 integer) OWNER TO postgres;

--
-- Name: find_procedures(character varying, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.find_procedures(input character varying, input2 integer, input3 integer) RETURNS SETOF public.procedures
    LANGUAGE plpgsql
    AS $$
BEGIN
  RETURN QUERY SELECT * FROM procedures where service_codifier = input AND staff_id = input2 AND 
receipt_id = input3;
END
$$;


ALTER FUNCTION public.find_procedures(input character varying, input2 integer, input3 integer) OWNER TO postgres;

--
-- Name: receipts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.receipts (
    id integer NOT NULL,
    final_cost money DEFAULT 0.0 NOT NULL,
    date_open timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    client_id integer NOT NULL,
    date_close timestamp with time zone
);


ALTER TABLE public.receipts OWNER TO postgres;

--
-- Name: find_receipts_by_client(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.find_receipts_by_client(client integer) RETURNS SETOF public.receipts
    LANGUAGE plpgsql
    AS $$
BEGIN
  RETURN QUERY SELECT * FROM receipts where client_id = client;
END
$$;


ALTER FUNCTION public.find_receipts_by_client(client integer) OWNER TO postgres;

--
-- Name: find_receipts_by_price(money, money); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.find_receipts_by_price(min_cost money, max_cost money) RETURNS SETOF public.receipts
    LANGUAGE plpgsql
    AS $$
BEGIN
  RETURN QUERY SELECT * FROM receipts where final_cost BETWEEN min_cost AND max_cost;
END
$$;


ALTER FUNCTION public.find_receipts_by_price(min_cost money, max_cost money) OWNER TO postgres;

--
-- Name: inc_bonus(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.inc_bonus() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
	begin
	update clients set bonus = bonus + new.final_cost * 0.05 where clients.id = new.client_id and status = 'Ordinary';
	update clients set bonus = bonus + new.final_cost * 0.10 where clients.id = new.client_id and status = 'Regular';
	update clients set bonus = bonus + new.final_cost * 0.15 where clients.id = new.client_id and status = 'Premium';
	return null;
	end;
$$;


ALTER FUNCTION public.inc_bonus() OWNER TO postgres;

--
-- Name: inc_count_staff(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.inc_count_staff() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
	begin
	update officies set staff_count = staff_count + 1
	where codifier = new.office_codifier;
	return null;
	end;
$$;


ALTER FUNCTION public.inc_count_staff() OWNER TO postgres;

--
-- Name: inc_staff_assmnt(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.inc_staff_assmnt() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
	begin
	update staff
	set count_assessment = count_assessment + 1 where staff.id = new.staff_id;
	update staff
	set rating = (rating * (count_assessment - 1) + new.assessment) / count_assessment where staff.id = new.staff_id;
	return null;
	end;
$$;


ALTER FUNCTION public.inc_staff_assmnt() OWNER TO postgres;

--
-- Name: receipt_close(integer); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.receipt_close(IN idr integer)
    LANGUAGE plpgsql
    AS $$
begin
update receipts set date_close = current_timestamp where id=idr;
end; 
$$;


ALTER PROCEDURE public.receipt_close(IN idr integer) OWNER TO postgres;

--
-- Name: test(character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.test(cod character varying) RETURNS TABLE(description character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
SELECT description FROM services WHERE services.codifier=cod;
END;
$$;


ALTER FUNCTION public.test(cod character varying) OWNER TO postgres;

--
-- Name: tests(character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.tests(cod character varying) RETURNS TABLE(description character varying)
    LANGUAGE plpgsql
    AS $_$
BEGIN
SELECT $1;
END;
$_$;


ALTER FUNCTION public.tests(cod character varying) OWNER TO postgres;

--
-- Name: update_client_status(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.update_client_status() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
UPDATE clients
   SET status = 'Regular'  WHERE clients.count_visit > 15;
UPDATE clients
SET status = 'Premium'  WHERE clients.count_visit > 50;
RETURN NEW;
END;
$$;


ALTER FUNCTION public.update_client_status() OWNER TO postgres;

--
-- Name: visit_incrementation(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.visit_incrementation() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
UPDATE clients 
   SET count_visit = count_visit + 1
WHERE clients.id = NEW.client_id; 
RETURN NEW;
END;
$$;


ALTER FUNCTION public.visit_incrementation() OWNER TO postgres;

--
-- Name: clients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clients (
    id integer NOT NULL,
    firstname character varying(20) NOT NULL,
    surname character varying(20) NOT NULL,
    phone_number character varying(12) NOT NULL,
    status character varying(10) DEFAULT 'Ordinary'::character varying NOT NULL,
    count_visit smallint DEFAULT 1 NOT NULL,
    bonus money DEFAULT 0.0 NOT NULL
);


ALTER TABLE public.clients OWNER TO postgres;

--
-- Name: clients_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clients_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clients_id_seq OWNER TO postgres;

--
-- Name: clients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clients_id_seq OWNED BY public.clients.id;


--
-- Name: duty; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.duty (
    staff_id integer NOT NULL,
    office_codifier character varying(5) NOT NULL
);


ALTER TABLE public.duty OWNER TO postgres;

--
-- Name: logins; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logins (
    staff_login character varying(255) NOT NULL,
    password character varying,
    level_sec smallint
);


ALTER TABLE public.logins OWNER TO postgres;

--
-- Name: offices; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.offices (
    codifier character varying(5) NOT NULL,
    description character varying(40),
    address character varying(40) NOT NULL,
    post_index character varying(6) NOT NULL,
    phone_number character varying(12) NOT NULL,
    staff_count smallint DEFAULT 0 NOT NULL
);


ALTER TABLE public.offices OWNER TO postgres;

--
-- Name: receipts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.receipts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.receipts_id_seq OWNER TO postgres;

--
-- Name: receipts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.receipts_id_seq OWNED BY public.receipts.id;


--
-- Name: services; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.services (
    codifier character varying(5) NOT NULL,
    title character varying(20) NOT NULL,
    cost money NOT NULL,
    description character varying(40) NOT NULL,
    office_codifier character varying(5) NOT NULL
);


ALTER TABLE public.services OWNER TO postgres;

--
-- Name: staff; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.staff (
    id integer NOT NULL,
    firstname character varying(20) NOT NULL,
    surname character varying(20) NOT NULL,
    patronymic character varying(20) NOT NULL,
    email character varying(30) NOT NULL,
    phone_number character varying(12) NOT NULL,
    experience smallint NOT NULL,
    age smallint NOT NULL,
    rating double precision DEFAULT 0.0 NOT NULL,
    description character varying(40),
    login character varying(20) NOT NULL,
    salary money NOT NULL,
    count_assessment integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.staff OWNER TO postgres;

--
-- Name: staff_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.staff_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.staff_id_seq OWNER TO postgres;

--
-- Name: staff_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.staff_id_seq OWNED BY public.staff.id;


--
-- Name: clients id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients ALTER COLUMN id SET DEFAULT nextval('public.clients_id_seq'::regclass);


--
-- Name: receipts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receipts ALTER COLUMN id SET DEFAULT nextval('public.receipts_id_seq'::regclass);


--
-- Name: staff id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff ALTER COLUMN id SET DEFAULT nextval('public.staff_id_seq'::regclass);


--
-- Data for Name: clients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clients (id, firstname, surname, phone_number, status, count_visit, bonus) FROM stdin;
\.
COPY public.clients (id, firstname, surname, phone_number, status, count_visit, bonus) FROM '$$PATH$$/3461.dat';

--
-- Data for Name: duty; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.duty (staff_id, office_codifier) FROM stdin;
\.
COPY public.duty (staff_id, office_codifier) FROM '$$PATH$$/3459.dat';

--
-- Data for Name: logins; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.logins (staff_login, password, level_sec) FROM stdin;
\.
COPY public.logins (staff_login, password, level_sec) FROM '$$PATH$$/3456.dat';

--
-- Data for Name: offices; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.offices (codifier, description, address, post_index, phone_number, staff_count) FROM stdin;
\.
COPY public.offices (codifier, description, address, post_index, phone_number, staff_count) FROM '$$PATH$$/3454.dat';

--
-- Data for Name: procedures; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.procedures (assessment, service_codifier, staff_id, receipt_id) FROM stdin;
\.
COPY public.procedures (assessment, service_codifier, staff_id, receipt_id) FROM '$$PATH$$/3464.dat';

--
-- Data for Name: receipts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.receipts (id, final_cost, date_open, client_id, date_close) FROM stdin;
\.
COPY public.receipts (id, final_cost, date_open, client_id, date_close) FROM '$$PATH$$/3463.dat';

--
-- Data for Name: services; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.services (codifier, title, cost, description, office_codifier) FROM stdin;
\.
COPY public.services (codifier, title, cost, description, office_codifier) FROM '$$PATH$$/3455.dat';

--
-- Data for Name: staff; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.staff (id, firstname, surname, patronymic, email, phone_number, experience, age, rating, description, login, salary, count_assessment) FROM stdin;
\.
COPY public.staff (id, firstname, surname, patronymic, email, phone_number, experience, age, rating, description, login, salary, count_assessment) FROM '$$PATH$$/3458.dat';

--
-- Name: clients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clients_id_seq', 3, true);


--
-- Name: receipts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.receipts_id_seq', 4, true);


--
-- Name: staff_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.staff_id_seq', 3, true);


--
-- Name: clients clients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (id);


--
-- Name: duty duty_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.duty
    ADD CONSTRAINT duty_pkey PRIMARY KEY (staff_id, office_codifier);


--
-- Name: logins logins_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logins
    ADD CONSTRAINT logins_pkey PRIMARY KEY (staff_login);


--
-- Name: offices offices_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.offices
    ADD CONSTRAINT offices_pkey PRIMARY KEY (codifier);


--
-- Name: procedures procedures_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.procedures
    ADD CONSTRAINT procedures_pkey PRIMARY KEY (service_codifier, staff_id, receipt_id);


--
-- Name: receipts receipts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receipts
    ADD CONSTRAINT receipts_pkey PRIMARY KEY (id);


--
-- Name: services services_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_pkey PRIMARY KEY (codifier);


--
-- Name: staff staff_login_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff
    ADD CONSTRAINT staff_login_key UNIQUE (login);


--
-- Name: staff staff_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff
    ADD CONSTRAINT staff_pkey PRIMARY KEY (id);


--
-- Name: chq_indx_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX chq_indx_id ON public.receipts USING btree (id);


--
-- Name: chq_indx_time; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX chq_indx_time ON public.receipts USING btree (date_close);


--
-- Name: cli_indx_frnm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cli_indx_frnm ON public.clients USING hash (firstname);


--
-- Name: cli_indx_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cli_indx_id ON public.clients USING btree (id);


--
-- Name: cli_indx_stts; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cli_indx_stts ON public.clients USING hash (status);


--
-- Name: receipts trg_bonus; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_bonus AFTER UPDATE OF date_close ON public.receipts FOR EACH ROW EXECUTE FUNCTION public.inc_bonus();


--
-- Name: duty trg_count_staff; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_count_staff AFTER INSERT ON public.duty FOR EACH ROW EXECUTE FUNCTION public.inc_count_staff();


--
-- Name: procedures trg_staff_assmnt; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_staff_assmnt AFTER UPDATE OF assessment ON public.procedures FOR EACH ROW EXECUTE FUNCTION public.inc_staff_assmnt();


--
-- Name: clients update_client_status_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_client_status_trigger AFTER UPDATE OF count_visit ON public.clients FOR EACH ROW EXECUTE FUNCTION public.update_client_status();


--
-- Name: receipts visit_incrementation_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER visit_incrementation_trigger AFTER INSERT ON public.receipts FOR EACH ROW EXECUTE FUNCTION public.visit_incrementation();


--
-- Name: duty duty_office_codifier_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.duty
    ADD CONSTRAINT duty_office_codifier_fkey FOREIGN KEY (office_codifier) REFERENCES public.offices(codifier);


--
-- Name: duty duty_staff_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.duty
    ADD CONSTRAINT duty_staff_id_fkey FOREIGN KEY (staff_id) REFERENCES public.staff(id);


--
-- Name: procedures procedures_receipt_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.procedures
    ADD CONSTRAINT procedures_receipt_id_fkey FOREIGN KEY (receipt_id) REFERENCES public.receipts(id);


--
-- Name: procedures procedures_service_codifier_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.procedures
    ADD CONSTRAINT procedures_service_codifier_fkey FOREIGN KEY (service_codifier) REFERENCES public.services(codifier);


--
-- Name: procedures procedures_staff_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.procedures
    ADD CONSTRAINT procedures_staff_id_fkey FOREIGN KEY (staff_id) REFERENCES public.staff(id);


--
-- Name: receipts receipts_client_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receipts
    ADD CONSTRAINT receipts_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.clients(id);


--
-- Name: services services_office_codifier_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_office_codifier_fkey FOREIGN KEY (office_codifier) REFERENCES public.offices(codifier);


--
-- Name: staff staff_login_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff
    ADD CONSTRAINT staff_login_fkey FOREIGN KEY (login) REFERENCES public.logins(staff_login);


--
-- Name: clients; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.clients ENABLE ROW LEVEL SECURITY;

--
-- Name: clients delete_clients; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY delete_clients ON public.clients FOR INSERT TO manager;


--
-- Name: duty delete_duty; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY delete_duty ON public.duty FOR DELETE TO administrator;


--
-- Name: logins delete_logins; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY delete_logins ON public.logins FOR DELETE TO administrator;


--
-- Name: procedures delete_procedures; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY delete_procedures ON public.procedures FOR DELETE TO manager;


--
-- Name: receipts delete_receipts; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY delete_receipts ON public.receipts FOR DELETE TO manager;


--
-- Name: staff delete_staff; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY delete_staff ON public.staff FOR DELETE TO administrator;


--
-- Name: duty; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.duty ENABLE ROW LEVEL SECURITY;

--
-- Name: clients insert_clients; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY insert_clients ON public.clients FOR INSERT TO manager, employee;


--
-- Name: duty insert_duty; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY insert_duty ON public.duty FOR INSERT TO administrator;


--
-- Name: logins insert_logins; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY insert_logins ON public.logins FOR INSERT TO administrator;


--
-- Name: procedures insert_procedures; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY insert_procedures ON public.procedures FOR INSERT TO manager, employee;


--
-- Name: receipts insert_receipts; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY insert_receipts ON public.receipts FOR INSERT TO manager, employee;


--
-- Name: staff insert_staff; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY insert_staff ON public.staff FOR INSERT TO administrator;


--
-- Name: logins; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.logins ENABLE ROW LEVEL SECURITY;

--
-- Name: offices; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.offices ENABLE ROW LEVEL SECURITY;

--
-- Name: procedures; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.procedures ENABLE ROW LEVEL SECURITY;

--
-- Name: receipts; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.receipts ENABLE ROW LEVEL SECURITY;

--
-- Name: clients select_clients; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY select_clients ON public.clients FOR SELECT TO analyst, manager, employee, operator USING (true);


--
-- Name: duty select_duty; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY select_duty ON public.duty FOR SELECT TO analyst, administrator, operator USING (true);


--
-- Name: logins select_logins; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY select_logins ON public.logins FOR SELECT TO administrator USING (true);


--
-- Name: offices select_offices; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY select_offices ON public.offices FOR SELECT TO analyst, operator USING (true);


--
-- Name: procedures select_procedures; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY select_procedures ON public.procedures FOR SELECT TO analyst, manager, employee, operator USING (true);


--
-- Name: receipts select_receipts; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY select_receipts ON public.receipts FOR SELECT TO analyst, manager, employee, operator USING (true);


--
-- Name: services select_services; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY select_services ON public.services FOR SELECT TO analyst, manager, employee, operator USING (true);


--
-- Name: staff select_staff; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY select_staff ON public.staff FOR SELECT TO analyst, administrator, manager, employee, operator USING (true);


--
-- Name: services; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.services ENABLE ROW LEVEL SECURITY;

--
-- Name: staff; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.staff ENABLE ROW LEVEL SECURITY;

--
-- Name: clients update_clients; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY update_clients ON public.clients FOR UPDATE TO manager, employee, operator;


--
-- Name: duty update_duty; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY update_duty ON public.duty FOR UPDATE TO administrator, operator;


--
-- Name: logins update_logins; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY update_logins ON public.logins FOR UPDATE TO administrator;


--
-- Name: offices update_offices; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY update_offices ON public.offices FOR UPDATE TO operator;


--
-- Name: procedures update_procedures; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY update_procedures ON public.procedures FOR UPDATE TO manager, employee, operator;


--
-- Name: receipts update_receipts; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY update_receipts ON public.receipts FOR UPDATE TO manager, employee, operator;


--
-- Name: services update_services; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY update_services ON public.services FOR UPDATE TO operator;


--
-- Name: staff update_staff; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY update_staff ON public.staff FOR UPDATE TO administrator, manager, employee, operator;


--
-- Name: PROCEDURE assmnt_proc(IN assessment double precision, IN receipt_id integer, IN staff_id integer, IN service_codifier character varying); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON PROCEDURE public.assmnt_proc(IN assessment double precision, IN receipt_id integer, IN staff_id integer, IN service_codifier character varying) TO manager;


--
-- Name: PROCEDURE create_cheque(IN client_id integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON PROCEDURE public.create_cheque(IN client_id integer) TO manager;


--
-- Name: PROCEDURE create_client(IN firstname character varying, IN surname character varying, IN phone_number character varying); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON PROCEDURE public.create_client(IN firstname character varying, IN surname character varying, IN phone_number character varying) TO manager;


--
-- Name: PROCEDURE create_duty(IN staff_id integer, IN office_codifier character varying); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON PROCEDURE public.create_duty(IN staff_id integer, IN office_codifier character varying) TO administrator;


--
-- Name: PROCEDURE create_employee(IN log character varying, IN password character varying, IN firstname character varying, IN surname character varying, IN patronymic character varying, IN email character varying, IN phone_number character varying, IN salary money, IN experience smallint, IN age smallint, IN description character varying, IN level smallint); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON PROCEDURE public.create_employee(IN log character varying, IN password character varying, IN firstname character varying, IN surname character varying, IN patronymic character varying, IN email character varying, IN phone_number character varying, IN salary money, IN experience smallint, IN age smallint, IN description character varying, IN level smallint) TO administrator;


--
-- Name: PROCEDURE create_procedure(IN service_codifier character varying, IN staff_id integer, IN receipt_id integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON PROCEDURE public.create_procedure(IN service_codifier character varying, IN staff_id integer, IN receipt_id integer) TO manager;


--
-- Name: TABLE procedures; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.procedures TO analyst;
GRANT SELECT,INSERT,DELETE ON TABLE public.procedures TO manager;
GRANT SELECT,INSERT,UPDATE ON TABLE public.procedures TO employee;
GRANT SELECT,UPDATE ON TABLE public.procedures TO operator;


--
-- Name: FUNCTION find_procedures(input character varying); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.find_procedures(input character varying) TO manager;


--
-- Name: FUNCTION find_procedures(input character varying, input2 integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.find_procedures(input character varying, input2 integer) TO manager;


--
-- Name: FUNCTION find_procedures(input character varying, input2 integer, input3 integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.find_procedures(input character varying, input2 integer, input3 integer) TO manager;


--
-- Name: TABLE receipts; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.receipts TO analyst;
GRANT SELECT,INSERT,DELETE ON TABLE public.receipts TO manager;
GRANT SELECT,INSERT,UPDATE ON TABLE public.receipts TO employee;
GRANT SELECT,UPDATE ON TABLE public.receipts TO operator;


--
-- Name: FUNCTION find_receipts_by_client(client integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.find_receipts_by_client(client integer) TO analyst;
GRANT ALL ON FUNCTION public.find_receipts_by_client(client integer) TO manager;


--
-- Name: FUNCTION find_receipts_by_price(min_cost money, max_cost money); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.find_receipts_by_price(min_cost money, max_cost money) TO analyst;
GRANT ALL ON FUNCTION public.find_receipts_by_price(min_cost money, max_cost money) TO manager;


--
-- Name: PROCEDURE receipt_close(IN idr integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON PROCEDURE public.receipt_close(IN idr integer) TO manager;


--
-- Name: TABLE clients; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.clients TO analyst;
GRANT SELECT,INSERT,DELETE ON TABLE public.clients TO manager;
GRANT SELECT,INSERT,UPDATE ON TABLE public.clients TO employee;
GRANT SELECT,UPDATE ON TABLE public.clients TO operator;
GRANT SELECT ON TABLE public.clients TO test1;


--
-- Name: TABLE duty; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.duty TO analyst;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.duty TO administrator;
GRANT SELECT,UPDATE ON TABLE public.duty TO operator;


--
-- Name: TABLE logins; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE public.logins TO administrator;
GRANT SELECT ON TABLE public.logins TO analyst;
GRANT SELECT,UPDATE ON TABLE public.logins TO operator;


--
-- Name: TABLE offices; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.offices TO analyst;
GRANT SELECT,UPDATE ON TABLE public.offices TO operator;


--
-- Name: TABLE services; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.services TO analyst;
GRANT SELECT ON TABLE public.services TO manager;
GRANT SELECT ON TABLE public.services TO employee;
GRANT SELECT,UPDATE ON TABLE public.services TO operator;


--
-- Name: TABLE staff; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE public.staff TO administrator;
GRANT SELECT ON TABLE public.staff TO analyst;
GRANT SELECT,UPDATE ON TABLE public.staff TO operator;


--
-- Name: COLUMN staff.rating; Type: ACL; Schema: public; Owner: postgres
--

GRANT UPDATE(rating) ON TABLE public.staff TO employee;
GRANT UPDATE(rating) ON TABLE public.staff TO manager;


--
-- Name: COLUMN staff.count_assessment; Type: ACL; Schema: public; Owner: postgres
--

GRANT UPDATE(count_assessment) ON TABLE public.staff TO employee;
GRANT UPDATE(count_assessment) ON TABLE public.staff TO manager;


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            