--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2
-- Dumped by pg_dump version 17.2

-- Started on 2025-12-27 00:31:24

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 5007 (class 1262 OID 25983)
-- Name: EducationalPractice; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "EducationalPractice" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';


ALTER DATABASE "EducationalPractice" OWNER TO postgres;

\connect "EducationalPractice"

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 5008 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- TOC entry 260 (class 1255 OID 26452)
-- Name: GetCountryByCapital(character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."GetCountryByCapital"(capital_name character varying) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
declare 
	country character varying(50);
begin 
	select c."Name" into country from "Country" c
	where c."Capital" = capital_name;
	return country;
end;
$$;


ALTER FUNCTION public."GetCountryByCapital"(capital_name character varying) OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 220 (class 1259 OID 26046)
-- Name: Academic; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Academic" (
    "Id" integer NOT NULL,
    "FIO" character varying(100),
    "DateOfBirthday" date,
    "Specialization" character varying(50),
    "YearAssignmentRank" smallint
);


ALTER TABLE public."Academic" OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 26045)
-- Name: Academic_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Academic_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Academic_Id_seq" OWNER TO postgres;

--
-- TOC entry 5009 (class 0 OID 0)
-- Dependencies: 219
-- Name: Academic_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Academic_Id_seq" OWNED BY public."Academic"."Id";


--
-- TOC entry 252 (class 1259 OID 26345)
-- Name: Animals_Galeev; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Animals_Galeev" (
    "Id" integer NOT NULL,
    "Squad" character varying(100) DEFAULT 'Хищные'::character varying,
    CONSTRAINT "Animals_Galeev_Id_check" CHECK (("Id" < 500))
);


ALTER TABLE public."Animals_Galeev" OWNER TO postgres;

--
-- TOC entry 251 (class 1259 OID 26344)
-- Name: Animals_Galeev_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Animals_Galeev_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Animals_Galeev_Id_seq" OWNER TO postgres;

--
-- TOC entry 5010 (class 0 OID 0)
-- Dependencies: 251
-- Name: Animals_Galeev_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Animals_Galeev_Id_seq" OWNED BY public."Animals_Galeev"."Id";


--
-- TOC entry 242 (class 1259 OID 26271)
-- Name: Application; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Application" (
    "Id" integer NOT NULL,
    "Number" character varying(50),
    "Code" smallint
);


ALTER TABLE public."Application" OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 26270)
-- Name: Application_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Application_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Application_Id_seq" OWNER TO postgres;

--
-- TOC entry 5011 (class 0 OID 0)
-- Dependencies: 241
-- Name: Application_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Application_Id_seq" OWNED BY public."Application"."Id";


--
-- TOC entry 246 (class 1259 OID 26300)
-- Name: Control_Galeev; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Control_Galeev" (
    "Id" integer NOT NULL,
    "View" character varying(100) DEFAULT 'Татарская республика'::character varying
);


ALTER TABLE public."Control_Galeev" OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 26299)
-- Name: Control_Galeev_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Control_Galeev_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Control_Galeev_Id_seq" OWNER TO postgres;

--
-- TOC entry 5012 (class 0 OID 0)
-- Dependencies: 245
-- Name: Control_Galeev_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Control_Galeev_Id_seq" OWNED BY public."Control_Galeev"."Id";


--
-- TOC entry 222 (class 1259 OID 26053)
-- Name: Country; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Country" (
    "Id" integer NOT NULL,
    "Name" character varying(50),
    "Capital" character varying(50),
    "Square" numeric(10,2),
    "Population" integer,
    "Continent" character varying(50)
);


ALTER TABLE public."Country" OWNER TO postgres;

--
-- TOC entry 248 (class 1259 OID 26327)
-- Name: Country_Galeev; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Country_Galeev" (
    "Id" integer NOT NULL,
    "View" character varying(100) DEFAULT 'Татарская республика'::character varying NOT NULL,
    CONSTRAINT "Country_Galeev_Id_check" CHECK (("Id" < 500))
);


ALTER TABLE public."Country_Galeev" OWNER TO postgres;

--
-- TOC entry 247 (class 1259 OID 26326)
-- Name: Country_Galeev_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Country_Galeev_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Country_Galeev_Id_seq" OWNER TO postgres;

--
-- TOC entry 5013 (class 0 OID 0)
-- Dependencies: 247
-- Name: Country_Galeev_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Country_Galeev_Id_seq" OWNED BY public."Country_Galeev"."Id";


--
-- TOC entry 221 (class 1259 OID 26052)
-- Name: Country_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Country_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Country_Id_seq" OWNER TO postgres;

--
-- TOC entry 5014 (class 0 OID 0)
-- Dependencies: 221
-- Name: Country_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Country_Id_seq" OWNED BY public."Country"."Id";


--
-- TOC entry 226 (class 1259 OID 26075)
-- Name: Department; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Department" (
    "Id" integer NOT NULL,
    "Code" character varying(2),
    "Name" character varying(100),
    "Faculty" character varying(2)
);


ALTER TABLE public."Department" OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 26074)
-- Name: Department_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Department_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Department_Id_seq" OWNER TO postgres;

--
-- TOC entry 5015 (class 0 OID 0)
-- Dependencies: 225
-- Name: Department_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Department_Id_seq" OWNED BY public."Department"."Id";


--
-- TOC entry 240 (class 1259 OID 26242)
-- Name: Discipline; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Discipline" (
    "Id" integer NOT NULL,
    "Volume" smallint,
    "Name" character varying(100),
    "Executor" character varying(2)
);


ALTER TABLE public."Discipline" OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 26241)
-- Name: Discipline_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Discipline_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Discipline_Id_seq" OWNER TO postgres;

--
-- TOC entry 5016 (class 0 OID 0)
-- Dependencies: 239
-- Name: Discipline_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Discipline_Id_seq" OWNED BY public."Discipline"."Id";


--
-- TOC entry 238 (class 1259 OID 26213)
-- Name: Employee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Employee" (
    "Id" integer NOT NULL,
    "Code" character varying,
    "FullName" character varying,
    "Post" character varying,
    "Salary" numeric,
    "Director" smallint,
    "RoleId" integer,
    "Login" character varying,
    "Password" character varying
);


ALTER TABLE public."Employee" OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 26212)
-- Name: Employee_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Employee_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Employee_Id_seq" OWNER TO postgres;

--
-- TOC entry 5017 (class 0 OID 0)
-- Dependencies: 237
-- Name: Employee_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Employee_Id_seq" OWNED BY public."Employee"."Id";


--
-- TOC entry 232 (class 1259 OID 26119)
-- Name: Engineer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Engineer" (
    "Id" integer NOT NULL,
    "TabNumber" smallint,
    "Specialization" character varying(50)
);


ALTER TABLE public."Engineer" OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 26118)
-- Name: Engineer_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Engineer_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Engineer_Id_seq" OWNER TO postgres;

--
-- TOC entry 5018 (class 0 OID 0)
-- Dependencies: 231
-- Name: Engineer_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Engineer_Id_seq" OWNED BY public."Engineer"."Id";


--
-- TOC entry 244 (class 1259 OID 26278)
-- Name: Exam; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Exam" (
    "Id" integer NOT NULL,
    "Date" date,
    "DisciplineId" integer,
    "StudentId" integer,
    "EmployeeId" integer,
    "Auditorium" character varying(20),
    "Estimation" character varying(1)
);


ALTER TABLE public."Exam" OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 26277)
-- Name: Exam_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Exam_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Exam_Id_seq" OWNER TO postgres;

--
-- TOC entry 5019 (class 0 OID 0)
-- Dependencies: 243
-- Name: Exam_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Exam_Id_seq" OWNED BY public."Exam"."Id";


--
-- TOC entry 224 (class 1259 OID 26068)
-- Name: Faculty; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Faculty" (
    "Id" integer NOT NULL,
    "Abbreviation" character varying(2),
    "Name" character varying(100)
);


ALTER TABLE public."Faculty" OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 26067)
-- Name: Faculty_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Faculty_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Faculty_Id_seq" OWNER TO postgres;

--
-- TOC entry 5020 (class 0 OID 0)
-- Dependencies: 223
-- Name: Faculty_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Faculty_Id_seq" OWNED BY public."Faculty"."Id";


--
-- TOC entry 250 (class 1259 OID 26336)
-- Name: Flowers_Galeev; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Flowers_Galeev" (
    "Id" integer NOT NULL,
    "Class" character varying(100) DEFAULT 'Двудольные'::character varying,
    CONSTRAINT "Flowers_Galeev_Id_check" CHECK (("Id" < 500))
);


ALTER TABLE public."Flowers_Galeev" OWNER TO postgres;

--
-- TOC entry 249 (class 1259 OID 26335)
-- Name: Flowers_Galeev_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Flowers_Galeev_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Flowers_Galeev_Id_seq" OWNER TO postgres;

--
-- TOC entry 5021 (class 0 OID 0)
-- Dependencies: 249
-- Name: Flowers_Galeev_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Flowers_Galeev_Id_seq" OWNED BY public."Flowers_Galeev"."Id";


--
-- TOC entry 230 (class 1259 OID 26112)
-- Name: HeadDepartment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."HeadDepartment" (
    "Id" integer NOT NULL,
    "TabNumber" smallint,
    "Experience" character varying(3)
);


ALTER TABLE public."HeadDepartment" OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 26111)
-- Name: HeadDepartment_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."HeadDepartment_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."HeadDepartment_Id_seq" OWNER TO postgres;

--
-- TOC entry 5022 (class 0 OID 0)
-- Dependencies: 229
-- Name: HeadDepartment_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."HeadDepartment_Id_seq" OWNED BY public."HeadDepartment"."Id";


--
-- TOC entry 258 (class 1259 OID 26438)
-- Name: Role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Role" (
    "Id" integer NOT NULL,
    "Name" character varying(100)
);


ALTER TABLE public."Role" OWNER TO postgres;

--
-- TOC entry 257 (class 1259 OID 26437)
-- Name: Role_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Role_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Role_Id_seq" OWNER TO postgres;

--
-- TOC entry 5023 (class 0 OID 0)
-- Dependencies: 257
-- Name: Role_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Role_Id_seq" OWNED BY public."Role"."Id";


--
-- TOC entry 228 (class 1259 OID 26089)
-- Name: Specialization; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Specialization" (
    "Id" integer NOT NULL,
    "Number" character varying(50),
    "Direction" text,
    "Code" character varying(2)
);


ALTER TABLE public."Specialization" OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 26088)
-- Name: Specialization_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Specialization_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Specialization_Id_seq" OWNER TO postgres;

--
-- TOC entry 5024 (class 0 OID 0)
-- Dependencies: 227
-- Name: Specialization_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Specialization_Id_seq" OWNED BY public."Specialization"."Id";


--
-- TOC entry 236 (class 1259 OID 26133)
-- Name: Student; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Student" (
    "Id" integer NOT NULL,
    "Number" character varying(50),
    "FullName" character varying(50)
);


ALTER TABLE public."Student" OWNER TO postgres;

--
-- TOC entry 256 (class 1259 OID 26374)
-- Name: StudentGimnazia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."StudentGimnazia" (
    "Id" integer NOT NULL,
    "Surname" character varying(100) NOT NULL,
    "Subject" character varying(100) NOT NULL,
    "School" character varying(100) NOT NULL,
    "Point" numeric,
    CONSTRAINT "StudentGimnazia_Point_check" CHECK ((("Point" >= (0)::numeric) AND ("Point" <= (100)::numeric)))
);


ALTER TABLE public."StudentGimnazia" OWNER TO postgres;

--
-- TOC entry 255 (class 1259 OID 26373)
-- Name: StudentGimnazia_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."StudentGimnazia_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."StudentGimnazia_Id_seq" OWNER TO postgres;

--
-- TOC entry 5025 (class 0 OID 0)
-- Dependencies: 255
-- Name: StudentGimnazia_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."StudentGimnazia_Id_seq" OWNED BY public."StudentGimnazia"."Id";


--
-- TOC entry 254 (class 1259 OID 26364)
-- Name: StudentTest; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."StudentTest" (
    "Id" integer NOT NULL,
    "Surname" character varying(100) NOT NULL,
    "Subject" character varying(100) NOT NULL,
    "School" character varying(100) NOT NULL,
    "Point" numeric,
    CONSTRAINT "StudentTest_Point_check" CHECK ((("Point" >= (0)::numeric) AND ("Point" <= (100)::numeric)))
);


ALTER TABLE public."StudentTest" OWNER TO postgres;

--
-- TOC entry 253 (class 1259 OID 26363)
-- Name: StudentTest_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."StudentTest_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."StudentTest_Id_seq" OWNER TO postgres;

--
-- TOC entry 5026 (class 0 OID 0)
-- Dependencies: 253
-- Name: StudentTest_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."StudentTest_Id_seq" OWNED BY public."StudentTest"."Id";


--
-- TOC entry 235 (class 1259 OID 26132)
-- Name: Student_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Student_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Student_Id_seq" OWNER TO postgres;

--
-- TOC entry 5027 (class 0 OID 0)
-- Dependencies: 235
-- Name: Student_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Student_Id_seq" OWNED BY public."Student"."Id";


--
-- TOC entry 234 (class 1259 OID 26126)
-- Name: Teacher; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Teacher" (
    "Id" integer NOT NULL,
    "TabNumber" smallint,
    "Rank" character varying(50),
    "Degree" character varying(50)
);


ALTER TABLE public."Teacher" OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 26125)
-- Name: Teacher_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Teacher_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Teacher_Id_seq" OWNER TO postgres;

--
-- TOC entry 5028 (class 0 OID 0)
-- Dependencies: 233
-- Name: Teacher_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Teacher_Id_seq" OWNED BY public."Teacher"."Id";


--
-- TOC entry 259 (class 1259 OID 26453)
-- Name: ex3; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.ex3 AS
 SELECT e."FullName",
    e."Post",
    t."Rank",
    t."Degree",
    d."Name",
    count(ex."Id") AS count
   FROM (((public."Employee" e
     JOIN public."Teacher" t ON ((e."Id" = t."TabNumber")))
     JOIN public."Department" d ON (((e."Code")::text = (d."Code")::text)))
     LEFT JOIN public."Exam" ex ON ((e."Id" = ex."EmployeeId")))
  GROUP BY e."FullName", e."Post", t."Rank", t."Degree", d."Name";


ALTER VIEW public.ex3 OWNER TO postgres;

--
-- TOC entry 4743 (class 2604 OID 26049)
-- Name: Academic Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Academic" ALTER COLUMN "Id" SET DEFAULT nextval('public."Academic_Id_seq"'::regclass);


--
-- TOC entry 4762 (class 2604 OID 26348)
-- Name: Animals_Galeev Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Animals_Galeev" ALTER COLUMN "Id" SET DEFAULT nextval('public."Animals_Galeev_Id_seq"'::regclass);


--
-- TOC entry 4754 (class 2604 OID 26274)
-- Name: Application Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Application" ALTER COLUMN "Id" SET DEFAULT nextval('public."Application_Id_seq"'::regclass);


--
-- TOC entry 4756 (class 2604 OID 26303)
-- Name: Control_Galeev Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Control_Galeev" ALTER COLUMN "Id" SET DEFAULT nextval('public."Control_Galeev_Id_seq"'::regclass);


--
-- TOC entry 4744 (class 2604 OID 26056)
-- Name: Country Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Country" ALTER COLUMN "Id" SET DEFAULT nextval('public."Country_Id_seq"'::regclass);


--
-- TOC entry 4758 (class 2604 OID 26330)
-- Name: Country_Galeev Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Country_Galeev" ALTER COLUMN "Id" SET DEFAULT nextval('public."Country_Galeev_Id_seq"'::regclass);


--
-- TOC entry 4746 (class 2604 OID 26078)
-- Name: Department Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Department" ALTER COLUMN "Id" SET DEFAULT nextval('public."Department_Id_seq"'::regclass);


--
-- TOC entry 4753 (class 2604 OID 26245)
-- Name: Discipline Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Discipline" ALTER COLUMN "Id" SET DEFAULT nextval('public."Discipline_Id_seq"'::regclass);


--
-- TOC entry 4752 (class 2604 OID 26216)
-- Name: Employee Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Employee" ALTER COLUMN "Id" SET DEFAULT nextval('public."Employee_Id_seq"'::regclass);


--
-- TOC entry 4749 (class 2604 OID 26122)
-- Name: Engineer Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Engineer" ALTER COLUMN "Id" SET DEFAULT nextval('public."Engineer_Id_seq"'::regclass);


--
-- TOC entry 4755 (class 2604 OID 26281)
-- Name: Exam Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Exam" ALTER COLUMN "Id" SET DEFAULT nextval('public."Exam_Id_seq"'::regclass);


--
-- TOC entry 4745 (class 2604 OID 26071)
-- Name: Faculty Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Faculty" ALTER COLUMN "Id" SET DEFAULT nextval('public."Faculty_Id_seq"'::regclass);


--
-- TOC entry 4760 (class 2604 OID 26339)
-- Name: Flowers_Galeev Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Flowers_Galeev" ALTER COLUMN "Id" SET DEFAULT nextval('public."Flowers_Galeev_Id_seq"'::regclass);


--
-- TOC entry 4748 (class 2604 OID 26115)
-- Name: HeadDepartment Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HeadDepartment" ALTER COLUMN "Id" SET DEFAULT nextval('public."HeadDepartment_Id_seq"'::regclass);


--
-- TOC entry 4766 (class 2604 OID 26441)
-- Name: Role Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Role" ALTER COLUMN "Id" SET DEFAULT nextval('public."Role_Id_seq"'::regclass);


--
-- TOC entry 4747 (class 2604 OID 26092)
-- Name: Specialization Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Specialization" ALTER COLUMN "Id" SET DEFAULT nextval('public."Specialization_Id_seq"'::regclass);


--
-- TOC entry 4751 (class 2604 OID 26136)
-- Name: Student Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Student" ALTER COLUMN "Id" SET DEFAULT nextval('public."Student_Id_seq"'::regclass);


--
-- TOC entry 4765 (class 2604 OID 26377)
-- Name: StudentGimnazia Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."StudentGimnazia" ALTER COLUMN "Id" SET DEFAULT nextval('public."StudentGimnazia_Id_seq"'::regclass);


--
-- TOC entry 4764 (class 2604 OID 26367)
-- Name: StudentTest Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."StudentTest" ALTER COLUMN "Id" SET DEFAULT nextval('public."StudentTest_Id_seq"'::regclass);


--
-- TOC entry 4750 (class 2604 OID 26129)
-- Name: Teacher Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Teacher" ALTER COLUMN "Id" SET DEFAULT nextval('public."Teacher_Id_seq"'::regclass);


--
-- TOC entry 4963 (class 0 OID 26046)
-- Dependencies: 220
-- Data for Name: Academic; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Academic" ("Id", "FIO", "DateOfBirthday", "Specialization", "YearAssignmentRank") VALUES (1, 'Аничков Николай Николаевич', '1885-11-03', 'медицина', 1939);
INSERT INTO public."Academic" ("Id", "FIO", "DateOfBirthday", "Specialization", "YearAssignmentRank") VALUES (2, 'Бартольд Василий Владимирович', '1869-11-15', 'историк', 1913);
INSERT INTO public."Academic" ("Id", "FIO", "DateOfBirthday", "Specialization", "YearAssignmentRank") VALUES (3, 'Белопольский Аристарх Аполлонович', '1854-07-13', 'астрофизик', 1903);
INSERT INTO public."Academic" ("Id", "FIO", "DateOfBirthday", "Specialization", "YearAssignmentRank") VALUES (4, 'Бородин Иван Парфеньевич', '1847-01-30', 'ботаник', 1902);
INSERT INTO public."Academic" ("Id", "FIO", "DateOfBirthday", "Specialization", "YearAssignmentRank") VALUES (5, 'Вальден Павел Иванович', '1863-07-26', 'химик-технолог', 1910);
INSERT INTO public."Academic" ("Id", "FIO", "DateOfBirthday", "Specialization", "YearAssignmentRank") VALUES (6, 'Вернадский Владимир Иванович', '1863-03-12', 'геохимик', 1908);
INSERT INTO public."Academic" ("Id", "FIO", "DateOfBirthday", "Specialization", "YearAssignmentRank") VALUES (7, 'Виноградов Павел Гаврилович', '1854-11-30', 'историк', 1914);
INSERT INTO public."Academic" ("Id", "FIO", "DateOfBirthday", "Specialization", "YearAssignmentRank") VALUES (8, 'Ипатьев Владимир Николаевич', '1867-11-21', 'химик', 1916);
INSERT INTO public."Academic" ("Id", "FIO", "DateOfBirthday", "Specialization", "YearAssignmentRank") VALUES (9, 'Истрин Василий Михайлович', '1865-02-22', 'филолог', 1907);
INSERT INTO public."Academic" ("Id", "FIO", "DateOfBirthday", "Specialization", "YearAssignmentRank") VALUES (10, 'Карпинский Александр Петрович', '1847-01-07', 'геолог', 1889);
INSERT INTO public."Academic" ("Id", "FIO", "DateOfBirthday", "Specialization", "YearAssignmentRank") VALUES (11, 'Коковцов Павел Константинович', '1861-07-01', 'историк', 1906);
INSERT INTO public."Academic" ("Id", "FIO", "DateOfBirthday", "Specialization", "YearAssignmentRank") VALUES (12, 'Курнаков Николай Семёнович', '1860-12-06', 'химик', 1913);
INSERT INTO public."Academic" ("Id", "FIO", "DateOfBirthday", "Specialization", "YearAssignmentRank") VALUES (13, 'Марр Николай Яковлевич', '1865-01-06', 'лингвист', 1912);
INSERT INTO public."Academic" ("Id", "FIO", "DateOfBirthday", "Specialization", "YearAssignmentRank") VALUES (14, 'Насонов Николай Викторович', '1855-02-26', 'зоолог', 1906);
INSERT INTO public."Academic" ("Id", "FIO", "DateOfBirthday", "Specialization", "YearAssignmentRank") VALUES (15, 'Ольденбург Сергей Фёдорович', '1863-09-26', 'историк', 1903);
INSERT INTO public."Academic" ("Id", "FIO", "DateOfBirthday", "Specialization", "YearAssignmentRank") VALUES (16, 'Павлов Иван Петрович', '1849-09-26', 'физиолог', 1907);
INSERT INTO public."Academic" ("Id", "FIO", "DateOfBirthday", "Specialization", "YearAssignmentRank") VALUES (17, 'Перетц Владимир Николаевич', '1870-01-31', 'филолог', 1914);
INSERT INTO public."Academic" ("Id", "FIO", "DateOfBirthday", "Specialization", "YearAssignmentRank") VALUES (18, 'Соболевский Алексей Иванович', '1857-01-07', 'лингвист', 1900);
INSERT INTO public."Academic" ("Id", "FIO", "DateOfBirthday", "Specialization", "YearAssignmentRank") VALUES (19, 'Стеклов Владимир Андреевич', '1864-01-09', 'математик', 1912);


--
-- TOC entry 4995 (class 0 OID 26345)
-- Dependencies: 252
-- Data for Name: Animals_Galeev; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4985 (class 0 OID 26271)
-- Dependencies: 242
-- Data for Name: Application; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Application" ("Id", "Number", "Code") VALUES (1, '01.03.2004', 101);
INSERT INTO public."Application" ("Id", "Number", "Code") VALUES (2, '01.03.2004', 205);
INSERT INTO public."Application" ("Id", "Number", "Code") VALUES (3, '01.03.2004', 209);
INSERT INTO public."Application" ("Id", "Number", "Code") VALUES (4, '09.03.2002', 101);
INSERT INTO public."Application" ("Id", "Number", "Code") VALUES (5, '09.03.2002', 102);
INSERT INTO public."Application" ("Id", "Number", "Code") VALUES (6, '09.03.2002', 103);
INSERT INTO public."Application" ("Id", "Number", "Code") VALUES (7, '09.03.2002', 202);
INSERT INTO public."Application" ("Id", "Number", "Code") VALUES (8, '09.03.2002', 205);
INSERT INTO public."Application" ("Id", "Number", "Code") VALUES (9, '09.03.2002', 209);
INSERT INTO public."Application" ("Id", "Number", "Code") VALUES (10, '09.03.2003', 101);
INSERT INTO public."Application" ("Id", "Number", "Code") VALUES (11, '09.03.2003', 102);
INSERT INTO public."Application" ("Id", "Number", "Code") VALUES (12, '09.03.2003', 103);
INSERT INTO public."Application" ("Id", "Number", "Code") VALUES (13, '09.03.2003', 202);
INSERT INTO public."Application" ("Id", "Number", "Code") VALUES (14, '09.03.2003', 205);
INSERT INTO public."Application" ("Id", "Number", "Code") VALUES (15, '14.03.2002', 101);
INSERT INTO public."Application" ("Id", "Number", "Code") VALUES (16, '14.03.2002', 102);
INSERT INTO public."Application" ("Id", "Number", "Code") VALUES (17, '14.03.2002', 103);
INSERT INTO public."Application" ("Id", "Number", "Code") VALUES (18, '14.03.2002', 204);
INSERT INTO public."Application" ("Id", "Number", "Code") VALUES (19, '38.03.2005', 101);
INSERT INTO public."Application" ("Id", "Number", "Code") VALUES (20, '38.03.2005', 103);
INSERT INTO public."Application" ("Id", "Number", "Code") VALUES (21, '38.03.2005', 202);
INSERT INTO public."Application" ("Id", "Number", "Code") VALUES (22, '38.03.2005', 209);


--
-- TOC entry 4989 (class 0 OID 26300)
-- Dependencies: 246
-- Data for Name: Control_Galeev; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4965 (class 0 OID 26053)
-- Dependencies: 222
-- Data for Name: Country; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Country" ("Id", "Name", "Capital", "Square", "Population", "Continent") VALUES (1, 'Австрия', 'Вена', 83858.00, 8741753, 'Европа');
INSERT INTO public."Country" ("Id", "Name", "Capital", "Square", "Population", "Continent") VALUES (2, 'Азербайджан', 'Баку', 86600.00, 9705600, 'Азия');
INSERT INTO public."Country" ("Id", "Name", "Capital", "Square", "Population", "Continent") VALUES (3, 'Албания', 'Тирана', 28748.00, 2866026, 'Европа');
INSERT INTO public."Country" ("Id", "Name", "Capital", "Square", "Population", "Continent") VALUES (4, 'Алжир', 'Алжир', 2381740.00, 39813722, 'Африка');
INSERT INTO public."Country" ("Id", "Name", "Capital", "Square", "Population", "Continent") VALUES (5, 'Ангола', 'Луанда', 1246700.00, 25831000, 'Африка');
INSERT INTO public."Country" ("Id", "Name", "Capital", "Square", "Population", "Continent") VALUES (6, 'Аргентина', 'Буэнос-Айрес', 2766890.00, 43847000, 'Южная Америка');
INSERT INTO public."Country" ("Id", "Name", "Capital", "Square", "Population", "Continent") VALUES (7, 'Афганистан', 'Кабул', 647500.00, 29822848, 'Азия');
INSERT INTO public."Country" ("Id", "Name", "Capital", "Square", "Population", "Continent") VALUES (8, 'Бангладеш', 'Дакка', 144000.00, 160221000, 'Азия');
INSERT INTO public."Country" ("Id", "Name", "Capital", "Square", "Population", "Continent") VALUES (9, 'Бахрейн', 'Манама', 701.00, 1397000, 'Азия');
INSERT INTO public."Country" ("Id", "Name", "Capital", "Square", "Population", "Continent") VALUES (10, 'Белиз', 'Бельмопан', 22966.00, 377968, 'Северная Америка');
INSERT INTO public."Country" ("Id", "Name", "Capital", "Square", "Population", "Continent") VALUES (11, 'Белоруссия', 'Минск', 207595.00, 9498400, 'Европа');
INSERT INTO public."Country" ("Id", "Name", "Capital", "Square", "Population", "Continent") VALUES (12, 'Бельгия', 'Брюссель', 30528.00, 11250585, 'Европа');
INSERT INTO public."Country" ("Id", "Name", "Capital", "Square", "Population", "Continent") VALUES (13, 'Бенин', 'Порто-Ново', 112620.00, 11167000, 'Африка');
INSERT INTO public."Country" ("Id", "Name", "Capital", "Square", "Population", "Continent") VALUES (14, 'Болгария', 'София', 110910.00, 7153784, 'Европа');
INSERT INTO public."Country" ("Id", "Name", "Capital", "Square", "Population", "Continent") VALUES (15, 'Боливия', 'Сукре', 1098580.00, 10985059, 'Южная Америка');
INSERT INTO public."Country" ("Id", "Name", "Capital", "Square", "Population", "Continent") VALUES (16, 'Ботсвана', 'Габороне', 600370.00, 2209208, 'Африка');
INSERT INTO public."Country" ("Id", "Name", "Capital", "Square", "Population", "Continent") VALUES (17, 'Бразилия', 'Бразилиа', 8511965.00, 206081432, 'Южная Америка');
INSERT INTO public."Country" ("Id", "Name", "Capital", "Square", "Population", "Continent") VALUES (18, 'Буркина-Фасо', 'Уагадугу', 274200.00, 19034397, 'Африка');
INSERT INTO public."Country" ("Id", "Name", "Capital", "Square", "Population", "Continent") VALUES (19, 'Бутан', 'Тхимпху', 47000.00, 784000, 'Азия');
INSERT INTO public."Country" ("Id", "Name", "Capital", "Square", "Population", "Continent") VALUES (20, 'Великобритания', 'Лондон', 244820.00, 65341183, 'Европа');
INSERT INTO public."Country" ("Id", "Name", "Capital", "Square", "Population", "Continent") VALUES (21, 'Венгрия', 'Будапешт', 93030.00, 9830485, 'Европа');
INSERT INTO public."Country" ("Id", "Name", "Capital", "Square", "Population", "Continent") VALUES (22, 'Венесуэла', 'Каракас', 912050.00, 31028637, 'Южная Америка');
INSERT INTO public."Country" ("Id", "Name", "Capital", "Square", "Population", "Continent") VALUES (23, 'Восточный Тимор', 'Дили', 14874.00, 1167242, 'Азия');
INSERT INTO public."Country" ("Id", "Name", "Capital", "Square", "Population", "Continent") VALUES (24, 'Вьетнам', 'Ханой', 329560.00, 91713300, 'Азия');


--
-- TOC entry 4991 (class 0 OID 26327)
-- Dependencies: 248
-- Data for Name: Country_Galeev; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4969 (class 0 OID 26075)
-- Dependencies: 226
-- Data for Name: Department; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Department" ("Id", "Code", "Name", "Faculty") VALUES (1, 'вм', 'Высшая математика', 'ен');
INSERT INTO public."Department" ("Id", "Code", "Name", "Faculty") VALUES (2, 'ис', 'Информационные системы', 'ит');
INSERT INTO public."Department" ("Id", "Code", "Name", "Faculty") VALUES (3, 'мм', 'Математическое моделирование', 'фм');
INSERT INTO public."Department" ("Id", "Code", "Name", "Faculty") VALUES (4, 'оф', 'Общая физика', 'ен');
INSERT INTO public."Department" ("Id", "Code", "Name", "Faculty") VALUES (5, 'пи', 'Прикладная информатика', 'ит');
INSERT INTO public."Department" ("Id", "Code", "Name", "Faculty") VALUES (6, 'эф', 'Экспериментальная физика', 'фм');


--
-- TOC entry 4983 (class 0 OID 26242)
-- Dependencies: 240
-- Data for Name: Discipline; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Discipline" ("Id", "Volume", "Name", "Executor") VALUES (1, 320, 'Математика', 'вм');
INSERT INTO public."Discipline" ("Id", "Volume", "Name", "Executor") VALUES (2, 160, 'Информатика', 'пи');
INSERT INTO public."Discipline" ("Id", "Volume", "Name", "Executor") VALUES (3, 160, 'Физика', 'оф');
INSERT INTO public."Discipline" ("Id", "Volume", "Name", "Executor") VALUES (5, 160, 'Электроника', 'эф');
INSERT INTO public."Discipline" ("Id", "Volume", "Name", "Executor") VALUES (6, 80, 'Программирование', 'пи');
INSERT INTO public."Discipline" ("Id", "Volume", "Name", "Executor") VALUES (7, 80, 'Моделирование', 'мм');
INSERT INTO public."Discipline" ("Id", "Volume", "Name", "Executor") VALUES (4, 120, 'Базы данных', 'ис');


--
-- TOC entry 4981 (class 0 OID 26213)
-- Dependencies: 238
-- Data for Name: Employee; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Employee" ("Id", "Code", "FullName", "Post", "Salary", "Director", "RoleId", "Login", "Password") VALUES (21, NULL, 'Галеев Р.Р.', '', 300000, NULL, 1, 'admin@gmail.com', '1');
INSERT INTO public."Employee" ("Id", "Code", "FullName", "Post", "Salary", "Director", "RoleId", "Login", "Password") VALUES (42, NULL, 'vser', NULL, NULL, NULL, 3, 'gfkjh@.', '1');
INSERT INTO public."Employee" ("Id", "Code", "FullName", "Post", "Salary", "Director", "RoleId", "Login", "Password") VALUES (4, 'пи', 'Сидорова С.С.', 'инженер', 15000.00, 102, 6, 'AdminEngineer1@gmail.com', '1');
INSERT INTO public."Employee" ("Id", "Code", "FullName", "Post", "Salary", "Director", "RoleId", "Login", "Password") VALUES (8, 'ис', 'Чернов Ч.Ч.', 'инженер', 15000.00, 202, 6, 'AdminEngineer3@gmail.com', '1');
INSERT INTO public."Employee" ("Id", "Code", "FullName", "Post", "Salary", "Director", "RoleId", "Login", "Password") VALUES (14, 'оф', 'Лисин Л.Л.', 'инженер', 20000.00, 402, 6, 'AdminEngineer4@gmail.com', '1');
INSERT INTO public."Employee" ("Id", "Code", "FullName", "Post", "Salary", "Director", "RoleId", "Login", "Password") VALUES (20, 'эф', 'Григорьев Г.Г.', 'инженер', 20000.00, 602, 6, 'AdminEngineer5@gmail.com', '1');
INSERT INTO public."Employee" ("Id", "Code", "FullName", "Post", "Salary", "Director", "RoleId", "Login", "Password") VALUES (1, 'пи', 'Прохоров П.П.', 'зав. кафедрой', 35000.00, 101, 3, 'Employee1@gmail.com', '1');
INSERT INTO public."Employee" ("Id", "Code", "FullName", "Post", "Salary", "Director", "RoleId", "Login", "Password") VALUES (2, 'пи', 'Семенов С.С.', 'преподаватель', 25000.00, 101, 3, 'Employee2@gmail.com', '1');
INSERT INTO public."Employee" ("Id", "Code", "FullName", "Post", "Salary", "Director", "RoleId", "Login", "Password") VALUES (3, 'пи', 'Петров П.П.', 'преподаватель', 25000.00, 101, 3, 'Employee3@gmail.com', '1');
INSERT INTO public."Employee" ("Id", "Code", "FullName", "Post", "Salary", "Director", "RoleId", "Login", "Password") VALUES (5, 'ис', 'Андреев А.А.', 'зав. кафедрой', 35000.00, 201, 3, 'Employee4@gmail.com', '1');
INSERT INTO public."Employee" ("Id", "Code", "FullName", "Post", "Salary", "Director", "RoleId", "Login", "Password") VALUES (6, 'ис', 'Борисов Б.Б.', 'преподаватель', 25000.00, 201, 3, 'Employee5@gmail.com', '1');
INSERT INTO public."Employee" ("Id", "Code", "FullName", "Post", "Salary", "Director", "RoleId", "Login", "Password") VALUES (10, 'мм', 'Сергеева С.С.', 'преподаватель', 25000.00, 301, 3, 'Employee7@gmail.com', '1');
INSERT INTO public."Employee" ("Id", "Code", "FullName", "Post", "Salary", "Director", "RoleId", "Login", "Password") VALUES (11, 'оф', 'Волков В.В.', 'зав. кафедрой', 35000.00, 401, 3, 'Employee8@gmail.com', '1');
INSERT INTO public."Employee" ("Id", "Code", "FullName", "Post", "Salary", "Director", "RoleId", "Login", "Password") VALUES (12, 'оф', 'Зайцев З.З.', 'преподаватель', 25000.00, 401, 3, 'Employee9@gmail.com', '1');
INSERT INTO public."Employee" ("Id", "Code", "FullName", "Post", "Salary", "Director", "RoleId", "Login", "Password") VALUES (13, 'оф', 'Смирнов С.С.', 'преподаватель', 15000.00, 401, 3, 'Employee10@gmail.com', '1');
INSERT INTO public."Employee" ("Id", "Code", "FullName", "Post", "Salary", "Director", "RoleId", "Login", "Password") VALUES (15, 'вм', 'Кузнецов К.К.', 'зав. кафедрой', 35000.00, 501, 3, 'Employee11@gmail.com', '1');
INSERT INTO public."Employee" ("Id", "Code", "FullName", "Post", "Salary", "Director", "RoleId", "Login", "Password") VALUES (16, 'вм', 'Романцев Р.Р.', 'преподаватель', 25000.00, 501, 3, 'Employee12@gmail.com', '1');
INSERT INTO public."Employee" ("Id", "Code", "FullName", "Post", "Salary", "Director", "RoleId", "Login", "Password") VALUES (17, 'вм', 'Соловьев С.С.', 'преподаватель', 25000.00, 501, 3, 'Employee13@gmail.com', '1');
INSERT INTO public."Employee" ("Id", "Code", "FullName", "Post", "Salary", "Director", "RoleId", "Login", "Password") VALUES (18, 'эф', 'Зверев З.З.', 'зав. кафедрой', 35000.00, 601, 3, 'Employee14@gmail.com', '1');
INSERT INTO public."Employee" ("Id", "Code", "FullName", "Post", "Salary", "Director", "RoleId", "Login", "Password") VALUES (19, 'эф', 'Сорокина С.С.', 'преподаватель', 25000.00, 601, 3, 'Employee15@gmail.com', '1');
INSERT INTO public."Employee" ("Id", "Code", "FullName", "Post", "Salary", "Director", "RoleId", "Login", "Password") VALUES (7, 'ис', 'Глухов Г.Г.', 'инженер', 20000.00, 201, 6, 'AdminEngineer2@gmail.com', '1');
INSERT INTO public."Employee" ("Id", "Code", "FullName", "Post", "Salary", "Director", "RoleId", "Login", "Password") VALUES (22, NULL, 'Габитов А.И.', '', 100000.00, NULL, 2, 'ManagerExam@gmail.com', '1');
INSERT INTO public."Employee" ("Id", "Code", "FullName", "Post", "Salary", "Director", "RoleId", "Login", "Password") VALUES (24, NULL, 'Иванов Г.Р.', '', 100000, NULL, 5, 'ManagerStudent@gmail.com', '1');
INSERT INTO public."Employee" ("Id", "Code", "FullName", "Post", "Salary", "Director", "RoleId", "Login", "Password") VALUES (23, NULL, 'Петров Е.А.', '', 100000, NULL, 4, 'ManagerDiscipline@gmail.com', '1');


--
-- TOC entry 4975 (class 0 OID 26119)
-- Dependencies: 232
-- Data for Name: Engineer; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Engineer" ("Id", "TabNumber", "Specialization") VALUES (1, 153, 'электроник');
INSERT INTO public."Engineer" ("Id", "TabNumber", "Specialization") VALUES (2, 241, 'электроник');
INSERT INTO public."Engineer" ("Id", "TabNumber", "Specialization") VALUES (3, 242, 'программист');
INSERT INTO public."Engineer" ("Id", "TabNumber", "Specialization") VALUES (4, 435, 'электроник');
INSERT INTO public."Engineer" ("Id", "TabNumber", "Specialization") VALUES (5, 614, 'программист');


--
-- TOC entry 4987 (class 0 OID 26278)
-- Dependencies: 244
-- Data for Name: Exam; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Exam" ("Id", "Date", "DisciplineId", "StudentId", "EmployeeId", "Auditorium", "Estimation") VALUES (1, '2015-06-05', 2, 1, 2, 'т505', '4');
INSERT INTO public."Exam" ("Id", "Date", "DisciplineId", "StudentId", "EmployeeId", "Auditorium", "Estimation") VALUES (2, '2015-06-05', 2, 2, 2, 'т505', '4');
INSERT INTO public."Exam" ("Id", "Date", "DisciplineId", "StudentId", "EmployeeId", "Auditorium", "Estimation") VALUES (3, '2015-06-05', 4, 4, 6, 'т506', '4');
INSERT INTO public."Exam" ("Id", "Date", "DisciplineId", "StudentId", "EmployeeId", "Auditorium", "Estimation") VALUES (4, '2015-06-05', 4, 5, 6, 'т506', '3');
INSERT INTO public."Exam" ("Id", "Date", "DisciplineId", "StudentId", "EmployeeId", "Auditorium", "Estimation") VALUES (5, '2015-06-07', 2, 6, 3, 'ф419', '3');
INSERT INTO public."Exam" ("Id", "Date", "DisciplineId", "StudentId", "EmployeeId", "Auditorium", "Estimation") VALUES (6, '2015-06-07', 2, 7, 1, 'т506', '4');
INSERT INTO public."Exam" ("Id", "Date", "DisciplineId", "StudentId", "EmployeeId", "Auditorium", "Estimation") VALUES (7, '2015-06-07', 2, 11, 2, 'м425', '5');
INSERT INTO public."Exam" ("Id", "Date", "DisciplineId", "StudentId", "EmployeeId", "Auditorium", "Estimation") VALUES (8, '2015-06-09', 6, 12, 12, 'м424', '4');
INSERT INTO public."Exam" ("Id", "Date", "DisciplineId", "StudentId", "EmployeeId", "Auditorium", "Estimation") VALUES (9, '2015-06-09', 7, 4, 10, 'ф333', '3');
INSERT INTO public."Exam" ("Id", "Date", "DisciplineId", "StudentId", "EmployeeId", "Auditorium", "Estimation") VALUES (10, '2015-06-10', 1, 1, 15, 'т506', '4');
INSERT INTO public."Exam" ("Id", "Date", "DisciplineId", "StudentId", "EmployeeId", "Auditorium", "Estimation") VALUES (11, '2015-06-10', 1, 2, 15, 'т506', '4');
INSERT INTO public."Exam" ("Id", "Date", "DisciplineId", "StudentId", "EmployeeId", "Auditorium", "Estimation") VALUES (12, '2015-06-10', 5, 7, 18, 'ф349', '5');
INSERT INTO public."Exam" ("Id", "Date", "DisciplineId", "StudentId", "EmployeeId", "Auditorium", "Estimation") VALUES (15, '2015-06-12', 1, 11, 16, 'с324', '4');
INSERT INTO public."Exam" ("Id", "Date", "DisciplineId", "StudentId", "EmployeeId", "Auditorium", "Estimation") VALUES (16, '2015-06-15', 1, 6, 17, 'ф417', '4');
INSERT INTO public."Exam" ("Id", "Date", "DisciplineId", "StudentId", "EmployeeId", "Auditorium", "Estimation") VALUES (17, '2015-06-15', 1, 9, 15, 'ф201', '5');
INSERT INTO public."Exam" ("Id", "Date", "DisciplineId", "StudentId", "EmployeeId", "Auditorium", "Estimation") VALUES (18, '2015-06-15', 1, 10, 15, 'ф201', '3');
INSERT INTO public."Exam" ("Id", "Date", "DisciplineId", "StudentId", "EmployeeId", "Auditorium", "Estimation") VALUES (19, '2015-06-15', 3, 1, 13, 'ф414', '4');
INSERT INTO public."Exam" ("Id", "Date", "DisciplineId", "StudentId", "EmployeeId", "Auditorium", "Estimation") VALUES (20, '2015-06-17', 2, 1, 2, 'т505', '5');
INSERT INTO public."Exam" ("Id", "Date", "DisciplineId", "StudentId", "EmployeeId", "Auditorium", "Estimation") VALUES (13, '2015-06-10', 7, 11, NULL, 'э105', '5');
INSERT INTO public."Exam" ("Id", "Date", "DisciplineId", "StudentId", "EmployeeId", "Auditorium", "Estimation") VALUES (14, '2015-06-10', 7, 12, NULL, 'э105', '4');


--
-- TOC entry 4967 (class 0 OID 26068)
-- Dependencies: 224
-- Data for Name: Faculty; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Faculty" ("Id", "Abbreviation", "Name") VALUES (1, 'ен', 'Естественные науки');
INSERT INTO public."Faculty" ("Id", "Abbreviation", "Name") VALUES (2, 'гн', 'Гуманитарные науки');
INSERT INTO public."Faculty" ("Id", "Abbreviation", "Name") VALUES (3, 'ит', 'Информационные технологии');
INSERT INTO public."Faculty" ("Id", "Abbreviation", "Name") VALUES (4, 'фм', 'Физико-математический');


--
-- TOC entry 4993 (class 0 OID 26336)
-- Dependencies: 250
-- Data for Name: Flowers_Galeev; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4973 (class 0 OID 26112)
-- Dependencies: 230
-- Data for Name: HeadDepartment; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."HeadDepartment" ("Id", "TabNumber", "Experience") VALUES (1, 1, '15');
INSERT INTO public."HeadDepartment" ("Id", "TabNumber", "Experience") VALUES (2, 5, '18');
INSERT INTO public."HeadDepartment" ("Id", "TabNumber", "Experience") VALUES (3, 9, '20');
INSERT INTO public."HeadDepartment" ("Id", "TabNumber", "Experience") VALUES (4, 11, '10');
INSERT INTO public."HeadDepartment" ("Id", "TabNumber", "Experience") VALUES (5, 15, '18');
INSERT INTO public."HeadDepartment" ("Id", "TabNumber", "Experience") VALUES (6, 18, '8');


--
-- TOC entry 5001 (class 0 OID 26438)
-- Dependencies: 258
-- Data for Name: Role; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Role" ("Id", "Name") VALUES (1, 'Администратор');
INSERT INTO public."Role" ("Id", "Name") VALUES (2, 'Управляющий экзаменами');
INSERT INTO public."Role" ("Id", "Name") VALUES (3, 'Сотрудник');
INSERT INTO public."Role" ("Id", "Name") VALUES (4, 'Управляющий дисциплинами');
INSERT INTO public."Role" ("Id", "Name") VALUES (5, 'Управляющий студентами');
INSERT INTO public."Role" ("Id", "Name") VALUES (6, 'Инженер');


--
-- TOC entry 4971 (class 0 OID 26089)
-- Dependencies: 228
-- Data for Name: Specialization; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Specialization" ("Id", "Number", "Direction", "Code") VALUES (1, '01.03.2004', 'Прикладная математика', 'мм');
INSERT INTO public."Specialization" ("Id", "Number", "Direction", "Code") VALUES (2, '09.03.2002', 'Информационные системы и технологии', 'ис');
INSERT INTO public."Specialization" ("Id", "Number", "Direction", "Code") VALUES (3, '09.03.2003', 'Прикладная информатика', 'пи');
INSERT INTO public."Specialization" ("Id", "Number", "Direction", "Code") VALUES (4, '14.03.2002', 'Ядерные физика и технологии', 'эф');
INSERT INTO public."Specialization" ("Id", "Number", "Direction", "Code") VALUES (5, '38.03.05', 'Бизнес-информатика', 'ис');


--
-- TOC entry 4979 (class 0 OID 26133)
-- Dependencies: 236
-- Data for Name: Student; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Student" ("Id", "Number", "FullName") VALUES (1, '09.03.2003', 'Николаева Н. Н.');
INSERT INTO public."Student" ("Id", "Number", "FullName") VALUES (2, '09.03.2003', 'Иванов И. И.');
INSERT INTO public."Student" ("Id", "Number", "FullName") VALUES (3, '09.03.2003', 'Крюков К. К.');
INSERT INTO public."Student" ("Id", "Number", "FullName") VALUES (4, '09.03.2002', 'Андреев А. А.');
INSERT INTO public."Student" ("Id", "Number", "FullName") VALUES (5, '09.03.2002', 'Федоров Ф. Ф.');
INSERT INTO public."Student" ("Id", "Number", "FullName") VALUES (6, '14.03.2002', 'Бондаренко Б. Б.');
INSERT INTO public."Student" ("Id", "Number", "FullName") VALUES (7, '14.03.2002', 'Цветков К. К.');
INSERT INTO public."Student" ("Id", "Number", "FullName") VALUES (8, '14.03.2002', 'Петров П. П.');
INSERT INTO public."Student" ("Id", "Number", "FullName") VALUES (9, '01.03.2004', 'Сергеев С. С.');
INSERT INTO public."Student" ("Id", "Number", "FullName") VALUES (10, '01.03.2004', 'Кудрявцев К. К.');
INSERT INTO public."Student" ("Id", "Number", "FullName") VALUES (11, '38.03.2005', 'Макаров М. М.');
INSERT INTO public."Student" ("Id", "Number", "FullName") VALUES (12, '38.03.2005', 'Яковлев Я. Я.');


--
-- TOC entry 4999 (class 0 OID 26374)
-- Dependencies: 256
-- Data for Name: StudentGimnazia; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4997 (class 0 OID 26364)
-- Dependencies: 254
-- Data for Name: StudentTest; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."StudentTest" ("Id", "Surname", "Subject", "School", "Point") VALUES (1, 'Иванова', 'Математика', 'Лицей', 98.5);
INSERT INTO public."StudentTest" ("Id", "Surname", "Subject", "School", "Point") VALUES (2, 'Петров', 'Физика', 'Лицей', 99);
INSERT INTO public."StudentTest" ("Id", "Surname", "Subject", "School", "Point") VALUES (3, 'Сидоров', 'Математика', 'Лицей', 88);
INSERT INTO public."StudentTest" ("Id", "Surname", "Subject", "School", "Point") VALUES (4, 'Полухина', 'Физика', 'Гимназия', 78);
INSERT INTO public."StudentTest" ("Id", "Surname", "Subject", "School", "Point") VALUES (5, 'Матвеева', 'Химия', 'Лицей', 92);
INSERT INTO public."StudentTest" ("Id", "Surname", "Subject", "School", "Point") VALUES (6, 'Касимов', 'Химия', 'Гимназия', 68);
INSERT INTO public."StudentTest" ("Id", "Surname", "Subject", "School", "Point") VALUES (7, 'Нурулин', 'Математика', 'Гимназия', 81);
INSERT INTO public."StudentTest" ("Id", "Surname", "Subject", "School", "Point") VALUES (8, 'Авдеев', 'Физика', 'Лицей', 87);
INSERT INTO public."StudentTest" ("Id", "Surname", "Subject", "School", "Point") VALUES (9, 'Никитина', 'Химия', 'Лицей', 94);
INSERT INTO public."StudentTest" ("Id", "Surname", "Subject", "School", "Point") VALUES (10, 'Барышева', 'Химия', 'Лицей', 88);
INSERT INTO public."StudentTest" ("Id", "Surname", "Subject", "School", "Point") VALUES (12, 'Семенов', 'Химия', 'Лицей', 90);
INSERT INTO public."StudentTest" ("Id", "Surname", "Subject", "School", "Point") VALUES (13, 'Рогов', 'Математика', 'Лицей', 92);
INSERT INTO public."StudentTest" ("Id", "Surname", "Subject", "School", "Point") VALUES (14, 'Самойлов', 'Физика', 'Лицей', 95);


--
-- TOC entry 4977 (class 0 OID 26126)
-- Dependencies: 234
-- Data for Name: Teacher; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Teacher" ("Id", "TabNumber", "Rank", "Degree") VALUES (1, 1, 'профессор', 'д. т.н.');
INSERT INTO public."Teacher" ("Id", "TabNumber", "Rank", "Degree") VALUES (2, 2, 'доцент', 'к. ф.-м. н.');
INSERT INTO public."Teacher" ("Id", "TabNumber", "Rank", "Degree") VALUES (3, 3, 'доцент', 'к. т.н.');
INSERT INTO public."Teacher" ("Id", "TabNumber", "Rank", "Degree") VALUES (4, 5, 'профессор', 'д. ф.-м. н.');
INSERT INTO public."Teacher" ("Id", "TabNumber", "Rank", "Degree") VALUES (5, 6, 'доцент', 'к. ф.-м. н.');
INSERT INTO public."Teacher" ("Id", "TabNumber", "Rank", "Degree") VALUES (6, 9, 'профессор', 'д. т.н.');
INSERT INTO public."Teacher" ("Id", "TabNumber", "Rank", "Degree") VALUES (7, 10, 'доцент', 'к. т.н.');
INSERT INTO public."Teacher" ("Id", "TabNumber", "Rank", "Degree") VALUES (8, 11, 'профессор', 'д. т.н.');
INSERT INTO public."Teacher" ("Id", "TabNumber", "Rank", "Degree") VALUES (9, 12, 'доцент', 'к. т.н.');
INSERT INTO public."Teacher" ("Id", "TabNumber", "Rank", "Degree") VALUES (10, 13, 'ассистент', NULL);
INSERT INTO public."Teacher" ("Id", "TabNumber", "Rank", "Degree") VALUES (11, 15, 'профессор', 'д. ф.-м. н.');
INSERT INTO public."Teacher" ("Id", "TabNumber", "Rank", "Degree") VALUES (12, 16, 'профессор', 'д. ф.-м. н.');
INSERT INTO public."Teacher" ("Id", "TabNumber", "Rank", "Degree") VALUES (13, 17, 'доцент', 'к. ф.-м. н.');
INSERT INTO public."Teacher" ("Id", "TabNumber", "Rank", "Degree") VALUES (14, 18, 'профессор', 'д. ф.-м. н.');


--
-- TOC entry 5029 (class 0 OID 0)
-- Dependencies: 219
-- Name: Academic_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Academic_Id_seq"', 1, false);


--
-- TOC entry 5030 (class 0 OID 0)
-- Dependencies: 251
-- Name: Animals_Galeev_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Animals_Galeev_Id_seq"', 1, false);


--
-- TOC entry 5031 (class 0 OID 0)
-- Dependencies: 241
-- Name: Application_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Application_Id_seq"', 1, false);


--
-- TOC entry 5032 (class 0 OID 0)
-- Dependencies: 245
-- Name: Control_Galeev_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Control_Galeev_Id_seq"', 1, false);


--
-- TOC entry 5033 (class 0 OID 0)
-- Dependencies: 247
-- Name: Country_Galeev_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Country_Galeev_Id_seq"', 1, false);


--
-- TOC entry 5034 (class 0 OID 0)
-- Dependencies: 221
-- Name: Country_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Country_Id_seq"', 1, false);


--
-- TOC entry 5035 (class 0 OID 0)
-- Dependencies: 225
-- Name: Department_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Department_Id_seq"', 1, false);


--
-- TOC entry 5036 (class 0 OID 0)
-- Dependencies: 239
-- Name: Discipline_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Discipline_Id_seq"', 11, true);


--
-- TOC entry 5037 (class 0 OID 0)
-- Dependencies: 237
-- Name: Employee_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Employee_Id_seq"', 42, true);


--
-- TOC entry 5038 (class 0 OID 0)
-- Dependencies: 231
-- Name: Engineer_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Engineer_Id_seq"', 1, false);


--
-- TOC entry 5039 (class 0 OID 0)
-- Dependencies: 243
-- Name: Exam_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Exam_Id_seq"', 25, true);


--
-- TOC entry 5040 (class 0 OID 0)
-- Dependencies: 223
-- Name: Faculty_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Faculty_Id_seq"', 1, false);


--
-- TOC entry 5041 (class 0 OID 0)
-- Dependencies: 249
-- Name: Flowers_Galeev_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Flowers_Galeev_Id_seq"', 1, false);


--
-- TOC entry 5042 (class 0 OID 0)
-- Dependencies: 229
-- Name: HeadDepartment_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."HeadDepartment_Id_seq"', 1, false);


--
-- TOC entry 5043 (class 0 OID 0)
-- Dependencies: 257
-- Name: Role_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Role_Id_seq"', 1, false);


--
-- TOC entry 5044 (class 0 OID 0)
-- Dependencies: 227
-- Name: Specialization_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Specialization_Id_seq"', 1, false);


--
-- TOC entry 5045 (class 0 OID 0)
-- Dependencies: 255
-- Name: StudentGimnazia_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."StudentGimnazia_Id_seq"', 1, false);


--
-- TOC entry 5046 (class 0 OID 0)
-- Dependencies: 253
-- Name: StudentTest_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."StudentTest_Id_seq"', 14, true);


--
-- TOC entry 5047 (class 0 OID 0)
-- Dependencies: 235
-- Name: Student_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Student_Id_seq"', 17, true);


--
-- TOC entry 5048 (class 0 OID 0)
-- Dependencies: 233
-- Name: Teacher_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Teacher_Id_seq"', 1, false);


--
-- TOC entry 4773 (class 2606 OID 26051)
-- Name: Academic Academic_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Academic"
    ADD CONSTRAINT "Academic_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 4805 (class 2606 OID 26352)
-- Name: Animals_Galeev Animals_Galeev_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Animals_Galeev"
    ADD CONSTRAINT "Animals_Galeev_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 4795 (class 2606 OID 26276)
-- Name: Application Application_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Application"
    ADD CONSTRAINT "Application_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 4799 (class 2606 OID 26306)
-- Name: Control_Galeev Control_Galeev_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Control_Galeev"
    ADD CONSTRAINT "Control_Galeev_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 4801 (class 2606 OID 26334)
-- Name: Country_Galeev Country_Galeev_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Country_Galeev"
    ADD CONSTRAINT "Country_Galeev_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 4775 (class 2606 OID 26058)
-- Name: Country Country_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Country"
    ADD CONSTRAINT "Country_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 4779 (class 2606 OID 26080)
-- Name: Department Department_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Department"
    ADD CONSTRAINT "Department_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 4793 (class 2606 OID 26247)
-- Name: Discipline Discipline_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Discipline"
    ADD CONSTRAINT "Discipline_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 4791 (class 2606 OID 26218)
-- Name: Employee Employee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Employee"
    ADD CONSTRAINT "Employee_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 4785 (class 2606 OID 26124)
-- Name: Engineer Engineer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Engineer"
    ADD CONSTRAINT "Engineer_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 4797 (class 2606 OID 26283)
-- Name: Exam Exam_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Exam"
    ADD CONSTRAINT "Exam_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 4777 (class 2606 OID 26073)
-- Name: Faculty Faculty_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Faculty"
    ADD CONSTRAINT "Faculty_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 4803 (class 2606 OID 26343)
-- Name: Flowers_Galeev Flowers_Galeev_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Flowers_Galeev"
    ADD CONSTRAINT "Flowers_Galeev_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 4783 (class 2606 OID 26117)
-- Name: HeadDepartment HeadDepartment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HeadDepartment"
    ADD CONSTRAINT "HeadDepartment_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 4811 (class 2606 OID 26443)
-- Name: Role Role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Role"
    ADD CONSTRAINT "Role_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 4781 (class 2606 OID 26096)
-- Name: Specialization Specialization_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Specialization"
    ADD CONSTRAINT "Specialization_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 4809 (class 2606 OID 26382)
-- Name: StudentGimnazia StudentGimnazia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."StudentGimnazia"
    ADD CONSTRAINT "StudentGimnazia_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 4807 (class 2606 OID 26372)
-- Name: StudentTest StudentTest_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."StudentTest"
    ADD CONSTRAINT "StudentTest_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 4789 (class 2606 OID 26138)
-- Name: Student Student_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Student"
    ADD CONSTRAINT "Student_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 4787 (class 2606 OID 26131)
-- Name: Teacher Teacher_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Teacher"
    ADD CONSTRAINT "Teacher_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 4813 (class 2606 OID 26284)
-- Name: Exam Exam_DisciplineId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Exam"
    ADD CONSTRAINT "Exam_DisciplineId_fkey" FOREIGN KEY ("DisciplineId") REFERENCES public."Discipline"("Id");


--
-- TOC entry 4814 (class 2606 OID 26294)
-- Name: Exam Exam_EmployeeId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Exam"
    ADD CONSTRAINT "Exam_EmployeeId_fkey" FOREIGN KEY ("EmployeeId") REFERENCES public."Employee"("Id");


--
-- TOC entry 4815 (class 2606 OID 26289)
-- Name: Exam Exam_StudentId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Exam"
    ADD CONSTRAINT "Exam_StudentId_fkey" FOREIGN KEY ("StudentId") REFERENCES public."Student"("Id");


--
-- TOC entry 4812 (class 2606 OID 26445)
-- Name: Employee FK_Role; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Employee"
    ADD CONSTRAINT "FK_Role" FOREIGN KEY ("RoleId") REFERENCES public."Role"("Id") NOT VALID;


-- Completed on 2025-12-27 00:31:27

--
-- PostgreSQL database dump complete
--

