--
-- PostgreSQL database dump
--

-- Dumped from database version 16.8
-- Dumped by pg_dump version 17.4

-- Started on 2025-05-06 09:21:58

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
-- TOC entry 852 (class 1247 OID 172033)
-- Name: _dbadmin_role_enum; Type: TYPE; Schema: public; Owner: default
--

CREATE TYPE public._dbadmin_role_enum AS ENUM (
    'admin',
    'employee'
);


ALTER TYPE public._dbadmin_role_enum OWNER TO "default";

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 222 (class 1259 OID 3391506)
-- Name: _dbaccesslog; Type: TABLE; Schema: public; Owner: default
--

CREATE TABLE public._dbaccesslog (
    id integer NOT NULL,
    rfidtag character varying NOT NULL,
    "accessDateTime" character varying NOT NULL,
    "accessType" character varying NOT NULL,
    "roleAtAccess" character varying NOT NULL,
    fingerprint1 character varying,
    fingerprint2 character varying,
    "employeeId" integer
);


ALTER TABLE public._dbaccesslog OWNER TO "default";

--
-- TOC entry 221 (class 1259 OID 3391505)
-- Name: _dbaccesslog_id_seq; Type: SEQUENCE; Schema: public; Owner: default
--

CREATE SEQUENCE public._dbaccesslog_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public._dbaccesslog_id_seq OWNER TO "default";

--
-- TOC entry 3387 (class 0 OID 0)
-- Dependencies: 221
-- Name: _dbaccesslog_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: default
--

ALTER SEQUENCE public._dbaccesslog_id_seq OWNED BY public._dbaccesslog.id;


--
-- TOC entry 224 (class 1259 OID 3997700)
-- Name: _dbadmin; Type: TABLE; Schema: public; Owner: default
--

CREATE TABLE public._dbadmin (
    id integer NOT NULL,
    username character varying NOT NULL,
    password character varying NOT NULL,
    email character varying,
    verified boolean DEFAULT false,
    verify_otp character varying(255),
    verify_expiry timestamp without time zone,
    otp_code character varying(255),
    otp_expiry timestamp without time zone,
    "profileImage" character varying(255),
    "lastEmailChange" timestamp without time zone,
    bday character varying,
    phone character varying,
    age character varying,
    address character varying,
    number character varying,
    role public._dbadmin_role_enum DEFAULT 'admin'::public._dbadmin_role_enum NOT NULL
);


ALTER TABLE public._dbadmin OWNER TO "default";

--
-- TOC entry 223 (class 1259 OID 3997699)
-- Name: _dbadmin_id_seq; Type: SEQUENCE; Schema: public; Owner: default
--

CREATE SEQUENCE public._dbadmin_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public._dbadmin_id_seq OWNER TO "default";

--
-- TOC entry 3388 (class 0 OID 0)
-- Dependencies: 223
-- Name: _dbadmin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: default
--

ALTER SEQUENCE public._dbadmin_id_seq OWNED BY public._dbadmin.id;


--
-- TOC entry 216 (class 1259 OID 164043)
-- Name: _dbemployee; Type: TABLE; Schema: public; Owner: default
--

CREATE TABLE public._dbemployee (
    id integer NOT NULL,
    fullname character varying NOT NULL,
    phone character varying NOT NULL,
    email character varying NOT NULL,
    role character varying NOT NULL,
    lastlogdate character varying NOT NULL,
    "profileImage" character varying,
    regdate date DEFAULT ('now'::text)::date NOT NULL,
    rfidtag character varying,
    fingerprint1 character varying,
    fingerprint2 character varying,
    branch character varying,
    deldate date,
    template1 character varying,
    template2 character varying,
    fingerprintfile1 bytea,
    fingerprintfile2 bytea,
    fingerprintfile1name character varying,
    fingerprintfile2name character varying
);


ALTER TABLE public._dbemployee OWNER TO "default";

--
-- TOC entry 215 (class 1259 OID 164042)
-- Name: _dbemployee_id_seq; Type: SEQUENCE; Schema: public; Owner: default
--

CREATE SEQUENCE public._dbemployee_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public._dbemployee_id_seq OWNER TO "default";

--
-- TOC entry 3389 (class 0 OID 0)
-- Dependencies: 215
-- Name: _dbemployee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: default
--

ALTER SEQUENCE public._dbemployee_id_seq OWNED BY public._dbemployee.id;


--
-- TOC entry 220 (class 1259 OID 3391489)
-- Name: _dberror_log; Type: TABLE; Schema: public; Owner: default
--

CREATE TABLE public._dberror_log (
    id integer NOT NULL,
    "errorType" character varying NOT NULL,
    message character varying NOT NULL,
    "timestamp" character varying NOT NULL
);


ALTER TABLE public._dberror_log OWNER TO "default";

--
-- TOC entry 219 (class 1259 OID 3391488)
-- Name: _dberror_log_id_seq; Type: SEQUENCE; Schema: public; Owner: default
--

CREATE SEQUENCE public._dberror_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public._dberror_log_id_seq OWNER TO "default";

--
-- TOC entry 3390 (class 0 OID 0)
-- Dependencies: 219
-- Name: _dberror_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: default
--

ALTER SEQUENCE public._dberror_log_id_seq OWNED BY public._dberror_log.id;


--
-- TOC entry 218 (class 1259 OID 491528)
-- Name: _dblogstotal; Type: TABLE; Schema: public; Owner: default
--

CREATE TABLE public._dblogstotal (
    id integer NOT NULL,
    loginstoday character varying NOT NULL,
    notlogin character varying NOT NULL,
    date date DEFAULT ('now'::text)::date NOT NULL
);


ALTER TABLE public._dblogstotal OWNER TO "default";

--
-- TOC entry 217 (class 1259 OID 491527)
-- Name: _dblogstotal_id_seq; Type: SEQUENCE; Schema: public; Owner: default
--

CREATE SEQUENCE public._dblogstotal_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public._dblogstotal_id_seq OWNER TO "default";

--
-- TOC entry 3391 (class 0 OID 0)
-- Dependencies: 217
-- Name: _dblogstotal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: default
--

ALTER SEQUENCE public._dblogstotal_id_seq OWNED BY public._dblogstotal.id;


--
-- TOC entry 3208 (class 2604 OID 3391509)
-- Name: _dbaccesslog id; Type: DEFAULT; Schema: public; Owner: default
--

ALTER TABLE ONLY public._dbaccesslog ALTER COLUMN id SET DEFAULT nextval('public._dbaccesslog_id_seq'::regclass);


--
-- TOC entry 3209 (class 2604 OID 3997703)
-- Name: _dbadmin id; Type: DEFAULT; Schema: public; Owner: default
--

ALTER TABLE ONLY public._dbadmin ALTER COLUMN id SET DEFAULT nextval('public._dbadmin_id_seq'::regclass);


--
-- TOC entry 3203 (class 2604 OID 164046)
-- Name: _dbemployee id; Type: DEFAULT; Schema: public; Owner: default
--

ALTER TABLE ONLY public._dbemployee ALTER COLUMN id SET DEFAULT nextval('public._dbemployee_id_seq'::regclass);


--
-- TOC entry 3207 (class 2604 OID 3391492)
-- Name: _dberror_log id; Type: DEFAULT; Schema: public; Owner: default
--

ALTER TABLE ONLY public._dberror_log ALTER COLUMN id SET DEFAULT nextval('public._dberror_log_id_seq'::regclass);


--
-- TOC entry 3205 (class 2604 OID 491531)
-- Name: _dblogstotal id; Type: DEFAULT; Schema: public; Owner: default
--

ALTER TABLE ONLY public._dblogstotal ALTER COLUMN id SET DEFAULT nextval('public._dblogstotal_id_seq'::regclass);


--
-- TOC entry 3379 (class 0 OID 3391506)
-- Dependencies: 222
-- Data for Name: _dbaccesslog; Type: TABLE DATA; Schema: public; Owner: default
--

COPY public._dbaccesslog (id, rfidtag, "accessDateTime", "accessType", "roleAtAccess", fingerprint1, fingerprint2, "employeeId") FROM stdin;
1	eadawda	2024-08-08T06:27:55.095+00:00	In	Project Coordinator	1	2	120
2	0966863555	08/08/2024, 15:17:40	In	HR and Recruitment Assistant	1	2	649
3	eadawda	08/08/2024, 15:27:28	In	Project Coordinator	1	2	120
5	0966863555	08/08/2024, 15:30:55	In	HR and Recruitment Assistant	1	2	649
6	235	08/09/2024, 08:04:05	In	Full Stack Developer	1	2	168
7	0966863555	08/09/2024, 08:05:12	In	HR and Recruitment Assistant	1	2	649
9	eadawda	08/09/2024, 08:09:00	In	Project Coordinator	1	2	120
10	eadawda	08/09/2024, 08:43:32	In	Project Coordinator	1	2	120
11	235	08/09/2024, 08:44:40	In	Full Stack Developer	1	2	168
12	852	08/09/2024, 08:46:15	In	Quality Assurance Specialist	1	\N	198
15	852	08/09/2024, 09:04:28	In	Logistics	2	\N	178
17	jer	08/09/2024, 09:52:57	In	Quality Assurance Specialist	23	\N	163
19	0966863555	08/12/2024, 15:46:21	In	HR and Recruitment Assistant	1	2	649
20	0966863555	08/12/2024, 15:46:29	In	HR and Recruitment Assistant	1	2	649
22	0966863555	08/15/2024, 14:40:13	In	HR and Recruitment Assistant	0	1	649
23	0966863555	08/15/2024, 14:46:08	In	HR and Recruitment Assistant	0	1	649
24	sanny	08/19/2024, 13:30:45	In	Chief Executive Officer	2	3	687
26	0909863555	08/19/2024, 15:54:41	In	Full Stack Developer	0	1	649
27	0909863555	08/19/2024, 16:33:21	In	Full Stack Developer	0	1	649
28	0909234003	08/19/2024, 16:55:05	In	Chief Executive Officer	0		687
29	0909863555	08/19/2024, 16:58:11	In	Full Stack Developer	4		649
30	0909863555	08/20/2024, 08:22:20	In	Full Stack Developer	4		649
31	0909234003	08/20/2024, 08:33:33	In	Chief Executive Officer	0		687
32	jer	08/20/2024, 08:39:38	In	Quality Assurance Specialist	5123		163
33	852	08/20/2024, 08:44:34	In	Logistics	6	5	178
34	852	08/20/2024, 08:48:32	In	Logistics	6	5	178
35	jer	08/20/2024, 08:50:24	In	Quality Assurance Specialist	5123		163
36	852	08/20/2024, 08:51:36	In	Logistics	6	5	178
37	1612312	08/20/2024, 08:51:55	In	Quality Assurance Specialist	61		198
38	235	08/20/2024, 09:28:20	In	Full Stack Developer	512		168
39	1235123516512	08/20/2024, 09:35:02	In	Project Manager	5213132		203
41	0771604515	08/20/2024, 09:36:48	In	Quality Assurance Specialist - Team Lead	512312		159
45	0909863555	08/20/2024, 15:07:10	In	Full Stack Developer	4		649
46	0909863555	08/20/2024, 15:18:18	In	Full Stack Developer	4		649
47	0909863555	08/20/2024, 15:33:41	In	Full Stack Developer	4		649
48	0909863555	08/20/2024, 15:35:46	In	Full Stack Developer	4		649
49	0909863555	08/20/2024, 15:36:39	In	Full Stack Developer	4		649
50	0909863555	08/20/2024, 15:37:51	In	Full Stack Developer	4		649
51	0906143331	08/20/2024, 15:51:50	In	Chief Executive Officer	5		162
52	0909863555	08/21/2024, 10:04:54	In	Full Stack Developer	4		649
53	0913225411	08/21/2024, 10:12:49	In	Admin Aide	0		783
54	0909863555	08/21/2024, 10:16:23	In	Full Stack Developer	4	0	649
55	0906143331	08/21/2024, 11:01:36	In	Chief Executive Officer	5		162
56	0909863555	08/21/2024, 12:51:06	In	Full Stack Developer	4	0	649
57	0909863555	08/21/2024, 13:38:46	In	Full Stack Developer	4	0	649
58	0909234003	08/21/2024, 13:51:12	In	Chief Executive Officer	6		687
59	0909234003	08/21/2024, 13:52:37	In	Chief Executive Officer	6		687
60	0772547539	08/21/2024, 13:54:44	In	HR and Recruitment Assistant	7		785
61	0771604515	08/21/2024, 15:25:56	In	Chief Finance Officer	8		161
62	0771604515	08/21/2024, 15:28:27	In	Chief Finance Officer	8		161
63	0772342275	08/21/2024, 15:44:21	In	Full Stack Developer	9		168
64	0909234003	08/21/2024, 15:52:34	In	Chief Executive Officer	6		687
65	0909234003	08/21/2024, 15:54:03	In	Chief Executive Officer	6		687
66	0909234003	08/21/2024, 15:54:49	In	Chief Executive Officer	6		687
67	0909234003	08/21/2024, 15:55:29	In	Chief Executive Officer	6		687
68	0909234003	08/21/2024, 15:56:07	In	Chief Executive Officer	6		687
69	0909234003	08/21/2024, 15:56:23	In	Chief Executive Officer	6		687
70	0909863555	08/22/2024, 12:04:05	In	Full Stack Developer	4	0	649
71	0909234003	08/22/2024, 12:04:33	In	Chief Executive Officer	6		687
72	0909234003	08/28/2024, 10:38:32	In	Chief Executive Officer	6		687
73	0909863555	08/28/2024, 11:24:35	In	Full Stack Developer	4	0	649
74	0909863555	08/28/2024, 14:07:07	In	Full Stack Developer	4	0	649
75	1331839441	08/28/2024, 14:28:19	In	Digital Creative Marketing	11		788
76	1331856295	08/28/2024, 14:29:23	In	Digital Creative Marketing	10		787
78	1331833219	08/28/2024, 14:39:12	In	Logistics	13		178
80	1876115629	08/28/2024, 14:55:32	In	Admin Aide	15		790
81	1331787297	08/28/2024, 14:59:35	In	Developer	16		210
83	1331880954	08/28/2024, 15:19:30	In	Full Stack Developer	18		793
84	1876123142	08/28/2024, 15:25:13	In	Full Stack Developer	19	20	794
85	1876123142	08/28/2024, 15:25:40	In	Full Stack Developer	19	20	794
86	1876130278	08/28/2024, 15:29:50	In	Scrum Master/Product Owner	21	22	795
87	1876130278	08/28/2024, 15:30:10	In	Scrum Master/Product Owner	21	22	795
88	1876116498	08/28/2024, 15:37:56	In	IT Administrator	23	24	185
89	1876116498	08/28/2024, 15:39:14	In	IT Administrator	23	24	185
90	0909863555	08/29/2024, 13:53:29	In	Full Stack Developer	4	0	649
91	0909863555	08/29/2024, 14:17:46	In	Full Stack Developer	4	0	649
92	1876101869	08/29/2024, 14:25:44	In	Full Stack Developer	1	2	167
93	1876101869	08/29/2024, 14:26:09	In	Full Stack Developer	1	2	167
94	1331760816	08/29/2024, 14:31:32	In	UI/UX Designer	3	4	784
95	1331760816	08/29/2024, 14:32:03	In	UI/UX Designer	3	4	784
96	1876101869	08/29/2024, 14:37:15	In	Full Stack Developer	1	2	167
97	1876101869	08/29/2024, 14:37:34	In	Full Stack Developer	1	2	167
98	1331880233	08/29/2024, 14:38:07	In	Back End Developer	5	6	173
99	0909863555	08/29/2024, 14:59:04	In	Full Stack Developer	0		649
100	0909863555	08/29/2024, 15:05:34	In	Full Stack Developer	0		649
101	0909863555	08/29/2024, 15:07:04	In	Full Stack Developer	0		649
102	0772342275	08/29/2024, 15:58:24	In	Full Stack Developer	9		168
103	0909863555	09/05/2024, 08:41:49	In	Full Stack Developer	0		649
104	0909863555	09/05/2024, 14:11:17	In	Full Stack Developer	0		649
105	0909863555	09/05/2024, 14:12:26	In	Full Stack Developer	0		649
106	0909863555	09/05/2024, 14:23:14	In	Full Stack Developer	0		649
107	0909863555	09/05/2024, 14:23:49	In	Full Stack Developer	0		649
108	0909863555	09/05/2024, 15:05:32	In	Full Stack Developer	0		649
109	0909863555	09/11/2024, 13:59:22	In	Full Stack Developer	0		649
110	0909234003	09/11/2024, 14:01:35	In	Chief Executive Officer	12345		687
112	0913225411	09/11/2024, 14:12:27	In	Admin Aide	9186212		783
113	0909863555	09/13/2024, 16:52:59	In	Full Stack Developer	2	3	649
114	0909863555	09/13/2024, 16:54:15	In	Full Stack Developer	2	3	649
115	0909863555	09/17/2024, 13:50:33	In	Full Stack Developer	2	3	649
116	0909863555	09/17/2024, 13:51:57	In	Full Stack Developer	2	3	649
117	0909863555	09/17/2024, 14:25:23	In	Full Stack Developer	2	3	649
118	1876101869	09/17/2024, 14:30:12	In	Full Stack Developer	14	15	167
119	1331787297	09/17/2024, 14:31:50	In	Developer	16	17	210
120	0909863555	09/17/2024, 14:36:39	In	Full Stack Developer	2	3	649
121	1876130278	09/17/2024, 14:39:15	In	Scrum Master/Product Owner	20	21	795
122	0909863555	09/18/2024, 08:10:44	In	Full Stack Developer	2	3	649
126	0772342275	09/19/2024, 14:01:09	In	Full Stack Developer	28	29	168
127	1876130278	09/19/2024, 14:02:10	In	Scrum Master/Product Owner	20	21	795
129	0909863555	09/19/2024, 14:12:36	In	Full Stack Developer	2	3	649
130	0909863555	09/19/2024, 15:15:26	In	Full Stack Developer	2	3	649
131	1332278615	09/19/2024, 15:24:22	In	Admin Aide	34	35	783
132	1332278615	09/19/2024, 15:24:38	In	Admin Aide	34	35	783
133	1331880954	09/19/2024, 15:31:01	In	Full Stack Developer	36	37	793
134	1331880954	09/19/2024, 15:31:32	In	Full Stack Developer	36	37	793
135	1876123142	09/19/2024, 15:33:23	In	Full Stack Developer	38	39	794
136	1876123142	09/19/2024, 15:33:39	In	Full Stack Developer	38	39	794
137	1876115629	09/19/2024, 15:37:01	In	Admin Aide	40	41	790
139	1876116498	09/19/2024, 15:54:21	In	IT Administrator	43	44	185
140	1876116498	09/19/2024, 15:54:49	In	IT Administrator	43	44	185
144	1876123142	09/20/2024, 13:43:04	In	Full Stack Developer	38	39	794
145	1331927637	09/20/2024, 14:24:53	In	Back End Developer	45	46	834
146	1331927637	09/20/2024, 14:25:09	In	Back End Developer	45	46	834
147	2413138727	09/20/2024, 14:26:39	In	Front-end Developer	47	48	835
148	2413138727	09/20/2024, 14:26:55	In	Front-end Developer	47	48	835
149	2413104481	09/20/2024, 14:29:54	In	Project Coordinator	49	50	157
150	2413104481	09/20/2024, 14:30:17	In	Project Coordinator	49	50	157
151	1332278258	09/20/2024, 14:39:28	In	Junior Full Stack Developer	54	55	217
152	1332278258	09/20/2024, 14:39:44	In	Junior Full Stack Developer	54	55	217
153	2413142078	09/20/2024, 14:43:39	In	Maintenance Worker	56	57	118
154	2413142078	09/20/2024, 14:43:59	In	Maintenance Worker	56	57	118
155	2413027717	09/20/2024, 14:44:15	In	Developer	51	52	120
156	2413027717	09/20/2024, 14:44:43	In	Developer	51	52	120
157	2413083178	09/20/2024, 14:50:25	In	PMO Manager	58	59	171
158	2413083178	09/20/2024, 14:50:49	In	PMO Manager	58	59	171
159	1331923851	09/20/2024, 14:55:38	In	Scrum Master/Product Owner	60	61	205
160	1331923851	09/20/2024, 14:56:07	In	Scrum Master/Product Owner	60	61	205
161	1332259323	09/20/2024, 15:02:30	In	Full Stack Developer	62	63	218
162	1332210983	09/20/2024, 15:05:16	In	Quality Assurance Specialist - Team Lead	64	65	843
163	1332210983	09/20/2024, 15:05:32	In	Quality Assurance Specialist - Team Lead	64	65	843
164	1332273475	09/20/2024, 15:08:18	In	Quality Assurance Specialist	66	67	198
165	1332273475	09/20/2024, 15:09:01	In	Quality Assurance Specialist	66	67	198
166	0909234003	09/23/2024, 10:11:58	In	Developer	68	69	687
167	0909234003	09/23/2024, 10:12:16	In	Developer	68	69	687
168	1876101869	09/23/2024, 14:53:12	In	Full Stack Developer	14	15	167
169	0909234003	09/23/2024, 15:03:45	In	Developer	68	69	687
170	0909234003	09/23/2024, 15:59:43	In	Developer	68	69	687
171	1876130278	09/23/2024, 16:34:30	In	Scrum Master/Product Owner	20	21	795
172	0772342275	09/23/2024, 16:44:04	In	Full Stack Developer	28	29	168
173	0909234003	09/24/2024, 10:39:56	In	Developer	68	69	687
174	0909234003	09/24/2024, 10:51:43	In	Developer	68	69	687
175	1331927637	09/24/2024, 10:54:26	In	Back End Developer	45	46	834
176	1332210983	09/24/2024, 11:14:07	In	Quality Assurance Specialist - Team Lead	64	65	843
177	1876253785	09/24/2024, 12:36:23	In	Liaison Officer	13		181
178	1331856295	09/24/2024, 13:03:19	In	Digital Creative Marketing	4	5	787
179	1331923851	09/24/2024, 13:05:53	In	Scrum Master/Product Owner	60	61	205
180	1331760816	09/24/2024, 13:10:40	In	UI/UX Designer	30	31	784
181	1876116498	09/24/2024, 13:35:20	In	IT Administrator	43	44	185
182	1332259323	09/24/2024, 13:54:51	In	Full Stack Developer	62	63	218
183	1876103302	09/24/2024, 13:57:13	In	UI/UX Designer	22	23	807
184	1331905588	09/24/2024, 13:58:04	In	HR and Recruitment Assistant	6	7	169
185	1331760816	09/24/2024, 14:02:49	In	UI/UX Designer	30	31	784
186	1331760816	09/24/2024, 15:34:51	In	UI/UX Designer	30	31	784
187	1876103302	09/24/2024, 15:35:14	In	UI/UX Designer	22	23	807
188	1331981345	09/24/2024, 15:36:09	In	Developer	53		836
189	1332278615	09/24/2024, 16:07:02	In	Admin Aide	34	35	783
190	1876115629	09/24/2024, 16:08:19	In	Admin Aide	40	41	790
191	0909863555	09/25/2024, 10:40:16	In	Full Stack Developer	2	3	649
192	1332210983	09/26/2024, 08:35:10	In	Quality Assurance Specialist - Team Lead	64	65	843
193	1876101869	09/26/2024, 08:35:32	In	Full Stack Developer	14	15	167
194	1876101869	09/26/2024, 08:56:44	In	Full Stack Developer	14	15	167
195	1876123142	09/26/2024, 09:02:48	In	Full Stack Developer	38	39	794
196	1876101869	09/26/2024, 09:09:51	In	Full Stack Developer	14	15	167
197	1331880954	09/26/2024, 09:10:19	In	Full Stack Developer	36	37	793
198	1332210983	09/26/2024, 09:10:41	In	Quality Assurance Specialist - Team Lead	64	65	843
199	2413091052	09/26/2024, 09:27:25	In	TVI Head	24	25	866
200	1331841869	09/26/2024, 09:48:37	In	HR Consultant	8	9	865
201	2413091052	09/26/2024, 09:54:33	In	TVI Head	24	25	866
202	1876103302	09/26/2024, 09:56:20	In	UI/UX Designer	22	23	807
203	1876123142	09/26/2024, 09:57:15	In	Full Stack Developer	38	39	794
204	1331841869	09/26/2024, 11:13:23	In	HR Consultant	8	9	865
205	1331981345	09/26/2024, 11:13:38	In	Developer	53		836
206	1331923851	09/26/2024, 11:16:06	In	Scrum Master/Product Owner	60	61	205
207	1331841869	09/26/2024, 11:16:24	In	HR Consultant	8	9	865
208	1875999242	09/26/2024, 13:26:20	In	Project Manager	76	77	187
209	1331986293	09/26/2024, 13:56:51	In	Junior Full Stack Developer	54	55	217
210	0909234003	09/26/2024, 13:59:21	In	Developer	68	69	687
211	2413142078	09/26/2024, 13:59:39	In	Developer	56	57	118
212	0771071059	09/26/2024, 15:19:06	In	TVI Head	26	27	864
213	2413142078	09/26/2024, 17:01:53	In	Developer	56	57	118
214	2413142078	09/26/2024, 17:02:22	In	Developer	56	57	118
215	2413142078	09/26/2024, 17:03:40	In	Developer	56	57	118
216	1876070164	09/26/2024, 17:07:51	In	Quality Assurance Specialist	18	19	806
217	2413027717	09/26/2024, 17:13:41	In	Developer	51	52	120
218	0909234003	09/26/2024, 17:29:46	In	Developer	68	69	687
219	1331839441	09/26/2024, 17:30:18	In	Digital Creative Marketing	10	11	788
220	2413027717	09/26/2024, 17:30:34	In	Developer	51	52	120
221	2413142078	09/26/2024, 17:30:51	In	Developer	56	57	118
222	1875999242	09/26/2024, 17:35:01	In	Project Manager	76	77	187
223	2413027717	09/26/2024, 17:35:18	In	Developer	51	52	120
224	2413142078	09/26/2024, 17:35:37	In	Developer	56	57	118
225	0909234003	09/26/2024, 17:36:04	In	Developer	68	69	687
226	2413142078	09/26/2024, 17:36:24	In	Developer	56	57	118
227	0909234003	09/26/2024, 17:36:43	In	Developer	68	69	687
228	2413027717	09/26/2024, 17:37:49	In	Developer	51	52	120
229	1876253785	09/26/2024, 17:43:54	In	Liaison Officer	13		181
230	1876115629	09/27/2024, 12:47:19	In	Admin Aide	40	41	790
231	1876115629	09/27/2024, 12:47:20	In	Admin Aide	40	41	790
232	0909234003	09/27/2024, 13:38:54	In	Driver/ Maintenance	68	69	687
233	0909234003	09/27/2024, 13:39:14	In	Driver/ Maintenance	68	69	687
234	0909234003	09/27/2024, 13:40:08	In	Driver/ Maintenance	68	69	687
235	0909234003	09/27/2024, 13:41:55	In	Driver/ Maintenance	68	69	687
236	0909234003	09/27/2024, 13:44:18	In	Driver/ Maintenance	68	69	687
237	0909234003	09/27/2024, 13:48:55	In	Driver/ Maintenance	68	69	687
238	0909234003	09/27/2024, 13:52:12	In	Driver/ Maintenance	68	69	687
239	0909234003	09/27/2024, 14:04:27	In	Driver/ Maintenance	68	69	687
240	0909234003	09/27/2024, 14:04:43	In	Driver/ Maintenance	68	69	687
241	0909234003	09/27/2024, 14:04:59	In	Driver/ Maintenance	68	69	687
242	0909234003	09/27/2024, 14:05:48	In	Driver/ Maintenance	68	69	687
243	0909234003	09/27/2024, 14:06:04	In	Driver/ Maintenance	68	69	687
244	0909234003	09/27/2024, 14:06:44	In	Driver/ Maintenance	68	69	687
245	0909234003	09/27/2024, 14:08:01	In	Driver/ Maintenance	68	69	687
246	0771071059	09/27/2024, 14:19:22	In	TVI Head	26	27	864
247	1876101869	09/27/2024, 14:20:59	In	Full Stack Developer	14	15	167
248	0909234003	09/30/2024, 08:57:46	In	Admin Aide	68	69	687
249	0909234003	09/30/2024, 08:58:08	In	Admin Aide	68	69	687
250	0909234003	09/30/2024, 08:58:31	In	Admin Aide	68	69	687
251	1876101869	09/30/2024, 09:03:49	In	Full Stack Developer	14	15	167
252	2413027717	09/30/2024, 09:07:01	In	Full Stack Developer	51	52	120
253	2413027717	09/30/2024, 09:09:18	In	Full Stack Developer	51	52	120
254	0909234003	09/30/2024, 09:22:58	In	Admin Aide	68	69	687
255	0909234003	09/30/2024, 09:25:32	In	Admin Aide	68	69	687
256	0909234003	09/30/2024, 09:26:08	In	Admin Aide	68	69	687
257	1332221550	09/30/2024, 09:29:35	In	UI/UX Designer	80	81	1014
258	1332265826	09/30/2024, 09:35:33	In	Logistics Assistant	82	83	1017
259	1332265826	09/30/2024, 09:36:18	In	Logistics Assistant	82	83	1017
260	0909863555	09/30/2024, 09:40:41	In	Full Stack Developer	2	3	649
261	1332265826	09/30/2024, 09:42:05	In	Logistics Assistant	82	83	1017
262	1332265826	09/30/2024, 09:42:33	In	Logistics Assistant	82	83	1017
263	1331905588	09/30/2024, 09:44:40	In	HR and Recruitment Assistant	6	7	169
264	1876103302	09/30/2024, 09:48:22	In	UI/UX Designer	22	23	807
265	1876103302	09/30/2024, 09:52:20	In	UI/UX Designer	22	23	807
266	2413142078	09/30/2024, 10:04:56	In	QA Manager	56	57	118
267	1876115629	09/30/2024, 10:57:38	In	Admin Aide	40	41	790
268	1876115629	09/30/2024, 10:58:44	In	Admin Aide	40	41	790
269	0909234003	09/30/2024, 11:58:20	In	Admin Aide	68	69	687
270	0909234003	09/30/2024, 11:58:47	In	Admin Aide	68	69	687
271	0909863555	09/30/2024, 11:59:26	In	Full Stack Developer	2	3	649
272	0909863555	09/30/2024, 12:17:31	In	Full Stack Developer	2	3	649
273	0909863555	09/30/2024, 12:18:00	In	Full Stack Developer	2	3	649
274	0909863555	09/30/2024, 13:26:10	In	Full Stack Developer	2	3	649
275	0909863555	09/30/2024, 14:04:03	In	Full Stack Developer	2	3	649
276	0909234003	09/30/2024, 15:06:48	In	Admin Aide	68	69	687
277	0909234003	09/30/2024, 15:09:37	In	Admin Aide	68	69	687
278	1876101869	09/30/2024, 15:12:53	In	Full Stack Developer	14	15	167
279	1331880233	09/30/2024, 15:13:30	In	Back End Developer	32	33	173
280	0909234003	09/30/2024, 15:13:57	In	Admin Aide	68	69	687
281	1331880233	09/30/2024, 15:21:26	In	Back End Developer	32	33	173
282	0909863555	09/30/2024, 15:27:41	In	Guest	2	3	649
283	0909863555	09/30/2024, 15:32:34	In	Guest	2	3	649
284	0909863555	09/30/2024, 15:33:49	In	Guest	2	3	649
285	1332265826	09/30/2024, 15:36:29	In	Logistics Assistant	82	83	1017
286	0909234003	09/30/2024, 15:37:40	In	Admin Aide	68	69	687
287	0909863555	09/30/2024, 15:43:10	In	Guest	2	3	649
288	0909863555	09/30/2024, 15:43:58	In	Guest	2	3	649
289	0909863555	09/30/2024, 15:44:40	In	Guest	2	3	649
290	0909863555	09/30/2024, 15:45:27	In	Guest	2	3	649
291	0909863555	09/30/2024, 15:45:56	In	Guest	2	3	649
292	0909863555	09/30/2024, 15:46:51	In	Guest	2	3	649
293	0909863555	09/30/2024, 15:47:46	In	Guest	2	3	649
294	0909863555	09/30/2024, 15:48:42	In	Guest	2	3	649
295	0909863555	09/30/2024, 15:51:46	In	Guest	2	3	649
296	0909863555	09/30/2024, 15:52:38	In	Guest	2	3	649
297	0909863555	09/30/2024, 15:53:16	In	Guest	2	3	649
298	0909863555	09/30/2024, 15:55:02	In	Guest	2	3	649
299	0909863555	09/30/2024, 15:55:51	In	Guest	2	3	649
300	0909863555	09/30/2024, 15:56:13	In	Guest	2	3	649
301	0909234003	09/30/2024, 15:57:38	In	Full Stack Developer	68	69	687
302	0909234003	09/30/2024, 15:58:21	In	Full Stack Developer	68	69	687
303	0909234003	09/30/2024, 15:58:53	In	Full Stack Developer	68	69	687
304	0909234003	09/30/2024, 15:59:41	In	Full Stack Developer	68	69	687
305	1876101869	09/30/2024, 16:01:08	In	Full Stack Developer	14	15	167
306	0909234003	09/30/2024, 16:01:33	In	Full Stack Developer	68	69	687
307	0909234003	09/30/2024, 16:02:35	In	Full Stack Developer	68	69	687
308	0909234003	09/30/2024, 16:19:24	In	Full Stack Developer	68	69	687
309	1332265826	09/30/2024, 16:19:51	In	Logistics Assistant	82	83	1017
310	0909234003	09/30/2024, 16:27:29	In	Full Stack Developer	68	69	687
311	0909234003	09/30/2024, 16:27:41	In	Full Stack Developer	68	69	687
312	0909863555	09/30/2024, 16:31:32	In	Guest	2	3	649
313	0909234003	09/30/2024, 16:37:32	In	Full Stack Developer	68	69	687
314	1332278615	09/30/2024, 16:40:33	In	Admin Aide	34	35	783
315	2413027717	09/30/2024, 20:44:22	In	Full Stack Developer	51	52	120
316	2413027717	09/30/2024, 22:08:02	In	Full Stack Developer	51	52	120
317	2413027717	09/30/2024, 22:09:05	In	Full Stack Developer	51	52	120
318	2413142078	10/01/2024, 07:40:37	In	QA Manager	56	57	118
319	2413142078	10/01/2024, 07:42:50	In	QA Manager	56	57	118
320	2413142078	10/01/2024, 07:48:25	In	QA Manager	56	57	118
321	2413142078	10/01/2024, 07:50:43	In	QA Manager	56	57	118
322	2413027717	10/01/2024, 07:51:59	In	Full Stack Developer	51	52	120
323	1331841869	10/01/2024, 08:00:38	In	HR Consultant	8	9	865
324	1331839441	10/01/2024, 08:06:49	In	Digital Creative Marketing	10	11	788
325	1332278615	10/01/2024, 08:16:48	In	Admin Aide	34	35	783
326	1332265826	10/01/2024, 08:17:58	In	Logistics Assistant	82	83	1017
327	1332278615	10/01/2024, 08:21:16	In	Admin Aide	34	35	783
328	1331833219	10/01/2024, 08:44:29	In	Logistics	12		178
329	0909863555	10/01/2024, 08:48:30	In	Full Stack Developer	2	3	649
330	0909863555	10/01/2024, 09:19:14	In	Full Stack Developer	2	3	649
331	0909863555	10/01/2024, 09:20:59	In	Full Stack Developer	2	3	649
332	0909863555	10/01/2024, 09:29:09	In	Full Stack Developer	2	3	649
333	0909863555	10/01/2024, 09:34:27	In	Full Stack Developer	2	3	649
334	1331856295	10/01/2024, 09:37:28	In	Digital Creative Marketing	4	5	787
335	1331856295	10/01/2024, 09:38:01	In	Digital Creative Marketing	4	5	787
336	1875985940	10/01/2024, 09:54:12	In	Admin Aide	84	85	1031
337	1875985940	10/01/2024, 09:55:07	In	Admin Aide	84	85	1031
338	1331981345	10/01/2024, 10:07:32	In	Developer	53		836
339	0909863555	10/01/2024, 10:10:49	In	Full Stack Developer	2	3	649
340	0771071059	10/01/2024, 10:12:50	In	TVI Head	24	25	864
341	2413091052	10/01/2024, 10:13:05	In	TVI Head	26	27	866
342	0909863555	10/01/2024, 10:21:19	In	Full Stack Developer	2	3	649
343	1876101869	10/01/2024, 10:24:24	In	Full Stack Developer	14	15	167
344	0909863555	10/01/2024, 10:25:54	In	Full Stack Developer	2	3	649
345	1332278615	10/01/2024, 10:29:36	In	Admin Aide	34	35	783
346	1331833219	10/01/2024, 10:36:18	In	Logistics	12		178
347	0909863555	10/01/2024, 10:45:26	In	Full Stack Developer	2	3	649
348	0909863555	10/01/2024, 10:49:53	In	Full Stack Developer	2	3	649
349	0909863555	10/01/2024, 10:54:13	In	Full Stack Developer	2	3	649
350	2413027717	10/01/2024, 10:57:18	In	Full Stack Developer	51	52	120
351	0909863555	10/01/2024, 11:28:07	In	Full Stack Developer	2	3	649
352	0772342275	10/01/2024, 11:50:04	In	Full Stack Developer	28	29	168
353	0909863555	10/01/2024, 11:58:44	In	Full Stack Developer	2	3	649
354	1332221550	10/01/2024, 12:04:30	In	UI/UX Designer	80	81	1014
355	1061279271	10/01/2024, 12:13:11	In	Full Stack Developer	36	37	793
356	1876116498	10/01/2024, 12:19:02	In	IT Administrator	43	44	185
357	1331880233	10/01/2024, 12:23:50	In	Back End Developer	32	33	173
358	0909863555	10/01/2024, 12:52:44	In	Full Stack Developer	2	3	649
359	test	10/01/2024, 13:35:24	In	Admin Aide	test1	test2	1030
360	test	10/01/2024, 14:42:23	In	Admin Aide	test1	test2	1030
361	0909863555	10/02/2024, 08:21:59	In	Full Stack Developer	2	3	649
362	0909863555	10/02/2024, 08:23:26	In	Full Stack Developer	2	3	649
363	0909863555	10/02/2024, 08:24:15	In	Full Stack Developer	2	3	649
364	0909863555	10/02/2024, 09:19:40	In	Full Stack Developer	2	3	649
365	1875985940	10/02/2024, 09:23:24	In	Admin Aide	84	85	1031
366	1332265826	10/02/2024, 09:32:53	In	Logistics Assistant	82	83	1017
367	1876123142	10/02/2024, 09:40:40	In	Full Stack Developer	38	39	794
368	1332278615	10/02/2024, 09:56:18	In	Admin Aide	34	35	783
369	1331841869	10/02/2024, 10:05:47	In	HR Consultant	8	9	865
370	0909234003	10/02/2024, 14:18:46	In	Full Stack Developer	68	69	687
371	0909234003	10/02/2024, 14:21:33	In	Full Stack Developer	68	69	687
372	0909234003	10/02/2024, 14:23:04	In	Full Stack Developer	68	69	687
373	0909234003	10/02/2024, 14:23:41	In	Full Stack Developer	68	69	687
374	1332278615	10/02/2024, 14:27:58	In	Admin Aide	34	35	783
375	2413142078	10/02/2024, 14:34:19	In	QA Manager	56	57	118
376	1332278615	10/03/2024, 06:46:47	In	Admin Aide	34	35	783
377	2413091052	10/03/2024, 07:10:23	In	TVI Head	26	27	866
378	1331856295	10/03/2024, 07:20:48	In	Digital Creative Marketing	4	5	787
379	1332265826	10/03/2024, 07:24:23	In	Logistics Assistant	82	83	1017
380	2413027717	10/03/2024, 07:51:38	In	Full Stack Developer	51	52	120
381	1876101869	10/03/2024, 07:53:16	In	Full Stack Developer	14	15	167
382	1875985940	10/03/2024, 07:56:25	In	Admin Aide	84	85	1031
383	1331841869	10/03/2024, 07:59:11	In	HR Consultant	8	9	865
384	1876070164	10/03/2024, 08:00:45	In	Quality Assurance Specialist	18	19	806
385	2413027717	10/03/2024, 10:24:30	In	Full Stack Developer	51	52	120
386	2413027717	10/03/2024, 10:25:09	In	Full Stack Developer	51	52	120
387	2413027717	10/03/2024, 10:25:53	In	Full Stack Developer	51	52	120
388	2413027717	10/03/2024, 10:28:30	In	Full Stack Developer	51	52	120
389	1061279271	10/03/2024, 10:30:03	In	Full Stack Developer	36	37	793
390	2413027717	10/03/2024, 10:31:42	In	Full Stack Developer	51	52	120
391	0771071059	10/03/2024, 11:03:59	In	TVI Head	24	25	864
392	1876101869	10/03/2024, 11:16:59	In	Full Stack Developer	14	15	167
393	2413027717	10/03/2024, 13:35:09	In	Full Stack Developer	51	52	120
394	2413027717	10/03/2024, 13:35:22	In	Full Stack Developer	51	52	120
395	2413027717	10/03/2024, 13:40:09	In	Full Stack Developer	51	52	120
396	1331905588	10/03/2024, 15:32:44	In	HR and Recruitment Assistant	6	7	169
397	2413027717	10/03/2024, 15:52:36	In	Full Stack Developer	51	52	120
398	1876101869	10/03/2024, 15:55:32	In	Full Stack Developer	14	15	167
399	1875985940	10/03/2024, 15:58:33	In	Admin Aide	84	85	1031
400	2413027717	10/04/2024, 09:31:33	In	Full Stack Developer	51	52	120
401	1332269941	10/04/2024, 09:41:28	In	Administrative Assistant	88		1043
402	1332269941	10/04/2024, 09:42:25	In	Administrative Assistant	88		1043
403	1332269941		In	Developer	88	87	1042
404	1332269941		In	Developer	88	87	1042
405	1332269941	10/04/2024, 09:44:23	In	Administrative Assistant	88		1043
406	1332269941	10/04/2024, 09:46:00	In	Developer	88	87	1042
407	1332269941		In	Developer	87	89	1044
408	1332269941	10/04/2024, 10:00:17	In	Developer	88	87	1042
409	2413027717	10/04/2024, 10:02:34	In	Full Stack Developer	51	52	120
410	2413027717	10/04/2024, 10:03:59	In	Full Stack Developer	51	52	120
411	0909234003	10/08/2024, 16:46:17	In	Full Stack Developer	68	69	687
412	0909234003	10/08/2024, 16:46:54	In	Full Stack Developer	68	69	687
413	0909234003	10/08/2024, 16:47:32	In	Full Stack Developer	68	69	687
414	0909234003	10/08/2024, 16:48:20	In	Full Stack Developer	68	69	687
415	0909234003	10/08/2024, 16:49:30	In	Full Stack Developer	68	69	687
416	0909234003	10/09/2024, 09:28:38	In	Full Stack Developer	68	69	687
417	0909863555	10/09/2024, 09:43:08	In	Full Stack Developer	2	3	649
418	0909863555	10/09/2024, 09:54:21	In	Full Stack Developer	2	3	649
419	0909234003	10/09/2024, 09:59:56	In	Full Stack Developer	68	69	687
420	0909234003	10/09/2024, 10:00:20	In	Full Stack Developer	68	69	687
421	0909234003	10/09/2024, 10:00:32	In	Full Stack Developer	68	69	687
422	0909234003	10/09/2024, 10:00:44	In	Full Stack Developer	68	69	687
423	0909234003	10/09/2024, 10:00:55	In	Full Stack Developer	68	69	687
424	0909234003	10/09/2024, 10:01:06	In	Full Stack Developer	68	69	687
425	3275030810	10/09/2024, 10:20:10	In	Chief Executive Officer	74	75	875
426	3275030810	10/09/2024, 10:20:26	In	Chief Executive Officer	74	75	875
427	3275030810	10/09/2024, 10:20:38	In	Chief Executive Officer	74	75	875
428	3275030810	10/09/2024, 10:20:47	In	Chief Executive Officer	74	75	875
429	3275030810	10/09/2024, 10:20:57	In	Chief Executive Officer	74	75	875
430	3275030810	10/09/2024, 10:21:07	In	Chief Executive Officer	74	75	875
431	3275030810	10/09/2024, 10:21:16	In	Chief Executive Officer	74	75	875
432	3275030810	10/09/2024, 10:21:43	In	Chief Executive Officer	74	75	875
433	3275030810	10/09/2024, 10:21:53	In	Chief Executive Officer	74	75	875
434	3275030810	10/09/2024, 10:22:02	In	Chief Executive Officer	74	75	875
435	0909234003	10/09/2024, 10:22:30	In	Full Stack Developer	68	69	687
436	0909234003	10/09/2024, 10:22:39	In	Full Stack Developer	68	69	687
437	0909234003	10/09/2024, 10:22:48	In	Full Stack Developer	68	69	687
438	0909234003	10/09/2024, 10:22:58	In	Full Stack Developer	68	69	687
439	0909234003	10/09/2024, 10:23:07	In	Full Stack Developer	68	69	687
440	0909234003	10/09/2024, 10:23:17	In	Full Stack Developer	68	69	687
441	0909234003	10/09/2024, 10:23:26	In	Full Stack Developer	68	69	687
442	0909234003	10/09/2024, 10:23:36	In	Full Stack Developer	68	69	687
443	0909234003	10/09/2024, 10:23:45	In	Full Stack Developer	68	69	687
444	0909234003	10/09/2024, 10:23:55	In	Full Stack Developer	68	69	687
445	3275030810	10/09/2024, 10:31:40	In	Chief Executive Officer	74	75	875
446	3275030810	10/09/2024, 10:31:50	In	Chief Executive Officer	74	75	875
447	3275030810	10/09/2024, 10:32:10	In	Chief Executive Officer	74	75	875
448	0909234003	10/09/2024, 10:43:06	In	Full Stack Developer	68	69	687
449	0909234003	10/09/2024, 10:43:37	In	Full Stack Developer	68	69	687
450	0909234003	10/09/2024, 10:43:47	In	Full Stack Developer	68	69	687
451	0909234003	10/09/2024, 10:44:02	In	Full Stack Developer	68	69	687
452	0909234003	10/09/2024, 10:44:14	In	Full Stack Developer	68	69	687
453	0909234003	10/09/2024, 10:44:23	In	Full Stack Developer	68	69	687
454	0909234003	10/09/2024, 10:44:33	In	Full Stack Developer	68	69	687
455	0909234003	10/09/2024, 10:45:05	In	Full Stack Developer	68	69	687
456	3275030810	10/09/2024, 10:45:28	In	Chief Executive Officer	74	75	875
457	3275030810	10/09/2024, 10:45:58	In	Chief Executive Officer	74	75	875
458	3275030810	10/09/2024, 10:46:31	In	Chief Executive Officer	74	75	875
459	3275030810	10/09/2024, 10:46:51	In	Chief Executive Officer	74	75	875
460	3275030810	10/09/2024, 10:47:01	In	Chief Executive Officer	74	75	875
461	3275030810	10/09/2024, 10:47:15	In	Chief Executive Officer	74	75	875
462	3275030810	10/09/2024, 10:47:45	In	Chief Executive Officer	74	75	875
463	3274950492	10/09/2024, 10:48:12	In	Developer	72	73	874
464	3473018457	10/09/2024, 10:48:22	In	Chief Executive Officer	70	71	873
465	3274950492	10/09/2024, 10:54:09	In	Developer	72	73	874
466	3274950492	10/09/2024, 10:54:18	In	Developer	72	73	874
467	3274950492	10/09/2024, 10:54:39	In	Developer	72	73	874
468	3274950492	10/09/2024, 10:54:58	In	Developer	72	73	874
469	3274950492	10/09/2024, 10:55:15	In	Developer	72	73	874
470	3274950492	10/09/2024, 10:55:44	In	Developer	72	73	874
471	3274950492	10/09/2024, 10:55:54	In	Developer	72	73	874
472	3274950492	10/09/2024, 10:56:01	In	Developer	72	73	874
473	3274950492	10/09/2024, 10:56:59	In	Developer	72	73	874
474	3274950492	10/09/2024, 10:57:09	In	Developer	72	73	874
475	3473018457	10/09/2024, 11:11:14	In	Chief Executive Officer	70	71	873
476	3473018457	10/09/2024, 11:11:54	In	Chief Executive Officer	70	71	873
477	3473018457	10/09/2024, 11:12:20	In	Chief Executive Officer	70	71	873
478	3274950492	10/09/2024, 11:13:35	In	Developer	72	73	874
479	3473018457	10/09/2024, 13:09:14	In	Chief Executive Officer	70	71	873
480	3473018457	10/09/2024, 13:10:55	In	Chief Executive Officer	70	71	873
481	3473018457	10/09/2024, 13:11:22	In	Chief Executive Officer	70	71	873
482	3473018457	10/09/2024, 13:13:27	In	Chief Executive Officer	70	71	873
483	3473018457	10/09/2024, 13:13:47	In	Chief Executive Officer	70	71	873
484	3275030810	10/09/2024, 13:14:16	In	Chief Executive Officer	74	75	875
485	3274950492	10/09/2024, 13:17:11	In	Developer	72	73	874
486	3275030810	10/09/2024, 13:18:12	In	Chief Executive Officer	74	75	875
487	3473018457	10/09/2024, 13:18:54	In	Chief Executive Officer	70	71	873
488	1876101869	10/09/2024, 14:18:14	In	Full Stack Developer	14	15	167
489	3473018457	10/09/2024, 14:25:47	In	Chief Executive Officer	70	71	873
490	3275030810	10/09/2024, 14:26:18	In	Chief Executive Officer	74	75	875
491	1332265826	10/09/2024, 14:49:33	In	Logistics Assistant	82	83	1017
492	1876123142	10/09/2024, 14:55:27	In	Full Stack Developer	38	39	794
493	3473018457	10/09/2024, 15:41:46	In	Chief Executive Officer	70	71	873
494	3473018457	10/09/2024, 15:42:27	In	Chief Executive Officer	70	71	873
495	3275030810	10/09/2024, 15:56:19	In	Chief Executive Officer	74	75	875
496	0909234003	10/10/2024, 07:42:53	In	Full Stack Developer	68	69	687
497	0909234003	10/10/2024, 07:43:17	In	Full Stack Developer	68	69	687
498	0909234003	10/10/2024, 07:43:39	In	Full Stack Developer	68	69	687
499	0909234003	10/10/2024, 07:44:02	In	Full Stack Developer	68	69	687
500	0909234003	10/10/2024, 07:44:26	In	Full Stack Developer	68	69	687
501	0909234003	10/10/2024, 07:44:51	In	Full Stack Developer	68	69	687
502	0909234003	10/10/2024, 07:45:17	In	Full Stack Developer	68	69	687
503	0909234003	10/10/2024, 07:45:40	In	Full Stack Developer	68	69	687
504	0909234003	10/10/2024, 07:46:23	In	Full Stack Developer	68	69	687
505	0909234003	10/10/2024, 07:46:46	In	Full Stack Developer	68	69	687
506	0909234003	10/10/2024, 07:56:50	In	Full Stack Developer	68	69	687
507	0909234003	10/10/2024, 07:58:05	In	Full Stack Developer	68	69	687
508	0909234003	10/10/2024, 07:58:56	In	Full Stack Developer	68	69	687
509	3473018457	10/10/2024, 09:05:52	In	Chief Executive Officer	70	71	873
510	3473018457	10/10/2024, 09:06:19	In	Chief Executive Officer	70	71	873
511	3473018457	10/10/2024, 09:08:31	In	Chief Executive Officer	70	71	873
512	3473018457	10/10/2024, 09:09:00	In	Chief Executive Officer	70	71	873
513	0909863555	10/10/2024, 09:10:47	In	Full Stack Developer	2	3	649
514	3275030810	10/10/2024, 09:13:35	In	Chief Executive Officer	74	75	875
515	0909234003	10/10/2024, 09:13:52	In	Full Stack Developer	68	69	687
516	0909234003	10/10/2024, 09:14:16	In	Full Stack Developer	68	69	687
517	0909234003	10/10/2024, 09:14:44	In	Full Stack Developer	68	69	687
518	0909234003	10/10/2024, 09:14:53	In	Full Stack Developer	68	69	687
519	0909234003	10/10/2024, 09:17:31	In	Full Stack Developer	68	69	687
520	0909234003	10/10/2024, 09:18:31	In	Full Stack Developer	68	69	687
521	3275030810	10/10/2024, 09:19:30	In	Chief Executive Officer	74	75	875
522	0909234003	10/10/2024, 09:23:01	In	Full Stack Developer	68	69	687
523	3275030810	10/10/2024, 09:23:43	In	Chief Executive Officer	74	75	875
524	3275030810	10/10/2024, 09:23:56	In	Chief Executive Officer	74	75	875
525	3275030810	10/10/2024, 09:24:23	In	Chief Executive Officer	74	75	875
526	3473018457	10/10/2024, 09:26:24	In	Chief Executive Officer	70	71	873
527	3473018457	10/10/2024, 09:55:21	In	Chief Executive Officer	70	71	873
528	0909863555	10/10/2024, 10:04:07	In	Full Stack Developer	2	3	649
529	0909863555	10/10/2024, 10:04:30	In	Full Stack Developer	2	3	649
530	0909863555	10/10/2024, 10:04:54	In	Full Stack Developer	2	3	649
531	0909863555	10/10/2024, 10:05:19	In	Full Stack Developer	2	3	649
532	3473018457	10/10/2024, 10:08:27	In	Chief Executive Officer	70	71	873
533	3473018457	10/10/2024, 10:19:35	In	Chief Executive Officer	70	71	873
534	3473018457	10/10/2024, 10:24:41	In	Chief Executive Officer	70	71	873
535	3275030810	10/10/2024, 10:25:05	In	Chief Executive Officer	74	75	875
536	3473018457	10/10/2024, 11:36:30	In	Chief Executive Officer	70	71	873
537	3473018457	10/10/2024, 11:37:26	In	Chief Executive Officer	70	71	873
538	3473018457	10/10/2024, 11:37:55	In	Chief Executive Officer	70	71	873
539	3473018457	10/10/2024, 12:13:58	In	Chief Executive Officer	70	71	873
540	0909863555	10/10/2024, 12:17:56	In	Full Stack Developer	2	3	649
541	3473018457	10/10/2024, 12:20:18	In	Chief Executive Officer	70	71	873
542	3275030810	10/10/2024, 12:24:20	In	Chief Executive Officer	74	75	875
543	3473018457	10/10/2024, 12:25:11	In	Chief Executive Officer	70	71	873
544	3275030810	10/10/2024, 12:29:10	In	Chief Executive Officer	74	75	875
545	3473018457	10/10/2024, 12:30:04	In	Chief Executive Officer	70	71	873
546	0771071059	10/10/2024, 12:34:23	In	TVI Head	24	25	864
547	1876123142	10/10/2024, 12:49:32	In	Full Stack Developer	38	39	794
548	1332278615	10/10/2024, 13:04:23	In	Admin Aide	34	35	783
549	1332265826	10/10/2024, 13:13:03	In	Logistics Assistant	82	83	1017
550	0909863555	10/10/2024, 13:44:58	In	Full Stack Developer	2	3	649
551	3274950492	10/10/2024, 13:56:02	In	Developer	72	73	874
552	0909863555	10/10/2024, 14:31:08	In	Full Stack Developer	2	3	649
553	0909863555	10/10/2024, 14:32:03	In	Full Stack Developer	2	3	649
554	0909863555	10/10/2024, 14:50:21	In	Full Stack Developer	2	3	649
555	3473018457	10/10/2024, 14:53:54	In	Chief Executive Officer	70	71	873
556	3473018457	10/10/2024, 14:54:17	In	Chief Executive Officer	70	71	873
557	3274950492	10/10/2024, 14:54:47	In	Developer	72	73	874
558	2413027717	10/10/2024, 15:12:33	In	Full Stack Developer	51	52	120
559	0909234003	10/11/2024, 09:13:07	In	Full Stack Developer	68	69	687
560	0909234003	10/11/2024, 09:13:28	In	Full Stack Developer	68	69	687
561	0909234003	10/11/2024, 09:13:53	In	Full Stack Developer	68	69	687
562	0909234003	10/11/2024, 09:14:22	In	Full Stack Developer	68	69	687
563	0909234003	10/11/2024, 09:14:45	In	Full Stack Developer	68	69	687
564	0909234003	10/11/2024, 09:15:07	In	Full Stack Developer	68	69	687
565	0909234003	10/11/2024, 09:15:38	In	Full Stack Developer	68	69	687
566	0909234003	10/11/2024, 09:16:27	In	Full Stack Developer	68	69	687
567	0909234003	10/11/2024, 09:31:17	In	Full Stack Developer	68	69	687
568	0909234003	10/11/2024, 12:36:07	In	Full Stack Developer	68	69	687
569	0909234003	10/11/2024, 12:36:58	In	Full Stack Developer	68	69	687
570	0909234003	10/11/2024, 12:41:50	In	Full Stack Developer	68	69	687
571	0909234003	10/11/2024, 12:42:21	In	Full Stack Developer	68	69	687
572	1061279271	10/11/2024, 12:44:09	In	Full Stack Developer	36	37	793
573	1332265826	10/11/2024, 15:01:07	In	Logistics Assistant	82	83	1017
574	0909234003	10/11/2024, 15:27:09	In	Full Stack Developer	68	69	687
575	0909234003	10/11/2024, 15:27:31	In	Full Stack Developer	68	69	687
576	0909234003	10/11/2024, 15:28:01	In	Full Stack Developer	68	69	687
577	0909234003	10/11/2024, 16:11:02	In	Full Stack Developer	68	69	687
578	0909234003	10/11/2024, 16:30:37	In	Full Stack Developer	68	69	687
579	0909234003	10/11/2024, 16:58:29	In	Full Stack Developer	68	69	687
580	1876101869	10/11/2024, 17:10:34	In	Full Stack Developer	14	15	167
581	1876101869	10/11/2024, 17:35:56	In	Full Stack Developer	14	15	167
582	1331839441	10/11/2024, 17:39:28	In	Digital Creative Marketing	10	11	788
583	0909234003	10/14/2024, 10:31:34	In	Full Stack Developer	68	69	687
584	0909234003	10/14/2024, 10:31:55	In	Full Stack Developer	68	69	687
585	1876123142	10/14/2024, 11:01:14	In	Full Stack Developer	38	39	794
586	0909234003	10/14/2024, 12:57:05	In	Full Stack Developer	68	69	687
587	0909234003	10/14/2024, 12:57:27	In	Full Stack Developer	68	69	687
588	0909234003	10/14/2024, 13:41:30	In	Full Stack Developer	68	69	687
589	1332265826	10/14/2024, 14:03:16	In	Logistics Assistant	82	83	1017
590	0909234003	10/14/2024, 15:01:40	In	Full Stack Developer	68	69	687
591	0909234003	10/14/2024, 16:44:20	In	Full Stack Developer	68	69	687
592	0909234003	10/14/2024, 16:44:46	In	Full Stack Developer	68	69	687
593	0909234003	10/14/2024, 16:45:07	In	Full Stack Developer	68	69	687
594	0909234003	10/14/2024, 16:45:28	In	Full Stack Developer	68	69	687
595	0909234003	10/14/2024, 16:45:50	In	Full Stack Developer	68	69	687
596	0909234003	10/14/2024, 16:46:53	In	Full Stack Developer	68	69	687
597	0909234003	10/14/2024, 16:47:21	In	Full Stack Developer	68	69	687
598	0909234003	10/14/2024, 17:10:44	In	Full Stack Developer	68	69	687
599	3473018457	10/15/2024, 09:05:39	In	Developer	70	71	873
600	3275030810	10/15/2024, 09:14:28	In	Chief Executive Officer	74	75	875
601	3473018457	10/15/2024, 09:15:06	In	Developer	70	71	873
602	3473018457	10/15/2024, 09:15:34	In	Developer	70	71	873
603	3473018457	10/15/2024, 09:27:37	In	Developer	70	71	873
604	3473018457	10/15/2024, 09:31:17	In	Developer	70	71	873
605	3473018457	10/15/2024, 09:31:39	In	Developer	70	71	873
606	3473018457	10/15/2024, 09:32:32	In	Developer	70	71	873
607	3275030810	10/15/2024, 09:33:12	In	Chief Executive Officer	74	75	875
608	3473018457	10/15/2024, 09:41:27	In	Developer	70	71	873
609	3473018457	10/15/2024, 09:41:50	In	Developer	70	71	873
610	3473018457	10/15/2024, 09:42:13	In	Developer	70	71	873
611	3473018457	10/15/2024, 09:43:39	In	Developer	70	71	873
612	3473018457	10/15/2024, 09:44:11	In	Developer	70	71	873
613	3473018457	10/15/2024, 09:44:41	In	Developer	70	71	873
614	3473018457	10/15/2024, 10:00:11	In	Developer	70	71	873
615	3275030810	10/15/2024, 10:12:56	In	Chief Executive Officer	74	75	875
616	3275030810	10/15/2024, 10:13:30	In	Chief Executive Officer	74	75	875
617	3275030810	10/15/2024, 10:14:35	In	Chief Executive Officer	74	75	875
618	3275030810	10/15/2024, 10:17:32	In	Chief Executive Officer	74	75	875
619	3473018457	10/15/2024, 10:17:53	In	Developer	70	71	873
620	3473018457	10/15/2024, 10:18:15	In	Developer	70	71	873
621	3473018457	10/15/2024, 10:21:20	In	Developer	70	71	873
622	3473018457	10/15/2024, 10:21:45	In	Developer	70	71	873
623	3473018457	10/15/2024, 10:22:35	In	Developer	70	71	873
624	3473018457	10/15/2024, 11:13:04	In	Developer	70	71	873
625	3473018457	10/15/2024, 11:13:41	In	Developer	70	71	873
626	3473018457	10/15/2024, 11:16:16	In	Developer	70	71	873
627	3275030810	10/15/2024, 11:16:40	In	Chief Executive Officer	74	75	875
628	3275030810	10/15/2024, 13:32:42	In	Chief Executive Officer	74	75	875
629	3275030810	10/15/2024, 13:33:27	In	Chief Executive Officer	74	75	875
630	3275030810	10/15/2024, 13:34:09	In	Chief Executive Officer	74	75	875
631	3473018457	10/15/2024, 13:39:47	In	Developer	70	71	873
632	3473018457	10/15/2024, 17:17:13	In	Developer	70	71	873
633	0909234003	10/16/2024, 17:00:36	In	Full Stack Developer	68	69	687
634	0909234003	10/16/2024, 17:00:59	In	Full Stack Developer	68	69	687
635	0909234003	10/16/2024, 17:01:41	In	Full Stack Developer	68	69	687
636	0909234003	10/16/2024, 17:02:05	In	Full Stack Developer	68	69	687
637	0909234003	10/16/2024, 17:02:45	In	Full Stack Developer	68	69	687
638	1876130278	10/17/2024, 08:04:59	In	Scrum Master/Product Owner	20	21	795
639	3473018457	10/17/2024, 09:03:53	In	Developer	70	71	873
640	3473018457	10/17/2024, 09:07:05	In	Developer	70	71	873
641	3473018457	10/17/2024, 09:08:46	In	Developer	70	71	873
642	3473018457	10/17/2024, 09:09:28	In	Developer	70	71	873
643	3473018457	10/17/2024, 09:10:00	In	Developer	70	71	873
644	3275030810	10/17/2024, 09:24:56	In	Chief Executive Officer	74	75	875
645	3275030810	10/17/2024, 09:25:18	In	Chief Executive Officer	74	75	875
646	3275030810	10/17/2024, 09:25:38	In	Chief Executive Officer	74	75	875
647	3275030810	10/17/2024, 09:26:01	In	Chief Executive Officer	74	75	875
648	3275030810	10/17/2024, 09:26:21	In	Chief Executive Officer	74	75	875
649	3275030810	10/17/2024, 09:26:46	In	Chief Executive Officer	74	75	875
650	3275030810	10/17/2024, 09:27:09	In	Chief Executive Officer	74	75	875
651	3275030810	10/17/2024, 09:27:32	In	Chief Executive Officer	74	75	875
652	3275030810	10/17/2024, 09:27:53	In	Chief Executive Officer	74	75	875
653	3275030810	10/17/2024, 09:28:14	In	Chief Executive Officer	74	75	875
654	3275030810	10/17/2024, 09:29:06	In	Chief Executive Officer	74	75	875
655	3473018457	10/17/2024, 10:41:07	In	Developer	70	71	873
656	3473018457	10/17/2024, 10:59:26	In	Developer	70	71	873
657	3473018457	10/17/2024, 11:02:54	In	Developer	70	71	873
658	3473018457	10/17/2024, 11:07:16	In	Developer	70	71	873
659	3473018457	10/17/2024, 11:09:40	In	Developer	70	71	873
660	3473018457	10/17/2024, 11:22:39	In	Developer	70	71	873
661	3473018457	10/17/2024, 11:26:45	In	Developer	70	71	873
662	3473018457	10/17/2024, 11:34:31	In	Developer	70	71	873
663	3473018457	10/17/2024, 11:35:53	In	Developer	70	71	873
664	3473018457	10/17/2024, 12:16:05	In	Developer	70	71	873
665	3473018457	10/18/2024, 09:12:29	In	Developer	70	71	873
666	3473018457	10/18/2024, 11:04:56	In	Developer	70	71	873
667	3473018457	10/18/2024, 11:15:29	In	Developer	70	71	873
668	3473018457	10/18/2024, 11:16:10	In	Developer	70	71	873
669	3473018457	10/18/2024, 11:21:55	In	Developer	70	71	873
670	3473018457	10/18/2024, 11:23:30	In	Developer	70	71	873
671	3473018457	10/18/2024, 11:28:07	In	Developer	70	71	873
672	3274950492	10/18/2024, 11:40:23	In	Developer	72	73	874
673	3274950492	10/18/2024, 12:43:44	In	Developer	72	73	874
674	3274950492	10/18/2024, 12:44:38	In	Developer	72	73	874
675	1331905588	10/18/2024, 12:56:13	In	HR and Recruitment Assistant	6	7	169
676	1876123142	10/18/2024, 12:59:41	In	Full Stack Developer	38	39	794
677	3275030810	10/18/2024, 13:10:28	In	Chief Executive Officer	74	75	875
678	3275030810	10/18/2024, 13:10:50	In	Chief Executive Officer	74	75	875
679	3275030810	10/18/2024, 13:11:21	In	Chief Executive Officer	74	75	875
680	3275030810	10/18/2024, 13:11:42	In	Chief Executive Officer	74	75	875
681	3275030810	10/18/2024, 13:12:05	In	Chief Executive Officer	74	75	875
682	3275030810	10/18/2024, 13:15:24	In	Chief Executive Officer	74	75	875
683	3275030810	10/18/2024, 13:24:28	In	Chief Executive Officer	74	75	875
684	3275030810	10/18/2024, 13:24:51	In	Chief Executive Officer	74	75	875
685	3275030810	10/18/2024, 13:25:32	In	Chief Executive Officer	74	75	875
686	3275030810	10/18/2024, 13:25:54	In	Chief Executive Officer	74	75	875
687	3275030810	10/18/2024, 13:32:07	In	Chief Executive Officer	74	75	875
688	3275030810	10/18/2024, 13:58:01	In	Chief Executive Officer	74	75	875
689	3275030810	10/18/2024, 14:12:36	In	Chief Executive Officer	74	75	875
690	3275030810	10/18/2024, 14:13:00	In	Chief Executive Officer	74	75	875
691	3275030810	10/18/2024, 14:13:23	In	Chief Executive Officer	74	75	875
692	3275030810	10/18/2024, 14:13:48	In	Chief Executive Officer	74	75	875
693	3275030810	10/18/2024, 14:14:13	In	Chief Executive Officer	74	75	875
694	3275030810	10/18/2024, 14:14:44	In	Chief Executive Officer	74	75	875
695	3275030810	10/18/2024, 14:26:36	In	Chief Executive Officer	74	75	875
696	3275030810	10/18/2024, 14:27:17	In	Chief Executive Officer	74	75	875
697	3275030810	10/18/2024, 14:27:48	In	Chief Executive Officer	74	75	875
698	3275030810	10/18/2024, 14:28:08	In	Chief Executive Officer	74	75	875
699	3275030810	10/18/2024, 15:19:29	In	Chief Executive Officer	74	75	875
700	3275030810	10/18/2024, 15:20:06	In	Chief Executive Officer	74	75	875
701	3275030810	10/18/2024, 15:20:28	In	Chief Executive Officer	74	75	875
702	3275030810	10/18/2024, 15:20:50	In	Chief Executive Officer	74	75	875
703	3275030810	10/18/2024, 15:26:51	In	Chief Executive Officer	74	75	875
704	3275030810	10/18/2024, 15:29:43	In	Chief Executive Officer	74	75	875
705	3275030810	10/18/2024, 15:30:05	In	Chief Executive Officer	74	75	875
706	3275030810	10/18/2024, 15:30:27	In	Chief Executive Officer	74	75	875
707	3275030810	10/18/2024, 15:30:48	In	Chief Executive Officer	74	75	875
708	3275030810	10/18/2024, 15:31:10	In	Chief Executive Officer	74	75	875
709	3275030810	10/18/2024, 15:31:32	In	Chief Executive Officer	74	75	875
710	3275030810	10/18/2024, 15:31:56	In	Chief Executive Officer	74	75	875
711	3275030810	10/18/2024, 15:32:27	In	Chief Executive Officer	74	75	875
712	3275030810	10/18/2024, 15:33:14	In	Chief Executive Officer	74	75	875
713	3275030810	10/18/2024, 15:33:46	In	Chief Executive Officer	74	75	875
714	3274950492	10/18/2024, 16:39:57	In	Developer	72	73	874
715	3274950492	10/18/2024, 16:41:01	In	Developer	72	73	874
716	3274950492	10/18/2024, 16:41:26	In	Developer	72	73	874
717	3274950492	10/18/2024, 16:41:53	In	Developer	72	73	874
718	3274950492	10/18/2024, 16:42:20	In	Developer	72	73	874
719	3274950492	10/18/2024, 16:42:53	In	Developer	72	73	874
720	3274950492	10/18/2024, 16:43:20	In	Developer	72	73	874
721	3274950492	10/18/2024, 16:43:51	In	Developer	72	73	874
722	3274950492	10/18/2024, 16:44:17	In	Developer	72	73	874
723	3274950492	10/18/2024, 16:44:55	In	Developer	72	73	874
724	3473018457	10/18/2024, 16:45:30	In	Developer	70	71	873
725	3274950492	10/18/2024, 16:45:52	In	Developer	72	73	874
726	3274950492	10/18/2024, 16:46:14	In	Developer	72	73	874
727	3274950492	10/18/2024, 16:46:35	In	Developer	72	73	874
728	3473018457	10/18/2024, 16:51:20	In	Developer	70	71	873
729	3473018457	10/18/2024, 16:51:58	In	Developer	70	71	873
730	3473018457	10/18/2024, 16:52:41	In	Developer	70	71	873
731	3473018457	10/18/2024, 16:53:02	In	Developer	70	71	873
732	3473018457	10/18/2024, 16:53:34	In	Developer	70	71	873
733	3473018457	10/18/2024, 16:53:56	In	Developer	70	71	873
734	3473018457	10/18/2024, 16:54:24	In	Developer	70	71	873
735	3473018457	10/22/2024, 14:24:19	In	Developer	70	71	873
736	3275030810	10/22/2024, 14:24:46	In	Chief Executive Officer	74	75	875
737	3473018457	10/22/2024, 14:25:12	In	Developer	70	71	873
738	3275030810	10/22/2024, 14:28:01	In	Chief Executive Officer	74	75	875
739	3275030810	10/22/2024, 14:28:47	In	Chief Executive Officer	74	75	875
740	3275030810	10/22/2024, 14:29:11	In	Chief Executive Officer	74	75	875
741	3473018457	10/22/2024, 14:43:55	In	Developer	70	71	873
742	3473018457	10/22/2024, 14:44:18	In	Developer	70	71	873
743	3473018457	10/22/2024, 14:44:39	In	Developer	70	71	873
744	3473018457	10/22/2024, 14:45:31	In	Developer	70	71	873
745	3473018457	10/22/2024, 14:46:02	In	Developer	70	71	873
746	3275030810	10/22/2024, 14:46:32	In	Chief Executive Officer	74	75	875
747	3275030810	10/22/2024, 14:46:55	In	Chief Executive Officer	74	75	875
748	3275030810	10/22/2024, 14:47:18	In	Chief Executive Officer	74	75	875
749	3275030810	10/22/2024, 14:47:43	In	Chief Executive Officer	74	75	875
750	3275030810	10/22/2024, 14:48:04	In	Chief Executive Officer	74	75	875
751	3275030810	10/22/2024, 14:48:31	In	Chief Executive Officer	74	75	875
752	3473018457	10/22/2024, 14:48:53	In	Developer	70	71	873
753	3473018457	10/22/2024, 14:49:14	In	Developer	70	71	873
754	3473018457	10/22/2024, 14:50:00	In	Developer	70	71	873
755	3473018457	10/22/2024, 14:50:45	In	Developer	70	71	873
756	3274950492	10/22/2024, 14:51:31	In	Developer	72	73	874
757	3274950492	10/22/2024, 14:52:32	In	Developer	72	73	874
758	3274950492	10/22/2024, 14:52:55	In	Developer	72	73	874
759	3274950492	10/22/2024, 14:53:23	In	Developer	72	73	874
760	3274950492	10/22/2024, 14:54:10	In	Developer	72	73	874
761	3274950492	10/22/2024, 14:54:47	In	Developer	72	73	874
762	3275030810	10/22/2024, 15:07:11	In	Chief Executive Officer	74	75	875
763	3275030810	10/22/2024, 15:07:34	In	Chief Executive Officer	74	75	875
764	3275030810	10/22/2024, 15:07:57	In	Chief Executive Officer	74	75	875
765	3275030810	10/22/2024, 15:18:18	In	Chief Executive Officer	74	75	875
766	3275030810	10/22/2024, 15:18:40	In	Chief Executive Officer	74	75	875
767	3275030810	10/22/2024, 15:20:15	In	Chief Executive Officer	74	75	875
768	3275030810	10/22/2024, 15:20:38	In	Chief Executive Officer	74	75	875
769	3274950492	10/22/2024, 15:24:01	In	Developer	72	73	874
770	3274950492	10/22/2024, 15:25:46	In	Developer	72	73	874
771	3275030810	10/22/2024, 15:41:23	In	Chief Executive Officer	74	75	875
772	3275030810	10/22/2024, 15:41:49	In	Chief Executive Officer	74	75	875
773	3275030810	10/22/2024, 15:42:12	In	Chief Executive Officer	74	75	875
774	3275030810	10/22/2024, 15:43:15	In	Chief Executive Officer	74	75	875
775	3275030810	10/22/2024, 15:43:38	In	Chief Executive Officer	74	75	875
776	3473018457	10/22/2024, 15:44:35	In	Developer	70	71	873
777	3473018457	10/22/2024, 15:44:56	In	Developer	70	71	873
778	0909234003	10/22/2024, 15:50:40	In	Full Stack Developer	68	69	687
779	3274950492	10/22/2024, 15:54:42	In	Developer	72	73	874
780	3274950492	10/22/2024, 15:56:44	In	Developer	72	73	874
781	0909234003	10/22/2024, 15:57:11	In	Full Stack Developer	68	69	687
782	0909234003	10/22/2024, 15:58:18	In	Full Stack Developer	68	69	687
783	0909234003	10/22/2024, 15:59:24	In	Full Stack Developer	68	69	687
784	3274950492	10/22/2024, 16:07:16	In	Developer	72	73	874
785	3274950492	10/22/2024, 16:19:44	In	Developer	72	73	874
786	3473018457	10/24/2024, 14:13:07	In	Developer	70	71	873
787	3473018457	10/24/2024, 14:17:07	In	Developer	70	71	873
788	3473018457	10/24/2024, 14:18:10	In	Developer	70	71	873
789	3275030810	10/24/2024, 14:18:41	In	Chief Executive Officer	74	75	875
790	3275030810	10/24/2024, 14:19:03	In	Chief Executive Officer	74	75	875
791	3275030810	10/24/2024, 14:19:26	In	Chief Executive Officer	74	75	875
792	3275030810	10/24/2024, 14:20:42	In	Chief Executive Officer	74	75	875
793	0909863555	10/24/2024, 15:21:39	In	Full Stack Developer	2	3	649
794	3473018457	10/24/2024, 15:27:03	In	Developer	70	71	873
795	3473018457	10/24/2024, 15:27:26	In	Developer	70	71	873
796	3473018457	10/24/2024, 15:28:14	In	Developer	70	71	873
797	3473018457	10/24/2024, 15:30:00	In	Developer	70	71	873
798	3275030810	10/24/2024, 15:30:48	In	Chief Executive Officer	74	75	875
799	3275030810	10/24/2024, 15:31:10	In	Chief Executive Officer	74	75	875
800	3275030810	10/24/2024, 15:31:35	In	Chief Executive Officer	74	75	875
801	3275030810	10/24/2024, 15:31:59	In	Chief Executive Officer	74	75	875
802	3275030810	10/24/2024, 15:32:22	In	Chief Executive Officer	74	75	875
803	3275030810	10/24/2024, 15:33:42	In	Chief Executive Officer	74	75	875
804	3473018457	10/24/2024, 15:34:15	In	Developer	70	71	873
805	3473018457	10/24/2024, 15:43:51	In	Developer	70	71	873
806	3473018457	10/24/2024, 15:46:20	In	Developer	70	71	873
807	3275030810	10/24/2024, 15:56:33	In	Chief Executive Officer	74	75	875
808	3473018457	10/24/2024, 15:57:21	In	Developer	70	71	873
809	3473018457	10/24/2024, 16:19:55	In	Developer	70	71	873
810	3473018457	10/24/2024, 16:40:22	In	Developer	70	71	873
811	3473018457	10/24/2024, 16:41:16	In	Developer	70	71	873
812	3473018457	10/24/2024, 16:49:00	In	Developer	70	71	873
813	3473018457	10/24/2024, 16:49:23	In	Developer	70	71	873
814	3473018457	10/24/2024, 16:49:55	In	Developer	70	71	873
815	3473018457	10/24/2024, 16:50:17	In	Developer	70	71	873
816	3473018457	10/24/2024, 16:50:39	In	Developer	70	71	873
817	3473018457	10/24/2024, 16:50:59	In	Developer	70	71	873
818	3473018457	10/24/2024, 16:51:55	In	Developer	70	71	873
819	3473018457	10/29/2024, 14:02:03	In	Developer	70	71	873
820	3473018457	10/29/2024, 14:02:38	In	Developer	70	71	873
821	3473018457	10/29/2024, 14:03:48	In	Developer	70	71	873
822	3473018457	10/29/2024, 14:12:17	In	Developer	70	71	873
823	3473018457	10/29/2024, 14:14:10	In	Developer	70	71	873
824	3274950492	10/29/2024, 14:23:03	In	Developer	72	73	874
825	3274950492	10/29/2024, 14:23:59	In	Developer	72	73	874
826	3274950492	10/29/2024, 14:24:35	In	Developer	72	73	874
827	3473018457	10/29/2024, 14:30:55	In	Developer	70	71	873
828	3275030810	10/29/2024, 14:35:03	In	Chief Executive Officer	90	91	875
829	3275030810	10/29/2024, 14:35:33	In	Chief Executive Officer	90	91	875
830	3473018457	10/29/2024, 14:37:35	In	Developer	70	71	873
831	3473018457	10/29/2024, 14:37:59	In	Developer	70	71	873
832	3473018457	10/29/2024, 14:38:55	In	Developer	70	71	873
833	3473018457	10/29/2024, 14:41:15	In	Developer	70	71	873
834	3274950492	10/29/2024, 14:45:32	In	Developer	72	73	874
835	3473018457	10/29/2024, 14:47:52	In	Developer	70	71	873
836	3473018457	10/29/2024, 14:48:49	In	Developer	70	71	873
837	3473018457	10/29/2024, 14:51:42	In	Developer	70	71	873
838	3473018457	10/29/2024, 14:53:50	In	Developer	70	71	873
839	0909863555	10/29/2024, 14:54:46	In	Full Stack Developer	2	3	649
840	0909863555	10/29/2024, 14:55:24	In	Full Stack Developer	2	3	649
841	0909863555	10/29/2024, 14:56:03	In	Full Stack Developer	2	3	649
842	0909863555	10/29/2024, 14:57:13	In	Full Stack Developer	2	3	649
843	0909863555	10/29/2024, 14:57:36	In	Full Stack Developer	2	3	649
844	0909863555	10/29/2024, 14:58:25	In	Full Stack Developer	2	3	649
845	0909863555	10/29/2024, 14:58:55	In	Full Stack Developer	2	3	649
846	0909863555	10/29/2024, 14:59:18	In	Full Stack Developer	2	3	649
847	0909863555	10/29/2024, 14:59:52	In	Full Stack Developer	2	3	649
848	0909234003	10/29/2024, 15:00:17	In	Full Stack Developer	68	69	687
849	0909234003	10/29/2024, 15:01:17	In	Full Stack Developer	68	69	687
850	0909234003	10/29/2024, 15:01:47	In	Full Stack Developer	68	69	687
851	0909234003	10/29/2024, 15:02:27	In	Full Stack Developer	68	69	687
852	0909234003	10/29/2024, 15:03:59	In	Full Stack Developer	68	69	687
853	3473018457	10/29/2024, 15:06:19	In	Developer	70	71	873
854	3275030810	10/29/2024, 15:07:25	In	Chief Executive Officer	90	91	875
855	3275030810	10/29/2024, 15:08:18	In	Chief Executive Officer	90	91	875
856	0909863555	10/29/2024, 15:20:49	In	Full Stack Developer	2	3	649
857	0909863555	10/29/2024, 15:21:12	In	Full Stack Developer	2	3	649
858	0909234003	10/29/2024, 15:26:20	In	Full Stack Developer	68	69	687
859	0909863555	10/29/2024, 15:27:34	In	Full Stack Developer	2	3	649
860	0909863555	10/29/2024, 15:28:07	In	Full Stack Developer	2	3	649
861	0909863555	10/29/2024, 15:28:53	In	Full Stack Developer	2	3	649
862	0909863555	10/29/2024, 15:30:01	In	Full Stack Developer	2	3	649
863	3275030810	10/29/2024, 15:32:46	In	Chief Executive Officer	90	91	875
864	3473018457	10/29/2024, 15:36:58	In	Developer	70	71	873
865	3274950492	10/29/2024, 15:40:30	In	Developer	72	73	874
866	3274950492	10/29/2024, 15:49:42	In	Developer	72	73	874
867	3274950492	10/29/2024, 15:50:17	In	Developer	72	73	874
868	3473018457	10/29/2024, 15:52:42	In	Developer	70	71	873
869	3473018457	10/29/2024, 15:53:31	In	Developer	70	71	873
870	3473018457	10/29/2024, 15:53:52	In	Developer	70	71	873
871	3473018457	10/29/2024, 16:19:32	In	Developer	70	71	873
872	3473018457	10/29/2024, 16:19:53	In	Developer	70	71	873
873	3473018457	10/29/2024, 16:20:25	In	Developer	70	71	873
874	3473018457	10/29/2024, 16:20:48	In	Developer	70	71	873
875	3473018457	10/29/2024, 16:22:04	In	Developer	70	71	873
876	3274950492	10/29/2024, 16:23:26	In	Developer	72	73	874
877	3274950492	10/29/2024, 16:24:02	In	Developer	72	73	874
878	3473018457	10/29/2024, 16:25:39	In	Developer	70	71	873
879	3473018457	10/29/2024, 16:26:15	In	Developer	70	71	873
880	0909863555	10/29/2024, 16:29:56	In	Full Stack Developer	2	3	649
881	3473018457	10/29/2024, 16:31:55	In	Developer	70	71	873
882	3473018457	10/29/2024, 16:32:26	In	Developer	70	71	873
883	3274950492	10/29/2024, 16:47:01	In	Developer	72	73	874
884	3274950492	10/29/2024, 16:47:31	In	Developer	72	73	874
885	3274950492	10/29/2024, 16:48:04	In	Developer	72	73	874
886	3274950492	10/29/2024, 16:50:16	In	Developer	72	73	874
887	0909234003	10/29/2024, 16:56:22	In	Full Stack Developer	68	69	687
888	0909234003	10/29/2024, 16:56:45	In	Full Stack Developer	68	69	687
889	3275030810	10/29/2024, 17:20:51	In	Chief Executive Officer	90	91	875
890	3473018457	10/30/2024, 09:04:38	In	Developer	70	71	873
891	3473018457	10/30/2024, 09:20:53	In	Developer	70	71	873
892	3473018457	10/30/2024, 09:21:28	In	Developer	70	71	873
893	3473018457	10/30/2024, 09:22:01	In	Developer	70	71	873
894	3274950492	10/30/2024, 09:37:01	In	Developer	72	73	874
895	3275030810	10/30/2024, 09:37:26	In	Chief Executive Officer	90	91	875
896	3275030810	10/30/2024, 09:52:50	In	Chief Executive Officer	90	91	875
897	3275030810	10/30/2024, 10:28:55	In	Chief Executive Officer	90	91	875
898	3274950492	10/30/2024, 10:53:15	In	Developer	72	73	874
899	3274950492	10/30/2024, 10:53:53	In	Developer	72	73	874
900	3274950492	10/30/2024, 11:10:10	In	Developer	72	73	874
901	3274950492	10/30/2024, 11:11:19	In	Developer	72	73	874
902	3275030810	10/30/2024, 11:27:00	In	Chief Executive Officer	90	91	875
903	3473018457	10/30/2024, 11:36:42	In	Developer	70	71	873
904	3473018457	10/30/2024, 11:37:07	In	Developer	70	71	873
905	3473018457	10/30/2024, 11:41:43	In	Developer	70	71	873
906	3275030810	10/30/2024, 12:12:48	In	Chief Executive Officer	90	91	875
907	3473018457	10/30/2024, 12:13:34	In	Developer	70	71	873
908	3274950492	10/30/2024, 12:38:34	In	Developer	72	73	874
909	3275030810	10/30/2024, 13:10:30	In	Chief Executive Officer	90	91	875
910	3274950492	10/30/2024, 13:14:17	In	Developer	72	73	874
911	3274950492	10/30/2024, 13:15:05	In	Developer	72	73	874
912	3473018457	10/30/2024, 13:16:25	In	Developer	70	71	873
913	0909863555	10/30/2024, 13:18:26	In	Full Stack Developer	2	3	649
914	0909234003	10/30/2024, 13:49:53	In	Full Stack Developer	68	69	687
915	3275030810	10/30/2024, 13:57:20	In	Chief Executive Officer	90	91	875
916	3274950492	10/30/2024, 14:16:41	In	Developer	72	73	874
917	3274950492	10/30/2024, 14:17:22	In	Developer	72	73	874
918	0909863555	10/30/2024, 14:49:34	In	Full Stack Developer	2	3	649
919	3473018457	10/30/2024, 14:52:39	In	Developer	70	71	873
920	3473018457	10/30/2024, 15:03:21	In	Developer	70	71	873
921	3473018457	10/30/2024, 15:05:34	In	Developer	70	71	873
922	3274950492	10/30/2024, 15:06:14	In	Developer	72	73	874
923	3473018457	10/30/2024, 15:54:42	In	Developer	70	71	873
924	3473018457	10/30/2024, 15:55:22	In	Developer	70	71	873
925	3274950492	10/30/2024, 16:04:03	In	Developer	72	73	874
926	3274950492	10/30/2024, 16:04:50	In	Developer	72	73	874
927	3274950492	10/30/2024, 16:17:19	In	Developer	72	73	874
928	3274950492	10/30/2024, 16:18:23	In	Developer	72	73	874
929	3473018457	11/05/2024, 09:34:56	In	Developer	70	71	873
930	3473018457	11/05/2024, 09:36:24	In	Developer	70	71	873
931	3473018457	11/05/2024, 09:38:02	In	Developer	70	71	873
932	3473018457	11/05/2024, 09:47:20	In	Developer	70	71	873
933	3274950492	11/05/2024, 09:47:52	In	Developer	72	73	874
934	3274950492	11/05/2024, 09:59:50	In	Developer	72	73	874
935	3473018457	11/05/2024, 10:10:50	In	Developer	70	71	873
936	3275030810	11/05/2024, 10:15:41	In	Chief Executive Officer	90	91	875
937	3473018457	11/05/2024, 10:16:55	In	Developer	70	71	873
938	3275030810	11/05/2024, 10:46:42	In	Chief Executive Officer	90	91	875
939	3274950492	11/05/2024, 11:00:03	In	Developer	72	73	874
940	3473018457	11/05/2024, 11:19:10	In	Developer	70	71	873
941	3473018457	11/05/2024, 11:19:32	In	Developer	70	71	873
942	3274950492	11/05/2024, 11:20:23	In	Developer	72	73	874
943	3274950492	11/05/2024, 11:22:35	In	Developer	72	73	874
944	3473018457	11/05/2024, 11:27:27	In	Developer	70	71	873
945	3274950492	11/05/2024, 11:42:37	In	Developer	72	73	874
946	3473018457	11/05/2024, 11:46:30	In	Developer	70	71	873
947	3473018457	11/05/2024, 12:07:18	In	Developer	70	71	873
948	3473018457	11/05/2024, 12:15:10	In	Developer	70	71	873
949	3274950492	11/05/2024, 12:49:04	In	Developer	72	73	874
950	3274950492	11/05/2024, 12:59:32	In	Developer	72	73	874
951	3274950492	11/05/2024, 13:31:14	In	Developer	72	73	874
952	3473018457	11/05/2024, 13:35:49	In	Developer	70	71	873
953	3473018457	11/05/2024, 13:38:30	In	Developer	70	71	873
954	3274950492	11/05/2024, 13:48:19	In	Developer	72	73	874
955	3473018457	11/07/2024, 13:36:42	In	Developer	70	71	873
956	3473018457	11/07/2024, 13:39:24	In	Developer	70	71	873
957	3473018457	11/07/2024, 13:40:36	In	Developer	70	71	873
958	3473018457	11/07/2024, 13:41:24	In	Developer	70	71	873
959	3275030810	11/07/2024, 13:41:47	In	Chief Executive Officer	90	91	875
960	3473018457	11/07/2024, 13:42:11	In	Developer	70	71	873
961	3275030810	11/07/2024, 13:44:11	In	Chief Executive Officer	90	91	875
962	3275030810	11/07/2024, 13:44:42	In	Chief Executive Officer	90	91	875
963	3275030810	11/07/2024, 13:45:44	In	Chief Executive Officer	90	91	875
964	3275030810	11/07/2024, 13:46:38	In	Chief Executive Officer	90	91	875
965	3274950492	11/07/2024, 13:48:17	In	Developer	72	73	874
966	3274950492	11/07/2024, 13:49:03	In	Developer	72	73	874
967	3274950492	11/07/2024, 13:50:17	In	Developer	72	73	874
968	3473018457	11/07/2024, 13:52:37	In	Developer	70	71	873
969	3274950492	11/07/2024, 13:53:11	In	Developer	72	73	874
970	3473018457	11/07/2024, 13:55:01	In	Developer	70	71	873
971	3473018457	11/07/2024, 13:57:45	In	Developer	70	71	873
972	3274950492	11/07/2024, 14:04:54	In	Developer	72	73	874
973	3473018457	11/07/2024, 14:12:30	In	Developer	70	71	873
974	3473018457	11/07/2024, 14:12:54	In	Developer	70	71	873
975	3274950492	11/07/2024, 14:16:47	In	Developer	72	73	874
976	0909863555	11/07/2024, 14:17:10	In	Full Stack Developer	2	3	649
977	0909863555	11/07/2024, 14:17:34	In	Full Stack Developer	2	3	649
978	3275030810	11/07/2024, 14:25:15	In	Chief Executive Officer	90	91	875
979	3473018457	11/07/2024, 14:26:06	In	Developer	70	71	873
980	3473018457	11/07/2024, 14:26:45	In	Developer	70	71	873
981	3473018457	11/07/2024, 14:41:45	In	Developer	70	71	873
982	3473018457	11/07/2024, 14:42:15	In	Developer	70	71	873
983	3473018457	11/07/2024, 14:42:40	In	Developer	70	71	873
984	3274950492	11/07/2024, 14:47:49	In	Developer	72	73	874
985	3473018457	11/07/2024, 14:48:13	In	Developer	70	71	873
986	3473018457	11/07/2024, 14:50:08	In	Developer	70	71	873
987	3473018457	11/07/2024, 15:00:02	In	Developer	70	71	873
988	3473018457	11/07/2024, 15:07:43	In	Developer	70	71	873
989	3275030810	11/07/2024, 15:11:10	In	Chief Executive Officer	90	91	875
990	3473018457	11/07/2024, 15:22:08	In	Developer	70	71	873
991	3275030810	11/07/2024, 15:31:34	In	Chief Executive Officer	90	91	875
992	3473018457	11/07/2024, 15:32:39	In	Developer	70	71	873
993	3274950492	11/07/2024, 15:38:32	In	Developer	72	73	874
994	3473018457	11/07/2024, 15:44:36	In	Developer	70	71	873
995	3473018457	11/07/2024, 15:48:13	In	Developer	70	71	873
996	0909863555	11/07/2024, 15:49:56	In	Full Stack Developer	2	3	649
997	3274950492	11/07/2024, 15:57:51	In	Developer	72	73	874
998	3274950492	11/07/2024, 15:59:23	In	Developer	72	73	874
999	3473018457	11/07/2024, 15:59:45	In	Developer	70	71	873
1000	3473018457	11/07/2024, 16:09:36	In	Developer	70	71	873
1001	3274950492	11/07/2024, 16:13:56	In	Developer	72	73	874
1002	3473018457	11/07/2024, 16:39:05	In	Developer	70	71	873
1003	3473018457	11/07/2024, 16:39:31	In	Developer	70	71	873
1004	3275030810	11/07/2024, 16:44:09	In	Chief Executive Officer	90	91	875
1005	0909863555	11/07/2024, 16:52:13	In	Full Stack Developer	2	3	649
1006	3275030810	11/07/2024, 16:53:18	In	Chief Executive Officer	90	91	875
1007	3473018457	11/07/2024, 16:58:03	In	Developer	70	71	873
1008	3473018457	11/07/2024, 16:58:30	In	Developer	70	71	873
1009	3274950492	11/07/2024, 16:59:06	In	Developer	72	73	874
1010	3473018457	11/08/2024, 08:49:14	In	Developer	70	71	873
1011	3473018457	11/08/2024, 08:49:36	In	Developer	70	71	873
1012	3275030810	11/08/2024, 08:50:00	In	Chief Executive Officer	90	91	875
1013	3473018457	11/08/2024, 09:01:47	In	Developer	70	71	873
1014	3275030810	11/08/2024, 09:08:07	In	Chief Executive Officer	90	91	875
1015	3473018457	11/08/2024, 09:30:58	In	Developer	70	71	873
1016	3473018457	11/08/2024, 09:31:45	In	Developer	70	71	873
1017	3275030810	11/08/2024, 09:43:04	In	Chief Executive Officer	90	91	875
1018	3275030810	11/08/2024, 10:02:33	In	Chief Executive Officer	90	91	875
1019	3473018457	11/08/2024, 10:15:50	In	Developer	70	71	873
1020	3473018457	11/08/2024, 10:24:16	In	Developer	70	71	873
1021	3473018457	11/08/2024, 10:24:44	In	Developer	70	71	873
1022	3274950492	11/08/2024, 11:01:24	In	Developer	72	73	874
1023	3473018457	11/08/2024, 11:01:45	In	Developer	70	71	873
1024	3275030810	11/08/2024, 11:19:20	In	Chief Executive Officer	90	91	875
1025	3274950492	11/08/2024, 11:26:02	In	Developer	72	73	874
1026	3274950492	11/08/2024, 11:27:08	In	Developer	72	73	874
1027	3274950492	11/08/2024, 11:27:38	In	Developer	72	73	874
1028	3473018457	11/08/2024, 11:59:19	In	Developer	70	71	873
1029	3274950492	11/08/2024, 11:59:39	In	Developer	72	73	874
1030	3473018457	11/08/2024, 12:00:29	In	Developer	70	71	873
1031	3473018457	11/08/2024, 12:23:09	In	Developer	70	71	873
1032	3473018457	11/08/2024, 12:23:38	In	Developer	70	71	873
1033	3473018457	11/08/2024, 12:32:24	In	Developer	70	71	873
1034	3275030810	11/08/2024, 12:46:39	In	Chief Executive Officer	90	91	875
1035	3473018457	11/08/2024, 12:48:10	In	Developer	70	71	873
1036	3274950492	11/08/2024, 12:48:44	In	Developer	72	73	874
1037	3473018457	11/08/2024, 13:30:09	In	Developer	70	71	873
1038	3473018457	11/08/2024, 13:40:21	In	Developer	70	71	873
1039	0909863555	11/08/2024, 13:44:33	In	Full Stack Developer	2	3	649
1040	3275030810	11/08/2024, 14:24:08	In	Chief Executive Officer	90	91	875
1041	3275030810	11/08/2024, 14:33:03	In	Chief Executive Officer	90	91	875
1042	3274950492	11/08/2024, 15:12:35	In	Developer	72	73	874
1043	3275030810	11/08/2024, 15:20:42	In	Chief Executive Officer	90	91	875
1044	3473018457	11/08/2024, 15:46:13	In	Developer	70	71	873
1045	3473018457	11/08/2024, 15:49:59	In	Developer	70	71	873
1046	0909863555	11/08/2024, 15:52:52	In	Full Stack Developer	2	3	649
1047	3473018457	11/08/2024, 15:56:36	In	Developer	70	71	873
1048	3473018457	11/08/2024, 16:01:35	In	Developer	70	71	873
1049	3274950492	11/08/2024, 16:16:20	In	Developer	72	73	874
1050	3275030810	11/08/2024, 16:51:53	In	Chief Executive Officer	90	91	875
1051	3274950492	11/08/2024, 16:53:46	In	Developer	72	73	874
1052	3274950492	11/12/2024, 08:31:49	In	Developer	72	73	874
1053	3274950492	11/12/2024, 08:36:11	In	Developer	72	73	874
1054	3274950492	11/12/2024, 08:36:53	In	Developer	72	73	874
1055	3274950492	11/12/2024, 09:24:43	In	Developer	72	73	874
1056	3274950492	11/12/2024, 10:03:07	In	Developer	72	73	874
1057	3473018457	11/12/2024, 10:05:42	In	Developer	70	71	873
1058	3275030810	11/12/2024, 10:06:33	In	Chief Executive Officer	90	91	875
1059	3275030810	11/12/2024, 10:07:32	In	Chief Executive Officer	90	91	875
1060	3275030810	11/12/2024, 10:11:54	In	Chief Executive Officer	90	91	875
1061	3473018457	11/12/2024, 10:12:21	In	Developer	70	71	873
1062	3473018457	11/12/2024, 10:17:50	In	Developer	70	71	873
1063	3473018457	11/12/2024, 10:41:34	In	Developer	70	71	873
1064	3473018457	11/12/2024, 11:35:53	In	Developer	70	71	873
1065	3274950492	11/12/2024, 14:13:11	In	Developer	72	73	874
1066	3473018457	11/12/2024, 14:15:09	In	Developer	70	71	873
1067	3274950492	11/13/2024, 14:21:08	In	Developer	72	73	874
1068	3473018457	11/14/2024, 08:56:48	In	Developer	70	71	873
1069	3473018457	11/14/2024, 09:02:54	In	Developer	70	71	873
1070	3473018457	11/14/2024, 09:05:05	In	Developer	70	71	873
1071	3473018457	11/14/2024, 09:05:36	In	Developer	70	71	873
1072	3473018457	11/14/2024, 09:08:39	In	Developer	70	71	873
1073	3473018457	11/14/2024, 09:09:47	In	Developer	70	71	873
1074	3275030810	11/14/2024, 09:10:21	In	Chief Executive Officer	90	91	875
1075	3473018457	11/14/2024, 09:11:11	In	Developer	70	71	873
1076	3473018457	11/14/2024, 09:11:41	In	Developer	70	71	873
1077	3473018457	11/14/2024, 09:15:16	In	Developer	70	71	873
1078	3473018457	11/14/2024, 09:15:40	In	Developer	70	71	873
1079	3274950492	11/14/2024, 09:18:57	In	Developer	72	73	874
1080	3274950492	11/14/2024, 09:19:46	In	Developer	72	73	874
1081	3275030810	11/14/2024, 09:21:25	In	Chief Executive Officer	90	91	875
1082	3473018457	11/14/2024, 09:26:55	In	Developer	70	71	873
1083	3274950492	11/14/2024, 09:45:51	In	Developer	72	73	874
1084	3274950492	11/14/2024, 09:56:16	In	Developer	72	73	874
1085	3274950492	11/14/2024, 09:56:39	In	Developer	72	73	874
1086	3274950492	11/14/2024, 10:50:57	In	Developer	72	73	874
1087	3274950492	11/14/2024, 10:55:48	In	Developer	72	73	874
1088	3473018457	11/14/2024, 11:00:11	In	Developer	70	71	873
1089	3274950492	11/14/2024, 11:28:59	In	Developer	72	73	874
1090	3274950492	11/14/2024, 11:29:24	In	Developer	72	73	874
1091	3473018457	11/14/2024, 11:41:06	In	Developer	70	71	873
1092	3274950492	11/14/2024, 11:42:54	In	Developer	72	73	874
1093	3473018457	11/14/2024, 11:54:04	In	Developer	70	71	873
1094	3274950492	11/14/2024, 12:00:53	In	Developer	72	73	874
1095	3274950492	11/14/2024, 12:45:30	In	Developer	72	73	874
1096	3274950492	11/14/2024, 12:46:56	In	Developer	72	73	874
1097	3473018457	11/14/2024, 12:57:40	In	Developer	70	71	873
1098	3473018457	11/14/2024, 13:01:21	In	Developer	70	71	873
1099	3275030810	11/14/2024, 13:16:35	In	Chief Executive Officer	90	91	875
1100	3473018457	11/14/2024, 15:49:33	In	Developer	70	71	873
1101	3473018457	11/14/2024, 16:26:03	In	Developer	70	71	873
1102	3473018457	11/14/2024, 16:42:44	In	Developer	70	71	873
1103	3473018457	11/14/2024, 16:43:17	In	Developer	70	71	873
1104	3274950492	11/14/2024, 16:44:19	In	Developer	72	73	874
1105	3275030810	11/14/2024, 16:45:43	In	Chief Executive Officer	90	91	875
1106	3275030810	11/14/2024, 17:05:43	In	Chief Executive Officer	90	91	875
1107	3274950492	11/18/2024, 10:16:28	In	Developer	72	73	874
1108	3473018457	11/18/2024, 10:17:27	In	Developer	70	71	873
1109	3473018457	11/18/2024, 11:06:38	In	Developer	70	71	873
1110	3473018457	11/18/2024, 11:10:11	In	Developer	70	71	873
1111	3275030810	11/18/2024, 11:11:19	In	Chief Executive Officer	90	91	875
1112	3275030810	11/18/2024, 11:12:38	In	Chief Executive Officer	90	91	875
1113	3275030810	11/18/2024, 11:18:35	In	Chief Executive Officer	90	91	875
1114	3275030810	11/18/2024, 11:24:26	In	Chief Executive Officer	90	91	875
1115	3473018457	11/18/2024, 14:18:47	In	Developer	70	71	873
1116	3275030810	11/18/2024, 14:59:25	In	Chief Executive Officer	90	91	875
1117	3275030810	11/18/2024, 15:04:10	In	Chief Executive Officer	90	91	875
1118	3473018457	11/18/2024, 15:05:30	In	Developer	70	71	873
1119	3275030810	11/18/2024, 15:18:28	In	Chief Executive Officer	90	91	875
1120	3275030810	11/18/2024, 15:19:19	In	Chief Executive Officer	90	91	875
1121	3473018457	11/18/2024, 15:29:05	In	Developer	70	71	873
1122	3275030810	11/18/2024, 15:30:47	In	Chief Executive Officer	90	91	875
1123	3473018457	11/18/2024, 15:41:17	In	Developer	70	71	873
1124	3274950492	11/18/2024, 15:50:27	In	Developer	72	73	874
1125	3473018457	11/18/2024, 16:00:54	In	Developer	70	71	873
1126	1875985940	11/18/2024, 16:06:37	In	Admin Aide	84	85	1031
1127	3473018457	11/18/2024, 16:22:01	In	Developer	70	71	873
1128	1332265826	11/18/2024, 16:42:42	In	Logistics Assistant	82	83	1017
1129	1332265826	11/18/2024, 16:43:45	In	Logistics Assistant	82	83	1017
1130	1332265826	11/18/2024, 16:45:53	In	Logistics Assistant	82	83	1017
1131	3274950492	11/18/2024, 17:02:16	In	Developer	72	73	874
1132	1331839441	11/18/2024, 17:04:40	In	Digital Creative Marketing	10	11	788
1133	3275030810	11/19/2024, 08:48:49	In	Chief Executive Officer	90	91	875
1134	3275030810	11/19/2024, 08:51:26	In	Chief Executive Officer	90	91	875
1135	1332278615	11/19/2024, 09:09:36	In	Admin Aide	34	35	783
1136	1875985940	11/19/2024, 09:48:25	In	Admin Aide	84	85	1031
1137	3275030810	11/19/2024, 10:13:59	In	Chief Executive Officer	90	91	875
1138	3473018457	11/19/2024, 10:16:01	In	Developer	70	71	873
1139	1332278615	11/19/2024, 10:20:06	In	Admin Aide	34	35	783
1140	1332278615	11/19/2024, 10:28:46	In	Admin Aide	34	35	783
1141	1332278615	11/19/2024, 10:29:14	In	Admin Aide	34	35	783
1142	3473018457	11/19/2024, 10:32:07	In	Developer	70	71	873
1143	3473018457	11/19/2024, 10:39:56	In	Developer	70	71	873
1144	3473018457	11/19/2024, 10:44:00	In	Developer	70	71	873
1145	3473018457	11/19/2024, 11:38:48	In	Developer	70	71	873
1146	1332278615	11/19/2024, 13:06:02	In	Admin Aide	34	35	783
1147	1332265826	11/19/2024, 13:11:03	In	Logistics Assistant	82	83	1017
1148	3473018457	11/19/2024, 13:14:30	In	Developer	70	71	873
1149	3473018457	11/19/2024, 13:17:39	In	Developer	70	71	873
1150	3473018457	11/19/2024, 14:37:44	In	Developer	70	71	873
1151	3473018457	11/19/2024, 14:51:10	In	Developer	70	71	873
1152	3473018457	11/19/2024, 14:56:57	In	Developer	70	71	873
1153	3275030810	11/19/2024, 14:57:21	In	Chief Executive Officer	90	91	875
1154	3275030810	11/19/2024, 15:03:01	In	Chief Executive Officer	90	91	875
1155	3275030810	11/19/2024, 15:10:03	In	Chief Executive Officer	90	91	875
1156	3275030810	11/19/2024, 15:21:14	In	Chief Executive Officer	90	91	875
1157	3473018457	11/19/2024, 15:24:07	In	Developer	70	71	873
1158	3473018457	11/19/2024, 15:29:24	In	Developer	70	71	873
1159	3473018457	11/19/2024, 15:31:01	In	Developer	70	71	873
1160	3275030810	11/19/2024, 15:31:35	In	Chief Executive Officer	90	91	875
1161	3275030810	11/19/2024, 15:32:18	In	Chief Executive Officer	90	91	875
1162	3275030810	11/19/2024, 15:33:00	In	Chief Executive Officer	90	91	875
1163	3473018457	11/19/2024, 15:35:33	In	Developer	70	71	873
1164	1875985940	11/19/2024, 15:49:15	In	Admin Aide	84	85	1031
1165	3473018457	11/19/2024, 15:57:59	In	Developer	70	71	873
1166	3473018457	11/19/2024, 15:58:20	In	Developer	70	71	873
1167	1332278615	11/19/2024, 16:11:10	In	Admin Aide	34	35	783
1168	3473018457	11/19/2024, 16:23:48	In	Developer	70	71	873
1169	3473018457	11/19/2024, 16:24:36	In	Developer	70	71	873
1170	3473018457	11/20/2024, 08:52:00	In	Developer	70	71	873
1171	3275030810	11/20/2024, 08:52:37	In	Chief Executive Officer	90	91	875
1172	3275030810	11/20/2024, 08:55:55	In	Chief Executive Officer	90	91	875
1173	3473018457	11/20/2024, 09:02:19	In	Developer	70	71	873
1174	3275030810	11/20/2024, 09:03:42	In	Chief Executive Officer	90	91	875
1175	3473018457	11/20/2024, 09:05:00	In	Developer	70	71	873
1176	1331995105	11/20/2024, 09:22:11	In	Chief Executive Officer	92	93	1047
1177	3473018457	11/20/2024, 09:23:49	In	Developer	70	71	873
1178	1331995105	11/20/2024, 09:24:32	In	Chief Executive Officer	92	93	1047
1179	1332002163	11/20/2024, 09:29:38	In	Back End Developer	93	94	1048
1180	1332002163	11/20/2024, 09:30:17	In	Back End Developer	93	94	1048
1181	3473018457	11/20/2024, 09:32:27	In	Developer	70	71	873
1182	3473018457	11/20/2024, 09:36:03	In	Developer	70	71	873
1183	3473018457	11/20/2024, 09:38:39	In	Developer	70	71	873
1184	3473018457	11/20/2024, 09:47:07	In	Developer	70	71	873
1185	3275030810	11/20/2024, 09:47:35	In	Chief Executive Officer	90	91	875
1186	1332278615	11/20/2024, 10:05:09	In	Admin Aide	34	35	783
1187	3274950492	11/20/2024, 10:13:20	In	Developer	72	73	874
1188	1332265826	11/20/2024, 10:21:47	In	Logistics Assistant	82	83	1017
1189	1332265826	11/20/2024, 10:37:45	In	Logistics Assistant	82	83	1017
1190	1875985940	11/20/2024, 10:58:31	In	Admin Aide	84	85	1031
1191	0772342275	11/20/2024, 11:16:46	In	Full Stack Developer	28	29	168
1192	3473018457	11/20/2024, 11:41:26	In	Developer	70	71	873
1193	3275030810	11/20/2024, 12:11:25	In	Chief Executive Officer	90	91	875
1194	1331880233	11/20/2024, 12:27:32	In	Back End Developer	32	33	173
1195	1332278615	11/20/2024, 13:05:43	In	Admin Aide	34	35	783
1196	1332278615	11/20/2024, 13:10:52	In	Admin Aide	34	35	783
1197	1332265826	11/20/2024, 13:18:00	In	Logistics Assistant	82	83	1017
1198	3275030810	11/20/2024, 14:02:57	In	Chief Executive Officer	90	91	875
1199	1332265826	11/20/2024, 14:14:38	In	Logistics Assistant	82	83	1017
1200	3274950492	11/20/2024, 14:52:42	In	Developer	72	73	874
1201	1332278615	11/20/2024, 15:16:03	In	Admin Aide	34	35	783
1202	1332278615	11/20/2024, 15:23:05	In	Admin Aide	34	35	783
1203	1332265826	11/20/2024, 15:37:26	In	Logistics Assistant	82	83	1017
1204	3473018457	11/20/2024, 15:44:04	In	Developer	70	71	873
1205	3473018457	11/20/2024, 15:44:50	In	Developer	70	71	873
1206	3274950492	11/20/2024, 16:32:41	In	Developer	72	73	874
1207	3473018457	11/20/2024, 16:54:10	In	Developer	70	71	873
1208	3274950492	11/21/2024, 08:45:27	In	Developer	72	73	874
1209	3473018457	11/21/2024, 08:46:24	In	Developer	70	71	873
1210	1875985940	11/21/2024, 08:47:08	In	Admin Aide	84	85	1031
1211	1332278615	11/21/2024, 09:30:34	In	Admin Aide	34	35	783
1212	1331880233	11/21/2024, 09:37:20	In	Back End Developer	32	33	173
1213	0772342275	11/21/2024, 10:00:12	In	Full Stack Developer	28	29	168
1214	1332265826	11/21/2024, 10:42:16	In	Logistics Assistant	82	83	1017
1215	1332278615	11/21/2024, 11:21:19	In	Admin Aide	34	35	783
1216	3274950492	11/21/2024, 11:38:52	In	Developer	72	73	874
1217	1331880233	11/21/2024, 12:24:07	In	Back End Developer	32	33	173
1218	1876101869	11/21/2024, 12:25:45	In	Full Stack Developer	14	15	167
1219	1331905588	11/21/2024, 12:58:29	In	HR and Recruitment Assistant	6	7	169
1220	1332278615	11/21/2024, 13:04:33	In	Admin Aide	34	35	783
1221	1332265826	11/21/2024, 13:21:26	In	Logistics Assistant	82	83	1017
1222	1332278615	11/21/2024, 14:09:41	In	Admin Aide	34	35	783
1223	3274950492	11/21/2024, 14:10:42	In	Developer	72	73	874
1224	1876101869	11/21/2024, 14:56:34	In	Full Stack Developer	14	15	167
1225	1876130278	11/21/2024, 15:48:22	In	Scrum Master/Product Owner	20	21	795
1226	1876130278	11/21/2024, 15:51:39	In	Scrum Master/Product Owner	20	21	795
1227	3473018457	11/21/2024, 15:52:57	In	Developer	70	71	873
1228	3275030810	11/21/2024, 15:57:10	In	Chief Executive Officer	90	91	875
1229	1331991510	11/21/2024, 16:11:01	In	Front-end Developer	47	48	835
1230	1876138282	11/21/2024, 16:22:58	In	Internal Finance	95	96	1049
1231	3274950492	11/21/2024, 16:25:10	In	Developer	72	73	874
1232	3473018457	11/21/2024, 16:29:21	In	Developer	70	71	873
1233	1876101869	11/21/2024, 16:43:35	In	Full Stack Developer	14	15	167
1234	3275030810	11/22/2024, 08:48:02	In	Chief Executive Officer	90	91	875
1235	1875985940	11/22/2024, 08:50:05	In	Admin Aide	84	85	1031
1236	1332265826	11/22/2024, 09:11:18	In	Logistics Assistant	82	83	1017
1237	1876123142	11/22/2024, 09:35:31	In	Full Stack Developer	38	39	794
1238	1331880233	11/22/2024, 09:44:57	In	Back End Developer	32	33	173
1239	3473018457	11/22/2024, 09:57:04	In	Developer	70	71	873
1240	3473018457	11/22/2024, 11:43:41	In	Developer	70	71	873
1241	1331880233	11/22/2024, 12:19:50	In	Back End Developer	32	33	173
1242	1331880233	11/22/2024, 12:27:12	In	Back End Developer	32	33	173
1243	1876116498	11/22/2024, 12:35:23	In	IT Administrator	43	44	185
1244	1332278615	11/22/2024, 13:09:02	In	Admin Aide	34	35	783
1245	3473018457	11/22/2024, 13:18:43	In	Developer	70	71	873
1246	3473018457	11/22/2024, 13:39:41	In	Developer	70	71	873
1247	3275030810	11/22/2024, 14:29:48	In	Chief Executive Officer	90	91	875
1248	1331880233	11/22/2024, 14:59:54	In	Back End Developer	32	33	173
1249	1876116498	11/22/2024, 15:09:09	In	IT Administrator	43	44	185
1250	1331880233	11/22/2024, 15:14:52	In	Back End Developer	32	33	173
1251	3473018457	11/22/2024, 15:21:45	In	Developer	70	71	873
1252	1332265826	11/22/2024, 15:38:31	In	Logistics Assistant	82	83	1017
1253	1332278615	11/22/2024, 15:46:48	In	Admin Aide	34	35	783
1254	1875985940	11/22/2024, 16:09:11	In	Admin Aide	84	85	1031
1255	1332265826	11/22/2024, 16:11:19	In	Logistics Assistant	82	83	1017
1256	1331880233	11/22/2024, 16:26:56	In	Back End Developer	32	33	173
1257	3473018457	11/22/2024, 16:55:23	In	Developer	70	71	873
1258	3275030810	11/27/2024, 09:22:26	In	Chief Executive Officer	90	91	875
1259	1332265826	11/27/2024, 09:24:38	In	Logistics Assistant	82	83	1017
1260	3473018457	11/27/2024, 09:32:34	In	Developer	70	71	873
1261	1331991510	11/27/2024, 09:37:12	In	Front-end Developer	47	48	835
1262	3274950492	11/27/2024, 09:43:56	In	Developer	72	73	874
1263	0909863555	11/27/2024, 09:45:27	In	Full Stack Developer	2	3	649
1264	3473018457	11/27/2024, 10:32:18	In	Developer	70	71	873
1265	3275030810	11/27/2024, 11:09:53	In	Full Stack Developer	90	91	875
1266	1876060668	11/27/2024, 11:29:13	In	Full Stack Developer	42		867
1267	1332265826	11/27/2024, 13:00:24	In	Logistics Assistant	82	83	1017
1268	1332278615	11/27/2024, 13:05:23	In	Admin Aide	34	35	783
1269	1876116498	11/27/2024, 13:08:30	In	IT Administrator	43	44	185
1270	1332278615	11/27/2024, 13:10:52	In	Admin Aide	34	35	783
1271	1332278615	11/27/2024, 13:32:06	In	Admin Aide	34	35	783
1272	1332265826	11/27/2024, 14:13:27	In	Logistics Assistant	82	83	1017
1273	1332278615	11/27/2024, 14:48:49	In	Admin Aide	34	35	783
1274	1332265826	11/27/2024, 14:57:17	In	Logistics Assistant	82	83	1017
1275	1332278615	11/27/2024, 15:08:26	In	Admin Aide	34	35	783
1276	1332278615	11/27/2024, 15:19:37	In	Admin Aide	34	35	783
1277	1876060668	11/27/2024, 15:26:49	In	Full Stack Developer	42		867
1278	1332265826	11/27/2024, 15:40:28	In	Logistics Assistant	82	83	1017
1279	1875985940	11/27/2024, 15:53:40	In	Admin Aide	84	85	1031
1280	1331856295	11/27/2024, 17:22:49	In	Digital Creative Marketing	4	5	787
1281	1061279271	11/27/2024, 18:44:48	In	Full Stack Developer	36	37	793
1282	1061279271	11/27/2024, 19:27:33	In	Full Stack Developer	36	37	793
1283	1332278615	11/27/2024, 19:46:29	In	Admin Aide	34	35	783
1284	1332278615	11/27/2024, 19:47:15	In	Admin Aide	34	35	783
1285	1875985940	11/28/2024, 05:46:07	In	Admin Aide	84	85	1031
1286	1876138282	11/28/2024, 06:17:52	In	Internal Finance	95	96	1049
1287	1332278615	11/28/2024, 06:20:12	In	Admin Aide	34	35	783
1288	1332278615	11/28/2024, 06:47:56	In	Admin Aide	34	35	783
1289	1061279271	11/28/2024, 06:52:16	In	Full Stack Developer	36	37	793
1290	1332265826	11/28/2024, 07:05:47	In	Logistics Assistant	82	83	1017
1291	1332265826	11/28/2024, 07:25:27	In	Logistics Assistant	82	83	1017
1292	1332278615	11/28/2024, 07:32:42	In	Admin Aide	34	35	783
1293	1331839441	11/28/2024, 07:52:34	In	Digital Creative Marketing	10	11	788
1294	0909234003	11/28/2024, 07:54:48	In	Full Stack Developer	68	69	687
1295	1331856295	11/28/2024, 08:00:45	In	Digital Creative Marketing	4	5	787
1296	1875985940	11/28/2024, 08:07:37	In	Admin Aide	84	85	1031
1297	1331991510	11/28/2024, 08:08:52	In	Front-end Developer	47	48	835
1298	1876130278	11/28/2024, 08:15:23	In	Scrum Master/Product Owner	20	21	795
1299	0909863555	11/28/2024, 08:15:54	In	Full Stack Developer	2	3	649
1300	1331927637	11/28/2024, 08:20:19	In	Back End Developer	45	46	834
1301	1876138282	11/28/2024, 08:25:15	In	Internal Finance	95	96	1049
1302	1876101869	11/28/2024, 08:39:36	In	Full Stack Developer	14	15	167
1303	1332278615	11/28/2024, 09:06:31	In	Admin Aide	34	35	783
1304	1332304341	11/28/2024, 09:31:40	In	Full Stack Developer	99	100	170
1305	1332265826	11/28/2024, 09:32:35	In	Logistics Assistant	82	83	1017
1306	1875985940	11/28/2024, 09:38:05	In	Admin Aide	84	85	1031
1307	1331905588	11/28/2024, 09:41:57	In	HR and Recruitment Assistant	6	7	169
1308	1876130278	11/28/2024, 09:54:08	In	Scrum Master/Product Owner	20	21	795
1309	1332278615	11/28/2024, 10:31:52	In	Admin Aide	34	35	783
1310	0772342275	11/28/2024, 10:38:37	In	Full Stack Developer	28	29	168
1311	1876101869	11/28/2024, 10:49:49	In	Full Stack Developer	14	15	167
1312	0772342275	11/28/2024, 12:02:53	In	Full Stack Developer	28	29	168
1313	1876138282	11/28/2024, 12:05:54	In	Internal Finance	95	96	1049
1314	1876101869	11/28/2024, 12:18:15	In	Full Stack Developer	14	15	167
1315	1332265826	11/28/2024, 12:59:33	In	Logistics Assistant	82	83	1017
1316	1876116498	11/28/2024, 13:06:11	In	IT Administrator	43	44	185
1317	1332278615	11/28/2024, 13:15:55	In	Admin Aide	34	35	783
1318	1332278615	11/28/2024, 14:41:06	In	Admin Aide	34	35	783
1319	1876101869	11/28/2024, 14:46:49	In	Full Stack Developer	14	15	167
1320	1332265826	11/28/2024, 16:02:42	In	Logistics Assistant	82	83	1017
1321	1876101869	11/28/2024, 17:04:12	In	Full Stack Developer	14	15	167
1322	0909863555	11/28/2024, 17:07:22	In	Full Stack Developer	2	3	649
1323	1061279271	11/28/2024, 17:19:22	In	Full Stack Developer	36	37	793
1324	1875985940	11/28/2024, 18:00:25	In	Admin Aide	84	85	1031
1325	1061279271	11/28/2024, 19:45:49	In	Full Stack Developer	36	37	793
1326	1875985940	11/29/2024, 06:29:25	In	Admin Aide	84	85	1031
1327	1061279271	11/29/2024, 06:32:43	In	Full Stack Developer	36	37	793
1328	1876138282	11/29/2024, 06:40:37	In	Internal Finance	95	96	1049
1329	1332265826	11/29/2024, 07:14:20	In	Logistics Assistant	82	83	1017
1330	1061279271	11/29/2024, 07:16:30	In	Full Stack Developer	36	37	793
1331	0909234003	11/29/2024, 07:58:03	In	Full Stack Developer	68	69	687
1332	1331839441	11/29/2024, 07:58:54	In	Digital Creative Marketing	10	11	788
1333	0909863555	11/29/2024, 08:10:01	In	Full Stack Developer	2	3	649
1334	1876101869	11/29/2024, 08:39:23	In	Full Stack Developer	14	15	167
1335	1875985940	11/29/2024, 08:49:06	In	Admin Aide	84	85	1031
1336	1876103302	11/29/2024, 08:54:56	In	UI/UX Designer	22	23	807
1337	1876070164	11/29/2024, 08:57:43	In	Quality Assurance Specialist	18	19	806
1338	1876103302	11/29/2024, 08:59:43	In	UI/UX Designer	22	23	807
1339	1331905588	11/29/2024, 09:07:02	In	HR and Recruitment Assistant	6	7	169
1340	1876130278	11/29/2024, 09:11:44	In	Scrum Master/Product Owner	20	21	795
1341	1332265826	11/29/2024, 09:28:35	In	Logistics Assistant	82	83	1017
1342	1876060668	11/29/2024, 10:21:55	In	Full Stack Developer	42		867
1343	1876101869	11/29/2024, 10:27:21	In	Full Stack Developer	14	15	167
1344	1876101869	11/29/2024, 12:26:56	In	Full Stack Developer	14	15	167
1345	1332265826	11/29/2024, 13:11:48	In	Logistics Assistant	82	83	1017
1346	1876116498	11/29/2024, 13:37:17	In	IT Administrator	43	44	185
1347	1876130278	11/29/2024, 14:20:44	In	Scrum Master/Product Owner	20	21	795
1348	1876138282	11/29/2024, 15:02:01	In	Internal Finance	95	96	1049
1349	1331905588	11/29/2024, 15:16:53	In	HR and Recruitment Assistant	6	7	169
1350	1875985940	11/29/2024, 16:14:39	In	Admin Aide	84	85	1031
1351	1332265826	11/29/2024, 16:45:37	In	Logistics Assistant	82	83	1017
1352	1876103302	11/29/2024, 17:02:22	In	UI/UX Designer	22	23	807
1353	0909863555	11/29/2024, 17:06:04	In	Full Stack Developer	2	3	649
1354	1331905588	11/29/2024, 18:22:31	In	HR and Recruitment Assistant	6	7	169
1355	1331841869	11/29/2024, 18:23:17	In	HR Consultant	8	9	865
1356	1875985940	11/30/2024, 06:05:10	In	Admin Aide	84	85	1031
1357	1875985940	11/30/2024, 17:24:56	In	Admin Aide	84	85	1031
1358	0909863555	12/02/2024, 07:39:50	In	Full Stack Developer	2	3	649
1359	0909234003	12/02/2024, 07:52:06	In	Full Stack Developer	68	69	687
1360	1331839441	12/02/2024, 08:05:47	In	Digital Creative Marketing	10	11	788
1361	1331991510	12/02/2024, 08:08:49	In	Front-end Developer	47	48	835
1362	1331841869	12/02/2024, 08:11:19	In	HR Consultant	8	9	865
1363	1876101869	12/02/2024, 08:21:38	In	Full Stack Developer	14	15	167
1364	1876103302	12/02/2024, 08:30:28	In	UI/UX Designer	22	23	807
1365	1875985940	12/02/2024, 09:03:43	In	Admin Aide	84	85	1031
1366	1332265826	12/02/2024, 10:11:50	In	Logistics Assistant	82	83	1017
1367	1331905588	12/02/2024, 10:33:34	In	HR and Recruitment Assistant	6	7	169
1368	0909234003	12/02/2024, 10:49:36	In	Full Stack Developer	68	69	687
1369	0909863555	12/02/2024, 12:05:44	In	Full Stack Developer	2	3	649
1370	1876101869	12/02/2024, 12:27:57	In	Full Stack Developer	14	15	167
1371	1331991510	12/02/2024, 12:51:59	In	Front-end Developer	47	48	835
1372	1876101869	12/02/2024, 14:14:09	In	Full Stack Developer	14	15	167
1373	1876103302	12/02/2024, 14:52:38	In	UI/UX Designer	22	23	807
1374	1061279271	12/02/2024, 15:48:59	In	Full Stack Developer	36	37	793
1375	1332265826	12/02/2024, 16:10:51	In	Logistics Assistant	82	83	1017
1376	1875985940	12/02/2024, 16:13:02	In	Admin Aide	84	85	1031
1377	1876101869	12/02/2024, 16:37:21	In	Full Stack Developer	14	15	167
1378	1331991510	12/02/2024, 17:29:55	In	Front-end Developer	47	48	835
1379	1875985940	12/03/2024, 05:45:42	In	Admin Aide	84	85	1031
1380	1876138282	12/03/2024, 06:15:03	In	Internal Finance	95	96	1049
1381	1061279271	12/03/2024, 06:45:59	In	Full Stack Developer	36	37	793
1382	1331833219	12/03/2024, 07:00:37	In	Logistics	12		178
1383	1332278615	12/03/2024, 07:26:20	In	Admin Aide	34	35	783
1384	1331856295	12/03/2024, 07:43:15	In	Digital Creative Marketing	4	5	787
1385	0909234003	12/03/2024, 07:45:12	In	Full Stack Developer	68	69	687
1386	1331991510	12/03/2024, 07:50:38	In	Front-end Developer	47	48	835
1387	1331839441	12/03/2024, 07:53:06	In	Digital Creative Marketing	10	11	788
1388	1876103302	12/03/2024, 08:49:04	In	UI/UX Designer	22	23	807
1389	0909234003	12/03/2024, 09:06:23	In	Full Stack Developer	68	69	687
1390	1875985940	12/03/2024, 09:13:17	In	Admin Aide	84	85	1031
1391	1332278615	12/03/2024, 09:26:38	In	Admin Aide	34	35	783
1392	1331991510	12/03/2024, 09:30:32	In	Front-end Developer	47	48	835
1393	1061279271	12/03/2024, 10:16:59	In	Full Stack Developer	36	37	793
1394	1332278615	12/03/2024, 10:18:36	In	Admin Aide	34	35	783
1395	1061279271	12/03/2024, 10:27:35	In	Full Stack Developer	36	37	793
1396	1061279271	12/03/2024, 10:43:28	In	Full Stack Developer	36	37	793
1397	1876116498	12/03/2024, 12:31:15	In	IT Administrator	43	44	185
1398	1332278615	12/03/2024, 13:00:54	In	Admin Aide	34	35	783
1399	1331905588	12/03/2024, 13:12:17	In	HR and Recruitment Assistant	6	7	169
1400	1061279271	12/03/2024, 13:13:06	In	Full Stack Developer	36	37	793
1401	1876138282	12/03/2024, 13:18:45	In	Internal Finance	95	96	1049
1402	1332278615	12/03/2024, 13:19:10	In	Admin Aide	34	35	783
1403	1331991510	12/03/2024, 13:27:22	In	Front-end Developer	47	48	835
1404	1332278615	12/03/2024, 13:45:37	In	Admin Aide	34	35	783
1405	1332278615	12/03/2024, 15:11:35	In	Admin Aide	34	35	783
1406	1875985940	12/03/2024, 16:13:05	In	Admin Aide	84	85	1031
1407	1876123142	12/03/2024, 16:37:27	In	Full Stack Developer	38	39	794
1408	1332278615	12/04/2024, 05:40:37	In	Admin Aide	34	35	783
1409	1876138282	12/04/2024, 05:52:33	In	Internal Finance	95	96	1049
1410	1332278615	12/04/2024, 06:18:19	In	Admin Aide	34	35	783
1411	1332278615	12/04/2024, 06:34:26	In	Admin Aide	34	35	783
1412	1332265826	12/04/2024, 07:06:05	In	Logistics Assistant	82	83	1017
1413	1061279271	12/04/2024, 07:11:18	In	Full Stack Developer	36	37	793
1414	1332278615	12/04/2024, 07:26:14	In	Admin Aide	34	35	783
1415	0909234003	12/04/2024, 07:50:30	In	Full Stack Developer	68	69	687
1416	1331991510	12/04/2024, 07:52:51	In	Front-end Developer	47	48	835
1417	1331839441	12/04/2024, 07:58:17	In	Digital Creative Marketing	10	11	788
1418	1331856295	12/04/2024, 08:01:40	In	Digital Creative Marketing	4	5	787
1419	1876103302	12/04/2024, 08:22:25	In	UI/UX Designer	22	23	807
1420	1331841869	12/04/2024, 08:34:03	In	HR Consultant	8	9	865
1421	1332269941	12/04/2024, 08:39:46	In	Developer	87	89	1044
1422	1332269941	10/04/2024, 10:00:17	In	Developer	88	87	1042
1423	1332269941	12/04/2024, 08:40:23	In	Developer	87	89	1044
1424	1332286977	12/04/2024, 08:57:33	In	Liaison Officer	101	102	181
1425	1332286977	12/04/2024, 08:57:54	In	Liaison Officer	101	102	181
1426	1332278615	12/04/2024, 09:43:07	In	Admin Aide	34	35	783
1427	1876138282	12/04/2024, 09:43:31	In	Internal Finance	95	96	1049
1428	1331905588	12/04/2024, 10:06:36	In	HR and Recruitment Assistant	6	7	169
1429	1332265826	12/04/2024, 10:09:11	In	Logistics Assistant	82	83	1017
1430	1876060668	12/04/2024, 11:19:58	In	Full Stack Developer	42		867
1431	1876116498	12/04/2024, 12:29:45	In	IT Administrator	43	44	185
1432	1876123142	12/04/2024, 12:38:36	In	Full Stack Developer	38	39	794
1433	1332278615	12/04/2024, 13:05:53	In	Admin Aide	34	35	783
1434	1332278615	12/04/2024, 13:12:29	In	Admin Aide	34	35	783
1435	1332265826	12/04/2024, 14:50:44	In	Logistics Assistant	82	83	1017
1436	1332278615	12/04/2024, 14:57:22	In	Admin Aide	34	35	783
1437	1332265826	12/04/2024, 15:23:05	In	Logistics Assistant	82	83	1017
1438	1331991510	12/04/2024, 15:50:16	In	Front-end Developer	47	48	835
1439	1875985940	12/04/2024, 16:04:53	In	Admin Aide	84	85	1031
1440	1331927637	12/04/2024, 16:15:11	In	Back End Developer	45	46	834
1441	1876138282	12/04/2024, 16:33:31	In	Internal Finance	95	96	1049
1442	1332278615	12/04/2024, 18:23:25	In	Admin Aide	34	35	783
1443	1332278615	12/04/2024, 19:53:22	In	Admin Aide	34	35	783
1444	1332278615	12/04/2024, 21:02:19	In	Admin Aide	34	35	783
1445	1875985940	12/05/2024, 05:47:15	In	Admin Aide	84	85	1031
1446	1332278615	12/05/2024, 06:15:45	In	Admin Aide	34	35	783
1447	1332278615	12/05/2024, 06:25:44	In	Admin Aide	34	35	783
1448	1332278615	12/05/2024, 06:44:59	In	Admin Aide	34	35	783
1449	1332278615	12/05/2024, 06:59:52	In	Admin Aide	34	35	783
1450	1061279271	12/05/2024, 07:09:29	In	Full Stack Developer	36	37	793
1451	1331927637	12/05/2024, 07:25:31	In	Back End Developer	45	46	834
1452	0909234003	12/05/2024, 07:45:22	In	Full Stack Developer	68	69	687
1453	1332278615	12/05/2024, 07:52:55	In	Admin Aide	34	35	783
1454	1331839441	12/05/2024, 07:57:34	In	Digital Creative Marketing	10	11	788
1455	1876101869	12/05/2024, 07:59:43	In	Full Stack Developer	14	15	167
1456	1331856295	12/05/2024, 08:01:30	In	Digital Creative Marketing	4	5	787
1457	1331991510	12/05/2024, 08:03:54	In	Front-end Developer	47	48	835
1458	0909863555	12/05/2024, 08:10:10	In	Full Stack Developer	2	3	649
1459	1876103302	12/05/2024, 08:24:10	In	UI/UX Designer	22	23	807
1460	1332304341	12/05/2024, 08:24:54	In	Full Stack Developer	99	100	170
1461	1332278615	12/05/2024, 08:26:15	In	Admin Aide	34	35	783
1462	1876123142	12/05/2024, 09:07:05	In	Full Stack Developer	38	39	794
1463	1331905588	12/05/2024, 09:12:25	In	HR and Recruitment Assistant	6	7	169
1464	1876130278	12/05/2024, 09:18:14	In	Scrum Master/Product Owner	20	21	795
1465	1875985940	12/05/2024, 09:19:52	In	Admin Aide	84	85	1031
1466	1875985940	12/05/2024, 09:45:11	In	Admin Aide	84	85	1031
1467	1332278615	12/05/2024, 09:48:17	In	Admin Aide	34	35	783
1468	1876060668	12/05/2024, 09:58:28	In	Full Stack Developer	42		867
1469	1332265826	12/05/2024, 10:00:53	In	Logistics Assistant	82	83	1017
1470	1331905588	12/05/2024, 10:23:44	In	HR and Recruitment Assistant	6	7	169
1471	1332278615	12/05/2024, 10:28:55	In	Admin Aide	34	35	783
1472	1876101869	12/05/2024, 12:25:51	In	Full Stack Developer	14	15	167
1473	1876116498	12/05/2024, 12:28:38	In	IT Administrator	43	44	185
1474	1876130278	12/05/2024, 12:45:16	In	Scrum Master/Product Owner	20	21	795
1475	1332278615	12/05/2024, 13:09:37	In	Admin Aide	34	35	783
1476	1332265826	12/05/2024, 13:16:27	In	Logistics Assistant	82	83	1017
1477	1876101869	12/05/2024, 14:00:39	In	Full Stack Developer	14	15	167
1478	1876130278	12/05/2024, 14:01:48	In	Scrum Master/Product Owner	20	21	795
1479	1332265826	12/05/2024, 14:28:30	In	Logistics Assistant	82	83	1017
1480	1332265826	12/05/2024, 14:50:59	In	Logistics Assistant	82	83	1017
1481	0909234003	12/05/2024, 15:32:13	In	Full Stack Developer	68	69	687
1482	1875985940	12/05/2024, 16:13:19	In	Admin Aide	84	85	1031
1483	1061279271	12/05/2024, 17:26:10	In	Full Stack Developer	36	37	793
1484	1332278615	12/05/2024, 19:16:42	In	Admin Aide	34	35	783
1485	1876123142	12/05/2024, 20:13:37	In	Full Stack Developer	38	39	794
1486	1332278615	12/05/2024, 20:52:33	In	Admin Aide	34	35	783
1487	1332278615	12/05/2024, 20:56:44	In	Admin Aide	34	35	783
1488	1332278615	12/05/2024, 21:18:05	In	Admin Aide	34	35	783
1489	1875985940	12/06/2024, 05:42:43	In	Admin Aide	84	85	1031
1490	1332278615	12/06/2024, 05:47:47	In	Admin Aide	34	35	783
1491	1332278615	12/06/2024, 06:25:12	In	Admin Aide	34	35	783
1492	1332278615	12/06/2024, 06:25:41	In	Admin Aide	34	35	783
1493	0909863555	12/06/2024, 08:19:39	In	Full Stack Developer	2	3	649
1494	1876130278	12/06/2024, 09:05:41	In	Scrum Master/Product Owner	20	21	795
1495	1875985940	12/06/2024, 09:12:51	In	Admin Aide	84	85	1031
1496	1332265826	12/06/2024, 09:27:35	In	Logistics Assistant	82	83	1017
1497	1332278615	12/06/2024, 09:56:08	In	Admin Aide	34	35	783
1498	1876060668	12/06/2024, 10:04:43	In	Full Stack Developer	42		867
1499	1876103302	12/06/2024, 10:20:13	In	UI/UX Designer	22	23	807
1500	0909234003	12/06/2024, 11:44:41	In	Full Stack Developer	68	69	687
1501	1331905588	12/06/2024, 12:26:17	In	HR and Recruitment Assistant	6	7	169
1502	1876116498	12/06/2024, 12:42:30	In	IT Administrator	43	44	185
1503	1876123142	12/06/2024, 12:55:21	In	Full Stack Developer	38	39	794
1504	1061279271	12/06/2024, 12:55:50	In	Full Stack Developer	36	37	793
1505	1332278615	12/06/2024, 13:05:13	In	Admin Aide	34	35	783
1506	1332278615	12/06/2024, 13:05:43	In	Admin Aide	34	35	783
1507	0909863555	12/06/2024, 13:34:00	In	Full Stack Developer	2	3	649
1508	1332278615	12/06/2024, 14:10:47	In	Admin Aide	34	35	783
1509	1332265826	12/06/2024, 15:13:26	In	Logistics Assistant	82	83	1017
1510	1875985940	12/06/2024, 16:12:22	In	Admin Aide	84	85	1031
1511	1332265826	12/06/2024, 16:16:15	In	Logistics Assistant	82	83	1017
1512	1875985940	12/06/2024, 17:04:16	In	Admin Aide	84	85	1031
1513	1332278615	12/06/2024, 18:52:50	In	Admin Aide	34	35	783
1514	1332278615	12/06/2024, 18:53:52	In	Admin Aide	34	35	783
1515	1875985940	12/07/2024, 05:47:54	In	Admin Aide	84	85	1031
1516	1875985940	12/07/2024, 06:12:43	In	Admin Aide	84	85	1031
1517	1332278615	12/07/2024, 06:43:55	In	Admin Aide	34	35	783
1518	1875985940	12/07/2024, 06:54:39	In	Admin Aide	84	85	1031
1519	1875985940	12/07/2024, 07:48:23	In	Admin Aide	84	85	1031
1520	1875985940	12/07/2024, 08:33:15	In	Admin Aide	84	85	1031
1521	1332278615	12/07/2024, 08:34:34	In	Admin Aide	34	35	783
1522	1332278615	12/07/2024, 13:09:03	In	Admin Aide	34	35	783
1523	1875985940	12/07/2024, 13:33:05	In	Admin Aide	84	85	1031
1524	1875985940	12/07/2024, 14:52:32	In	Admin Aide	84	85	1031
1525	1332278615	12/07/2024, 15:08:45	In	Admin Aide	34	35	783
1526	1876103302	12/09/2024, 08:23:54	In	UI/UX Designer	22	23	807
1527	1876101869	12/09/2024, 08:24:25	In	Full Stack Developer	14	15	167
1528	1331841869	12/09/2024, 08:27:03	In	HR Consultant	8	9	865
1529	0909234003	12/09/2024, 08:28:44	In	Full Stack Developer	68	69	687
1530	1332278615	12/09/2024, 08:29:19	In	Admin Aide	34	35	783
1531	1875985940	12/09/2024, 09:08:35	In	Admin Aide	84	85	1031
1532	1331905588	12/09/2024, 09:38:26	In	HR and Recruitment Assistant	6	7	169
1533	1876123142	12/09/2024, 09:46:33	In	Full Stack Developer	38	39	794
1534	1332278615	12/09/2024, 09:50:20	In	Admin Aide	34	35	783
1535	1876101869	12/09/2024, 09:51:35	In	Full Stack Developer	14	15	167
1536	1875985940	12/09/2024, 10:00:54	In	Admin Aide	84	85	1031
1537	1332278615	12/09/2024, 10:50:52	In	Admin Aide	34	35	783
1538	1876101869	12/09/2024, 12:26:03	In	Full Stack Developer	14	15	167
1539	1876123142	12/09/2024, 12:29:15	In	Full Stack Developer	38	39	794
1540	1331880233	12/09/2024, 12:32:46	In	Back End Developer	32	33	173
1541	1876116498	12/09/2024, 12:48:17	In	IT Administrator	43	44	185
1542	1332265826	12/09/2024, 12:55:01	In	Logistics Assistant	82	83	1017
1543	1876103302	12/09/2024, 13:24:45	In	UI/UX Designer	22	23	807
1544	1061279271	12/09/2024, 15:08:22	In	Full Stack Developer	36	37	793
1545	1332278615	12/09/2024, 15:52:25	In	Admin Aide	34	35	783
1546	1876103302	12/09/2024, 15:55:51	In	UI/UX Designer	22	23	807
1547	1875985940	12/09/2024, 16:00:20	In	Admin Aide	84	85	1031
1548	1332269941	12/04/2024, 08:44:37	In	Developer	88	87	1042
1549	1332278615	12/09/2024, 18:47:57	In	Admin Aide	34	35	783
1550	1875985940	12/10/2024, 05:44:38	In	Admin Aide	84	85	1031
1551	1876138282	12/10/2024, 06:07:53	In	Internal Finance	95	96	1049
1552	1061279271	12/10/2024, 06:13:48	In	Full Stack Developer	36	37	793
1553	1332278615	12/10/2024, 06:29:49	In	Admin Aide	34	35	783
1554	1331833219	12/10/2024, 06:48:07	In	Logistics	12		178
1555	1332278615	12/10/2024, 06:55:03	In	Admin Aide	34	35	783
1556	0771071059	12/10/2024, 07:36:21	In	TVI Head	24	25	864
1557	0909234003	12/10/2024, 07:52:01	In	Full Stack Developer	68	69	687
1558	1331856295	12/10/2024, 07:56:31	In	Digital Creative Marketing	4	5	787
1559	1876101869	12/10/2024, 08:13:07	In	Full Stack Developer	14	15	167
1560	1332265826	12/10/2024, 08:23:02	In	Logistics Assistant	82	83	1017
1561	1332278615	12/10/2024, 08:30:28	In	Admin Aide	34	35	783
1562	1876103302	12/10/2024, 08:34:25	In	UI/UX Designer	22	23	807
1563	1875985940	12/10/2024, 08:52:43	In	Admin Aide	84	85	1031
1564	1876101869	12/10/2024, 09:06:56	In	Full Stack Developer	14	15	167
1565	1332265826	12/10/2024, 09:21:44	In	Logistics Assistant	82	83	1017
1566	1331880233	12/10/2024, 09:33:29	In	Back End Developer	32	33	173
1567	1332265826	12/10/2024, 10:07:07	In	Logistics Assistant	82	83	1017
1568	1331787297	12/10/2024, 10:21:14	In	Developer	16	17	210
1569	1876060668	12/10/2024, 11:10:23	In	Full Stack Developer	42		867
1570	0772342275	12/10/2024, 11:25:20	In	Full Stack Developer	28	29	168
1571	1876116498	12/10/2024, 12:54:32	In	IT Administrator	43	44	185
1572	1332278615	12/10/2024, 13:03:54	In	Admin Aide	34	35	783
1573	1332265826	12/10/2024, 13:06:03	In	Logistics Assistant	82	83	1017
1574	1331905588	12/10/2024, 13:08:26	In	HR and Recruitment Assistant	6	7	169
1575	1876101869	12/10/2024, 14:09:51	In	Full Stack Developer	14	15	167
1576	1876101869	12/10/2024, 14:38:20	In	Full Stack Developer	14	15	167
1577	1332278615	12/10/2024, 15:03:14	In	Admin Aide	34	35	783
1578	0772342275	12/10/2024, 15:10:52	In	Full Stack Developer	28	29	168
1579	1332265826	12/10/2024, 15:58:41	In	Logistics Assistant	82	83	1017
1580	1876060668	12/10/2024, 16:08:16	In	Full Stack Developer	42		867
1581	1875985940	12/10/2024, 16:09:09	In	Admin Aide	84	85	1031
1582	1875985940	12/10/2024, 16:52:18	In	Admin Aide	84	85	1031
1583	1875985940	12/10/2024, 17:38:28	In	Admin Aide	84	85	1031
1584	0909234003	12/11/2024, 07:59:38	In	Full Stack Developer	68	69	687
1585	1876101869	12/11/2024, 08:01:11	In	Full Stack Developer	14	15	167
1586	1876130278	12/11/2024, 08:15:54	In	Scrum Master/Product Owner	20	21	795
1587	0909863555	12/11/2024, 08:18:47	In	Full Stack Developer	2	3	649
1588	1876103302	12/11/2024, 08:35:48	In	UI/UX Designer	22	23	807
1589	1876123142	12/11/2024, 09:06:29	In	Full Stack Developer	38	39	794
1590	1875985940	12/11/2024, 09:16:33	In	Admin Aide	84	85	1031
1591	1332265826	12/11/2024, 09:20:17	In	Logistics Assistant	82	83	1017
1592	1331839441	12/11/2024, 09:22:35	In	Digital Creative Marketing	10	11	788
1593	1331905588	12/11/2024, 09:26:18	In	HR and Recruitment Assistant	6	7	169
1594	1876138282	12/11/2024, 09:42:04	In	Internal Finance	95	96	1049
1595	1332265826	12/11/2024, 10:01:47	In	Logistics Assistant	82	83	1017
1596	0772342275	12/11/2024, 10:49:13	In	Full Stack Developer	28	29	168
1597	1332265826	12/11/2024, 10:53:54	In	Logistics Assistant	82	83	1017
1598	1332269941	12/09/2024, 17:35:27	In	Developer	87	89	1044
1599	1332265826	12/11/2024, 11:08:05	In	Logistics Assistant	82	83	1017
1600	1876101869	12/11/2024, 11:33:40	In	Full Stack Developer	14	15	167
1601	1331880233	12/11/2024, 12:29:15	In	Back End Developer	32	33	173
1602	1876123142	12/11/2024, 12:38:25	In	Full Stack Developer	38	39	794
1603	1876116498	12/11/2024, 12:52:07	In	IT Administrator	43	44	185
1604	1332278615	12/11/2024, 13:04:46	In	Admin Aide	34	35	783
1605	1332265826	12/11/2024, 13:20:01	In	Logistics Assistant	82	83	1017
1606	1876103302	12/11/2024, 13:28:38	In	UI/UX Designer	22	23	807
1607	1876101869	12/11/2024, 13:38:12	In	Full Stack Developer	14	15	167
1608	1876130278	12/11/2024, 15:36:03	In	Scrum Master/Product Owner	20	21	795
1609	1875985940	12/11/2024, 16:08:56	In	Admin Aide	84	85	1031
1610	1332265826	12/11/2024, 16:16:10	In	Logistics Assistant	82	83	1017
1611	0909234003	12/11/2024, 16:17:50	In	Full Stack Developer	68	69	687
1612	1876138282	12/11/2024, 17:36:50	In	Internal Finance	95	96	1049
1613	1876103302	12/11/2024, 18:32:32	In	UI/UX Designer	22	23	807
1614	1876138282	12/11/2024, 19:40:38	In	Internal Finance	95	96	1049
1615	1061279271	12/11/2024, 20:30:44	In	Full Stack Developer	36	37	793
1616	1875985940	12/12/2024, 05:47:02	In	Admin Aide	84	85	1031
1617	1875985940	12/12/2024, 06:22:07	In	Admin Aide	84	85	1031
1618	1875985940	12/12/2024, 06:28:09	In	Admin Aide	84	85	1031
1619	1332278615	12/12/2024, 06:29:01	In	Admin Aide	34	35	783
1620	1331833219	12/12/2024, 06:41:54	In	Logistics	12		178
1621	1876138282	12/12/2024, 06:51:38	In	Internal Finance	95	96	1049
1622	1061279271	12/12/2024, 06:55:54	In	Full Stack Developer	36	37	793
1623	1061279271	12/12/2024, 07:00:54	In	Full Stack Developer	36	37	793
1624	1875985940	12/12/2024, 07:02:53	In	Admin Aide	84	85	1031
1625	0771071059	12/12/2024, 07:26:24	In	TVI Head	24	25	864
1626	1331927637	12/12/2024, 07:30:36	In	Back End Developer	45	46	834
1627	1332278615	12/12/2024, 07:45:48	In	Admin Aide	34	35	783
1628	1331856295	12/12/2024, 07:50:33	In	Digital Creative Marketing	4	5	787
1629	1332265826	12/12/2024, 07:54:35	In	Logistics Assistant	82	83	1017
1630	1876101869	12/12/2024, 08:00:25	In	Full Stack Developer	14	15	167
1631	1331991510	12/12/2024, 08:01:28	In	Front-end Developer	47	48	835
1632	0909234003	12/12/2024, 08:04:07	In	Full Stack Developer	68	69	687
1633	1331839441	12/12/2024, 08:07:27	In	Digital Creative Marketing	10	11	788
1634	1331833219	12/12/2024, 08:09:23	In	Logistics	12		178
1635	1331927637	12/12/2024, 08:09:42	In	Back End Developer	45	46	834
1636	1332265826	12/12/2024, 08:11:18	In	Logistics Assistant	82	83	1017
1637	1332269941	12/11/2024, 11:03:27	In	Developer	88	87	1042
1638	0909863555	12/12/2024, 08:22:18	In	Full Stack Developer	2	3	649
1639	1876060668	12/12/2024, 08:45:24	In	Full Stack Developer	42		867
1640	1332265826	12/12/2024, 08:51:51	In	Logistics Assistant	82	83	1017
1641	0772342275	12/12/2024, 09:17:07	In	Full Stack Developer	28	29	168
1642	1331841869	12/12/2024, 09:24:27	In	HR Consultant	8	9	865
1643	0906143331	12/12/2024, 09:32:33	In	Chief Executive Officer	103	104	162
1644	0771604515	12/12/2024, 09:34:46	In	Chief Finance Officer	104	105	161
1645	1332304341	12/12/2024, 10:18:57	In	Full Stack Developer	99	100	170
1646	1331760816	12/12/2024, 10:44:40	In	UI/UX Designer	30	31	784
1647	1876101869	12/12/2024, 11:45:01	In	Full Stack Developer	14	15	167
1648	1331760816	12/12/2024, 11:51:25	In	UI/UX Designer	30	31	784
1649	1331991510	12/12/2024, 11:56:11	In	Front-end Developer	47	48	835
1650	1876130278	12/12/2024, 12:01:03	In	Scrum Master/Product Owner	20	21	795
1651	1332265826	12/12/2024, 12:05:50	In	Logistics Assistant	82	83	1017
1652	1876116498	12/12/2024, 12:17:06	In	IT Administrator	43	44	185
1653	1876101869	12/12/2024, 12:33:30	In	Full Stack Developer	14	15	167
1654	1331927637	12/12/2024, 12:48:56	In	Back End Developer	45	46	834
1655	1876138282	12/12/2024, 12:52:44	In	Internal Finance	95	96	1049
1656	1332278615	12/12/2024, 13:05:10	In	Admin Aide	34	35	783
1657	1331856295	12/12/2024, 13:39:22	In	Digital Creative Marketing	4	5	787
1658	1331856295	12/12/2024, 13:54:57	In	Digital Creative Marketing	4	5	787
1659	1332278615	12/12/2024, 13:59:34	In	Admin Aide	34	35	783
1660	1332278615	12/12/2024, 14:01:36	In	Admin Aide	34	35	783
1661	1332265826	12/12/2024, 14:30:23	In	Logistics Assistant	82	83	1017
1662	1876101869	12/12/2024, 14:49:50	In	Full Stack Developer	14	15	167
1663	1332278615	12/12/2024, 15:10:54	In	Admin Aide	34	35	783
1664	1332278615	12/12/2024, 15:27:39	In	Admin Aide	34	35	783
1665	1332278615	12/12/2024, 15:52:03	In	Admin Aide	34	35	783
1666	1875985940	12/12/2024, 16:04:07	In	Admin Aide	84	85	1031
1667	1331880233	12/12/2024, 16:14:18	In	Back End Developer	32	33	173
1668	1876123142	12/12/2024, 17:12:41	In	Full Stack Developer	38	39	794
1669	1332265826	12/12/2024, 17:25:53	In	Logistics Assistant	82	83	1017
1670	1332265826	12/12/2024, 17:28:12	In	Logistics Assistant	82	83	1017
1671	1331760816	12/12/2024, 18:04:15	In	UI/UX Designer	30	31	784
1672	1332278615	12/12/2024, 19:31:09	In	Admin Aide	34	35	783
1673	1332278615	12/12/2024, 19:32:06	In	Admin Aide	34	35	783
1674	1876138282	12/12/2024, 19:44:37	In	Internal Finance	95	96	1049
1675	1061279271	12/12/2024, 21:06:02	In	Full Stack Developer	36	37	793
1676	1875985940	12/13/2024, 05:36:02	In	Admin Aide	84	85	1031
1677	1876138282	12/13/2024, 06:12:29	In	Internal Finance	95	96	1049
1678	1332278615	12/13/2024, 06:20:52	In	Admin Aide	34	35	783
1679	1875985940	12/13/2024, 06:32:09	In	Admin Aide	84	85	1031
1680	1331833219	12/13/2024, 06:50:15	In	Logistics	12		178
1681	1875985940	12/13/2024, 06:55:37	In	Admin Aide	84	85	1031
1682	1332265826	12/13/2024, 06:59:56	In	Logistics Assistant	82	83	1017
1683	0771071059	12/13/2024, 07:28:21	In	TVI Head	24	25	864
1684	1332278615	12/13/2024, 07:42:41	In	Admin Aide	34	35	783
1685	1876103302	12/13/2024, 07:53:36	In	UI/UX Designer	22	23	807
1686	1331991510	12/13/2024, 07:56:55	In	Front-end Developer	47	48	835
1687	1332265826	12/13/2024, 07:57:54	In	Logistics Assistant	82	83	1017
1688	1331839441	12/13/2024, 08:02:48	In	Digital Creative Marketing	10	11	788
1689	0909234003	12/13/2024, 08:04:41	In	Full Stack Developer	68	69	687
1690	1331856295	12/13/2024, 08:09:13	In	Digital Creative Marketing	4	5	787
1691	1332265826	12/13/2024, 08:11:10	In	Logistics Assistant	82	83	1017
1692	1331841869	12/13/2024, 08:12:58	In	HR Consultant	8	9	865
1693	0909863555	12/13/2024, 08:15:01	In	Full Stack Developer	2	3	649
1694	1332278615	12/13/2024, 08:15:52	In	Admin Aide	34	35	783
1695	1332265826	12/13/2024, 08:20:48	In	Logistics Assistant	82	83	1017
1696	1876130278	12/13/2024, 08:28:53	In	Scrum Master/Product Owner	20	21	795
1697	1876101869	12/13/2024, 08:31:20	In	Full Stack Developer	14	15	167
1698	1332278615	12/13/2024, 08:36:31	In	Admin Aide	34	35	783
1699	1875985940	12/13/2024, 08:49:45	In	Admin Aide	84	85	1031
1700	1875985940	12/13/2024, 09:07:22	In	Admin Aide	84	85	1031
1701	1332278615	12/13/2024, 09:16:45	In	Admin Aide	34	35	783
1702	1331787297	12/13/2024, 09:21:44	In	Developer	16	17	210
1703	1331880233	12/13/2024, 09:34:25	In	Back End Developer	32	33	173
1704	1876101869	12/13/2024, 09:48:41	In	Full Stack Developer	14	15	167
1705	1876123142	12/13/2024, 09:49:25	In	Full Stack Developer	38	39	794
1706	1332278615	12/13/2024, 10:00:58	In	Admin Aide	34	35	783
1707	1875985940	12/13/2024, 10:10:01	In	Admin Aide	84	85	1031
1708	1875985940	12/13/2024, 10:27:44	In	Admin Aide	84	85	1031
1709	1876130278	12/13/2024, 10:40:26	In	Scrum Master/Product Owner	20	21	795
1710	0772342275	12/13/2024, 11:18:08	In	Full Stack Developer	28	29	168
1711	1876101869	12/13/2024, 11:31:10	In	Full Stack Developer	14	15	167
1712	1332265826	12/13/2024, 11:43:32	In	Logistics Assistant	82	83	1017
1713	1332278615	12/13/2024, 12:01:48	In	Admin Aide	34	35	783
1714	1331880233	12/13/2024, 12:22:58	In	Back End Developer	32	33	173
1715	1876101869	12/13/2024, 12:27:58	In	Full Stack Developer	14	15	167
1716	1876116498	12/13/2024, 12:56:45	In	IT Administrator	43	44	185
1717	1876101869	12/13/2024, 13:00:21	In	Full Stack Developer	14	15	167
1718	1332265826	12/13/2024, 13:04:50	In	Logistics Assistant	82	83	1017
1719	1332265826	12/13/2024, 13:25:52	In	Logistics Assistant	82	83	1017
1720	1875985940	12/13/2024, 14:38:30	In	Admin Aide	84	85	1031
1721	1875985940	12/13/2024, 15:12:31	In	Admin Aide	84	85	1031
1722	1876101869	12/13/2024, 15:15:54	In	Full Stack Developer	14	15	167
1723	1876138282	12/13/2024, 15:47:38	In	Internal Finance	95	96	1049
1724	1875985940	12/13/2024, 16:13:28	In	Admin Aide	84	85	1031
1725	0909234003	12/13/2024, 16:21:16	In	Full Stack Developer	68	69	687
1726	1332278615	12/13/2024, 16:41:38	In	Admin Aide	34	35	783
1727	1332265826	12/13/2024, 17:04:55	In	Logistics Assistant	82	83	1017
1728	1332304341	12/13/2024, 17:06:13	In	Full Stack Developer	99	100	170
1729	1875985940	12/13/2024, 17:09:23	In	Admin Aide	84	85	1031
1730	1332265826	12/13/2024, 17:12:01	In	Logistics Assistant	82	83	1017
1731	1332278615	12/13/2024, 17:59:49	In	Admin Aide	34	35	783
1732	1875985940	12/13/2024, 18:21:59	In	Admin Aide	84	85	1031
1733	1875985940	12/13/2024, 18:48:16	In	Admin Aide	84	85	1031
1734	1332265826	12/13/2024, 18:48:50	In	Logistics Assistant	82	83	1017
1735	1332278615	12/13/2024, 19:45:19	In	Admin Aide	34	35	783
1736	1332265826	12/13/2024, 20:05:01	In	Logistics Assistant	82	83	1017
1737	1876123142	12/13/2024, 20:07:18	In	Full Stack Developer	38	39	794
1738	1061279271	12/13/2024, 20:27:04	In	Full Stack Developer	36	37	793
1739	1876138282	12/13/2024, 20:33:24	In	Internal Finance	95	96	1049
1740	0909863555	12/16/2024, 20:16:07	In	Full Stack Developer	2	3	649
1741	1061201422	12/16/2024, 21:55:47	In	Quality Assurance Specialist	106	107	1061
1742	1061201422	12/16/2024, 21:56:11	In	Quality Assurance Specialist	106	107	1061
1743	1332265826	12/17/2024, 15:27:25	In	Logistics Assistant	82	83	1017
1744	1876123142	12/17/2024, 15:53:26	In	Full Stack Developer	38	39	794
1745	1331880233	12/17/2024, 16:13:35	In	Back End Developer	32	33	173
1746	1332265826	12/17/2024, 16:15:08	In	Logistics Assistant	82	83	1017
1747	1332278615	12/17/2024, 16:16:48	In	Admin Aide	34	35	783
1748	1875985940	12/17/2024, 17:30:01	In	Admin Aide	84	85	1031
1749	1061279271	12/17/2024, 17:49:21	In	Full Stack Developer	36	37	793
1750	1332278615	12/17/2024, 19:03:46	In	Admin Aide	34	35	783
1751	1332278615	12/18/2024, 05:56:36	In	Admin Aide	34	35	783
1752	1875985940	12/18/2024, 06:09:27	In	Admin Aide	84	85	1031
1753	1332278615	12/18/2024, 06:11:00	In	Admin Aide	34	35	783
1754	1332278615	12/18/2024, 06:50:51	In	Admin Aide	34	35	783
1755	1875985940	12/18/2024, 07:09:10	In	Admin Aide	84	85	1031
1756	1875985940	12/18/2024, 07:10:38	In	Admin Aide	84	85	1031
1757	1332265826	12/18/2024, 07:14:11	In	Logistics Assistant	82	83	1017
1758	1875985940	12/18/2024, 07:17:18	In	Admin Aide	84	85	1031
1759	1332265826	12/18/2024, 07:19:01	In	Logistics Assistant	82	83	1017
1760	0771071059	12/18/2024, 07:32:05	In	TVI Head	24	25	864
1761	1331991510	12/18/2024, 07:58:26	In	Front-end Developer	47	48	835
1762	1331927637	12/18/2024, 08:02:08	In	Back End Developer	45	46	834
1763	0909234003	12/18/2024, 08:16:55	In	Full Stack Developer	68	69	687
1764	1331856295	12/18/2024, 08:21:13	In	Digital Creative Marketing	4	5	787
1765	1876103302	12/18/2024, 08:37:32	In	UI/UX Designer	22	23	807
1766	1332278615	12/18/2024, 08:44:58	In	Admin Aide	34	35	783
1767	1332265826	12/18/2024, 08:58:54	In	Logistics Assistant	82	83	1017
1768	1875985940	12/18/2024, 09:38:30	In	Admin Aide	84	85	1031
1769	1876138282	12/18/2024, 09:53:49	In	Internal Finance	95	96	1049
1770	1332278615	12/18/2024, 10:05:50	In	Admin Aide	34	35	783
1771	1331880233	12/18/2024, 10:08:14	In	Back End Developer	32	33	173
1772	1332278615	12/18/2024, 10:38:21	In	Admin Aide	34	35	783
1773	1332278615	12/18/2024, 10:51:29	In	Admin Aide	34	35	783
1774	1876138282	12/18/2024, 11:28:50	In	Internal Finance	95	96	1049
1775	1331856295	12/18/2024, 12:57:42	In	Digital Creative Marketing	4	5	787
1776	1332278615	12/18/2024, 13:04:54	In	Admin Aide	34	35	783
1777	1876116498	12/18/2024, 13:10:35	In	IT Administrator	43	44	185
1778	1331880233	12/18/2024, 13:18:37	In	Back End Developer	32	33	173
1779	1876130278	12/18/2024, 14:03:39	In	Scrum Master/Product Owner	20	21	795
1780	1332278615	12/18/2024, 14:57:08	In	Admin Aide	34	35	783
1781	0909863555	12/18/2024, 15:02:04	In	Full Stack Developer	2	3	649
1782	1876138282	12/18/2024, 15:17:51	In	Internal Finance	95	96	1049
1783	1061279271	12/18/2024, 15:23:03	In	Full Stack Developer	36	37	793
1784	1332278615	12/18/2024, 15:37:33	In	Admin Aide	34	35	783
1785	1332265826	12/18/2024, 15:42:57	In	Logistics Assistant	82	83	1017
1786	1875985940	12/18/2024, 16:15:16	In	Admin Aide	84	85	1031
1787	1061279271	12/18/2024, 16:36:53	In	Full Stack Developer	36	37	793
1788	1876123142	12/18/2024, 18:05:09	In	Full Stack Developer	38	39	794
1789	1875985940	12/19/2024, 05:46:14	In	Admin Aide	84	85	1031
1790	1332278615	12/19/2024, 06:20:55	In	Admin Aide	34	35	783
1791	1331833219	12/19/2024, 06:47:38	In	Logistics	12		178
1792	1876138282	12/19/2024, 07:02:17	In	Internal Finance	95	96	1049
1793	1332278615	12/19/2024, 07:10:32	In	Admin Aide	34	35	783
1794	1331927637	12/19/2024, 07:24:30	In	Back End Developer	45	46	834
1795	0771071059	12/19/2024, 07:31:51	In	TVI Head	24	25	864
1796	0909234003	12/19/2024, 07:53:33	In	Full Stack Developer	68	69	687
1797	1331839441	12/19/2024, 07:57:55	In	Digital Creative Marketing	10	11	788
1798	1331991510	12/19/2024, 08:04:46	In	Front-end Developer	47	48	835
1799	1331856295	12/19/2024, 08:09:49	In	Digital Creative Marketing	4	5	787
1800	1876103302	12/19/2024, 08:48:49	In	UI/UX Designer	22	23	807
1801	1876130278	12/19/2024, 08:56:03	In	Scrum Master/Product Owner	20	21	795
1802	1332278615	12/19/2024, 09:12:55	In	Admin Aide	34	35	783
1803	1331880233	12/19/2024, 09:26:38	In	Back End Developer	32	33	173
1804	1875985940	12/19/2024, 10:02:12	In	Admin Aide	84	85	1031
1805	1332265826	12/19/2024, 10:05:35	In	Logistics Assistant	82	83	1017
1806	0909234003	12/19/2024, 10:11:19	In	Full Stack Developer	68	69	687
1807	1876130278	12/19/2024, 10:19:39	In	Scrum Master/Product Owner	20	21	795
1808	1875985940	12/19/2024, 10:23:28	In	Admin Aide	84	85	1031
1809	1332278615	12/19/2024, 10:46:17	In	Admin Aide	34	35	783
1810	1332265826	12/19/2024, 11:18:15	In	Logistics Assistant	82	83	1017
1811	1332278615	12/19/2024, 13:06:30	In	Admin Aide	34	35	783
1812	1332278615	12/19/2024, 13:13:23	In	Admin Aide	34	35	783
1813	0909863555	12/19/2024, 14:53:25	In	Full Stack Developer	2	3	649
1814	1332278615	12/19/2024, 15:17:33	In	Admin Aide	34	35	783
1815	1331880233	12/19/2024, 16:00:11	In	Back End Developer	32	33	173
1816	1875985940	12/19/2024, 16:23:51	In	Admin Aide	84	85	1031
1817	1331927637	12/19/2024, 18:09:02	In	Back End Developer	45	46	834
1818	1875985940	12/19/2024, 18:26:12	In	Admin Aide	84	85	1031
1819	1061279271	12/19/2024, 19:00:57	In	Full Stack Developer	36	37	793
1820	1332278615	12/19/2024, 19:14:47	In	Admin Aide	34	35	783
1821	1332278615	12/19/2024, 19:38:01	In	Admin Aide	34	35	783
1822	1061201422	12/19/2024, 20:51:07	In	Quality Assurance Specialist	106	107	1061
1823	1332278615	12/19/2024, 21:58:47	In	Admin Aide	34	35	783
1824	1875985940	12/20/2024, 05:47:43	In	Admin Aide	84	85	1031
1825	1332278615	12/20/2024, 06:06:23	In	Admin Aide	34	35	783
1826	1332278615	12/20/2024, 06:22:35	In	Admin Aide	34	35	783
1827	1332278615	12/20/2024, 06:32:45	In	Admin Aide	34	35	783
1828	1332278615	12/20/2024, 06:50:23	In	Admin Aide	34	35	783
1829	1876138282	12/20/2024, 07:01:12	In	Internal Finance	95	96	1049
1830	1332265826	12/20/2024, 07:16:45	In	Logistics Assistant	82	83	1017
1831	1332278615	12/20/2024, 07:34:02	In	Admin Aide	34	35	783
1832	1331991510	12/20/2024, 08:01:55	In	Front-end Developer	47	48	835
1833	1331839441	12/20/2024, 08:06:24	In	Digital Creative Marketing	10	11	788
1834	1331856295	12/20/2024, 08:08:47	In	Digital Creative Marketing	4	5	787
1835	1331841869	12/20/2024, 08:14:18	In	HR Consultant	8	9	865
1836	1332278615	12/20/2024, 08:18:04	In	Admin Aide	34	35	783
1837	1876130278	12/20/2024, 08:22:31	In	Scrum Master/Product Owner	20	21	795
1838	1332265826	12/20/2024, 08:27:46	In	Logistics Assistant	82	83	1017
1839	1876103302	12/20/2024, 08:30:46	In	UI/UX Designer	22	23	807
1840	1331905588	12/20/2024, 09:01:54	In	HR and Recruitment Assistant	6	7	169
1841	1332278615	12/20/2024, 09:09:17	In	Admin Aide	34	35	783
1842	1332278615	12/20/2024, 09:15:22	In	Admin Aide	34	35	783
1843	1875985940	12/20/2024, 09:40:18	In	Admin Aide	84	85	1031
1844	1331880233	12/20/2024, 09:50:44	In	Back End Developer	32	33	173
1845	1332265826	12/20/2024, 09:58:32	In	Logistics Assistant	82	83	1017
1846	1332278615	12/20/2024, 10:03:55	In	Admin Aide	34	35	783
1847	1875985940	12/20/2024, 10:10:58	In	Admin Aide	84	85	1031
1848	1332278615	12/20/2024, 10:12:31	In	Admin Aide	34	35	783
1849	1332278615	12/20/2024, 10:32:38	In	Admin Aide	34	35	783
1850	1332265826	12/20/2024, 11:15:00	In	Logistics Assistant	82	83	1017
1851	1331880233	12/20/2024, 12:07:28	In	Back End Developer	32	33	173
1852	1331991510	12/20/2024, 12:41:06	In	Front-end Developer	47	48	835
1853	1332304341	12/20/2024, 12:42:39	In	Full Stack Developer	99	100	170
1854	1876060668	12/20/2024, 12:56:32	In	Full Stack Developer	42		867
1855	1332278615	12/20/2024, 13:00:50	In	Admin Aide	34	35	783
1856	1332265826	12/20/2024, 13:07:24	In	Logistics Assistant	82	83	1017
1857	1332269941	12/12/2024, 08:12:08	In	Developer	87	89	1044
1858	0909863555	12/20/2024, 14:56:05	In	Full Stack Developer	2	3	649
1859	1332278615	12/20/2024, 15:09:22	In	Admin Aide	34	35	783
1860	1332265826	12/20/2024, 15:38:13	In	Logistics Assistant	82	83	1017
1861	1332278615	12/20/2024, 15:54:52	In	Admin Aide	34	35	783
1862	1331880233	12/20/2024, 15:59:15	In	Back End Developer	32	33	173
1863	1332304341	12/20/2024, 16:14:41	In	Full Stack Developer	99	100	170
1864	1332278615	12/20/2024, 16:19:26	In	Admin Aide	34	35	783
1865	1876103302	01/14/2025, 19:02:58	In	UI/UX Designer	22	23	807
1866	1332278615	01/14/2025, 20:09:31	In	Admin Aide	34	35	783
1867	1875985940	01/15/2025, 05:53:45	In	Admin Aide	84	85	1031
1868	1875985940	01/15/2025, 05:54:33	In	Admin Aide	84	85	1031
1869	1332278615	01/15/2025, 06:40:00	In	Admin Aide	34	35	783
1870	1876103302	01/15/2025, 07:46:31	In	UI/UX Designer	22	23	807
1871	1331927637	01/15/2025, 07:48:06	In	Back End Developer	45	46	834
1872	1331991510	01/15/2025, 07:56:36	In	Front-end Developer	47	48	835
1873	1331839441	01/15/2025, 08:09:57	In	Digital Creative Marketing	10	11	788
1874	1876123142	01/15/2025, 08:22:35	In	Full Stack Developer	38	39	794
1875	1876130278	01/15/2025, 08:23:17	In	Scrum Master/Product Owner	20	21	795
1876	1332278615	01/15/2025, 08:27:24	In	Admin Aide	34	35	783
1877	1332269941	12/20/2024, 14:16:50	In	Developer	88	87	1042
1878	1331856295	01/15/2025, 08:38:57	In	Digital Creative Marketing	4	5	787
1879	0771071059	01/15/2025, 08:47:42	In	TVI Head	24	25	864
1880	1875985940	01/15/2025, 09:08:48	In	Admin Aide	84	85	1031
1881	1332278615	01/15/2025, 09:10:17	In	Admin Aide	34	35	783
1882	1332265826	01/15/2025, 09:17:35	In	Logistics Assistant	82	83	1017
1883	1875985940	01/15/2025, 10:08:04	In	Admin Aide	84	85	1031
1884	1331905588	01/15/2025, 11:08:12	In	HR and Recruitment Assistant	6	7	169
1885	1331841869	01/15/2025, 12:33:56	In	HR Consultant	8	9	865
1886	1331927637	01/15/2025, 12:40:00	In	Back End Developer	45	46	834
1887	1876116498	01/15/2025, 12:44:26	In	IT Administrator	43	44	185
1888	1876130278	01/15/2025, 12:57:47	In	Scrum Master/Product Owner	20	21	795
1889	1332278615	01/15/2025, 13:00:52	In	Admin Aide	34	35	783
1890	1332278615	01/15/2025, 13:11:01	In	Admin Aide	34	35	783
1891	1332278615	01/15/2025, 14:52:40	In	Admin Aide	34	35	783
1892	0909863555	01/15/2025, 14:56:37	In	Full Stack Developer	2	3	649
1893	0909863555	01/15/2025, 15:17:01	In	Full Stack Developer	2	3	649
1894	1875985940	01/15/2025, 15:45:07	In	Admin Aide	84	85	1031
1895	0909234003	01/15/2025, 17:03:58	In	Full Stack Developer	68	69	687
1896	1331905588	01/15/2025, 17:08:48	In	HR and Recruitment Assistant	6	7	169
1897	1875985940	01/15/2025, 17:34:32	In	Admin Aide	84	85	1031
1898	1332278615	01/15/2025, 18:29:19	In	Admin Aide	34	35	783
1899	1332278615	01/15/2025, 18:30:11	In	Admin Aide	34	35	783
1900	1332278615	01/15/2025, 18:40:02	In	Admin Aide	34	35	783
1901	1875985940	01/16/2025, 05:45:30	In	Admin Aide	84	85	1031
1902	1876138282	01/16/2025, 06:06:03	In	Internal Finance	95	96	1049
1903	1332278615	01/16/2025, 06:28:12	In	Admin Aide	34	35	783
1904	1332278615	01/16/2025, 07:06:23	In	Admin Aide	34	35	783
1905	1332265826	01/16/2025, 07:08:11	In	Logistics Assistant	82	83	1017
1906	1875985940	01/16/2025, 07:32:32	In	Admin Aide	84	85	1031
1907	0771071059	01/16/2025, 07:34:43	In	TVI Head	24	25	864
1908	1331839441	01/16/2025, 07:52:16	In	Digital Creative Marketing	10	11	788
1909	1875985940	01/16/2025, 07:55:11	In	Admin Aide	84	85	1031
1910	1331991510	01/16/2025, 07:56:59	In	Front-end Developer	47	48	835
1911	1876103302	01/16/2025, 08:07:19	In	UI/UX Designer	22	23	807
1912	1876101869	01/16/2025, 08:19:09	In	Full Stack Developer	14	15	167
1913	1876130278	01/16/2025, 08:25:04	In	Scrum Master/Product Owner	20	21	795
1914	1331841869	01/16/2025, 08:31:45	In	HR Consultant	8	9	865
1915	1331856295	01/16/2025, 08:33:09	In	Digital Creative Marketing	4	5	787
1916	1332265826	01/16/2025, 08:58:23	In	Logistics Assistant	82	83	1017
1917	1876123142	01/16/2025, 09:16:53	In	Full Stack Developer	38	39	794
1918	1875985940	01/16/2025, 09:31:10	In	Admin Aide	84	85	1031
1919	1331880233	01/16/2025, 09:39:40	In	Back End Developer	32	33	173
1920	1876101869	01/16/2025, 09:47:37	In	Full Stack Developer	14	15	167
1921	1332265826	01/16/2025, 09:49:16	In	Logistics Assistant	82	83	1017
1922	0771071059	01/16/2025, 09:56:42	In	TVI Head	24	25	864
1923	1332265826	01/16/2025, 10:02:37	In	Logistics Assistant	82	83	1017
1924	1331880233	01/16/2025, 12:05:52	In	Back End Developer	32	33	173
1925	1331880233	01/16/2025, 12:18:09	In	Back End Developer	32	33	173
1926	1876101869	01/16/2025, 12:38:34	In	Full Stack Developer	14	15	167
1927	1876116498	01/16/2025, 12:46:56	In	IT Administrator	43	44	185
1928	1876123142	01/16/2025, 12:50:52	In	Full Stack Developer	38	39	794
1929	1332278615	01/16/2025, 13:01:20	In	Admin Aide	34	35	783
1930	1332265826	01/16/2025, 13:09:01	In	Logistics Assistant	82	83	1017
1931	0909234003	01/16/2025, 13:34:24	In	Full Stack Developer	68	69	687
1932	0909234003	01/16/2025, 13:38:10	In	Full Stack Developer	68	69	687
1933	1332278615	01/16/2025, 13:55:02	In	Admin Aide	34	35	783
1934	1876101869	01/16/2025, 14:31:22	In	Full Stack Developer	14	15	167
1935	1332265826	01/16/2025, 14:53:16	In	Logistics Assistant	82	83	1017
1936	1875985940	01/16/2025, 16:06:21	In	Admin Aide	84	85	1031
1937	1876101869	01/16/2025, 16:31:05	In	Full Stack Developer	14	15	167
1938	0909234003	01/16/2025, 17:38:01	In	Full Stack Developer	68	69	687
1939	1061279271	01/16/2025, 18:53:07	In	Full Stack Developer	36	37	793
1940	0909234003	01/16/2025, 19:33:08	In	Full Stack Developer	68	69	687
1941	0909234003	01/16/2025, 20:22:46	In	Full Stack Developer	68	69	687
1942	1875985940	01/17/2025, 05:44:26	In	Admin Aide	84	85	1031
1943	1876138282	01/17/2025, 06:12:54	In	Internal Finance	95	96	1049
1944	1332278615	01/17/2025, 06:20:16	In	Admin Aide	34	35	783
1945	1332278615	01/17/2025, 06:27:35	In	Admin Aide	34	35	783
1946	1875985940	01/17/2025, 06:46:23	In	Admin Aide	84	85	1031
1947	1061279271	01/17/2025, 07:24:18	In	Full Stack Developer	36	37	793
1948	0771071059	01/17/2025, 07:35:56	In	TVI Head	24	25	864
1949	1331991510	01/17/2025, 07:48:30	In	Front-end Developer	47	48	835
1950	1875985940	01/18/2025, 05:48:02	In	Admin Aide	84	85	1031
1951	1332278615	01/18/2025, 06:29:43	In	Admin Aide	34	35	783
1952	1332278615	01/18/2025, 13:11:13	In	Admin Aide	34	35	783
1953	1332265826	01/20/2025, 06:59:06	In	Logistics Assistant	82	83	1017
1954	1875985940	01/20/2025, 07:16:30	In	Admin Aide	84	85	1031
1955	1876130278	01/20/2025, 14:49:30	In	Scrum Master/Product Owner	20	21	795
1956	0909234003	01/23/2025, 17:35:11	In	Full Stack Developer	68	69	687
1957	0909234003	01/23/2025, 17:35:31	In	Full Stack Developer	68	69	687
1958	0909863555	01/23/2025, 18:08:04	In	Full Stack Developer	2	3	649
1959	1331905588	01/24/2025, 10:02:45	In	HR and Recruitment Assistant	6	7	169
1960	1331905588	01/24/2025, 10:03:37	In	HR and Recruitment Assistant	6	7	169
1961	1331905588	01/24/2025, 10:16:42	In	HR and Recruitment Assistant	6	7	169
1962	1331880233	01/24/2025, 10:29:57	In	Back End Developer	32	33	173
1963	1875985940	01/24/2025, 10:38:31	In	Admin Aide	84	85	1031
1964	1876103302	01/24/2025, 11:23:21	In	UI/UX Designer	22	23	807
1965	1331880233	01/24/2025, 12:19:51	In	Back End Developer	32	33	173
1966	1331880233	01/24/2025, 12:28:24	In	Back End Developer	32	33	173
1967	1876138282	01/24/2025, 12:42:40	In	Internal Finance	95	96	1049
1968	1332278615	01/24/2025, 13:03:22	In	Admin Aide	34	35	783
1969	1332265826	01/24/2025, 13:03:53	In	Logistics Assistant	82	83	1017
1970	0909234003	01/24/2025, 13:12:45	In	Full Stack Developer	68	69	687
1971	1332265826	01/24/2025, 13:13:56	In	Logistics Assistant	82	83	1017
1972	1331856295	01/27/2025, 10:24:48	In	Digital Creative Marketing	4	5	787
1973	1332265826	01/27/2025, 10:58:48	In	Logistics Assistant	82	83	1017
1974	1331880233	01/27/2025, 11:13:51	In	Back End Developer	32	33	173
1975	1331880233	01/27/2025, 12:35:03	In	Back End Developer	32	33	173
1976	1876116498	01/27/2025, 12:38:38	In	IT Administrator	43	44	185
1977	1332278615	01/27/2025, 13:05:48	In	Admin Aide	34	35	783
1978	1331905588	01/27/2025, 15:30:52	In	HR and Recruitment Assistant	6	7	169
1979	1331880233	01/27/2025, 15:55:06	In	Back End Developer	32	33	173
1980	1331905588	01/27/2025, 16:07:04	In	HR and Recruitment Assistant	6	7	169
1981	0909234003	01/27/2025, 17:33:37	In	Full Stack Developer	68	69	687
1982	1876123142	01/27/2025, 18:09:19	In	Full Stack Developer	38	39	794
1983	1332278615	01/27/2025, 19:22:34	In	Admin Aide	34	35	783
1984	1875985940	01/28/2025, 05:47:50	In	Admin Aide	84	85	1031
1985	1331905588	01/28/2025, 10:43:28	In	HR and Recruitment Assistant	6	7	169
1986	1331880233	01/28/2025, 10:46:26	In	Back End Developer	32	33	173
1987	1876101869	01/28/2025, 10:55:16	In	Full Stack Developer	14	15	167
1988	1331880233	01/28/2025, 12:09:04	In	Back End Developer	32	33	173
1989	1331880233	01/28/2025, 12:16:40	In	Back End Developer	32	33	173
1990	1876101869	01/28/2025, 12:20:28	In	Full Stack Developer	14	15	167
1991	1876116498	01/28/2025, 12:39:10	In	IT Administrator	43	44	185
1992	1876130278	01/28/2025, 12:42:24	In	Scrum Master/Product Owner	20	21	795
1993	1876123142	01/28/2025, 13:00:20	In	Full Stack Developer	38	39	794
1994	1061279271	01/28/2025, 13:02:53	In	Full Stack Developer	36	37	793
1995	1332278615	01/28/2025, 13:10:50	In	Admin Aide	34	35	783
1996	1332265826	01/28/2025, 13:19:54	In	Logistics Assistant	82	83	1017
1997	0909234003	01/28/2025, 13:44:01	In	Full Stack Developer	68	69	687
1998	1332265826	01/28/2025, 14:03:15	In	Logistics Assistant	82	83	1017
1999	0909863555	01/28/2025, 14:56:36	In	Full Stack Developer	2	3	649
2000	1332265826	01/28/2025, 15:25:52	In	Logistics Assistant	82	83	1017
2001	1061279271	01/28/2025, 15:34:47	In	Full Stack Developer	36	37	793
2002	1331880233	01/28/2025, 15:54:16	In	Back End Developer	32	33	173
2003	1876116498	01/28/2025, 16:00:10	In	IT Administrator	43	44	185
2004	1875985940	01/28/2025, 16:04:00	In	Admin Aide	84	85	1031
2005	1876103302	01/28/2025, 16:59:18	In	UI/UX Designer	22	23	807
2006	0909234003	01/28/2025, 17:34:45	In	Full Stack Developer	68	69	687
2007	1875985940	01/29/2025, 05:50:00	In	Admin Aide	84	85	1031
2008	1876116498	01/29/2025, 12:43:05	In	IT Administrator	43	44	185
2009	0909863555	01/29/2025, 14:59:16	In	Full Stack Developer	2	3	649
2010	0909863555	01/29/2025, 15:01:04	In	Full Stack Developer	2	3	649
2011	1332278615	01/29/2025, 20:16:49	In	Admin Aide	34	35	783
2012	1875985940	01/30/2025, 05:46:50	In	Admin Aide	84	85	1031
2013	1876138282	01/30/2025, 06:11:33	In	Internal Finance	95	96	1049
2014	1332278615	01/30/2025, 06:35:35	In	Admin Aide	34	35	783
2015	1332278615	01/30/2025, 06:41:50	In	Admin Aide	34	35	783
2016	1332278615	01/30/2025, 06:51:31	In	Admin Aide	34	35	783
2017	1061201422	02/03/2025, 21:18:52	In	Quality Assurance Specialist	106	107	1061
2018	1332278615	02/03/2025, 21:41:30	In	Admin Aide	34	35	783
2019	1875985940	02/04/2025, 05:52:24	In	Admin Aide	84	85	1031
2020	1876138282	02/04/2025, 06:13:33	In	Internal Finance	95	96	1049
2021	1332265826	02/04/2025, 07:26:19	In	Logistics Assistant	82	83	1017
2022	1332278615	02/04/2025, 21:31:18	In	Admin Aide	34	35	783
2023	1332278615	02/04/2025, 22:02:48	In	Admin Aide	34	35	783
2024	1332278615	02/04/2025, 22:05:38	In	Admin Aide	34	35	783
2025	1875985940	02/05/2025, 05:49:33	In	Admin Aide	84	85	1031
2026	1876138282	02/05/2025, 06:01:38	In	Internal Finance	95	96	1049
2027	1875985940	02/05/2025, 06:31:32	In	Admin Aide	84	85	1031
2028	1331880233	02/10/2025, 11:38:39	In	Back End Developer	32	33	173
2029	1876130278	02/17/2025, 09:28:14	In	Scrum Master/Product Owner	20	21	795
2030	1332278615	02/17/2025, 10:48:39	In	Admin Aide	34	35	783
2031	1876116498	02/17/2025, 11:55:11	In	IT Administrator	43	44	185
2032	1061279271	02/17/2025, 12:19:26	In	Full Stack Developer	36	37	793
2033	1876130278	02/17/2025, 12:48:03	In	Scrum Master/Product Owner	20	21	795
2034	1332265826	02/17/2025, 12:57:50	In	Logistics Assistant	82	83	1017
2035	1332278615	02/17/2025, 13:19:12	In	Admin Aide	34	35	783
2036	1331880233	02/17/2025, 13:28:40	In	Back End Developer	32	33	173
2037	0909234003	02/17/2025, 13:42:40	In	Full Stack Developer	68	69	687
2038	0909863555	02/17/2025, 15:12:23	In	Full Stack Developer	2	3	649
2039	0909863555	02/18/2025, 15:08:04	In	Full Stack Developer	2	3	649
2040	1332265826	02/18/2025, 15:53:57	In	Logistics Assistant	82	83	1017
2041	1875985940	02/18/2025, 15:55:29	In	Admin Aide	84	85	1031
2042	1061201422	02/18/2025, 20:39:57	In	Quality Assurance Specialist	106	107	1061
2043	1875985940	02/19/2025, 05:50:59	In	Admin Aide	84	85	1031
2044	1332278615	02/19/2025, 06:23:49	In	Admin Aide	34	35	783
2045	1875985940	02/19/2025, 06:54:07	In	Admin Aide	84	85	1031
2046	0909234003	03/24/2025, 11:09:28	In	Full Stack Developer	68	69	687
2047	1876101869	04/02/2025, 10:05:36	In	Full Stack Developer	14	15	167
2048	0909863555	04/02/2025, 10:06:29	In	Full Stack Developer	2	3	649
2049	1876138282	04/02/2025, 11:00:49	In	Internal Finance	95	96	1049
2050	1332278615	04/02/2025, 11:15:58	In	Admin Aide	34	35	783
2051	1876060668	04/02/2025, 11:19:23	In	Full Stack Developer	42		867
2052	0772342275	04/02/2025, 13:02:50	In	Full Stack Developer	28	29	168
2053	1332278615	04/02/2025, 13:03:21	In	Admin Aide	34	35	783
2054	1332265826	04/02/2025, 13:05:35	In	Logistics Assistant	82	83	1017
2055	1332278615	04/02/2025, 13:07:55	In	Admin Aide	34	35	783
2056	1332265826	04/02/2025, 13:34:11	In	Logistics Assistant	82	83	1017
2057	1332265826	04/02/2025, 13:45:31	In	Logistics Assistant	82	83	1017
2058	1332278615	04/02/2025, 14:02:11	In	Admin Aide	34	35	783
2059	1876101869	04/02/2025, 14:34:23	In	Full Stack Developer	14	15	167
2060	1876116498	04/02/2025, 14:40:08	In	IT Administrator	43	44	185
2061	1332278615	04/02/2025, 14:43:01	In	Admin Aide	34	35	783
2062	1332278615	04/02/2025, 14:58:28	In	Admin Aide	34	35	783
2063	1332265826	04/02/2025, 15:20:09	In	Logistics Assistant	82	83	1017
2064	1875985940	04/02/2025, 15:58:25	In	Admin Aide	84	85	1031
2065	0909863555	04/02/2025, 17:09:30	In	Full Stack Developer	2	3	649
2066	1332278615	04/02/2025, 19:52:01	In	Admin Aide	34	35	783
2067	1875985940	04/03/2025, 05:46:30	In	Admin Aide	84	85	1031
2068	1332278615	04/03/2025, 06:26:51	In	Admin Aide	34	35	783
2069	1875985940	04/03/2025, 06:28:54	In	Admin Aide	84	85	1031
2070	1875985940	04/03/2025, 07:11:22	In	Admin Aide	84	85	1031
2071	1875985940	04/03/2025, 07:13:52	In	Admin Aide	84	85	1031
2072	0771071059	04/03/2025, 07:29:18	In	TVI Head	24	25	864
2073	1332278615	04/03/2025, 07:39:05	In	Admin Aide	34	35	783
2074	1876103302	04/03/2025, 07:44:35	In	UI/UX Designer	22	23	807
2075	0909863555	04/03/2025, 08:00:43	In	Full Stack Developer	2	3	649
2076	1876130278	04/03/2025, 08:09:11	In	Scrum Master/Product Owner	20	21	795
2077	1331927637	04/03/2025, 08:14:07	In	Back End Developer	45	46	834
2078	1876101869	04/03/2025, 08:33:12	In	Full Stack Developer	14	15	167
2079	0772342275	04/03/2025, 08:40:43	In	Full Stack Developer	28	29	168
2080	1876123142	04/03/2025, 08:53:24	In	Full Stack Developer	38	39	794
2081	0771071059	04/03/2025, 09:22:15	In	TVI Head	24	25	864
2082	0909234003	04/03/2025, 09:32:20	In	Full Stack Developer	68	69	687
2083	1332265826	04/03/2025, 09:43:53	In	Logistics Assistant	82	83	1017
2084	1876101869	04/03/2025, 09:44:19	In	Full Stack Developer	14	15	167
2085	1332278615	04/03/2025, 10:12:53	In	Admin Aide	34	35	783
2086	1875985940	04/03/2025, 10:14:18	In	Admin Aide	84	85	1031
2087	1876060668	04/03/2025, 11:35:53	In	Full Stack Developer	42		867
2088	1331839441	04/03/2025, 11:52:43	In	Digital Creative Marketing	10	11	788
2089	1876116498	04/03/2025, 12:08:46	In	IT Administrator	43	44	185
2090	0771071059	04/03/2025, 12:15:42	In	TVI Head	24	25	864
2091	0909234003	04/03/2025, 12:17:08	In	Full Stack Developer	68	69	687
2092	1876123142	04/03/2025, 12:34:17	In	Full Stack Developer	38	39	794
2093	1331986293	04/03/2025, 12:49:52	In	Junior Full Stack Developer	54	55	217
2094	1332265826	04/03/2025, 13:00:35	In	Logistics Assistant	82	83	1017
2095	1332278615	04/03/2025, 13:04:39	In	Admin Aide	34	35	783
2096	1331880233	04/03/2025, 13:56:36	In	Back End Developer	32	33	173
2097	1332265826	04/03/2025, 14:43:22	In	Logistics Assistant	82	83	1017
2098	1876060668	04/03/2025, 15:09:31	In	Full Stack Developer	42		867
2099	1332278615	04/03/2025, 15:15:42	In	Admin Aide	34	35	783
2100	1332265826	04/03/2025, 15:52:51	In	Logistics Assistant	82	83	1017
2101	1875985940	04/03/2025, 16:18:32	In	Admin Aide	84	85	1031
2102	1875985940	04/03/2025, 16:25:22	In	Admin Aide	84	85	1031
2103	0772342275	04/03/2025, 16:28:32	In	Full Stack Developer	28	29	168
2104	1876130278	04/03/2025, 16:59:38	In	Scrum Master/Product Owner	20	21	795
2105	1876130278	04/03/2025, 17:30:39	In	Scrum Master/Product Owner	20	21	795
\.


--
-- TOC entry 3381 (class 0 OID 3997700)
-- Dependencies: 224
-- Data for Name: _dbadmin; Type: TABLE DATA; Schema: public; Owner: default
--

COPY public._dbadmin (id, username, password, email, verified, verify_otp, verify_expiry, otp_code, otp_expiry, "profileImage", "lastEmailChange", bday, phone, age, address, number, role) FROM stdin;
6	Sanny Paul	$2b$12$YRvGWcA8PpgXyLBC1DMxiOMFHpcl4VvLdCK/AmK3LUWwWfUR24sd6	sannypaulgeraldino11@gmail.com	t	144227	2024-09-16 11:21:07.896	798964	2024-11-04 10:29:27.233	\N	\N	\N	\N	\N	\N	\N	admin
3	Mibel Tester	$2b$12$7gOEDnFEVKtg2NnGAjOzIe.3uKWsCu8i3VrUzgYPK0x8l0ySVIgsm	lpaculanang@gmail.com	f	379819	2024-09-27 12:38:45.817	879152	2024-09-16 07:48:44.571	\N	\N	12/12/2000	\N	24	866 B Pob. Kamagayan Cebu	09565688528	admin
5	laurence	$2b$12$5O.iGmWpvmGEY7/ZwSaWwu1ge2dTJr1fjWUqUUrscxiZrIxpWji6q	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	admin
1	Laurence	$2b$12$jbFwamyvnK4nacimZnVUj.bjzxgByqHhS/yQgYCtQZdNEL1zripf2	laurence.divinagracia25@gmail.com	f	861111	2024-09-16 07:35:47.192	550835	2024-09-16 05:21:09.734	\N	\N	04/06/2001	\N	23		09959821335	admin
7	Diwata Paris Uberloft	$2b$12$w5twtGavr.fiTv/igZ10o.152bxhDcAeCvzbzRKtHQ6x0GE2zThdS	diwataparis@junsoy.com	f	970223	2024-11-07 12:11:01.965	\N	\N	\N	\N	December 69, 6969	\N	200	Paris 	09123456789	admin
8	Admin	$2b$12$NaH5wfYVzlHvuZ12pLW3R.v85d9nkTQ43D2/HXZwRdhbDXfyhmpcS	admin@email.com	f	197672	2024-12-02 01:22:23.949	\N	\N	\N	\N		\N				admin
\.


--
-- TOC entry 3373 (class 0 OID 164043)
-- Dependencies: 216
-- Data for Name: _dbemployee; Type: TABLE DATA; Schema: public; Owner: default
--

COPY public._dbemployee (id, fullname, phone, email, role, lastlogdate, "profileImage", regdate, rfidtag, fingerprint1, fingerprint2, branch, deldate, template1, template2, fingerprintfile1, fingerprintfile2, fingerprintfile1name, fingerprintfile2name) FROM stdin;
183	Ronelo Gomez	09123456789	defaultemail@gmail.com	Full Stack Developer		Ronelo697a68f0-bf68-494b-ab7c-74e7394cdcee.png	2024-05-03	\N			Davao	\N	\N	\N	\N	\N	\N	\N
179	Ryan Jeff Escalante	09123456789	defaultemail@gmail.com	CAD Operator		RyanJeffe8ba4627-d78e-4b84-9f70-66283e60bfb5.png	2024-05-03	\N			Davao	\N	\N	\N	\N	\N	\N	\N
981	Aber Caijsu	123	123@123	Admin Aide		Aber Caijsu.png	2024-09-26	\N			Cebu	2024-09-26	\N	\N	\N	\N	\N	\N
835	Eugene Lingatong	09672250469	elingatong@jairosoft.com	Front-end Developer	01/17/2025, 07:48:30	e(7)25d3af6a-7f60-4820-b1b8-05ce1dc2267f.png	2024-09-20	1331991510	47	48	Davao	\N	\N	\N	\N	\N	\N	\N
173	Paul Albrick Coronia	09123456789	defaultemail@gmail.com	Back End Developer	04/03/2025, 13:56:36	Paul5a6e64b0-a116-41e0-aed1-59ca47f26603.png	2024-05-03	1331880233	32	33	Davao	\N	\N	\N	\N	\N	\N	\N
906	test from user modal	5123123	5123@12	Developer		\N	2024-09-25	\N			Davao	2024-09-25	\N	\N	\N	\N	\N	\N
907	test animation	123	test@email.com	DevOps Engineer		\N	2024-09-25	1223612361			Cebu	2024-09-25	\N	\N	\N	\N	\N	\N
806	Ressa Paracuelles	9750167756	rparacuelles@jairosoft.com	Quality Assurance Specialist	11/29/2024, 08:57:43	Ressa8a81a15c-0850-4237-ac47-497fdab4a1aa.png	2024-09-17	1876070164	18	19	Davao	\N	\N	\N	\N	\N	\N	\N
157	Gabriel Vincent Antonio	09123456789	defaultemail@gmail.com	Project Coordinator	09/20/2024, 14:30:17	gabb92b1bb1-2418-40eb-9771-780a09d2d069.png	2024-05-03	2413104481	49	50	Davao	\N	\N	\N	\N	\N	\N	\N
807	Pamela May H. Lamela	09782421567	plamela@jairosoft.com	UI/UX Designer	04/03/2025, 07:44:35	IMG_527353a70ecc-8451-4d2c-b10e-57b5cfa60b80.jpg	2024-09-17	1876103302	22	23	Davao	\N	\N	\N	\N	\N	\N	\N
919	test animation	61231	test123@email.com	DevOps Engineer		max-smith.png	2024-09-25	1223612361			Cebu	2024-09-25	\N	\N	\N	\N	\N	\N
982	Berai Wqui	123	123@123	Admin Aide		Berai Wqui.png	2024-09-26	\N			Cebu	2024-09-26	\N	\N	\N	\N	\N	\N
989	aaaaa	61231	test123@email.com	Driver/ Maintenance		aaaaa.png	2024-09-26	\N			Davao	2024-09-26	\N	\N	\N	\N	\N	\N
217	Ike Lloyd Yana	09123456789	defaultemail@gmail.com	Junior Full Stack Developer	04/03/2025, 12:49:52	ike35447c7d-b958-4b01-a8ba-7dd0e5204f7f.png	2024-05-03	1331986293	54	55	Davao	\N	\N	\N	\N	\N	\N	\N
928	x_test_1	1232	123@123	Admin Aide		users-activee4da2329-3e0b-418c-a940-36c602ef5069.png	2024-09-25	\N			Cebu	2024-09-26	\N	\N	\N	\N	\N	\N
992	aaab	6123123	6123121512@email	Digital Creative Marketing		aaab.png	2024-09-26	\N			Cebu	2024-09-26	\N	\N	\N	\N	\N	\N
929	test from user modal	61231	test123@email.com	Driver/ Maintenance		\N	2024-09-25	\N			Davao	2024-09-26	\N	\N	\N	\N	\N	\N
1021	Joniel	123	j@jairosoft.com	Admin Aide		Joniel_4b4263ae-4116-4a07-8295-db55e63ce53c.png	2024-09-30	\N			Davao	2024-10-01	\N	\N	\N	\N	\N	\N
1016	Mark Lester Colina	123	mcolina@jairosoft.com	Logistics Assistant		MarkLesterColinafba948b6-d4f3-4b87-acd5-c83971f294f8.png	2024-09-30	\N			Davao	2024-09-30	\N	\N	\N	\N	\N	\N
171	Karl Jordan Caumban	09123456789	defaultemail@gmail.com	PMO Manager	09/20/2024, 14:50:49	Karlc2cbb179-2872-4ac6-8485-ce6f9fa4741a.png	2024-05-03	2413083178	58	59	Davao	\N	\N	\N	\N	\N	\N	\N
168	Earlrodson Carino	09123456123	defaultemail@gmail.com	Full Stack Developer	04/03/2025, 16:28:32	e3e431002-dea0-4337-b93d-6f8f1be7d849.png	2024-05-03	0772342275	28	29	Davao	\N	\N	\N	\N	\N	\N	\N
783	Gemmar Hamot	09709135516	gemmarhamot@gmail.com	Intern	04/03/2025, 15:15:42	gemmard071b90f-624c-48c9-a05a-17f16f27b5a4.png	2024-08-21	1332278615	34	35	Davao	\N	\N	\N	\N	\N	\N	\N
1028	Philbert Concion	123	umian@email.com	Intern		PhilbertConcion4c4c025e-d644-4aed-a3d0-816e82d060d6.png	2024-10-01	3374550416	phil		Davao	2024-11-27	\N	\N	\N	\N	\N	\N
1019	Junsoy love jun	+639123456123	junsoy@gmail.com	Chief Executive Officer		Junsoylovejunb02a705a-e0f6-4e9b-86d1-da42d02a7da9.png	2024-09-30	\N			Davao	2024-10-01	\N	\N	\N	\N	\N	\N
1026	John Jovert Lariosa	123	umian@email.com	Intern		JohnJovertLariosa9e978b20-35c0-4ca8-9b3b-ed7c70b9d52f.png	2024-10-01	3274987116	John1		Davao	2024-11-27	\N	\N	\N	\N	\N	\N
1017	Mark Lester Colina	123	mcolina@jairosoft.com	Intern	04/03/2025, 15:52:51	m1eebe834-6f57-4a03-8a2d-26d795856d61.png	2024-09-30	1332265826	82	83	Davao	\N	\N	\N	\N	\N	\N	\N
788	Elmer Joseph Cutin	+63956 841 0074	ecutin@jairosoft.com	Digital Creative Marketing	04/03/2025, 11:52:43	e(5)a65a8c6a-9ed8-4d43-b406-0effb5c69b9e.png	2024-08-28	1331839441	10	11	Davao	\N	\N	\N	\N	\N	\N	\N
793	Kent John Liloc	+639519440723	kliloc@jairosoft.com	Full Stack Developer	02/17/2025, 12:19:26	Kenta82657bd-1a13-4b3d-a26e-c9f128ddb421.png	2024-08-28	1061279271	36	37	Davao	\N	\N	\N	\N	\N	\N	\N
1027	Burt Emil Blasco	123	umian@email.com	Intern		BurtEmilBlasco6851c9be-1ee6-4ef4-9e4b-a158a856b468.png	2024-10-01	2824008391	burt		Davao	2024-11-27	\N	\N	\N	\N	\N	\N
834	Dennis Karl T. Albite	09465242159	dalbite@jairosoft.com	Back End Developer	04/03/2025, 08:14:07	d(1)21f745df-64f9-43b3-b697-c24576723f05.png	2024-09-20	1331927637	45	46	Davao	\N	\N	\N	\N	\N	\N	\N
997	Calvin John Dalino	09123456789	default@email.com	Front-end Developer		CalvinJohnDalino0159deb4-e16f-416c-adba-f2a37f24fd39.png	2024-09-26				Davao	\N	\N	\N	\N	\N	\N	\N
1002	test Delete	61231	test123@email.com	Digital Creative Marketing		test Delete.png	2024-09-27	\N			Davao	2024-09-27	\N	\N	\N	\N	\N	\N
1004	test from user modal	61231	apulido@jairosoft.com	DevOps Engineer		\N	2024-09-27	\N			Davao	2024-09-27	\N	\N	\N	\N	\N	\N
1005	test Delete	123	6123121512@email	Developer		\N	2024-09-27	\N			Davao	2024-09-27	\N	\N	\N	\N	\N	\N
159	Cindy Arrogancia	09123456789	defaultemail@gmail.com	Quality Assurance Specialist - Team Lead	08/20/2024, 09:36:48	c6de5e304-3497-49b0-b2ed-a83289d21fd9.png	2024-05-03				Davao	\N	\N	\N	\N	\N	\N	\N
177	Edmar Dabon	09123456789	defaultemail@gmail.com	Full Stack Developer		e(2)b1f259cb-db03-4eb1-a763-bdc5833b73e3.png	2024-05-03	\N			Cebu	\N	\N	\N	\N	\N	\N	\N
799	Eingress QA Tester	09227966995	ginekit327@esterace.com	Admin Aide		e(4)166bf948-74b6-4db5-9708-81d4e768fb08.png	2024-09-12	532123131			Cebu	\N	\N	\N	\N	\N	\N	\N
175	Maria Lina Cuestas	09123456789	defaultemail@gmail.com	Administrative Assistant		Mariace7ff566-f9e4-49b0-b216-eb5d365b0ac6.png	2024-05-03	\N			Davao	\N	\N	\N	\N	\N	\N	\N
198	Mary Grace Secusana	09762744260	msecusana@jairosoft.com	Quality Assurance Specialist	09/20/2024, 15:09:01	MarySecusana35397f0e-cd72-4fae-80b3-19e63371491d.png	2024-05-03	1332228969	66	67	Davao	\N	\N	\N	\N	\N	\N	\N
203	Ehman Velasco	09123456789	defaultemail@gmail.com	DevOps Engineer	08/20/2024, 09:35:02	e(3)dfd5da4f-9f0e-4274-88c2-60c3ef32d225.png	2024-05-03	1875987529			Davao	\N	\N	\N	\N	\N	\N	\N
182	Kirk Xerxex Garcia	09123456789	defaultemail@gmail.com	Administrative Assistant		Kirkaec79be4-e6d1-451e-9816-149838c4cb37.png	2024-05-03	\N			Davao	\N	\N	\N	\N	\N	\N	\N
220	Rommel Senillo	09123456789	defaultemail@gmail.com	Quality Assurance Specialist		Rommelbe781bdd-821a-4f4a-b5e9-bdc4cc06bae6.png	2024-05-03	\N			Davao	\N	\N	\N	\N	\N	\N	\N
866	Aimee Isabelle Huevia	123	ahuevia@jairosoft.com	TVI Head	10/03/2024, 07:10:23	AimeeIsabelleHuevia885bfec2-1387-4eaf-8bd1-6ddf33b9db06.png	2024-09-23	2413091052			Davao	2024-10-04	\N	\N	\N	\N	\N	\N
184	Gemmar Hamot	09123456789	defaultemail@gmail.com	Admin Aide		max-smith.png	2024-05-03	\N			Davao	2024-09-27	\N	\N	\N	\N	\N	\N
186	Levlar Logeco	09123456789	defaultemail@gmail.com	Sr. Full Stack Developer		Levlar569086db-7aa0-4089-a9e5-f6d2793689c3.png	2024-05-03	\N			Davao	\N	\N	\N	\N	\N	\N	\N
180	Daryl Estrada	09123456789	defaultemail@gmail.com	Intern		d2188d0c3-1040-407b-a627-c63bfe04fda1.png	2024-05-03	1332246043	108		Davao	\N	\N	\N	\N	\N	\N	\N
922	e_test_1	123	123@123	Admin Aide		max-smith.png	2024-09-25	\N			Cebu	2024-09-25	\N	\N	\N	\N	\N	\N
1032	atest	123	test@email.com	Admin Aide		atesta2b8da6b-1885-411e-810d-d3b4f73647e5.png	2024-10-01	\N			Davao	2024-10-01	\N	\N	\N	\N	\N	\N
836	Aldred Jay Donayre	8312059981	aldred@jairosoft.com	Developer	10/01/2024, 10:07:32	AldredJayDonayre5ce4c037-a75c-4296-b576-7a32f9a3ec28.png	2024-09-20	1331981345	53		Davao	\N	\N	\N	\N	\N	\N	\N
872	test	09565688237	lpaculanang1999@gmail.com	Quality Assurance Specialist		max-smith.png	2024-09-24	12345	123123		Cebu	2024-09-24	\N	\N	\N	\N	\N	\N
895	qwea	123	123@123	Digital Creative Marketing		max-smith.png	2024-09-25	\N			Davao	2024-09-28	\N	\N	\N	\N	\N	\N
790	Gemma Andrada	09108863178	defaultemail@email.com	Admin Aide	09/30/2024, 10:58:44	gemma8be2b1ae-0d86-4e38-9ecb-ba5782c78f4a.png	2024-08-28	1876115629	40	41	Davao	\N	\N	\N	\N	\N	\N	\N
875	John Lee Sause	123	johnsause331@gmail.com	Intern	11/27/2024, 11:09:53	JohnLeeSausea06c0ffc-a936-4a4c-94b4-4515f7508c6f.png	2024-09-24	3275030810	90	91	Davao	2024-11-29	\N	\N	\N	\N	\N	\N
794	Francheska Monique Palma Gil	+639324852290	fpalmagil@jairosoft.com	Full Stack Developer	04/03/2025, 12:34:17	f170f82f0-8567-419b-894a-2d50cf646493.png	2024-08-28	1876123142	38	39	Davao	\N	\N	\N	\N	\N	\N	\N
874	Belteshazzar Marquez	123	beltesheyzel@gmail.com	Intern	11/27/2024, 09:43:56	BelteshazzarMarquez77070812-c3e5-4513-b3c8-179e958fe097.png	2024-09-24	3274950492	72	73	Davao	2024-11-29	\N	\N	\N	\N	\N	\N
181	Mary Grace Garcia	09123456789	defaultemail@gmail.com	Intern	12/04/2024, 08:57:54	Marygarciaaa10f3ff-35ba-4c7c-927a-9f8a3426fbf4.png	2024-05-03	1332286977	101	102	Davao	\N	\N	\N	\N	\N	\N	\N
985	Csduh ASdio	123	123@123	Admin Aide		Csduh ASdio.png	2024-09-26	\N			Cebu	2024-09-26	\N	\N	\N	\N	\N	\N
795	Jaszmeine Abigaille Villanueva	0946630912	jvillanueva@jairosoft.com	Scrum Master/Product Owner	04/03/2025, 17:30:39	jasz34778752-0861-4908-ba11-222b36e08fe8.png	2024-08-28	1876130278	20	21	Davao	\N	\N	\N	\N	\N	\N	\N
873	Rosban Rosales	123	rosbanrosales1@gmail.com	Intern	11/27/2024, 10:32:18	Rosbanc415079a-8e96-4654-b20b-6108e8e8a0b4.png	2024-09-24	3473018457	70	71	Davao	2024-11-29	\N	\N	\N	\N	\N	\N
876	test	09565688237	lpaculanang1999@gmail.com	Quality Assurance Specialist		max-smith.png	2024-09-24	12345	123123		Cebu	2024-09-25	\N	\N	\N	\N	\N	\N
192	John Ivan Pagdayawon	09123456789	defaultemail@gmail.com	Front-end Developer		JohnIvan2b0ed6f2-5377-4b64-a0d5-943db7956e06.png	2024-05-03	\N			Davao	\N	\N	\N	\N	\N	\N	\N
221	Edel Jan Ugdang	09123456789	defaultemail@gmail.com	Database Administrator		e(1)ce34a097-8384-4591-be81-4984ce65d4b3.png	2024-05-03	\N			Davao	\N	\N	\N	\N	\N	\N	\N
216	Marvin Alimento	09123456789	defaultemail@gmail.com	Junior Full Stack Developer		Marvin5042e893-1a21-4700-8840-eeb6d60a84e9.png	2024-05-03	1331957733			Davao	\N	\N	\N	\N	\N	\N	\N
845	qwerty	09123456789	qwerty@test.com	Driver/ Maintenance		max-smith.png	2024-09-23	123456789	99		Davao	2024-09-23	\N	\N	\N	\N	\N	\N
868	Test for Revamp	09123456789	test@gmail.com	Co-CEO		max-smith.png	2024-09-23	1332265826			Davao	2024-09-23	\N	\N	\N	\N	\N	\N
994	Michael Jean I. Diamos	09926576316	mdiamos@jairosoft.com	IT Administrator		MichaelJeanabf65695-4f0a-4251-8fff-d16b8a902ee0.png	2024-09-26	1331987910	78	79	Davao	\N	\N	\N	\N	\N	\N	\N
869	test animation	61231	61231215@email	CAD Operator		max-smith.png	2024-09-23	\N	delete1		Davao	2024-09-23	\N	\N	\N	\N	\N	\N
871	test close modal after success	61231	61231215@email	Digital Creative Marketing		max-smith.png	2024-09-24	\N			Davao	2024-09-25	\N	\N	\N	\N	\N	\N
993	aab	61231	15125@wad	DevOps Engineer		aab.png	2024-09-26	\N			Davao	2024-09-26	\N	\N	\N	\N	\N	\N
877	test Delete	61231	test12@email.com	Developer		max-smith.png	2024-09-25	\N			Davao	2024-09-25	\N	\N	\N	\N	\N	\N
901	test Delete	61231	512@w	Driver/ Maintenance		test-profile.png	2024-09-25	\N			Cebu	2024-09-25	\N	\N	\N	\N	\N	\N
910	test from user modal	61231	test123@email.com	Driver/ Maintenance		\N	2024-09-25	\N			Cebu	2024-09-25	\N	\N	\N	\N	\N	\N
911	test from user modal	5123123	test@email.com	DevOps Engineer		\N	2024-09-25	\N			Davao	2024-09-25	\N	\N	\N	\N	\N	\N
923	test Delete	5123123	test@email.com	DevOps Engineer		\N	2024-09-25	\N			Cebu	2024-09-25	\N	\N	\N	\N	\N	\N
899	a_test_223	123	123@123	Admin Aide		max-smith.png	2024-09-25	\N			Cebu	2024-09-25	\N	\N	\N	\N	\N	\N
913	a_test_2	123	123@123	Admin Aide		max-smith.png	2024-09-25	\N			Davao	2024-09-25	\N	\N	\N	\N	\N	\N
898	a_test_user_1	123	123@123	Digital Creative Marketing		max-smith.png	2024-09-25	\N			Davao	2024-09-25	\N	\N	\N	\N	\N	\N
932	atest	123	6123121512@email	Driver/ Maintenance		max-smith.png	2024-09-25	\N			Cebu	2024-09-25	\N	\N	\N	\N	\N	\N
219	Carl Matthew Escoton	09123456789	defaultemail@gmail.com	Product Owner		C(1)06f1973b-635a-499c-af78-31d7b58cdde8.png	2024-05-03	\N			Davao	\N	\N	\N	\N	\N	\N	\N
984	Abads Dajus	123	123@123	Admin Aide		Abads Dajus.png	2024-09-26	\N			Cebu	2024-09-26	\N	\N	\N	\N	\N	\N
991	aabb	123	6123121512@email	Digital Creative Marketing		aabb.png	2024-09-26	\N			Davao	2024-09-26	\N	\N	\N	\N	\N	\N
990	abb	61231	6123121512@email	Developer		abb.png	2024-09-26	\N			Cebu	2024-09-26	\N	\N	\N	\N	\N	\N
941	test animation	61231	test@email.com	Front-end Developer		max-smith.png	2024-09-26	\N			Davao	2024-09-26	\N	\N	\N	\N	\N	\N
194	Teresito Pasculado Jr.	09123456789	defaultemail@gmail.com	QA Manager		Teresitofd214ae1-9977-4513-95db-54de22db4fd6.png	2024-05-03	\N			Davao	\N	\N	\N	\N	\N	\N	\N
1011	A testname	dawda	test123@email.com	Database Administrator		Atestname694136ba-c2c9-4bf3-920b-a495292252ee.png	2024-09-27	\N			Davao	2024-09-27	\N	\N	\N	\N	\N	\N
878	test_user	123	test@email.com	Driver/ Maintenance		max-smith.png	2024-09-25	\N			Davao	2024-09-25	\N	\N	\N	\N	\N	\N
1020	Junsoy love jun	12312321321	junsoylovejun@gmail.com	Admin Aide		Junsoylovejun(1)f1b1d390-32b7-452f-9f60-a1896539abef.png	2024-09-30	\N			Cebu	2024-10-01	\N	\N	\N	\N	\N	\N
1025	Hyren Yares	123	umian@email.com	Intern		HyrenYares1941b9b7-9bf4-4d76-b9c2-b4835d502fc9.png	2024-10-01	3187575225	hyren1		Davao	2024-11-27	\N	\N	\N	\N	\N	\N
201	Nico Tuban	09123456789	defaultemail@gmail.com	Bubble Developer		https___d34e910e9c4f6a4df0791b0a9b6b7141.cdn.bubble.io_f1702607126755x827498966464966400_Nicof2da4a69-fff9-4b07-bdd3-13e82d1d6de0.jpg	2024-05-03	1332215169			Davao	\N	\N	\N	\N	\N	\N	\N
163	Jerlyn Ates	09123456789	defaultemail@gmail.com	Quality Assurance Specialist	08/20/2024, 08:50:24	Jerlyn8a28e753-f8aa-4363-b271-49c2b3d56eab.png	2024-05-03				Davao	\N	\N	\N	\N	\N	\N	\N
853	test animation	6123123	61231215@email	Digital Creative Marketing		max-smith.png	2024-09-23	6123	delete1		Davao	2024-09-23	\N	\N	\N	\N	\N	\N
1018	Helen food vendor	123	h@jairosoft.com	Guest		Helenfoodvendor498c1656-9a7c-4857-81c5-9b8bd553d37c.png	2024-09-30	helen	helen	helen1	Davao	2024-12-02	\N	\N	\N	\N	\N	\N
1012	Belle Dangculos	565688275	belle@mail.com	Quality Assurance Specialist		BelleDangculos(2)7b91e587-b4a5-4920-9f19-9b3ae5f47ce2.png	2024-09-27	12345	123123		Cebu	2024-09-27	\N	\N	\N	\N	\N	\N
784	Russel Jan Quisido	123123	default@email.com	UI/UX Designer	12/12/2024, 18:04:15	sirrusselaf32b8dc-911b-477b-8c31-b8d6e27791cc.jpg	2024-08-21	1331760816	30	31	Davao	\N	\N	\N	\N	\N	\N	\N
1033	another	123	test@email.com	Administrative Assistant		another31dd20b7-b20d-429c-b872-8101015a8f6b.png	2024-10-01	\N			Davao	2024-11-27	\N	\N	\N	\N	\N	\N
900	test Delete	5123123	test213@email.com	Co-CEO		test-profile.png	2024-09-25	\N			Davao	2024-09-25	\N	\N	\N	\N	\N	\N
650	Princess Mae O. Inderio	5124151	princess@email.com	Full Stack Developer	08/08/2024, 12:47:00	454274969_3203176219816003_4517525176223367828_nfaa5811f-03e2-45c3-aecc-3c303979c4e5.jpg	2024-08-08				Davao	2024-11-27	\N	\N	\N	\N	\N	\N
902	test animation	123	test123@email.com	Driver/ Maintenance		test-profile.png	2024-09-25	\N			Davao	2024-09-25	\N	\N	\N	\N	\N	\N
859	test delete 1	61231	test21215235@email.com	Digital Creative Marketing		max-smith.png	2024-09-23	\N	delete1		Davao	2024-09-23	\N	\N	\N	\N	\N	\N
1014	Niña Dionelle Requina	123	nrequina@jairosoft.com	UI/UX Designer	10/01/2024, 12:04:30	N15ee0abf-0c1b-49b8-a5de-4ecba52136d4.png	2024-09-30	1332221550	80	81	Davao	2024-11-29	\N	\N	\N	\N	\N	\N
1024	Aleah Kim Manatad	123	umian@email.com	Intern		AleahKimManatad3f1a3cc5-259e-4368-8ed8-92103b8d8c32.png	2024-10-01	3382860026	aleah1		Davao	2024-11-27	\N	\N	\N	\N	\N	\N
169	Roche Casipong	09123456789	defaultemail@gmail.com	HR and Recruitment Assistant	01/28/2025, 10:43:28	https___d34e910e9c4f6a4df0791b0a9b6b7141.cdn.bubble.io_f1701669812384x393575854894280700_014738a1b3a-a8e6-411d-acbe-f18eae87c05c.jpg	2024-05-03	1331905588	6	7	Davao	\N	\N	\N	\N	\N	\N	\N
205	John Paul Catubig	09173091914	jcatubig@jairosoft.com	Scrum Master/Product Owner	09/26/2024, 11:16:06	JohnPaul312116e0-632a-4eb5-ad2c-e972c3511e8a.png	2024-05-03	1331923851	60	61	Cebu	\N	\N	\N	\N	\N	\N	\N
915	b_test_1	123	123@123	Admin Aide		max-smith.png	2024-09-25	\N			Davao	2024-09-25	\N	\N	\N	\N	\N	\N
912	a_test_123	123251	123@123	Admin Aide		420690661_1194840595259598_2450719876841480390_n(1)8ba3bb02-d4fb-4e4f-b25b-8820bccae3ef.jpg	2024-09-25	\N			Davao	2024-09-25	\N	\N	\N	\N	\N	\N
916	c_test_1	123	123@123	Admin Aide		max-smith.png	2024-09-25	\N			Cebu	2024-09-25	\N	\N	\N	\N	\N	\N
926	b_test_1	123	123@123	Admin Aide		max-smith.png	2024-09-25	\N			Cebu	2024-09-25	\N	\N	\N	\N	\N	\N
197	Jonas Rivera	09123456789	defaultemail@gmail.com	CAD Operator		Jonas630e9cad-37ca-4d69-8437-aacfa19c66ea.png	2024-05-03	\N			Davao	\N	\N	\N	\N	\N	\N	\N
1034	a-test-1	123	123@123	Chief Finance Officer		a-test-1290946bb-19d2-4937-ae87-23b1357b0127.png	2024-10-01	\N			Davao	2024-10-01	\N	\N	\N	\N	\N	\N
1035	a-test	123	123@123	Administrative Officer		\N	2024-10-01	\N			Cebu	2024-10-01	\N	\N	\N	\N	\N	\N
1013	Belle Tester (This is just a test)	6764375246465	bel@mail.com	Quality Assurance Specialist		BurtEmilBlascoc9607514-31ff-47b1-8b4d-229c113bec1a.png	2024-09-27	12345	12	13	Cebu	2024-11-27	\N	\N	\N	\N	\N	\N
987	Laurence char2	123	test123@email.com	Digital Creative Marketing		Laurence char2.png	2024-09-26	\N			Cebu	2024-09-26	\N	\N	\N	\N	\N	\N
986	Berasd Asduh	123	123@123	Admin Aide		Berasd Asduh.png	2024-09-26	\N			Cebu	2024-09-26	\N	\N	\N	\N	\N	\N
204	Jovanne Vicentino	09123456789	defaultemail@gmail.com	Front-end Developer		Jovanne00240d0e-ed43-4fcc-84a6-0888b6cffcc7.png	2024-05-03	\N			Davao	\N	\N	\N	\N	\N	\N	\N
1022	Erica Bolanio	123	test12@email.com	Intern		EricaBolanio941e6423-ef35-44a3-b2e7-093dbfe0f93f.png	2024-10-01	3007641742	erica1	erica2	Davao	2024-11-27	\N	\N	\N	\N	\N	\N
202	Maria Odessa Tura	09123456789	defaultemail@gmail.com	HR Consultant		Mark0e409d1c-6c9d-4d5b-b503-841bba52f267.png	2024-05-03	\N			Davao	\N	\N	\N	\N	\N	\N	\N
1023	Kyle Miguel Huyatid	123	umian@email.com	Intern		KyleMiguelHuyatid228c00d4-4f7d-4325-ac98-6320ab4c7eca.png	2024-10-01	3274943306	kyle1	klye2	Davao	2024-11-27	\N	\N	\N	\N	\N	\N
187	Carol Mana-ay	09123456789	cmanaay@jairosoft.com	Project Manager	09/26/2024, 17:35:01	C(2)cc449a66-7fdc-47c1-a780-ed7790d62af7.png	2024-05-03	1875999242	76	77	Davao	\N	\N	\N	\N	\N	\N	\N
207	Michael Añana	09123456789	defaultemail@gmail.com	Scrum Master		MichaelAÃ±ana66e7eed2-ef8b-4247-90d1-812f18bcedf4.png	2024-05-03	\N			Davao	\N	\N	\N	\N	\N	\N	\N
785	Gio Teves	123	defaultemail@email.com	HR and Recruitment Assistant	08/21/2024, 13:54:44	gio8c8a621b-ae00-48f6-806b-bd284a8edcfe.png	2024-08-21	0772547539			Davao	\N	\N	\N	\N	\N	\N	\N
212	Roden Cole	09123456789	defaultemail@gmail.com	DevOps Engineer		Rodenf7993450-853c-405e-b344-314febaae0a5.png	2024-05-03	\N			Davao	\N	\N	\N	\N	\N	\N	\N
189	Jove Maniel Moralde	09123456789	defaultemail@gmail.com	Product Owner		Jove0215155c-14f0-4df1-bb68-9651a10f53f7.png	2024-05-03	\N			Davao	\N	\N	\N	\N	\N	\N	\N
166	Lovely Gaye Bonghaney	09123456789	defaultemail@gmail.com	Cebu Branch Manager		Lovelyc256e4bc-b343-4cc0-b5d4-26eaf1d4925d.png	2024-05-03	\N			Davao	\N	\N	\N	\N	\N	\N	\N
170	Ryan Vince Castillo	09123456789	defaultemail@gmail.com	Full Stack Developer	12/20/2024, 16:14:41	RyanVincec170de80-1969-4912-b0bf-28d8ab63349a.png	2024-05-03	1332304341	99	100	Davao	\N	\N	\N	\N	\N	\N	\N
167	Cliff Randy Carcueva	09123456789	defaultemail@gmail.com	Full Stack Developer	04/03/2025, 09:44:19	c(1)7519601d-b529-4050-a089-75afe8a86dc3.png	2024-05-03	1876101869	14	15	Davao	\N	\N	\N	\N	\N	\N	\N
210	Jairiz Edward Esposo	09123456789	defaultemail@gmail.com	Developer	12/13/2024, 09:21:44	Jai4772cac8-4de7-4b61-899a-79f987924970.png	2024-05-03	1331787297	16	17	Davao	\N	\N	\N	\N	\N	\N	\N
188	Siddy Montemayor	09123456789	defaultemail@gmail.com	Bubble Developer		Siddyd544b9da-7f4f-41da-a502-aca3aa0b04eb.png	2024-05-03	\N			Davao	\N	\N	\N	\N	\N	\N	\N
1010	Amy fara fowler	15126	test123@email.com	DevOps Engineer		Amyfarafowlera6e32c70-658b-4ad8-acec-113f838212b4.png	2024-09-27	\N			Davao	2024-09-27	\N	\N	\N	\N	\N	\N
787	MIssy Mae O. Sale	09556852280	msale@jairosoft.com	Digital Creative Marketing	01/27/2025, 10:24:48	Missy582433e3-c850-47b8-a166-8e832d16dfa1.png	2024-08-28	1331856295	4	5	Davao	\N	\N	\N	\N	\N	\N	\N
172	Mark Colina	09123456789	defaultemail@gmail.com	Logistics		Mark1cbf65e5-8f55-4764-8f77-ddda9213a4ae.png	2024-05-03	1332265826	82	83	Davao	2024-09-30	\N	\N	\N	\N	\N	\N
882	test_user_2	123	123@123	Driver/ Maintenance		max-smith.png	2024-09-25	\N			Davao	2024-09-25	\N	\N	\N	\N	\N	\N
1015	Mark Lester Colina	123	mcolina@jairosoft.com	Logistics		MarkLesterColinaf995fc40-1afa-442f-b876-f6d1bb9cee37.png	2024-09-30	\N			Davao	2024-09-30	\N	\N	\N	\N	\N	\N
864	Armelita Pulido	123	apulido@jairosoft.com	TVI Head	04/03/2025, 12:15:42	AlmeraKleerTayaofa7c3d3a-9b99-4993-a7fa-46e930ddf958.png	2024-09-23	0771071059	24	25	Davao	\N	\N	\N	\N	\N	\N	\N
156	Michael Albiso	09123456789	defaultemail@gmail.com	Driver/ Maintenance	05/17/2024, 17:35:29	Michaelf055c62f-8a83-4c7a-8f09-e3d8a125c2f1.png	2024-05-03				Davao	\N	\N	\N	\N	\N	\N	\N
161	Mari Kriss Aseniero	09123456789	defaultemail@gmail.com	Chief Finance Officer	12/12/2024, 09:34:46	Marie6e9e305-28d5-4dde-b609-78fa700df9b4.png	2024-05-03	0771604515	104	105	Davao	\N	\N	\N	\N	\N	\N	\N
920	test Delete	123	test123@email.com	Driver/ Maintenance		\N	2024-09-25	\N			Davao	2024-09-25	\N	\N	\N	\N	\N	\N
918	test from user modal	5123123	test123@email.com	DevOps Engineer		max-smith.png	2024-09-25	\N			Cebu	2024-09-25	\N	\N	\N	\N	\N	\N
921	d_test_1	123	123@123	Admin Aide		max-smith.png	2024-09-25	\N			Cebu	2024-09-25	\N	\N	\N	\N	\N	\N
924	a_test_1	123	123@123	Admin Aide		max-smith.png	2024-09-25	\N			Cebu	2024-09-25	\N	\N	\N	\N	\N	\N
897	a_test_user_update	test update	testupdates@email.com	Admin Aide		420690661_1194840595259598_2450719876841480390_n(1)d1379c66-29a1-4873-a1c2-64c7fbc7d9d9.jpg	2024-09-25	\N			Cebu	2024-09-25	\N	\N	\N	\N	\N	\N
903	test Delete	61231	test@email.com	Driver/ Maintenance		D:\\EINGRESS\\EINGRESS_API\\dist\\employee-list\\uploads\\profileimages	2024-09-25	\N			Cebu	2024-09-25	\N	\N	\N	\N	\N	\N
904	test from user modal	5123123	test123@email.com	DevOps Engineer		\N	2024-09-25	\N			Cebu	2024-09-25	\N	\N	\N	\N	\N	\N
905	test Delete	61231	test123@email.com	Developer		\N	2024-09-25	\N			Davao	2024-09-25	\N	\N	\N	\N	\N	\N
160	Jayden Ashley Aseniero	09123456785	defaultemail@gmail.com	Co-CEO		jayden7477aa04-a164-49cc-a794-448f50f170be.png	2024-05-03	\N			Davao	\N	\N	\N	\N	\N	\N	\N
940	awdawda	5123123	test@email.com	DevOps Engineer		\N	2024-09-25	\N			Davao	2024-09-25	\N	\N	\N	\N	\N	\N
927	a_test_123	12322	123@123	Admin Aide		420690661_1194840595259598_2450719876841480390_n29c27b72-206d-4be5-a266-8b66eb0b766d.jpg	2024-09-25	\N			Cebu	2024-09-25	\N	\N	\N	\N	\N	\N
933	awt	61231	test123@email.com	Digital Creative Marketing		max-smith.png	2024-09-25	\N			Davao	2024-09-25	\N	\N	\N	\N	\N	\N
925	b_test	123	123@123	Admin Aide		max-smith.png	2024-09-25	\N			Cebu	2024-09-25	\N	\N	\N	\N	\N	\N
939	aaaaaaaaaaa	5123123	test@email.com	DevOps Engineer		\N	2024-09-25	\N			Cebu	2024-09-25	\N	\N	\N	\N	\N	\N
937	aaaa	61231	test@email.com	Digital Creative Marketing		max-smith.png	2024-09-25	\N			Davao	2024-09-25	\N	\N	\N	\N	\N	\N
931	c_test_1	123	123@123	Admin Aide		max-smith.png	2024-09-25	\N			Cebu	2024-09-25	\N	\N	\N	\N	\N	\N
988	L test	5123123	test123@email.com	Digital Creative Marketing		L test.png	2024-09-26	\N			Cebu	2024-09-26	\N	\N	\N	\N	\N	\N
983	Ashud Huis	123	123@123	Admin Aide		Ashud Huis.png	2024-09-26	\N			Cebu	2024-09-26	\N	\N	\N	\N	\N	\N
995	Belle	09565688237	bel@mail.com	Quality Assurance Specialist		Belle.png	2024-09-26	12345	123123		Cebu	2024-09-26	\N	\N	\N	\N	\N	\N
930	test animation	5123123	test@email.com	Digital Creative Marketing		\N	2024-09-25	\N			Cebu	2024-09-26	\N	\N	\N	\N	\N	\N
1000	aa123	5123123	test123@email.com	Developer		aa123.png	2024-09-27	\N			Davao	2024-09-27	\N	\N	\N	\N	\N	\N
999	1234	61231	test123@email.com	Developer		1234.png	2024-09-27	\N			Cebu	2024-09-27	\N	\N	\N	\N	\N	\N
998	Abre Test	123	123@123	Admin Aide		Abre Test.png	2024-09-27	\N			Cebu	2024-09-27	\N	\N	\N	\N	\N	\N
1001	awdawd	123	6123121512@email	DevOps Engineer		awdawd.png	2024-09-27	\N			Cebu	2024-09-27	\N	\N	\N	\N	\N	\N
1003	awsfaw123	6123123	test123@email.com	DevOps Engineer		\N	2024-09-27	\N			Cebu	2024-09-27	\N	\N	\N	\N	\N	\N
1006	adawd123	5123123	test123@email.com	DevOps Engineer		\N	2024-09-27	\N			Davao	2024-09-27	\N	\N	\N	\N	\N	\N
996	Analyn Cabintoy	09123456789	defaults@email.com	Administrative Officer		adawd12317504623-ee05-49c8-a340-27f03abd6a7f.png	2024-09-26	1875994482			Davao	\N	\N	\N	\N	\N	\N	\N
1008	adawd123	5123123	test@email.com	Digital Creative Marketing		adawd123(1)2c83537f-f10d-4751-a040-de2f265fcfe3.png	2024-09-27	\N			Davao	2024-09-27	\N	\N	\N	\N	\N	\N
844	Jeffrey salve avila	09209571919	javila@jairosoft.com	CAD Operator		jeffreybcbc19bf-bcf7-428b-af90-63dacb4b73a2.png	2024-09-20	2413118492			Davao	\N	\N	\N	\N	\N	\N	\N
1009	Jimuel Pacquiao	61231	test123@email.com	Digital Creative Marketing		JimuelPacquiao3187ddf5-98ae-480b-8094-b306c20e3b7f.png	2024-09-27	\N			Davao	2024-09-27	\N	\N	\N	\N	\N	\N
218	Joseph Fortunate Gerona	09955348821	jgerona@jairosoft.com	Full Stack Developer	09/24/2024, 13:54:51	Josephb851d659-013d-4d9f-867a-a12e20a169cd.png	2024-05-03	1332259323	62	63	Cebu	\N	\N	\N	\N	\N	\N	\N
1031	Joniel Pabilan	123	jpabilan@jairosoft.com	Intern	04/03/2025, 16:25:22	j3dbb8751-3e25-4b1e-b8c9-82f3e817e939.png	2024-10-01	1875985940	84	85	Davao	\N	\N	\N	\N	\N	\N	\N
1030	test DUI	09078992233	testdui@email.com	Admin Aide	10/01/2024, 14:42:23	testDUIdccf25b6-4b8c-411c-bac3-214266af31fb.png	2024-10-01	test	test1	test2	Davao	2024-10-03	\N	\N	\N	\N	\N	\N
1029	Keanu Roger Brua	123	umian@email.com	Intern		KeanuRogerBrua10fe2285-15a9-4dc1-9aee-ea4efa20bb29.png	2024-10-01	3187736089	Keanu		Davao	2024-11-27	\N	\N	\N	\N	\N	\N
178	Susan Dalisay	09269783094	sdalisay@jairosoft.com	Logistics	12/19/2024, 06:47:38	Susan2e1d13d1-afd6-4492-a4b3-19d834f99001.png	2024-05-03	1331833219	12		Davao	\N	\N	\N	\N	\N	\N	\N
185	Teofilo Limpag Jr.	09123456789	defaultemail@gmail.com	IT Administrator	04/03/2025, 12:08:46	Teofb6b223c7-79b6-42f5-86eb-4d44c551753f.png	2024-05-03	1876116498	43	44	Davao	\N	\N	\N	\N	\N	\N	\N
1038	abctest	123	123@123	Administrative Assistant		\N	2024-10-01	\N			Cebu	2024-10-01	\N	\N	\N	\N	\N	\N
1036	a-test_123	123	123@123	Administrative Assistant		\N	2024-10-01	\N			Cebu	2024-10-01	\N	\N	\N	\N	\N	\N
1037	ab_test	123	asd@asd	Administrative Assistant		\N	2024-10-01	\N			Cebu	2024-10-01	\N	\N	\N	\N	\N	\N
1040	a_test	123	123@123	Administrative Assistant		\N	2024-10-01	\N			Davao	2024-10-01	\N	\N	\N	\N	\N	\N
1039	abc_test	123	123@123	Admin Aide		\N	2024-10-01	\N			Cebu	2024-10-01	\N	\N	\N	\N	\N	\N
1041	Aimee Isabelle Huevia	1231213	ahuevia@jairosoft.com	TVI Head		AimeeIsabelleHueviaf24fda21-4157-4251-8db1-8906d50e329d.png	2024-10-04	2413091052			Davao	2024-10-04	\N	\N	\N	\N	\N	\N
1046	trialsause	09788894545	trial@email.com	Admin Aide		trialec1ecaa7-e8b7-46ce-8cf0-08078fba019e.png	2024-10-04	\N			Davao	2024-11-20	\N	\N	\N	\N	\N	\N
1045	test_123	1231512355123	test123@email.com	Admin Aide		test_123ec7c28d6-34ec-4338-be6b-f46cbb8efbc0.png	2024-10-04	\N			Davao	2024-11-20	\N	\N	\N	\N	\N	\N
120	Jimuel Dave Rodado	+639667595091	jrodado@jairosoft.com	Full Stack Developer	10/10/2024, 15:12:33	RODADO,JIMUEKDAVES(11)(2)fdfbb23f-fd1c-4c0c-bbc2-7b7c09984805.jpg	2024-04-30	2413027717	51	52	Davao	2024-11-27	\N	\N	\\x0411790021abb7ea896972f82503b96bc5fdc5ef59b3b7780797490e8d73b7eec847b6e88153b96946fcc7ee09d4b96804fc07efb17cb705052db8e8ce94b9e7044fb4e83dfdb78383ccc306caca86080afb6ff8e1c4840bc2ffc107a5ed867dc1ff85f845bcb9dcc65c3e0881edb708821c78e899aa8774cf6dcbef254d850ac2ffc107bd25b903c52cf4ef000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000812464f232319a8148646734355650333523f1f4221651040000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000c255	\\x04187400b182b76b099acbdf158bb6eac77a723f255bb590c76bc5e69943b76f469909d0e15bb86302ca43e8edabb581867a07e00d04b9d6c0093a005974b581067803e885f4740505fb710f8de4b577089b89e0e12cb7e6031cb4eed6b4b766c2cb05e06d7db577869d09f872e2b66e4e7dd5e7497b776c069847df518a851e03ff2bf8610a86094fffabf89a4db66504cffff8f929852ac5fd73ff25bb839504ac7ff80dccb40ac23772102904b40ec2fc77087544b40a84fa7508d1cc838744ad3ff800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000234a226428445475334228834373452223297532f5ff1515643583442523025634ff524f6749522f584304000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002c70	51.dat	52.dat
1042	Aimee Isabelle Huevia	09123456789	ahuevia@jairosoft.com	Developer	12/20/2024, 14:16:50	AimeeIsabelleHuevia(1)8f7d81ef-ee29-4a61-a15e-f9fe667b490f.png	2024-10-04	1332269941	88	87	Davao	2024-10-04	\N	\N	\N	\N	\N	\N
1044	Aimee Isabelle Huevia	09123455667	ahuevia@jairosoft.com	Developer	01/15/2025, 08:35:14	Atestnamee969f757-0cf0-4793-8997-dd661f3d82bf.png	2024-10-04	1332269941	87	89	Davao	\N	\N	\N	\N	\N	\N	\N
1085	Joshua Vergel Scalercio	09123456789	jscalercio@gmail.com	Intern		JoshuaVergelScalercio46633610-b123-42fa-81f1-b19203d1806e.png	2025-02-25	2413138727	josh		Davao	\N	\N	\N	\N	\N	\N	\N
1086	Dazzle Estaciones	09123456789	destaciones@gmail.com	Intern		DazzleEstaciones4e19946b-0726-4859-b866-7875dec420a2.png	2025-02-25	1876316638	daz		Davao	\N	\N	\N	\N	\N	\N	\N
1043	test1004	2222222222	aaaaaa@jairosoft.com	Administrative Assistant	10/04/2024, 09:49:16	test1004(1)e8baa6f8-6d96-425a-93a1-82d8e58d3881.png	2024-10-04	1332269941	88		Davao	2024-10-04	\N	\N	\N	\N	\N	\N
843	Bon Jovie Cueva	09760440176	bcueva@jairosoft.com	Quality Assurance Specialist - Team Lead	09/26/2024, 09:10:41	BonJovieCueva36b4cd0e-74dd-4b3e-b981-c7aceb062175.png	2024-09-20	1332210983	64	65	Davao	\N	\N	\N	\\x04157100c57ab886ca7d0707d902b69581b941e702a3b51ac2297a076e53b592c2d9010076fc841ec23dfae7311bb9edc75d3e1052e4b97207fc47c7b6ec8617421d76d8e15c8809443d2ee80945878d05abc30639cd8614842cf6ef459d897751fe07f8715d897a51fd45ff95ed887e50fe47ffb58d887e0cfe09f85929b62482fd79074d99b625c3fc77ff8239b721c3fb35f8a5a1b88a47fec7071dec83208cfffbef712c842208ffffe700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000649396563679946427725b13432124322114322652733218b211f80000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000f25f	\\x041574003952b806c43d72e8b1e2b784c2b8c10e5693b61043da3be8bd5bb901873ef400d9b3b88503bcc10e2aecb61443db3be0dd7cb80e832e7ae825e5851b04aef9ef79ad878f02fd41ff89b5859082fd39f841827609c0fc01f8a594b909851dbee08165898a02fe45ffb5758695c1fd79ff6eaab96b45be8d006912b611c21a780019838414c1fdc10715bc841684fbc3075d638408c3fbc3ffd2d949df465a7effb9124ae2c45c3e08000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000008223236267128454512766642437125236221ff5439f815fa8248727f52fff060000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004663	64.dat	65.dat
867	Bomar Sinday	123	bsinday@jairosoft.com	Full Stack Developer	04/03/2025, 15:09:31	BomarSinday4ab8ad08-583b-482a-8ec1-a6518838096a.png	2024-09-23	1876060668	42		Davao	\N	\N	\N	\\x041a700025fbb48fc2b903e8a983b606843ab608e903b67f02ca4718f9abb50b012a7800454cb702454cf4e892948410030c40e8b174b707c43bb4d8f904851743ca7be0ed63b870c4bb49ef0d858710420a74d75115888b854afbfdc97c8213c7fcc30701a5821508fec3ef1d0d841a83cac1df45ed821305ffc507e1e58494c4fd3bffc5cd868acdfd05f869c1883e46fe91fe7939894705fbcdfd9d8188500bfd8f05ce7189c2c87dfeefe131b79a9d1ccbe1fe21b8cdc99cf29856e2b6080d7e3040e2eab774c6aac906f99bb9dd024e3e0f000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000f795414392452266512993971246547345455243477b12fff93f125122236124242231132372533108000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000187b	\N	42.dat	\N
865	Almera Kleer Tayao	61231	armelita@jairosoft.com	HR Consultant	01/16/2025, 08:31:45	AlmeraKleerTayao3b4c0f71-5e67-4c63-a3b4-7df0b549cf59.png	2024-09-23	1331841869	8	9	Davao	\N	\N	\N	\\x042356006e8a87bc4eb83eb171da86aee6073fc1a53288c7c777feb7a12a869b0a5887e1f9b285134556342865d38492c4a607e0b1db87e106567600fdf3867f0697c5ee75c487ea422936e8a9e4867a44b90500d5748583c3b903100a1d850b031af8070105860542287800ed02841f43f9750fa52b89d7c3363ee866ac89db053cfe073635887503ad03ffe18283268efbf507d5c4840bc3fbff07353a862584f867ff2173821d91fbfb07454b821c10fbfb0f7563821b11f9fb0fa173821911faf917c12b838f02d9bf2819b4821990fcf90f253c831602fab90945ac821691fcf90f79cc821651fbf907a5e4821510faf907d504831312f9fb07152d830493fcc7271ec58387461e10f84165830650ffc71f65b5830d8efcc307000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000933fbf2d9ff725b984e75556f1a26b22685295657951524813286223c119b357d6a4ff6fffff2a52f2362083f12f33926f349242faf2d23ffe125f6f0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000e5a1	\\x04194e00912286ac0457fad0a22a87b68326b8d8ad7a88c282d77fcfbaaa87bbc315fad87d5387bc8455ba20c1a385dd55a86e6002f48578ce56cbec414c85004866ae10b21487d507873620da848505053730e02a7385beed0a33f861b48855c2c505effe4c85828397bfeefda487d1c67638183d2d86ed854670e0425d88d7034976efdd4285ac0ef8bef82ee58862c39bc3fe12ab8843831704f8294b894e43f801ffeaf4885803d745ff3d858953c3fa47f87efd847f42c83ff8d93589d146fcff1715ae86ee43fbf5ef0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000644326841f33b480466a43985a64c57752654f44315931542842448a427343461eff46f5fff3ff6844b23409000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d87d	08.dat	09.dat
1047	test	2312121321	testest@email.com	Chief Executive Officer	11/20/2024, 09:24:32	test52db5a9b-bde7-4739-b9b3-5f2e72d31292.png	2024-11-20	1331995105	92		Davao	2024-11-20	\N	\N	\N	\N	\N	\N
1048	testbadi	2312312	dasdsdadas@email.com	Back End Developer	11/20/2024, 09:30:17	testbadid78b887c-99dd-42c4-91d6-c6a10644ba13.png	2024-11-20	1332002163	93	94	Cebu	2024-11-20	\N	\N	\N	\N	\N	\N
1049	Russiel Janine C. Subang	09816225260	rsubang@jairosoft.com	Internal Finance	04/02/2025, 11:00:49	Russieljanine_0dcdbe7a-8063-46a5-b9a0-3818ca006277.png	2024-11-21	1876138282	95	96	Davao	\N	\N	\N	\N	\N	\N	\N
1050	John Doe	09253647891	John.doe@gmail.com	Full Stack Developer		JohnDoe714cf1a6-b6fe-4303-8525-5dd326c3f3b4.png	2024-11-27	1332304341			Davao	2024-11-27	\N	\N	\N	\N	\N	\N
118	Vaughn Fitz Benedicto	+639012387513	vbenedicto@jairosoft.com	Developer	10/02/2024, 14:34:19	454241607_8330691796973715_4445470484624151307_nd7e158f4-f867-4334-89ff-61497236c0e7.jpg	2024-04-29	2413142078	56	57	Davao	2024-11-27	\N	\N	\\x041f710029da861cc4faa5f8651288aee0b93ec9658a88b74ea9fea8759a879498083be1d93285a4849a83feeaea851a874e7408d17289ca8579f4cffdc2b7df0f9cb25809d3849e43bb7fff397388df886832707133b51cc22936079d4bb8e7c56ab4e8f90b8591c2c901e8f943b703065ab6080984b68883b9070f3d2cb60cc439ba10218cb9e4444b34e03d65b686c3cd050849dd8413011d7a086e45b70b031e76e87dcdb87bc6ad050f295a86250ffd73e0291289b00a89fec74a038ad4c44afedf957c848f82d93f00f985b612410d3ae03676b805453df8ef853e8804c64efe07991e888887ff83fe753c4ae0454b7eefba3d4a7043fd03f800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004306643536422553475a253445334119f37426313825412635142f55922945883766585733881511243253140669426528f4f72f212fff73040000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000aa8b	\\x04236200aac285a5cb4809d2920ab6b18f3949c999fab6c223da3ac0debab6961e1bcdd209638598876885d919fb8496468743d91d6bb68b8d3989db59c3b67b4c49c9db997b85888678c3e06ebbb769487ac9e6b1e3b674467809d9a23c8678489c05e0f61485084219f207a2c2b6b327d9fec0de32b857478d8be609abb85004ba0900617bb8c5c6587840713bb95642a705e8a94bb861869805e0e573b8d0843876271db5b95ec4cc03f83ab283ac0689bfe035ca84af0889ffd8016b839984a885e0263b829cc5a83ff8b533838fc3c843e805bc838681d98700b62c8387c1dd3ff812bd8582468a01ff319a8535caf9ef3f39aab74c49fad3e7eef9473fcaf9c90749ea48b48549be20ea824abf0328fa07e23b4bca410bfeef000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000612336392541461246456423257324426a4f3593483f535bf23239675522225162358222019a2254318213567114362326943af14399454041f87f56142857a5ff17552347050000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000059aa	56.dat	57.dat
1051	John Doe	09231565489	john.doe@gmail.com	Sr. Full Stack Developer		JohnDoe2302d009-d51c-4067-99d7-d20279c25f4e.png	2024-11-27	1332304341	97	98	Davao	2024-11-27	\N	\N	\N	\N	\N	\N
1058	Sheila Mae Baclao	123	sbaclao@jairosoft.com	Quality Assurance Specialist		SheilaMaeBaclao155d7bfb-3454-494f-9579-92830e833fc1.png	2024-11-29	\N			Davao	\N	\N	\N	\N	\N	\N	\N
1052	Jane Doe	09556879132	jane.doe@gmail.com	Intern		JaneDoeca8f5bf9-cb4d-4ded-9b97-974d4c5ea65a.png	2024-11-27	1332231820			Davao	2024-11-29	\N	\N	\N	\N	\N	\N
1053	John Lee Sause	09123456789	john.lee@gmail.com	Intern		JohnLeec3c5e3f5-8f2e-4557-b553-ae07e286350f.png	2024-11-27	1332304341	97	98	Davao	2024-11-27	\N	\N	\N	\N	\N	\N
1054	John Lee Sause	09123456789	john.lee@gmail.com	Intern		JohnLeeSausec8329b31-f267-4853-a8cf-cb2ecc985077.png	2024-11-27	1332304341	97		Davao	2024-11-27	\N	\N	\N	\N	\N	\N
1055	John Lee Sause	09123456789	john.lee@gmail.com	Intern		JohnLeeSausebf766a0f-81e3-4d29-bd92-db2dad04c721.png	2024-11-27	\N			Davao	2024-11-27	\N	\N	\N	\N	\N	\N
1056	John Lee Sause	09123456789	john.sause@gmail.com	Full Stack Developer		JohnLeeSause26a5bd3c-6042-4015-a9ba-79ca59d7ed1d.png	2024-11-27	1332304341	97	98	Davao	2024-11-27	\N	\N	\N	\N	\N	\N
1057	John Lee Sause	09123456789	john.sause@gmail.com	Full Stack Developer		JohnLeeSause47d45d05-81db-4a06-8418-076e0fd8b737.png	2024-11-27	1332304341	97	98	Davao	2024-11-27	\N	\N	\N	\N	\N	\N
162	Ramon Aseniero Jr.	09123456789	defaultemail@gmail.com	Chief Executive Officer	12/12/2024, 09:32:33	https___d34e910e9c4f6a4df0791b0a9b6b7141.cdn.bubble.io_f1704338794729x129984720837989390_Sir-Jett92583bb9-c564-42ac-88af-d14c248b02e8.jpg	2024-05-03	0906143331	103		Davao	\N	\N	\N	\N	\N	\N	\N
1059	Zazheska Lorenzo	09491649974	zlorenzo@mcm.edu.ph	Intern		jairoLogof53d9ffd-ebec-439c-90be-f734c333456d.png	2024-12-09	3139704089	1		Davao	\N	\N	\N	\N	\N	\N	\N
1060	James Klien Caluyong	09453359690	jamesklienccaluyong@gmail.com	Intern		JamesKlienCaluyong0151b11d-5633-4844-a3a1-0fc55b9e2161.png	2024-12-11	2771666446	0		Davao	\N	\N	\N	\N	\N	\N	\N
1075	Norsia Tago	09123456789	ntago@gmail.com	Intern		NorsiaTago92369142-fa97-40a0-b562-b894f79aef62.png	2025-02-17	1332227878	nor		Davao	\N	\N	\N	\N	\N	\N	\N
1081	John Smile Mella	09123456789	jmella@gmail.com	Intern		JohnSmileMellae4af0dbb-9709-4cda-b893-2c4d0f4966a2.png	2025-02-25	1332268145	john		Davao	\N	\N	\N	\N	\N	\N	\N
1069	Renz Uriel Deypalubos	09123456789	rdeypalubos@gmail.com	Intern		RenzUrielDeypalubose65b5301-5aa2-49d4-9f7f-4a9da7a8f2e5.png	2025-01-21	3205362682	Renz		Davao	2025-05-05	\N	\N	\N	\N	\N	\N
1061	Shiela Baclao	09123456789	sbaclao@jairosoft.com	Intern	02/18/2025, 20:39:57	ShielaBaclao0ec20d9e-0c94-4ada-b4e9-8b628588a5d3.png	2024-12-16	1061201422	106	107	Davao	\N	\N	\N	\N	\N	\N	\N
1063	Alfonso Nowel Tabingo	09123456789	atabingo@gmail.com	Intern		AlfonsoNowelTabingoae5dc804-4ad7-4816-8311-224b7ab0ffa7.png	2025-01-20	3965915818	alfonso		Davao	2025-05-05	\N	\N	\N	\N	\N	\N
1070	Aisah Jenan Lacsaman	09123456789	alacsaman@gmail.com	Intern		AisahJenanLacsamanb55b7075-e818-492d-876f-3724ff127a20.png	2025-02-17	1661079680	Aisah		Davao	\N	\N	\N	\N	\N	\N	\N
1071	Jamairah Cosain	09123456789	jcosain@gmail.com	Intern		JamairahCosain12cf5210-284b-4b40-942c-dd59922c5e12.png	2025-02-17	1627525248	jam		Davao	\N	\N	\N	\N	\N	\N	\N
1068	Nathalie Joy Canonigo	09123456789	ncanonigo@gmail.com	Intern		NathalieJoyCanonigo4190a996-4388-45a2-aab7-39d592f15c9e.png	2025-01-21	0874399325	Nathalie		Davao	2025-05-05	\N	\N	\N	\N	\N	\N
1072	Mohammad Namar Dimalotang	09123456789	mdimalotang@gmail.com	Intern		MohammadNamarDimalotangd58c5789-7cc4-4dfc-9985-ddc20dfb4d1b.png	2025-02-17	1332012666	mohammad		Davao	\N	\N	\N	\N	\N	\N	\N
1073	Lanz Peredeon Lozaldo	09123456789	llozaldo@gmail.com	Intern		LanzPeredeonLozaldoa35f6bb0-6e88-4fc3-81c3-9024e30930e0.png	2025-02-17	1332002163	lanz		Davao	\N	\N	\N	\N	\N	\N	\N
1074	Naimah Edris	09123456789	nedris@gmail.com	Intern		NaimahEdrisff8795b5-d340-4f8a-9dfd-ba403fb1af5e.png	2025-02-17	1331951796	nai		Davao	\N	\N	\N	\N	\N	\N	\N
649	Laurence Añasco	123	laurence@email.com	Full Stack Developer	04/03/2025, 08:00:43	imagesf02dc06d-8cf4-4d62-8cfd-269d66f5c6f4.jfif	2024-08-08	0909863555	2	3	Davao	\N	\N	\N	\\x04267400f6eaf86c8c8e11dc415bf87bcd6a0dd8669bf96205bbc7e0a29bf86d48a98dd9e19bf7ef0a5a722f3e54f96344c9c7e8e19cf777c9ab89e05125f7eb885ef626b1ebf51003397618b173f68fc38945e8b9e5f67847af47d09233fa5b02bb83007d34fb5d010c00efa232f6a584ab7fe79a52f895e9fd4aeae58ae5a043ba7fe0c6c3f59142b943e0ae85ebd4810ffe07f23df963c3cf03e815e6f67284bec7f841727631c2f9f5ffa5cd4409cefff707e1cd4409c4fff507395649d783feff17a9be47d4c4fffb1fbdb648d1c1ffc30f79024a57c2ffc5ff797a4953c2ffc907cd59494583fdc90fcd014a4201fcc717d191484642fee9efdde9484443ffd507e159473603fdf317f9014b4782fe03ff1a6a48b5460dbfd8292d4c5c81fc01f8fee54b5983ff43f871fe4ad901fdf7ef000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000240f33323453152f42375328742262398753f5325af6a321243125f27355135f23214823252315521f53ff2f6ffffffff2fff1ffffff5f22f2f3f41235ff38251b3434000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000dcb	\\x04256c00c552f9bccdd97ad8bab2f7af459983d826bbc8a25a1c09e25d43f7a3858943dfee93e619c31a781f56a4f8834a6bc7ee6a0d887d067e09f899dd8703855bf0178d1af7ac43b783d8a612b6a584b941e05d93e69d04b981d81904f78f83b9c500f17aea52859a49eee6dab49c83ddbff819438420c2fbc10fde8bb59484dd8508d1e4841241fec317fd04851741fbc10fce95887988fd49f8928b8ccfc52cfee79154bbd9421bfeef11bde9df444c782732bdb96a03cc87e0ae4d8a63c11d7ef8cd618a3906fc85f80a32e8b585b903d8e5c98a39c8fd85f8b5d14843c5f8f9efd9f9453303fa79fed1a1463102fbc1fefa61463241f8b916c5884a1e48fe47fcf160474586fdf727f2b848d10b8d7ffc2dc94ba2483efeef7dc1492916dd84e9e5614ba9444af40f0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000446324f233252f74593244228627342952557663311282425548221f4f52333828962f125f56f2f63f2f412f3575fffffff554ffffffff1f2ff3f81ff76f35424f32f7f30100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000008bc3	02.dat	03.dat
1076	James Anthony Javier	09123456789	jjavier@gmail.com	Intern		JamesAnthonyJavier8c3c61f0-9ffb-4539-a003-b83cd1a5cd8f.png	2025-02-25	1332250400	james		Davao	\N	\N	\N	\N	\N	\N	\N
1077	Art III Dela Cruz	09123456789	adelacruz@gmail.com	Intern		ArtIIIDelaCruz76e63806-1dcc-45bb-a7e5-97cb619f7284.png	2025-02-25	1876256826	art		Davao	\N	\N	\N	\N	\N	\N	\N
1078	Cleeve Philip Wong	09123456789	cwong@gmail.com	Intern		CleevePhilipWong50287055-b91e-4c8c-b11c-1247f04444dc.png	2025-02-25	1332278084	cleeve		Davao	\N	\N	\N	\N	\N	\N	\N
1079	Adam Omar Abdulbaki Jr.	09123456789	aabdulbaki@gmail.com	Intern		AdamOmarAbdulbakiJr_c4db4ee1-1056-4618-aee1-79f12fc9d371.png	2025-02-25	1331951909	adam		Davao	\N	\N	\N	\N	\N	\N	\N
1080	Renz Carl Jansen Sarucam	09123456789	rsarucam@gmail.com	Intern		RenzCarlJansenSarucam2e6e8c22-12f1-40eb-bfc4-d6f3cd212812.png	2025-02-25	1876316426	renz		Davao	\N	\N	\N	\N	\N	\N	\N
1082	Edgardo Rojas	09123456789	erojas@gmail.com	Intern		EdgardoRojase10c3a8c-3cdd-416a-9e14-3b6fd3df398a.png	2025-02-25	1331975069	edg		Davao	\N	\N	\N	\N	\N	\N	\N
1083	Nicose John Soriano	09123456789	nsoriano@gmail.com	Intern		NicoseJohnSorianoc0b01264-3224-4fa6-9d00-f1fe229197ba.png	2025-02-25	1332014702	nic		Davao	\N	\N	\N	\N	\N	\N	\N
1084	John Rey Silverio	09123456789	jsilverio@gmail.com	Intern		JohnReySilverio0882d42e-5044-4500-8f94-0ff156f0235b.png	2025-02-25	1876285786	ohn		Davao	\N	\N	\N	\N	\N	\N	\N
1067	John Frankie Tongo	09123456789	jtongo@gmail.com	Intern		JohnFrankieTongoa026677c-ad05-4131-a721-53ee21011e6d.png	2025-01-21	3181068058	fran		Davao	2025-05-05	\N	\N	\N	\N	\N	\N
1065	John Kearney Yap	09123456789	jyap@gmail.com	Intern		JohnKearneyYapb0158f50-c192-4a90-8e07-85c075753b42.png	2025-01-20	1544337527	John	kearney	Davao	2025-05-05	\N	\N	\N	\N	\N	\N
1064	Roan Miles Tanduyan	09123456789	rtanduyan@gmail.com	Intern		RoanMilesTanduyanb1390e8f-604d-4017-882a-24a25a7ab9ee.png	2025-01-20	1561242948	Roan	Miles	Davao	2025-05-05	\N	\N	\N	\N	\N	\N
1066	Niño Nagelo Calope	09123456789	ncalope@gmail.com	Intern		NiÃ±oNageloCalopef24ca577-e552-4706-abdf-92b2b5220f88.png	2025-01-20	1541433415	Niño	Nagelo	Davao	2025-05-05	\N	\N	\N	\N	\N	\N
1062	Stian Trond Bitong	09123456789	sbitong@email.com	Intern		StianTrondBitong01ac563b-c610-44e1-998b-88b203b33c5e.png	2025-01-20	1525425191	Stian	Trond	Davao	2025-05-05	\N	\N	\N	\N	\N	\N
1087	Straña Alynne Villacis	12345	intern@email.com	Intern		StraÃ±aAlynneVillacis9e9a335a-d192-4be3-a279-939288d1f42a.png	2025-04-02	2189495499	Alynne		Davao	\N	\N	\N	\N	\N	\N	\N
1088	Juliane Kyle Dimzon	123	intern@email.com	Intern		JulianeKyleDimzon2b3e31b2-90b0-4f20-b32a-11ad0817dd82.png	2025-04-02	3472732553	Juliane 		Davao	\N	\N	\N	\N	\N	\N	\N
1089	Christine Dacles	123	intern@email.com	Intern		ChristineDacles632592e1-bb78-4241-85e4-79d05105a67d.png	2025-04-02	2824313815	Christine 		Davao	\N	\N	\N	\N	\N	\N	\N
1090	Dean Cinco	123	intern@email.com	Intern		DeanCinco5deae150-8f15-4026-9b52-0fa5b9ab3b35.png	2025-04-02	2824202167	Dean 		Davao	\N	\N	\N	\N	\N	\N	\N
1091	Riza Pequiro	123	intern@email.com	Intern		RizaPequiroefd0f4f6-ca13-4af9-a03c-6102ce7fc8f2.png	2025-04-02	2851951059	Riza 		Davao	\N	\N	\N	\N	\N	\N	\N
1092	Elaiza Jane Tongson	123	intern@email.com	Intern		ElaizaJaneTongsonc08dae18-ab0f-41e3-895a-bdff31c91485.png	2025-04-02	3472472841	Elaiza 		Davao	\N	\N	\N	\N	\N	\N	\N
1094	Eldrick Pingal 	123	intern@email.com	Intern		EldrickPingal_37454bcb-c64e-4bb5-9ef7-ccb87ccec571.png	2025-04-02	2824292791	Eldrick 		Davao	\N	\N	\N	\N	\N	\N	\N
1095	Ian Je Nierre	123	intern@email.com	Intern		IanJeNierrecda2ecf8-45a1-466f-ae67-75599f7eb2d6.png	2025-04-02	3485013065	Ian 		Davao	\N	\N	\N	\N	\N	\N	\N
687	Sanny Paul Geraldino	09606052419	sgeraldino@jairosoft.com	Full Stack Developer	04/03/2025, 12:17:08	449390716_389315067487161_2060853620533180635_ncdb18c91-bfff-4cc0-bd5b-b6159ae10f09629e0189-56cd-4e10-a313-db57cae185b8.jpg	2024-08-14	0909234003	68	69	Davao	\N	\N	\N	\\x04146000b5e27612c849aef8d1d2b59984b87fefc2c27695477ac3e3e9a2b617473932009ab3b7034858b2e0c11bb78cc49743eeea93b70a863874d861bcb8ef8647b4e0b9e4b78483b8c30e5545b70ec21c78e8e98ab8d18dabf2607504b97ec68703069224b9e80648f6e8b242b9c5c489fe574a2b859403ca7fe8652b851641f70118b595878ac4fcc1fe1df2852a02f8f5ff95c2885a86fdd11f019b89618afccbef000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000753621f3320434342534263224452c6482383957b231fb4fad27a4bf2565f8f35f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000009d66	\\x041a5f00f5bab68d491ac9ed09cbb601886b6a4705c3b76e517acdd00a43b692064a85ed4d4bb7784f590bdfbe33b776ca6849d8c553b60488476e1ff9a3b67dc96749d84d1cb772068889e0a1dcb768c7a887d8c9ecb40905fbb508156db76d469907e015b5b6ea045a700782fa885005b9c30715438ac88218feef8e1b751683fbf3ef690db58604ac3fff2dba89be4238fee799cab695902cffe79de2b769155cd1cf1113852784f7f1ffee848a5601ff43f8a50a440b43fe09f9ba92449105ddff07dd7a441e85fcf9ef727c4486c7bbbf080000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002331669f624f04239324344155343af45547f2942f316f732f4b468222241869f3227358ff8f5524ffffff3fff89050000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007b7f	68.dat	69.dat
1093	Angela Marie Lamera	123	intern@email.com	Intern		AngelaMarieLamera151135bf-867a-4d6f-841a-66bdd4102bd4.png	2025-04-02	2824447111	Angela 		Davao	\N	\N	\N	\N	\N	\N	\N
1096	Jovanne Vicentino	1234567689	jvicentino@jairosoft.com	Intern		JovanneVicentino5006a292-d28a-42d4-be5a-67aa34ec53e5.png	2025-05-05	1876338010	jov		Davao	\N	\N	\N	\N	\N	\N	\N
1097	Calvin John Dalino	1234567689	cdalino@jairosoft.com	Intern		CalvinJohnDalino44c14103-bf27-4a8f-bb38-447a350b50eb.png	2025-05-05	1876335147	cal		Davao	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3377 (class 0 OID 3391489)
-- Dependencies: 220
-- Data for Name: _dberror_log; Type: TABLE DATA; Schema: public; Owner: default
--

COPY public._dberror_log (id, "errorType", message, "timestamp") FROM stdin;
2	API Error	Employee not found.	08/08/2024, 14:14:28
4	API Error	Error Fingerprint not match:	08/08/2024, 15:12:45
5	API Error	Employee not found.	08/08/2024, 15:18:05
6	API Error	Employee not found.	08/08/2024, 15:24:34
7	API Error	Employee not found.	08/08/2024, 15:30:35
8	API Error	Employee not found.	08/08/2024, 15:31:07
9	API Error	Employee not found.	08/08/2024, 16:05:53
10	API Error	Error Fingerprint not match:	08/08/2024, 16:06:13
11	API Error	Error Fingerprint not match:	08/09/2024, 08:04:33
12	API Error	Error Fingerprint not match:	08/09/2024, 08:06:52
13	API Error	Error Fingerprint not match:	08/09/2024, 08:09:36
14	API Error	Error Fingerprint not match:	08/09/2024, 09:41:44
15	API Error	Error Fingerprint not match:	08/09/2024, 20:00:08
16	API Error	Employee not found.	08/09/2024, 20:00:29
17	API Error	Employee not found.	08/15/2024, 12:15:47
18	API Error	Employee not found.	08/15/2024, 12:56:32
19	API Error	Employee not found.	08/15/2024, 12:58:07
20	API Error	Employee not found.	08/15/2024, 12:58:48
21	API Error	Employee not found.	08/15/2024, 14:40:06
22	API Error	Error Fingerprint not match:	08/15/2024, 15:04:27
23	API Error	Error Fingerprint not match:	08/19/2024, 13:30:40
24	API Error	Employee has no fingerprint.	08/19/2024, 13:31:05
25	API Error	Employee not found.	08/19/2024, 13:31:17
26	API Error	Employee not found.	08/19/2024, 15:46:43
27	API Error	Employee not found.	08/19/2024, 15:46:57
28	API Error	Employee has no fingerprint.	08/19/2024, 16:31:15
29	API Error	Employee has no fingerprint.	08/19/2024, 16:34:26
30	API Error	Employee has no fingerprint.	08/19/2024, 16:40:20
31	API Error	Employee not found.	08/19/2024, 16:41:00
32	API Error	Employee not found.	08/19/2024, 16:41:04
33	API Error	Employee not found.	08/19/2024, 16:41:10
34	API Error	Employee has no fingerprint.	08/19/2024, 16:41:18
35	API Error	Employee not found.	08/19/2024, 16:41:38
36	API Error	Error Fingerprint not match:	08/19/2024, 16:48:18
37	API Error	Error Fingerprint not match:	08/19/2024, 16:48:26
38	API Error	Error Fingerprint not match:	08/19/2024, 16:48:34
39	API Error	Error Fingerprint not match:	08/19/2024, 16:48:45
40	API Error	Error Fingerprint not match:	08/19/2024, 16:48:56
41	API Error	Error Fingerprint not match:	08/19/2024, 16:49:59
42	API Error	Employee not found.	08/19/2024, 16:50:04
43	API Error	Employee has no fingerprint.	08/19/2024, 16:51:33
44	API Error	Error Fingerprint not match:	08/19/2024, 16:54:58
45	API Error	Error Fingerprint not match:	08/20/2024, 08:21:55
46	API Error	Error Fingerprint not match:	08/20/2024, 08:22:02
47	API Error	Employee not found.	08/20/2024, 08:48:51
48	API Error	Employee not found.	08/20/2024, 08:48:51
49	API Error	Employee not found.	08/20/2024, 08:48:51
50	API Error	Error Fingerprint not match:	08/20/2024, 08:49:23
51	API Error	Error Fingerprint not match:	08/20/2024, 08:49:32
52	API Error	Error Fingerprint not match:	08/20/2024, 08:49:45
53	API Error	Error Fingerprint not match:	08/20/2024, 08:49:56
54	API Error	Error Fingerprint not match:	08/20/2024, 08:50:46
55	API Error	Employee has no fingerprint.	08/20/2024, 09:34:46
56	API Error	Employee has no fingerprint.	08/20/2024, 14:43:16
57	API Error	Error Fingerprint not match:	08/20/2024, 15:06:55
58	API Error	Error Fingerprint not match:	08/20/2024, 15:07:03
59	API Error	Error Fingerprint not match:	08/20/2024, 15:08:18
60	API Error	Error Fingerprint not match:	08/20/2024, 15:08:26
61	API Error	An error occurred.	08/20/2024, 15:09:37
62	API Error	Error Fingerprint not match:	08/20/2024, 15:12:26
63	API Error	Error Fingerprint not match:	08/20/2024, 15:33:25
64	API Error	Error Fingerprint not match:	08/20/2024, 15:33:34
65	API Error	Employee has no fingerprint.	08/20/2024, 15:47:34
66	API Error	Employee has no fingerprint.	08/20/2024, 15:50:07
67	API Error	Employee has no fingerprint.	08/21/2024, 08:17:10
68	API Error	Employee not found.	08/21/2024, 09:03:05
69	API Error	Employee not found.	08/21/2024, 09:05:42
70	API Error	Employee not found.	08/21/2024, 09:21:44
71	API Error	Employee not found.	08/21/2024, 09:21:44
72	API Error	Employee not found.	08/21/2024, 09:21:45
73	API Error	Employee has no fingerprint.	08/21/2024, 09:22:03
74	API Error	Employee has no fingerprint.	08/21/2024, 09:39:06
75	API Error	Employee has no fingerprint.	08/21/2024, 09:40:59
76	API Error	Employee has no fingerprint.	08/21/2024, 09:43:31
77	API Error	Employee has no fingerprint.	08/21/2024, 09:44:38
78	API Error	Error Fingerprint not match:	08/21/2024, 09:52:30
79	API Error	Error Fingerprint not match:	08/21/2024, 09:55:15
80	API Error	Employee not found.	08/21/2024, 09:55:19
81	API Error	Error Fingerprint not match:	08/21/2024, 09:58:28
82	API Error	Error Fingerprint not match:	08/21/2024, 10:00:53
83	API Error	Error Fingerprint not match:	08/21/2024, 10:01:01
84	API Error	Error Fingerprint not match:	08/21/2024, 10:01:09
85	API Error	Error Fingerprint not match:	08/21/2024, 10:01:18
86	API Error	Error Fingerprint not match:	08/21/2024, 10:01:27
87	API Error	Error Fingerprint not match:	08/21/2024, 10:02:24
88	API Error	Error Fingerprint not match:	08/21/2024, 10:02:31
89	API Error	Error Fingerprint not match:	08/21/2024, 10:02:39
90	API Error	Error Fingerprint not match:	08/21/2024, 10:02:48
91	API Error	Error Fingerprint not match:	08/21/2024, 10:05:27
92	API Error	Error Fingerprint not match:	08/21/2024, 10:05:43
93	API Error	Employee not found.	08/21/2024, 10:06:09
94	API Error	Employee has no fingerprint.	08/21/2024, 10:06:13
95	API Error	Employee has no fingerprint.	08/21/2024, 10:06:50
96	API Error	Employee has no fingerprint.	08/21/2024, 10:07:02
97	API Error	Employee not found.	08/21/2024, 10:07:07
98	API Error	Employee has no fingerprint.	08/21/2024, 10:07:12
99	API Error	Employee not found.	08/21/2024, 10:07:22
100	API Error	Employee has no fingerprint.	08/21/2024, 10:10:10
101	API Error	Employee has no fingerprint.	08/21/2024, 10:11:12
102	API Error	Employee has no fingerprint.	08/21/2024, 10:11:36
103	API Error	Error Fingerprint not match:	08/21/2024, 10:12:42
104	API Error	Employee has no fingerprint.	08/21/2024, 10:15:32
105	API Error	Employee has no fingerprint.	08/21/2024, 10:28:58
106	API Error	Employee has no fingerprint.	08/21/2024, 10:36:22
107	API Error	Employee has no fingerprint.	08/21/2024, 10:36:51
108	API Error	Employee not found.	08/21/2024, 10:37:33
109	API Error	Employee not found.	08/21/2024, 10:37:38
110	API Error	Employee not found.	08/21/2024, 10:37:48
111	API Error	Employee has no fingerprint.	08/21/2024, 10:37:54
112	API Error	Employee has no fingerprint.	08/21/2024, 10:38:52
113	API Error	Employee has no fingerprint.	08/21/2024, 10:39:27
114	API Error	Employee has no fingerprint.	08/21/2024, 10:40:00
115	API Error	An error occurred.	08/21/2024, 10:40:45
116	API Error	An error occurred.	08/21/2024, 10:41:09
117	API Error	Error Fingerprint not match:	08/21/2024, 10:44:24
118	API Error	Error Fingerprint not match:	08/21/2024, 10:44:57
119	API Error	Error Fingerprint not match:	08/21/2024, 10:46:18
120	API Error	Error Fingerprint not match:	08/21/2024, 10:46:47
121	API Error	Employee has no fingerprint.	08/21/2024, 10:51:49
122	API Error	Employee has no fingerprint.	08/21/2024, 11:51:29
123	API Error	Employee has no fingerprint.	08/21/2024, 11:51:38
124	API Error	Employee has no fingerprint.	08/21/2024, 11:51:38
125	API Error	Employee has no fingerprint.	08/21/2024, 11:51:48
126	API Error	Employee not found.	08/21/2024, 12:49:59
127	API Error	Error Fingerprint not match:	08/21/2024, 12:50:13
128	API Error	Employee has no fingerprint.	08/21/2024, 13:29:30
129	API Error	Error Fingerprint not match:	08/21/2024, 13:29:30
130	API Error	Error Fingerprint not match:	08/21/2024, 13:29:30
131	API Error	Employee has no fingerprint.	08/21/2024, 13:29:33
132	API Error	Error Fingerprint not match:	08/21/2024, 13:29:34
133	API Error	Employee has no fingerprint.	08/21/2024, 13:30:33
134	API Error	Employee has no fingerprint.	08/21/2024, 13:32:50
135	API Error	Employee has no fingerprint.	08/21/2024, 13:33:06
136	API Error	Employee has no fingerprint.	08/21/2024, 13:33:34
137	API Error	Employee has no fingerprint.	08/21/2024, 13:33:39
138	API Error	Employee has no fingerprint.	08/21/2024, 13:34:01
139	API Error	Employee has no fingerprint.	08/21/2024, 13:34:34
140	API Error	Employee has no fingerprint.	08/21/2024, 13:35:39
141	API Error	Employee has no fingerprint.	08/21/2024, 13:35:56
142	API Error	Employee has no fingerprint.	08/21/2024, 13:36:28
143	API Error	Employee has no fingerprint.	08/21/2024, 13:37:05
144	API Error	Employee has no fingerprint.	08/21/2024, 13:37:42
145	API Error	Employee has no fingerprint.	08/21/2024, 13:38:39
146	API Error	Employee has no fingerprint.	08/21/2024, 13:39:00
147	API Error	Employee has no fingerprint.	08/21/2024, 13:41:04
148	API Error	Employee has no fingerprint.	08/21/2024, 13:41:55
149	API Error	Employee has no fingerprint.	08/21/2024, 13:46:20
150	API Error	Employee has no fingerprint.	08/21/2024, 13:47:12
151	API Error	Employee has no fingerprint.	08/21/2024, 13:48:19
152	API Error	Employee has no fingerprint.	08/21/2024, 13:49:09
153	API Error	Employee has no fingerprint.	08/21/2024, 13:50:10
154	API Error	Employee has no fingerprint.	08/21/2024, 13:53:01
155	API Error	Employee not found.	08/21/2024, 14:08:05
156	API Error	Employee has no fingerprint.	08/21/2024, 14:10:54
157	API Error	Employee has no fingerprint.	08/21/2024, 14:14:06
158	API Error	Employee has no fingerprint.	08/21/2024, 14:15:36
159	API Error	Employee has no fingerprint.	08/21/2024, 14:28:55
160	API Error	Error Fingerprint not match:	08/21/2024, 14:29:31
161	API Error	Employee has no fingerprint.	08/21/2024, 14:41:54
162	API Error	Employee has no fingerprint.	08/21/2024, 14:41:59
163	API Error	Employee has no fingerprint.	08/21/2024, 14:43:35
164	API Error	Employee has no fingerprint.	08/21/2024, 14:44:18
165	API Error	Employee has no fingerprint.	08/21/2024, 14:44:54
166	API Error	Employee has no fingerprint.	08/21/2024, 14:48:18
167	API Error	Employee has no fingerprint.	08/21/2024, 14:48:26
168	API Error	Employee has no fingerprint.	08/21/2024, 14:49:23
169	API Error	Employee has no fingerprint.	08/21/2024, 14:49:30
170	API Error	An error occurred.	08/21/2024, 14:51:05
171	API Error	Employee has no fingerprint.	08/21/2024, 14:51:51
172	API Error	Employee has no fingerprint.	08/21/2024, 14:52:15
173	API Error	User is an intern	08/21/2024, 14:53:28
174	API Error	An error occurred.	08/21/2024, 14:54:32
175	API Error	Employee has no fingerprint.	08/21/2024, 14:56:30
176	API Error	Employee has no fingerprint.	08/21/2024, 14:56:40
177	API Error	Employee has no fingerprint.	08/21/2024, 14:57:15
178	API Error	Employee has no fingerprint.	08/21/2024, 14:57:28
179	API Error	Employee has no fingerprint.	08/21/2024, 14:59:18
180	API Error	Employee has no fingerprint.	08/21/2024, 15:00:04
181	API Error	Employee has no fingerprint.	08/21/2024, 15:02:42
182	API Error	Employee has no fingerprint.	08/21/2024, 15:03:08
183	API Error	Employee has no fingerprint.	08/21/2024, 15:04:51
184	API Error	Employee has no fingerprint.	08/21/2024, 15:05:46
185	API Error	Employee has no fingerprint.	08/21/2024, 15:21:30
186	API Error	Employee has no fingerprint.	08/21/2024, 15:23:18
187	API Error	Employee has no fingerprint.	08/21/2024, 15:24:02
188	API Error	Employee has no fingerprint.	08/21/2024, 15:24:35
189	API Error	Employee has no fingerprint.	08/21/2024, 15:24:51
190	API Error	Employee has no fingerprint.	08/21/2024, 15:42:55
191	API Error	Employee not found.	08/22/2024, 12:04:17
192	API Error	Error Fingerprint not match:	08/22/2024, 12:04:23
193	API Error	Employee not found.	08/22/2024, 12:15:34
194	API Error	Employee not found.	08/22/2024, 12:15:42
195	API Error	Employee not found.	08/22/2024, 12:16:07
196	API Error	Employee not found.	08/22/2024, 12:17:37
197	API Error	Employee not found.	08/22/2024, 12:17:42
198	API Error	Employee not found.	08/28/2024, 10:38:43
199	API Error	Error Fingerprint not match:	08/28/2024, 14:06:57
200	API Error	Employee not found.	08/28/2024, 14:07:20
201	API Error	Employee has no fingerprint.	08/28/2024, 14:09:24
202	API Error	Employee has no fingerprint.	08/28/2024, 14:09:46
203	API Error	Employee has no fingerprint.	08/28/2024, 14:13:01
204	API Error	Employee has no fingerprint.	08/28/2024, 14:14:29
205	API Error	Employee has no fingerprint.	08/28/2024, 14:14:52
206	API Error	Employee has no fingerprint.	08/28/2024, 14:15:25
207	API Error	Employee has no fingerprint.	08/28/2024, 14:16:05
208	API Error	Employee has no fingerprint.	08/28/2024, 14:16:33
209	API Error	Employee has no fingerprint.	08/28/2024, 14:17:30
210	API Error	Employee has no fingerprint.	08/28/2024, 14:18:49
211	API Error	Error Fingerprint not match:	08/28/2024, 14:25:03
212	API Error	Employee not found.	08/28/2024, 14:25:08
213	API Error	Error Fingerprint not match:	08/28/2024, 14:25:16
214	API Error	Employee not found.	08/28/2024, 14:25:43
215	API Error	Employee has no fingerprint.	08/28/2024, 14:27:52
216	API Error	Employee has no fingerprint.	08/28/2024, 14:32:24
217	API Error	Employee has no fingerprint.	08/28/2024, 14:32:44
218	API Error	Employee has no fingerprint.	08/28/2024, 14:33:06
219	API Error	Employee has no fingerprint.	08/28/2024, 14:33:23
220	API Error	Employee has no fingerprint.	08/28/2024, 14:33:58
221	API Error	Employee has no fingerprint.	08/28/2024, 14:34:57
222	API Error	Employee has no fingerprint.	08/28/2024, 14:37:55
223	API Error	Employee has no fingerprint.	08/28/2024, 14:38:26
224	API Error	Employee has no fingerprint.	08/28/2024, 14:43:00
225	API Error	Employee has no fingerprint.	08/28/2024, 14:43:25
226	API Error	Employee has no fingerprint.	08/28/2024, 14:43:43
227	API Error	Employee has no fingerprint.	08/28/2024, 14:44:05
228	API Error	Employee has no fingerprint.	08/28/2024, 14:45:04
229	API Error	Employee has no fingerprint.	08/28/2024, 14:45:29
230	API Error	Employee has no fingerprint.	08/28/2024, 14:45:50
231	API Error	Error Fingerprint not match:	08/28/2024, 14:46:27
232	API Error	Employee has no fingerprint.	08/28/2024, 14:53:19
233	API Error	Employee has no fingerprint.	08/28/2024, 14:53:45
234	API Error	Error Fingerprint not match:	08/28/2024, 14:55:25
235	API Error	Employee has no fingerprint.	08/28/2024, 14:57:01
236	API Error	Error Fingerprint not match:	08/28/2024, 14:58:21
237	API Error	Error Fingerprint not match:	08/28/2024, 14:58:43
238	API Error	Employee has no fingerprint.	08/28/2024, 15:10:16
239	API Error	Employee has no fingerprint.	08/28/2024, 15:10:57
240	API Error	Employee has no fingerprint.	08/28/2024, 15:11:52
241	API Error	Employee has no fingerprint.	08/28/2024, 15:12:15
242	API Error	Employee has no fingerprint.	08/28/2024, 15:13:05
243	API Error	Employee has no fingerprint.	08/28/2024, 15:14:20
244	API Error	Error Fingerprint not match:	08/28/2024, 15:14:55
245	API Error	Employee has no fingerprint.	08/28/2024, 15:18:55
246	API Error	Employee has no fingerprint.	08/28/2024, 15:21:29
247	API Error	Employee has no fingerprint.	08/28/2024, 15:22:57
248	API Error	Employee has no fingerprint.	08/28/2024, 15:23:24
249	API Error	Employee has no fingerprint.	08/28/2024, 15:24:30
250	API Error	Employee has no fingerprint.	08/28/2024, 15:28:31
251	API Error	Employee has no fingerprint.	08/28/2024, 15:29:11
252	API Error	Employee not found.	08/28/2024, 15:32:48
253	API Error	Employee not found.	08/28/2024, 15:32:54
254	API Error	Employee has no fingerprint.	08/28/2024, 15:35:55
255	API Error	Employee has no fingerprint.	08/28/2024, 15:36:32
256	API Error	Employee has no fingerprint.	08/28/2024, 15:37:10
257	API Error	Employee has no fingerprint.	08/29/2024, 12:53:04
258	API Error	Error Fingerprint not match:	08/29/2024, 13:22:21
259	API Error	Employee has no fingerprint.	08/29/2024, 13:25:52
260	API Error	Employee not found.	08/29/2024, 13:29:07
261	API Error	An error occurred.	08/29/2024, 13:29:13
262	API Error	Employee has no fingerprint.	08/29/2024, 14:16:47
263	API Error	Employee has no fingerprint.	08/29/2024, 14:18:08
264	API Error	Employee has no fingerprint.	08/29/2024, 14:23:53
265	API Error	Employee has no fingerprint.	08/29/2024, 14:24:17
266	API Error	Employee has no fingerprint.	08/29/2024, 14:24:48
267	API Error	Employee has no fingerprint.	08/29/2024, 14:25:12
268	API Error	Employee has no fingerprint.	08/29/2024, 14:27:41
269	API Error	Employee has no fingerprint.	08/29/2024, 14:28:49
270	API Error	Employee has no fingerprint.	08/29/2024, 14:32:30
271	API Error	Error Fingerprint not match:	08/29/2024, 14:33:38
272	API Error	Employee has no fingerprint.	08/29/2024, 14:34:34
273	API Error	Employee has no fingerprint.	08/29/2024, 14:35:14
274	API Error	Error Fingerprint not match:	08/29/2024, 14:37:20
275	API Error	Error Fingerprint not match:	08/29/2024, 14:39:21
276	API Error	Employee not found.	08/29/2024, 15:05:25
277	API Error	Employee not found.	08/29/2024, 15:05:46
278	API Error	Error Fingerprint not match:	08/29/2024, 15:05:54
279	API Error	Employee has no fingerprint.	08/29/2024, 15:06:06
280	API Error	Error Fingerprint not match:	08/30/2024, 14:25:08
281	API Error	Error Fingerprint not match:	09/05/2024, 14:11:07
282	API Error	Employee has no fingerprint.	09/05/2024, 14:11:34
283	API Error	Employee has no fingerprint.	09/05/2024, 15:07:06
284	API Error	Error Fingerprint not match:	09/05/2024, 15:09:35
285	API Error	Employee has no fingerprint.	09/10/2024, 09:39:42
286	API Error	Employee not found.	09/11/2024, 13:58:42
287	API Error	Employee not found.	09/11/2024, 13:58:51
288	API Error	Employee has no fingerprint.	09/11/2024, 14:00:14
289	API Error	Employee not found.	09/11/2024, 14:08:08
290	API Error	Error Fingerprint not match:	09/11/2024, 14:09:44
291	API Error	Employee has no fingerprint.	09/11/2024, 14:10:35
292	API Error	Error Fingerprint not match:	09/11/2024, 14:12:16
293	API Error	Employee has no fingerprint.	09/12/2024, 14:49:34
294	API Error	Error Fingerprint not match:	09/13/2024, 16:12:34
295	API Error	Employee not found.	09/13/2024, 16:12:39
296	API Error	Employee has no fingerprint.	09/13/2024, 16:48:22
297	API Error	Employee has no fingerprint.	09/13/2024, 16:49:16
298	API Error	Employee has no fingerprint.	09/13/2024, 16:49:47
299	API Error	Employee has no fingerprint.	09/17/2024, 13:47:00
300	API Error	Employee has no fingerprint.	09/17/2024, 13:51:08
301	API Error	Employee has no fingerprint.	09/17/2024, 13:51:34
302	API Error	Employee has no fingerprint.	09/17/2024, 13:59:19
303	API Error	Employee has no fingerprint.	09/17/2024, 13:59:27
304	API Error	Employee has no fingerprint.	09/17/2024, 13:59:53
305	API Error	Employee has no fingerprint.	09/17/2024, 14:00:19
306	API Error	Employee has no fingerprint.	09/17/2024, 14:00:42
307	API Error	Employee has no fingerprint.	09/17/2024, 14:01:08
308	API Error	Employee has no fingerprint.	09/17/2024, 14:03:11
309	API Error	Employee has no fingerprint.	09/17/2024, 14:03:36
310	API Error	Employee has no fingerprint.	09/17/2024, 14:06:18
311	API Error	Employee has no fingerprint.	09/17/2024, 14:06:36
312	API Error	Employee has no fingerprint.	09/17/2024, 14:08:53
313	API Error	Employee has no fingerprint.	09/17/2024, 14:09:13
314	API Error	Employee has no fingerprint.	09/17/2024, 14:10:29
315	API Error	Employee has no fingerprint.	09/17/2024, 14:10:59
316	API Error	Employee has no fingerprint.	09/17/2024, 14:11:41
317	API Error	Employee has no fingerprint.	09/17/2024, 14:15:10
318	API Error	Employee has no fingerprint.	09/17/2024, 14:15:32
319	API Error	Employee has no fingerprint.	09/17/2024, 14:15:47
320	API Error	Employee has no fingerprint.	09/17/2024, 14:16:12
321	API Error	Employee has no fingerprint.	09/17/2024, 14:16:36
322	API Error	Employee has no fingerprint.	09/17/2024, 14:16:59
323	API Error	Employee has no fingerprint.	09/17/2024, 14:17:27
324	API Error	Employee has no fingerprint.	09/17/2024, 14:29:13
325	API Error	Employee has no fingerprint.	09/17/2024, 14:29:31
326	API Error	Employee has no fingerprint.	09/17/2024, 14:30:26
327	API Error	Employee has no fingerprint.	09/17/2024, 14:30:47
328	API Error	Employee not found.	09/17/2024, 14:32:16
329	API Error	Employee has no fingerprint.	09/17/2024, 14:33:47
330	API Error	Employee has no fingerprint.	09/17/2024, 14:34:09
331	API Error	Employee has no fingerprint.	09/17/2024, 14:38:22
332	API Error	Employee has no fingerprint.	09/17/2024, 14:38:41
333	API Error	Employee not found.	09/17/2024, 14:40:29
334	API Error	Employee has no fingerprint.	09/17/2024, 14:42:21
335	API Error	Employee has no fingerprint.	09/17/2024, 14:42:42
336	API Error	Employee has no fingerprint.	09/17/2024, 14:43:06
337	API Error	Employee has no fingerprint.	09/17/2024, 14:43:53
338	API Error	Employee has no fingerprint.	09/17/2024, 14:44:17
339	API Error	Employee has no fingerprint.	09/17/2024, 14:45:28
340	API Error	Employee has no fingerprint.	09/17/2024, 14:45:50
341	API Error	Employee has no fingerprint.	09/17/2024, 14:46:17
342	API Error	Employee has no fingerprint.	09/17/2024, 14:48:48
343	API Error	Employee has no fingerprint.	09/17/2024, 14:49:02
344	API Error	Employee has no fingerprint.	09/17/2024, 14:49:24
345	API Error	Employee has no fingerprint.	09/17/2024, 14:49:41
346	API Error	Employee has no fingerprint.	09/17/2024, 14:49:59
347	API Error	Employee has no fingerprint.	09/17/2024, 14:50:12
348	API Error	Employee has no fingerprint.	09/17/2024, 14:50:56
349	API Error	Employee has no fingerprint.	09/17/2024, 14:51:18
350	API Error	Employee has no fingerprint.	09/17/2024, 14:53:29
351	API Error	Employee has no fingerprint.	09/17/2024, 14:53:53
352	API Error	Employee has no fingerprint.	09/17/2024, 14:59:17
353	API Error	Error Fingerprint not match:	09/18/2024, 08:09:56
354	API Error	Error Fingerprint not match:	09/18/2024, 08:10:19
355	API Error	Employee not found.	09/18/2024, 08:10:32
356	API Error	Error Fingerprint not match:	09/18/2024, 08:10:39
357	API Error	Employee not found.	09/19/2024, 14:44:51
358	API Error	Employee not found.	09/19/2024, 14:44:51
359	API Error	Error Fingerprint not match:	09/19/2024, 15:15:42
360	API Error	Error Fingerprint not match:	09/19/2024, 15:16:19
361	API Error	Error Fingerprint not match:	09/19/2024, 15:16:27
362	API Error	Employee has no fingerprint.	09/19/2024, 15:21:48
363	API Error	Employee has no fingerprint.	09/19/2024, 15:22:07
364	API Error	Employee has no fingerprint.	09/19/2024, 15:22:43
365	API Error	Employee has no fingerprint.	09/19/2024, 15:29:51
366	API Error	Employee has no fingerprint.	09/19/2024, 15:30:17
367	API Error	Employee has no fingerprint.	09/19/2024, 15:31:44
368	API Error	Employee has no fingerprint.	09/19/2024, 15:32:20
369	API Error	Employee has no fingerprint.	09/19/2024, 15:32:39
370	API Error	Employee has no fingerprint.	09/19/2024, 15:34:03
371	API Error	Employee has no fingerprint.	09/19/2024, 15:34:25
372	API Error	Employee has no fingerprint.	09/19/2024, 15:37:13
373	API Error	Employee has no fingerprint.	09/19/2024, 15:37:38
374	API Error	Employee has no fingerprint.	09/19/2024, 15:37:57
375	API Error	Error Fingerprint not match:	09/19/2024, 15:38:51
376	API Error	Error Fingerprint not match:	09/19/2024, 15:38:58
377	API Error	Error Fingerprint not match:	09/19/2024, 15:39:36
378	API Error	Error Fingerprint not match:	09/19/2024, 15:39:43
379	API Error	Employee has no fingerprint.	09/19/2024, 15:47:44
380	API Error	Employee has no fingerprint.	09/19/2024, 15:50:38
381	API Error	Employee has no fingerprint.	09/19/2024, 15:51:00
382	API Error	Employee has no fingerprint.	09/19/2024, 15:51:28
383	API Error	Error Fingerprint not match:	09/19/2024, 15:54:39
384	API Error	Error Fingerprint not match:	09/19/2024, 16:14:26
385	API Error	Employee not found.	09/20/2024, 09:39:52
386	API Error	Error Fingerprint not match:	09/20/2024, 09:40:46
387	API Error	Employee not found.	09/20/2024, 09:41:56
388	API Error	Error Fingerprint not match:	09/20/2024, 09:42:29
389	API Error	Error Fingerprint not match:	09/20/2024, 09:43:02
390	API Error	Error Fingerprint not match:	09/20/2024, 10:01:56
391	API Error	Employee not found.	09/20/2024, 10:12:28
392	API Error	Employee not found.	09/20/2024, 10:12:29
393	API Error	Employee not found.	09/20/2024, 10:49:38
394	API Error	Error Fingerprint not match:	09/20/2024, 12:14:17
395	API Error	Error Fingerprint not match:	09/20/2024, 12:54:42
396	API Error	Error Fingerprint not match:	09/20/2024, 12:56:38
397	API Error	Error Fingerprint not match:	09/20/2024, 13:00:24
398	API Error	Error Fingerprint not match:	09/20/2024, 13:22:19
399	API Error	Error Fingerprint not match:	09/20/2024, 13:43:20
400	API Error	Employee not found.	09/20/2024, 13:49:58
401	API Error	Employee not found.	09/20/2024, 14:17:52
402	API Error	Employee not found.	09/20/2024, 14:18:21
403	API Error	Employee has no fingerprint.	09/20/2024, 14:22:18
404	API Error	Employee has no fingerprint.	09/20/2024, 14:23:07
405	API Error	Employee has no fingerprint.	09/20/2024, 14:23:27
406	API Error	Employee has no fingerprint.	09/20/2024, 14:23:41
407	API Error	Employee has no fingerprint.	09/20/2024, 14:23:47
408	API Error	Error Fingerprint not match:	09/20/2024, 14:24:44
409	API Error	Employee has no fingerprint.	09/20/2024, 14:25:22
410	API Error	Employee has no fingerprint.	09/20/2024, 14:25:40
411	API Error	Employee has no fingerprint.	09/20/2024, 14:28:09
412	API Error	Employee has no fingerprint.	09/20/2024, 14:28:29
413	API Error	Employee has no fingerprint.	09/20/2024, 14:28:49
414	API Error	Employee has no fingerprint.	09/20/2024, 14:29:15
415	API Error	Error Fingerprint not match:	09/20/2024, 14:30:11
416	API Error	Employee has no fingerprint.	09/20/2024, 14:31:25
417	API Error	Employee has no fingerprint.	09/20/2024, 14:31:44
418	API Error	Employee has no fingerprint.	09/20/2024, 14:32:11
419	API Error	Employee has no fingerprint.	09/20/2024, 14:32:40
420	API Error	Employee has no fingerprint.	09/20/2024, 14:33:00
421	API Error	Employee has no fingerprint.	09/20/2024, 14:33:16
422	API Error	Employee has no fingerprint.	09/20/2024, 14:33:36
423	API Error	Employee has no fingerprint.	09/20/2024, 14:33:46
424	API Error	Employee has no fingerprint.	09/20/2024, 14:34:05
425	API Error	Employee has no fingerprint.	09/20/2024, 14:38:14
426	API Error	Employee has no fingerprint.	09/20/2024, 14:38:44
427	API Error	Employee has no fingerprint.	09/20/2024, 14:42:23
428	API Error	Employee has no fingerprint.	09/20/2024, 14:42:44
429	API Error	Error Fingerprint not match:	09/20/2024, 14:44:32
430	API Error	Employee has no fingerprint.	09/20/2024, 14:48:51
431	API Error	Employee has no fingerprint.	09/20/2024, 14:49:16
432	API Error	Employee has no fingerprint.	09/20/2024, 14:49:33
433	API Error	Employee has no fingerprint.	09/20/2024, 14:54:41
434	API Error	Employee has no fingerprint.	09/20/2024, 14:55:03
435	API Error	Employee has no fingerprint.	09/20/2024, 14:58:53
436	API Error	Employee has no fingerprint.	09/20/2024, 14:59:19
437	API Error	Employee has no fingerprint.	09/20/2024, 14:59:41
438	API Error	Employee has no fingerprint.	09/20/2024, 15:00:06
439	API Error	Employee has no fingerprint.	09/20/2024, 15:00:43
440	API Error	Error Fingerprint not match:	09/20/2024, 15:01:54
441	API Error	Error Fingerprint not match:	09/20/2024, 15:02:01
442	API Error	Employee has no fingerprint.	09/20/2024, 15:03:01
443	API Error	Employee has no fingerprint.	09/20/2024, 15:03:15
444	API Error	Employee has no fingerprint.	09/20/2024, 15:03:35
445	API Error	Employee has no fingerprint.	09/20/2024, 15:03:57
446	API Error	Employee has no fingerprint.	09/20/2024, 15:06:40
447	API Error	Employee has no fingerprint.	09/20/2024, 15:06:59
448	API Error	Employee has no fingerprint.	09/20/2024, 15:07:02
449	API Error	Employee has no fingerprint.	09/20/2024, 15:07:28
450	API Error	Error Fingerprint not match:	09/20/2024, 15:08:39
451	API Error	Employee not found.	09/20/2024, 16:23:22
452	API Error	Error Fingerprint not match:	09/23/2024, 09:43:36
453	API Error	Employee not found.	09/23/2024, 09:43:44
454	API Error	Employee not found.	09/23/2024, 09:43:49
455	API Error	Employee has no fingerprint.	09/23/2024, 10:07:52
456	API Error	Employee has no fingerprint.	09/23/2024, 10:08:12
457	API Error	Error Fingerprint not match:	09/23/2024, 10:29:54
458	API Error	Employee has no fingerprint.	09/23/2024, 13:11:14
459	API Error	Employee has no fingerprint.	09/23/2024, 15:04:57
460	API Error	Employee has no fingerprint.	09/23/2024, 15:07:31
461	API Error	Employee has no fingerprint.	09/23/2024, 15:07:31
462	API Error	Error Fingerprint not match:	09/23/2024, 15:19:42
463	API Error	Error Fingerprint not match:	09/23/2024, 16:46:11
464	API Error	Employee not found.	09/23/2024, 16:47:50
465	API Error	Error Fingerprint not match:	09/23/2024, 16:48:13
466	API Error	Employee not found.	09/23/2024, 16:49:14
467	API Error	Error Fingerprint not match:	09/23/2024, 16:49:35
468	API Error	Error Fingerprint not match:	09/24/2024, 10:05:12
469	API Error	Error Fingerprint not match:	09/24/2024, 10:08:52
470	API Error	Error Fingerprint not match:	09/24/2024, 10:37:17
471	API Error	Error Fingerprint not match:	09/24/2024, 10:43:41
472	API Error	Error Fingerprint not match:	09/24/2024, 10:45:51
473	API Error	Error Fingerprint not match:	09/24/2024, 10:50:55
474	API Error	Error Fingerprint not match:	09/24/2024, 10:56:06
475	API Error	Employee not found.	09/24/2024, 13:09:47
476	API Error	Error Fingerprint not match:	09/24/2024, 13:10:24
477	API Error	Employee not found.	09/24/2024, 13:19:08
478	API Error	Employee not found.	09/24/2024, 13:34:43
479	API Error	Error Fingerprint not match:	09/24/2024, 13:35:36
480	API Error	Error Fingerprint not match:	09/24/2024, 13:40:28
481	API Error	Employee not found.	09/24/2024, 13:45:45
482	API Error	Error Fingerprint not match:	09/24/2024, 13:57:07
483	API Error	Error Fingerprint not match:	09/24/2024, 14:27:28
484	API Error	Error Fingerprint not match:	09/24/2024, 14:27:37
485	API Error	Employee has no fingerprint.	09/24/2024, 15:13:04
486	API Error	Employee has no fingerprint.	09/24/2024, 15:13:22
487	API Error	Employee has no fingerprint.	09/24/2024, 15:13:37
488	API Error	Employee has no fingerprint.	09/24/2024, 15:14:40
489	API Error	Employee has no fingerprint.	09/24/2024, 15:14:53
490	API Error	Employee has no fingerprint.	09/24/2024, 15:14:59
491	API Error	Employee has no fingerprint.	09/24/2024, 15:15:28
492	API Error	Employee has no fingerprint.	09/24/2024, 15:15:50
493	API Error	Employee has no fingerprint.	09/24/2024, 15:16:08
494	API Error	Employee has no fingerprint.	09/24/2024, 15:16:27
495	API Error	Employee has no fingerprint.	09/24/2024, 15:16:46
496	API Error	Employee has no fingerprint.	09/24/2024, 15:17:02
497	API Error	Employee has no fingerprint.	09/24/2024, 15:17:23
498	API Error	Employee has no fingerprint.	09/24/2024, 15:17:43
499	API Error	Employee has no fingerprint.	09/24/2024, 15:18:03
500	API Error	Employee has no fingerprint.	09/24/2024, 15:18:22
501	API Error	Employee has no fingerprint.	09/24/2024, 15:19:00
502	API Error	Employee has no fingerprint.	09/24/2024, 15:19:20
503	API Error	Employee has no fingerprint.	09/24/2024, 15:19:44
504	API Error	Employee not found.	09/24/2024, 15:43:27
505	API Error	Error Fingerprint not match:	09/24/2024, 15:45:11
506	API Error	Error Fingerprint not match:	09/24/2024, 16:06:22
507	API Error	Employee not found.	09/25/2024, 10:11:27
508	API Error	Employee not found.	09/25/2024, 10:40:33
509	API Error	Error Fingerprint not match:	09/25/2024, 10:41:18
510	API Error	Error Fingerprint not match:	09/25/2024, 13:56:34
511	API Error	Error Fingerprint not match:	09/26/2024, 10:04:21
512	API Error	Employee has no fingerprint.	09/26/2024, 13:19:36
513	API Error	Employee has no fingerprint.	09/26/2024, 13:19:54
514	API Error	Employee has no fingerprint.	09/26/2024, 13:20:11
515	API Error	Error Fingerprint not match:	09/26/2024, 13:23:22
516	API Error	Error Fingerprint not match:	09/26/2024, 13:23:33
517	API Error	Employee has no fingerprint.	09/26/2024, 13:24:21
518	API Error	Employee has no fingerprint.	09/26/2024, 13:25:06
519	API Error	Error Fingerprint not match:	09/26/2024, 14:10:09
520	API Error	Employee has no fingerprint.	09/26/2024, 17:09:36
521	API Error	Employee has no fingerprint.	09/26/2024, 17:10:00
522	API Error	Error Fingerprint not match:	09/26/2024, 17:23:27
523	API Error	Employee not found.	09/26/2024, 17:23:31
524	API Error	Error Fingerprint not match:	09/26/2024, 17:23:54
525	API Error	Error Fingerprint not match:	09/26/2024, 17:24:28
526	API Error	Employee not found.	09/26/2024, 17:28:20
527	API Error	Error Fingerprint not match:	09/27/2024, 13:40:24
528	API Error	Error Fingerprint not match:	09/27/2024, 13:41:31
529	API Error	Employee has no fingerprint.	09/27/2024, 13:46:17
530	API Error	Employee has no fingerprint.	09/27/2024, 13:46:44
531	API Error	Employee has no fingerprint.	09/27/2024, 13:47:23
532	API Error	Error Fingerprint not match:	09/27/2024, 13:47:27
533	API Error	Employee has no fingerprint.	09/27/2024, 13:47:31
534	API Error	Error Fingerprint not match:	09/27/2024, 13:51:59
535	API Error	Error Fingerprint not match:	09/27/2024, 13:53:28
536	API Error	Error Fingerprint not match:	09/27/2024, 14:01:09
537	API Error	Error Fingerprint not match:	09/27/2024, 14:05:12
538	API Error	Error Fingerprint not match:	09/27/2024, 14:05:19
539	API Error	Employee not found.	09/27/2024, 14:05:32
540	API Error	Employee not found.	09/27/2024, 14:07:41
541	API Error	Employee not found.	09/27/2024, 14:20:28
542	API Error	Employee not found.	09/27/2024, 14:22:15
543	API Error	Error Fingerprint not match:	09/27/2024, 14:22:37
544	API Error	Error Fingerprint not match:	09/30/2024, 09:03:42
545	API Error	Error Fingerprint not match:	09/30/2024, 09:09:02
546	API Error	Employee has no fingerprint.	09/30/2024, 09:11:11
547	API Error	Employee has no fingerprint.	09/30/2024, 09:11:33
548	API Error	Employee has no fingerprint.	09/30/2024, 09:11:55
549	API Error	Employee has no fingerprint.	09/30/2024, 09:13:15
550	API Error	Employee has no fingerprint.	09/30/2024, 09:15:43
551	API Error	Employee has no fingerprint.	09/30/2024, 09:16:05
552	API Error	Employee has no fingerprint.	09/30/2024, 09:16:47
553	API Error	Employee has no fingerprint.	09/30/2024, 09:16:53
554	API Error	Employee has no fingerprint.	09/30/2024, 09:17:32
555	API Error	Employee has no fingerprint.	09/30/2024, 09:19:17
556	API Error	Employee has no fingerprint.	09/30/2024, 09:23:09
557	API Error	Employee has no fingerprint.	09/30/2024, 09:23:30
558	API Error	Employee has no fingerprint.	09/30/2024, 09:23:53
559	API Error	Employee has no fingerprint.	09/30/2024, 09:24:05
560	API Error	Employee has no fingerprint.	09/30/2024, 09:24:53
561	API Error	Employee has no fingerprint.	09/30/2024, 09:26:31
562	API Error	Employee has no fingerprint.	09/30/2024, 09:26:48
563	API Error	Employee has no fingerprint.	09/30/2024, 09:27:32
564	API Error	Employee has no fingerprint.	09/30/2024, 09:28:29
565	API Error	Employee has no fingerprint.	09/30/2024, 09:29:03
566	API Error	Error Fingerprint not match:	09/30/2024, 09:40:32
567	API Error	Error Fingerprint not match:	09/30/2024, 09:40:59
568	API Error	Error Fingerprint not match:	09/30/2024, 10:03:45
569	API Error	Error Fingerprint not match:	09/30/2024, 10:03:55
570	API Error	Error Fingerprint not match:	09/30/2024, 10:04:10
571	API Error	Error Fingerprint not match:	09/30/2024, 10:04:30
572	API Error	Error Fingerprint not match:	09/30/2024, 10:04:50
573	API Error	Error Fingerprint not match:	09/30/2024, 10:57:25
574	API Error	Error Fingerprint not match:	09/30/2024, 11:11:33
575	API Error	Error Fingerprint not match:	09/30/2024, 11:11:51
576	API Error	Error Fingerprint not match:	09/30/2024, 12:17:40
577	API Error	Error Fingerprint not match:	09/30/2024, 12:17:45
578	API Error	Employee not found.	09/30/2024, 12:17:53
579	API Error	Employee not found.	09/30/2024, 13:25:51
580	API Error	Error Fingerprint not match:	09/30/2024, 14:03:46
581	API Error	Error Fingerprint not match:	09/30/2024, 14:03:55
582	API Error	Employee not found.	09/30/2024, 14:14:29
583	API Error	Employee not found.	09/30/2024, 15:06:04
584	API Error	Error Fingerprint not match:	09/30/2024, 15:06:41
585	API Error	Employee has no fingerprint.	09/30/2024, 15:07:49
586	API Error	Employee has no fingerprint.	09/30/2024, 15:08:29
587	API Error	Error Fingerprint not match:	09/30/2024, 15:27:08
588	API Error	Error Fingerprint not match:	09/30/2024, 15:32:03
589	API Error	Error Fingerprint not match:	09/30/2024, 15:43:44
590	API Error	Error Fingerprint not match:	09/30/2024, 15:43:49
591	API Error	Error Fingerprint not match:	09/30/2024, 15:44:24
592	API Error	Employee not found.	09/30/2024, 15:46:47
593	API Error	Error Fingerprint not match:	09/30/2024, 15:47:36
594	API Error	Employee not found.	09/30/2024, 15:48:36
595	API Error	Error Fingerprint not match:	09/30/2024, 15:51:38
596	API Error	Employee not found.	09/30/2024, 16:28:29
597	API Error	Employee not found.	09/30/2024, 16:31:46
598	API Error	Employee not found.	09/30/2024, 16:33:08
599	API Error	Error Fingerprint not match:	09/30/2024, 16:37:00
600	API Error	Employee not found.	09/30/2024, 16:37:03
601	API Error	Employee not found.	09/30/2024, 16:41:50
602	API Error	Employee not found.	09/30/2024, 16:45:00
603	API Error	Employee not found.	09/30/2024, 16:45:37
604	API Error	Employee not found.	09/30/2024, 16:48:30
605	API Error	Employee not found.	09/30/2024, 16:48:30
606	API Error	Employee not found.	09/30/2024, 16:48:36
607	API Error	Employee not found.	09/30/2024, 16:48:42
608	API Error	Employee not found.	09/30/2024, 16:48:46
609	API Error	Employee not found.	09/30/2024, 16:49:37
610	API Error	Employee not found.	09/30/2024, 16:49:55
611	API Error	Employee not found.	09/30/2024, 16:50:00
612	API Error	Employee not found.	09/30/2024, 16:50:05
613	API Error	Employee not found.	09/30/2024, 16:50:16
614	API Error	Employee not found.	09/30/2024, 16:51:24
615	API Error	Employee not found.	09/30/2024, 16:51:32
616	API Error	Employee not found.	09/30/2024, 16:51:37
617	API Error	Employee not found.	09/30/2024, 16:52:03
618	API Error	Employee not found.	09/30/2024, 16:52:52
619	API Error	Employee not found.	09/30/2024, 16:53:03
620	API Error	Employee not found.	09/30/2024, 16:53:15
621	API Error	Employee not found.	09/30/2024, 16:53:22
622	API Error	Employee not found.	09/30/2024, 16:59:35
623	API Error	Employee not found.	09/30/2024, 21:50:13
624	API Error	Employee not found.	09/30/2024, 21:59:09
625	API Error	Employee not found.	09/30/2024, 21:59:09
626	API Error	Employee not found.	09/30/2024, 22:57:52
627	API Error	Error Fingerprint not match:	10/01/2024, 07:50:25
628	API Error	Error Fingerprint not match:	10/01/2024, 08:00:29
629	API Error	Error Fingerprint not match:	10/01/2024, 08:05:59
630	API Error	Error Fingerprint not match:	10/01/2024, 08:06:19
631	API Error	Error Fingerprint not match:	10/01/2024, 08:06:27
632	API Error	Error Fingerprint not match:	10/01/2024, 08:09:01
633	API Error	Error Fingerprint not match:	10/01/2024, 08:09:23
641	API Error	Employee not found.	10/01/2024, 08:28:51
634	API Error	Error Fingerprint not match:	10/01/2024, 08:09:51
635	API Error	Error Fingerprint not match:	10/01/2024, 08:09:56
636	API Error	Error Fingerprint not match:	10/01/2024, 08:10:15
637	API Error	Employee not found.	10/01/2024, 08:10:17
638	API Error	Employee has no fingerprint.	10/01/2024, 08:14:35
639	API Error	Employee has no fingerprint.	10/01/2024, 08:19:56
640	API Error	Employee not found.	10/01/2024, 08:22:28
642	API Error	Employee not found.	10/01/2024, 08:29:59
643	API Error	Error Fingerprint not match:	10/01/2024, 08:40:43
644	API Error	Employee not found.	10/01/2024, 08:40:47
645	API Error	Error Fingerprint not match:	10/01/2024, 08:44:11
646	API Error	Employee has no fingerprint.	10/01/2024, 09:01:56
647	API Error	Employee has no fingerprint.	10/01/2024, 09:02:13
648	API Error	Employee not found.	10/01/2024, 09:03:47
649	API Error	Employee not found.	10/01/2024, 09:03:54
650	API Error	Employee not found.	10/01/2024, 09:04:00
651	API Error	Employee has no fingerprint.	10/01/2024, 09:04:56
652	API Error	Employee has no fingerprint.	10/01/2024, 09:05:15
653	API Error	Employee has no fingerprint.	10/01/2024, 09:05:23
654	API Error	Employee has no fingerprint.	10/01/2024, 09:05:29
655	API Error	Error Fingerprint not match:	10/01/2024, 09:06:37
656	API Error	Employee has no fingerprint.	10/01/2024, 09:20:14
657	API Error	Employee has no fingerprint.	10/01/2024, 09:20:23
658	API Error	Error Fingerprint not match:	10/01/2024, 09:20:38
659	API Error	Error Fingerprint not match:	10/01/2024, 09:20:45
660	API Error	Error Fingerprint not match:	10/01/2024, 09:20:52
661	API Error	Employee has no fingerprint.	10/01/2024, 09:21:17
662	API Error	Employee has no fingerprint.	10/01/2024, 09:25:03
663	API Error	Employee has no fingerprint.	10/01/2024, 09:25:16
664	API Error	Error Fingerprint not match:	10/01/2024, 09:28:57
665	API Error	Error Fingerprint not match:	10/01/2024, 09:34:16
666	API Error	Error Fingerprint not match:	10/01/2024, 09:36:39
667	API Error	Error Fingerprint not match:	10/01/2024, 09:37:06
668	API Error	Employee not found.	10/01/2024, 09:37:47
669	API Error	Error Fingerprint not match:	10/01/2024, 09:43:22
670	API Error	Error Fingerprint not match:	10/01/2024, 09:43:39
671	API Error	Error Fingerprint not match:	10/01/2024, 09:43:48
672	API Error	Error Fingerprint not match:	10/01/2024, 09:44:33
673	API Error	Error Fingerprint not match:	10/01/2024, 09:45:05
674	API Error	Employee not found.	10/01/2024, 09:46:15
675	API Error	Employee not found.	10/01/2024, 09:46:22
676	API Error	Employee has no fingerprint.	10/01/2024, 09:46:50
677	API Error	An error occurred.	10/01/2024, 09:49:47
678	API Error	An error occurred.	10/01/2024, 09:50:20
679	API Error	An error occurred.	10/01/2024, 09:50:24
680	API Error	Employee has no fingerprint.	10/01/2024, 09:50:47
681	API Error	Employee not found.	10/01/2024, 09:51:33
682	API Error	Employee not found.	10/01/2024, 09:51:38
683	API Error	Employee has no fingerprint.	10/01/2024, 09:52:17
684	API Error	Employee has no fingerprint.	10/01/2024, 09:52:47
685	API Error	Employee not found.	10/01/2024, 09:54:11
686	API Error	Employee has no fingerprint.	10/01/2024, 09:54:33
687	API Error	Employee not found.	10/01/2024, 09:54:39
688	API Error	Employee has no fingerprint.	10/01/2024, 10:06:55
689	API Error	Error Fingerprint not match:	10/01/2024, 10:16:45
690	API Error	Error Fingerprint not match:	10/01/2024, 10:18:07
691	API Error	Error Fingerprint not match:	10/01/2024, 10:20:18
692	API Error	Error Fingerprint not match:	10/01/2024, 10:25:37
693	API Error	Error Fingerprint not match:	10/01/2024, 10:36:42
694	API Error	Error Fingerprint not match:	10/01/2024, 10:39:44
695	API Error	Error Fingerprint not match:	10/01/2024, 10:39:50
696	API Error	Error Fingerprint not match:	10/01/2024, 10:41:40
697	API Error	An error occurred.	10/01/2024, 10:44:41
698	API Error	An error occurred.	10/01/2024, 10:44:49
699	API Error	Error Fingerprint not match:	10/01/2024, 10:45:47
700	API Error	Error Fingerprint not match:	10/01/2024, 10:48:51
701	API Error	Employee not found.	10/01/2024, 10:49:00
702	API Error	Error Fingerprint not match:	10/01/2024, 10:49:46
703	API Error	Error Fingerprint not match:	10/01/2024, 10:54:08
704	API Error	Error Fingerprint not match:	10/01/2024, 10:54:09
705	API Error	Employee has no fingerprint.	10/01/2024, 10:56:40
706	API Error	Employee not found.	10/01/2024, 11:49:23
707	API Error	Employee not found.	10/01/2024, 11:49:23
708	API Error	Employee not found.	10/01/2024, 11:49:23
709	API Error	Error Fingerprint not match:	10/01/2024, 11:49:23
710	API Error	Error Fingerprint not match:	10/01/2024, 12:11:39
711	API Error	Employee not found.	10/01/2024, 12:18:49
712	API Error	Employee not found.	10/01/2024, 12:18:49
713	API Error	Error Fingerprint not match:	10/01/2024, 12:57:52
714	API Error	Employee not found.	10/01/2024, 13:34:37
715	API Error	Employee not found.	10/01/2024, 13:35:15
716	API Error	Employee not found.	10/01/2024, 13:51:59
717	API Error	Employee not found.	10/01/2024, 13:53:23
718	API Error	Error Fingerprint not match:	10/01/2024, 14:42:17
719	API Error	Employee not found.	10/02/2024, 08:08:25
720	API Error	Error Fingerprint not match:	10/02/2024, 08:24:07
721	API Error	Error Fingerprint not match:	10/02/2024, 09:40:31
722	API Error	Error Fingerprint not match:	10/02/2024, 10:05:40
724	API Error	Error Fingerprint not match:	10/02/2024, 12:37:21
723	API Error	Error Fingerprint not match:	10/02/2024, 12:37:19
725	API Error	Error Fingerprint not match:	10/02/2024, 12:37:21
726	API Error	Employee not found.	10/02/2024, 13:08:41
727	API Error	Employee not found.	10/02/2024, 13:08:55
728	API Error	Employee not found.	10/02/2024, 13:09:20
729	API Error	Employee not found.	10/02/2024, 13:13:26
730	API Error	Error Fingerprint not match:	10/02/2024, 13:14:27
731	API Error	Error Fingerprint not match:	10/02/2024, 14:27:41
732	API Error	Error Fingerprint not match:	10/03/2024, 06:46:24
733	API Error	Error Fingerprint not match:	10/03/2024, 07:09:28
734	API Error	Employee not found.	10/03/2024, 07:09:32
735	API Error	Employee not found.	10/03/2024, 07:09:32
736	API Error	Error Fingerprint not match:	10/03/2024, 07:09:53
737	API Error	Employee not found.	10/03/2024, 10:29:13
738	API Error	Error Fingerprint not match:	10/03/2024, 15:52:27
739	API Error	Error Fingerprint not match:	10/03/2024, 15:55:23
740	API Error	Employee has no fingerprint.	10/04/2024, 09:16:30
741	API Error	Employee has no fingerprint.	10/04/2024, 09:21:19
742	API Error	Employee has no fingerprint.	10/04/2024, 09:23:43
743	API Error	Employee has no fingerprint.	10/04/2024, 09:24:08
744	API Error	Employee has no fingerprint.	10/04/2024, 09:24:28
745	API Error	Employee has no fingerprint.	10/04/2024, 09:24:33
746	API Error	Employee has no fingerprint.	10/04/2024, 09:25:00
747	API Error	Employee has no fingerprint.	10/04/2024, 09:25:27
748	API Error	Employee has no fingerprint.	10/04/2024, 09:25:53
749	API Error	Employee has no fingerprint.	10/04/2024, 09:26:22
750	API Error	Employee has no fingerprint.	10/04/2024, 09:26:55
751	API Error	Employee has no fingerprint.	10/04/2024, 09:27:56
752	API Error	Employee has no fingerprint.	10/04/2024, 09:30:36
753	API Error	Employee has no fingerprint.	10/04/2024, 09:32:06
754	API Error	Employee has no fingerprint.	10/04/2024, 09:34:24
755	API Error	Employee has no fingerprint.	10/04/2024, 09:35:23
756	API Error	Employee has no fingerprint.	10/04/2024, 09:36:32
757	API Error	Employee has no fingerprint.	10/04/2024, 09:37:12
758	API Error	Employee has no fingerprint.	10/04/2024, 09:37:33
759	API Error	Employee has no fingerprint.	10/04/2024, 09:39:42
760	API Error	Employee has no fingerprint.	10/04/2024, 09:40:08
761	API Error	Employee has no fingerprint.	10/04/2024, 09:40:12
762	API Error	Employee has no fingerprint.	10/04/2024, 09:40:31
763	API Error	Error Fingerprint not match:	10/04/2024, 09:44:14
764	API Error	Employee has no fingerprint.	10/04/2024, 09:46:25
765	API Error	Employee has no fingerprint.	10/04/2024, 09:46:53
766	API Error	Employee has no fingerprint.	10/04/2024, 09:47:18
767	API Error	Error Fingerprint not match:	10/04/2024, 09:47:49
768	API Error	Error Fingerprint not match:	10/04/2024, 09:47:57
769	API Error	Error Fingerprint not match:	10/04/2024, 09:48:08
770	API Error	Error Fingerprint not match:	10/04/2024, 09:48:17
771	API Error	Error Fingerprint not match:	10/04/2024, 09:51:03
772	API Error	Error Fingerprint not match:	10/04/2024, 09:53:16
773	API Error	Error Fingerprint not match:	10/04/2024, 09:53:25
774	API Error	Employee has no fingerprint.	10/04/2024, 09:54:37
775	API Error	Employee has no fingerprint.	10/04/2024, 09:55:51
776	API Error	Employee has no fingerprint.	10/04/2024, 09:56:23
777	API Error	Employee has no fingerprint.	10/04/2024, 09:57:23
778	API Error	Employee has no fingerprint.	10/04/2024, 09:57:46
779	API Error	Employee has no fingerprint.	10/04/2024, 09:58:06
780	API Error	Error Fingerprint not match:	10/04/2024, 09:58:45
781	API Error	Error Fingerprint not match:	10/04/2024, 09:58:54
782	API Error	Error Fingerprint not match:	10/04/2024, 09:59:18
783	API Error	Error Fingerprint not match:	10/04/2024, 09:59:24
784	API Error	Error Fingerprint not match:	10/04/2024, 10:00:10
785	API Error	Error Fingerprint not match:	10/04/2024, 10:01:50
786	API Error	Error Fingerprint not match:	10/04/2024, 10:02:02
787	API Error	Employee not found.	10/04/2024, 10:10:06
788	API Error	Employee not found.	10/04/2024, 10:10:45
789	API Error	Employee not found.	10/04/2024, 11:20:42
790	API Error	Employee not found.	10/04/2024, 11:20:47
791	API Error	Employee not found.	10/04/2024, 11:20:53
792	API Error	Error Fingerprint not match:	10/08/2024, 16:48:11
793	API Error	Error Fingerprint not match:	10/08/2024, 16:49:00
794	API Error	Error Fingerprint not match:	10/08/2024, 16:49:10
795	API Error	Error Fingerprint not match:	10/08/2024, 16:49:19
796	API Error	Error Fingerprint not match:	10/08/2024, 16:51:49
797	API Error	Employee not found.	10/08/2024, 16:51:53
798	API Error	Employee not found.	10/08/2024, 16:51:53
799	API Error	Employee not found.	10/09/2024, 09:42:29
800	API Error	Employee not found.	10/09/2024, 09:53:23
801	API Error	Employee not found.	10/09/2024, 09:53:35
802	API Error	Employee not found.	10/09/2024, 09:54:26
803	API Error	Error Fingerprint not match:	10/09/2024, 10:22:23
804	API Error	Error Fingerprint not match:	10/09/2024, 10:44:56
805	API Error	Error Fingerprint not match:	10/09/2024, 10:45:15
806	API Error	Error Fingerprint not match:	10/09/2024, 10:45:37
807	API Error	Error Fingerprint not match:	10/09/2024, 10:47:53
808	API Error	Error Fingerprint not match:	10/09/2024, 10:48:05
809	API Error	Error Fingerprint not match:	10/09/2024, 10:53:39
810	API Error	Error Fingerprint not match:	10/09/2024, 10:53:48
811	API Error	Error Fingerprint not match:	10/09/2024, 10:54:30
812	API Error	Error Fingerprint not match:	10/09/2024, 10:54:49
813	API Error	Error Fingerprint not match:	10/09/2024, 10:55:03
814	API Error	Error Fingerprint not match:	10/09/2024, 10:55:35
815	API Error	Error Fingerprint not match:	10/09/2024, 10:56:50
816	API Error	Error Fingerprint not match:	10/09/2024, 10:58:53
817	API Error	Error Fingerprint not match:	10/09/2024, 11:45:06
818	API Error	Error Fingerprint not match:	10/09/2024, 14:17:44
819	API Error	Error Fingerprint not match:	10/09/2024, 14:55:09
820	API Error	Error Fingerprint not match:	10/09/2024, 14:55:09
821	API Error	Error Fingerprint not match:	10/09/2024, 14:55:17
822	API Error	Error Fingerprint not match:	10/09/2024, 15:31:34
823	API Error	Employee not found.	10/09/2024, 16:09:31
824	API Error	Employee not found.	10/09/2024, 16:09:31
825	API Error	Error Fingerprint not match:	10/09/2024, 16:09:38
826	API Error	Error Fingerprint not match:	10/09/2024, 16:09:39
827	API Error	Error Fingerprint not match:	10/09/2024, 16:09:42
828	API Error	Error Fingerprint not match:	10/09/2024, 16:09:54
829	API Error	Error Fingerprint not match:	10/09/2024, 16:10:33
830	API Error	Error Fingerprint not match:	10/09/2024, 16:10:44
831	API Error	Error Fingerprint not match:	10/10/2024, 07:42:34
832	API Error	Error Fingerprint not match:	10/10/2024, 07:42:44
833	API Error	Error Fingerprint not match:	10/10/2024, 07:56:43
834	API Error	Employee not found.	10/10/2024, 08:15:04
835	API Error	Error Fingerprint not match:	10/10/2024, 08:32:57
836	API Error	Error Fingerprint not match:	10/10/2024, 08:57:29
837	API Error	Error Fingerprint not match:	10/10/2024, 09:05:32
838	API Error	Error Fingerprint not match:	10/10/2024, 09:05:43
839	API Error	Error Fingerprint not match:	10/10/2024, 09:15:12
840	API Error	Error Fingerprint not match:	10/10/2024, 09:15:42
841	API Error	Employee not found.	10/10/2024, 09:15:51
842	API Error	Error Fingerprint not match:	10/10/2024, 09:16:01
843	API Error	Employee not found.	10/10/2024, 09:16:09
844	API Error	Error Fingerprint not match:	10/10/2024, 09:16:36
845	API Error	Employee not found.	10/10/2024, 09:16:42
846	API Error	Error Fingerprint not match:	10/10/2024, 09:16:57
847	API Error	Employee not found.	10/10/2024, 09:17:21
848	API Error	Error Fingerprint not match:	10/10/2024, 09:17:40
849	API Error	Employee not found.	10/10/2024, 09:17:46
850	API Error	Error Fingerprint not match:	10/10/2024, 09:18:13
851	API Error	Employee not found.	10/10/2024, 09:18:19
852	API Error	Error Fingerprint not match:	10/10/2024, 09:18:50
853	API Error	Error Fingerprint not match:	10/10/2024, 09:18:50
854	API Error	Employee not found.	10/10/2024, 09:18:55
855	API Error	Error Fingerprint not match:	10/10/2024, 09:19:07
856	API Error	Employee not found.	10/10/2024, 09:19:09
857	API Error	Error Fingerprint not match:	10/10/2024, 09:20:18
858	API Error	Error Fingerprint not match:	10/10/2024, 09:21:37
859	API Error	Error Fingerprint not match:	10/10/2024, 09:22:52
860	API Error	Error Fingerprint not match:	10/10/2024, 09:23:21
861	API Error	Employee not found.	10/10/2024, 09:23:28
862	API Error	Employee not found.	10/10/2024, 09:36:51
863	API Error	Error Fingerprint not match:	10/10/2024, 09:37:30
864	API Error	Error Fingerprint not match:	10/10/2024, 09:38:16
865	API Error	Employee not found.	10/10/2024, 09:44:52
866	API Error	Error Fingerprint not match:	10/10/2024, 09:59:18
867	API Error	Employee not found.	10/10/2024, 09:59:22
868	API Error	Error Fingerprint not match:	10/10/2024, 10:03:55
869	API Error	Error Fingerprint not match:	10/10/2024, 10:19:25
870	API Error	Error Fingerprint not match:	10/10/2024, 10:24:32
871	API Error	Error Fingerprint not match:	10/10/2024, 11:03:39
872	API Error	Error Fingerprint not match:	10/10/2024, 11:03:39
873	API Error	Error Fingerprint not match:	10/10/2024, 11:03:39
874	API Error	Employee not found.	10/10/2024, 11:07:45
875	API Error	Error Fingerprint not match:	10/10/2024, 11:20:54
876	API Error	Error Fingerprint not match:	10/10/2024, 11:32:22
877	API Error	Error Fingerprint not match:	10/10/2024, 11:35:59
878	API Error	Error Fingerprint not match:	10/10/2024, 11:36:19
879	API Error	Error Fingerprint not match:	10/10/2024, 11:36:54
880	API Error	Error Fingerprint not match:	10/10/2024, 11:37:02
881	API Error	Error Fingerprint not match:	10/10/2024, 11:37:16
882	API Error	Error Fingerprint not match:	10/10/2024, 11:37:46
883	API Error	Error Fingerprint not match:	10/10/2024, 12:09:36
884	API Error	Error Fingerprint not match:	10/10/2024, 12:19:33
885	API Error	Error Fingerprint not match:	10/10/2024, 12:19:45
886	API Error	Error Fingerprint not match:	10/10/2024, 12:19:55
887	API Error	Error Fingerprint not match:	10/10/2024, 12:20:06
888	API Error	Error Fingerprint not match:	10/10/2024, 12:25:36
889	API Error	Error Fingerprint not match:	10/10/2024, 12:26:07
890	API Error	Error Fingerprint not match:	10/10/2024, 12:29:33
891	API Error	Error Fingerprint not match:	10/10/2024, 12:29:52
892	API Error	Error Fingerprint not match:	10/10/2024, 13:44:48
893	API Error	Error Fingerprint not match:	10/10/2024, 14:31:35
894	API Error	Error Fingerprint not match:	10/10/2024, 14:31:55
895	API Error	Error Fingerprint not match:	10/10/2024, 14:53:35
896	API Error	Error Fingerprint not match:	10/11/2024, 09:15:30
897	API Error	Error Fingerprint not match:	10/11/2024, 12:42:14
898	API Error	Error Fingerprint not match:	10/11/2024, 15:27:52
899	API Error	Employee not found.	10/14/2024, 10:13:57
900	API Error	Error Fingerprint not match:	10/15/2024, 08:16:52
901	API Error	Error Fingerprint not match:	10/15/2024, 09:05:19
902	API Error	Employee not found.	10/15/2024, 09:10:39
903	API Error	Error Fingerprint not match:	10/15/2024, 09:14:48
904	API Error	Error Fingerprint not match:	10/15/2024, 09:14:57
905	API Error	Error Fingerprint not match:	10/15/2024, 09:32:14
906	API Error	Error Fingerprint not match:	10/15/2024, 09:32:22
907	API Error	Error Fingerprint not match:	10/15/2024, 09:40:56
908	API Error	Error Fingerprint not match:	10/15/2024, 09:41:03
909	API Error	Error Fingerprint not match:	10/15/2024, 09:41:15
910	API Error	Employee not found.	10/15/2024, 09:59:48
911	API Error	Employee not found.	10/15/2024, 10:20:42
912	API Error	Error Fingerprint not match:	10/15/2024, 11:12:46
913	API Error	Error Fingerprint not match:	10/15/2024, 11:12:55
914	API Error	Error Fingerprint not match:	10/15/2024, 11:16:00
915	API Error	Error Fingerprint not match:	10/15/2024, 11:16:08
916	API Error	Error Fingerprint not match:	10/15/2024, 13:33:15
917	API Error	Error Fingerprint not match:	10/15/2024, 13:39:40
918	API Error	Error Fingerprint not match:	10/16/2024, 09:16:05
919	API Error	Error Fingerprint not match:	10/16/2024, 09:16:17
920	API Error	Error Fingerprint not match:	10/16/2024, 17:01:22
921	API Error	Error Fingerprint not match:	10/17/2024, 09:06:58
922	API Error	Error Fingerprint not match:	10/17/2024, 09:24:48
923	API Error	Employee not found.	10/17/2024, 09:43:42
924	API Error	Error Fingerprint not match:	10/17/2024, 10:28:09
925	API Error	Error Fingerprint not match:	10/17/2024, 11:02:47
926	API Error	Error Fingerprint not match:	10/18/2024, 09:12:21
927	API Error	Error Fingerprint not match:	10/18/2024, 10:59:40
928	API Error	Error Fingerprint not match:	10/18/2024, 11:23:21
929	API Error	Error Fingerprint not match:	10/18/2024, 11:41:05
930	API Error	Employee not found.	10/18/2024, 12:35:10
931	API Error	Error Fingerprint not match:	10/18/2024, 12:56:04
932	API Error	Error Fingerprint not match:	10/18/2024, 12:59:34
933	API Error	Employee not found.	10/18/2024, 13:05:05
934	API Error	Error Fingerprint not match:	10/18/2024, 13:11:12
935	API Error	Error Fingerprint not match:	10/18/2024, 13:25:11
936	API Error	Employee not found.	10/18/2024, 13:30:29
937	API Error	Employee not found.	10/18/2024, 13:30:50
938	API Error	Error Fingerprint not match:	10/18/2024, 13:57:39
939	API Error	Error Fingerprint not match:	10/18/2024, 13:57:51
940	API Error	Error Fingerprint not match:	10/18/2024, 13:58:26
941	API Error	Error Fingerprint not match:	10/18/2024, 13:58:37
942	API Error	Error Fingerprint not match:	10/18/2024, 14:06:23
943	API Error	Error Fingerprint not match:	10/18/2024, 14:14:35
944	API Error	Error Fingerprint not match:	10/18/2024, 14:27:00
945	API Error	Error Fingerprint not match:	10/18/2024, 14:27:09
946	API Error	Error Fingerprint not match:	10/18/2024, 14:27:39
947	API Error	Error Fingerprint not match:	10/18/2024, 15:19:55
948	API Error	Error Fingerprint not match:	10/18/2024, 15:32:18
949	API Error	Error Fingerprint not match:	10/18/2024, 15:32:49
950	API Error	Error Fingerprint not match:	10/18/2024, 15:33:05
951	API Error	Error Fingerprint not match:	10/18/2024, 15:33:36
952	API Error	Error Fingerprint not match:	10/18/2024, 15:50:00
953	API Error	Error Fingerprint not match:	10/18/2024, 15:50:09
954	API Error	Error Fingerprint not match:	10/18/2024, 16:43:42
955	API Error	Error Fingerprint not match:	10/18/2024, 16:44:40
956	API Error	Error Fingerprint not match:	10/18/2024, 16:45:21
957	API Error	Error Fingerprint not match:	10/18/2024, 16:51:02
958	API Error	Error Fingerprint not match:	10/18/2024, 16:51:14
959	API Error	Error Fingerprint not match:	10/18/2024, 16:51:41
960	API Error	Error Fingerprint not match:	10/18/2024, 16:53:25
961	API Error	Error Fingerprint not match:	10/18/2024, 16:54:16
962	API Error	Error Fingerprint not match:	10/22/2024, 14:27:53
963	API Error	Error Fingerprint not match:	10/22/2024, 14:45:00
964	API Error	Error Fingerprint not match:	10/22/2024, 14:45:56
965	API Error	Error Fingerprint not match:	10/22/2024, 14:49:35
966	API Error	Error Fingerprint not match:	10/22/2024, 14:49:46
967	API Error	Error Fingerprint not match:	10/22/2024, 14:49:52
968	API Error	Error Fingerprint not match:	10/22/2024, 15:24:26
969	API Error	Error Fingerprint not match:	10/22/2024, 15:24:43
970	API Error	Error Fingerprint not match:	10/22/2024, 15:25:28
971	API Error	Error Fingerprint not match:	10/22/2024, 15:25:36
972	API Error	Error Fingerprint not match:	10/22/2024, 15:58:06
973	API Error	Error Fingerprint not match:	10/22/2024, 15:58:50
974	API Error	Error Fingerprint not match:	10/22/2024, 15:59:00
975	API Error	Error Fingerprint not match:	10/22/2024, 15:59:10
976	API Error	Error Fingerprint not match:	10/24/2024, 14:16:59
977	API Error	Error Fingerprint not match:	10/24/2024, 14:18:34
978	API Error	Error Fingerprint not match:	10/24/2024, 15:29:37
979	API Error	Error Fingerprint not match:	10/24/2024, 15:29:47
980	API Error	Error Fingerprint not match:	10/24/2024, 15:29:54
981	API Error	Error Fingerprint not match:	10/24/2024, 15:56:56
982	API Error	Error Fingerprint not match:	10/24/2024, 16:39:54
983	API Error	Employee not found.	10/24/2024, 16:45:15
984	API Error	Employee not found.	10/24/2024, 16:45:23
985	API Error	Employee not found.	10/24/2024, 16:46:03
986	API Error	Employee not found.	10/24/2024, 16:46:06
987	API Error	Employee not found.	10/24/2024, 16:46:13
988	API Error	Employee not found.	10/24/2024, 16:46:18
989	API Error	Employee not found.	10/24/2024, 16:46:24
990	API Error	Employee has no fingerprint.	10/24/2024, 16:54:13
991	API Error	Error Fingerprint not match:	10/29/2024, 14:02:28
992	API Error	Employee not found.	10/29/2024, 14:08:57
993	API Error	Employee has no fingerprint.	10/29/2024, 14:11:45
994	API Error	Error Fingerprint not match:	10/29/2024, 14:12:09
995	API Error	Employee has no fingerprint.	10/29/2024, 14:14:33
996	API Error	Employee has no fingerprint.	10/29/2024, 14:16:06
997	API Error	Error Fingerprint not match:	10/29/2024, 14:23:29
998	API Error	Error Fingerprint not match:	10/29/2024, 14:23:51
999	API Error	Employee has no fingerprint.	10/29/2024, 14:24:56
1000	API Error	Employee has no fingerprint.	10/29/2024, 14:25:31
1001	API Error	Employee has no fingerprint.	10/29/2024, 14:26:02
1002	API Error	Employee has no fingerprint.	10/29/2024, 14:28:03
1003	API Error	Error Fingerprint not match:	10/29/2024, 14:30:34
1004	API Error	Employee has no fingerprint.	10/29/2024, 14:31:24
1005	API Error	Employee has no fingerprint.	10/29/2024, 14:31:54
1006	API Error	Employee has no fingerprint.	10/29/2024, 14:32:12
1007	API Error	Employee has no fingerprint.	10/29/2024, 14:32:35
1008	API Error	Employee has no fingerprint.	10/29/2024, 14:32:59
1009	API Error	Employee has no fingerprint.	10/29/2024, 14:33:38
1010	API Error	Employee has no fingerprint.	10/29/2024, 14:34:04
1011	API Error	Error Fingerprint not match:	10/29/2024, 14:45:24
1012	API Error	Error Fingerprint not match:	10/29/2024, 14:48:26
1013	API Error	Error Fingerprint not match:	10/29/2024, 14:55:49
1014	API Error	Error Fingerprint not match:	10/29/2024, 14:56:27
1015	API Error	Error Fingerprint not match:	10/29/2024, 14:56:38
1016	API Error	Error Fingerprint not match:	10/29/2024, 14:56:51
1017	API Error	Error Fingerprint not match:	10/29/2024, 14:57:04
1018	API Error	Error Fingerprint not match:	10/29/2024, 14:58:00
1019	API Error	Error Fingerprint not match:	10/29/2024, 14:58:16
1020	API Error	Error Fingerprint not match:	10/29/2024, 14:58:47
1021	API Error	Error Fingerprint not match:	10/29/2024, 15:00:40
1022	API Error	Error Fingerprint not match:	10/29/2024, 15:00:50
1023	API Error	Error Fingerprint not match:	10/29/2024, 15:01:00
1024	API Error	Error Fingerprint not match:	10/29/2024, 15:01:09
1025	API Error	Error Fingerprint not match:	10/29/2024, 15:01:39
1026	API Error	Error Fingerprint not match:	10/29/2024, 15:03:50
1027	API Error	Error Fingerprint not match:	10/29/2024, 15:08:05
1028	API Error	Error Fingerprint not match:	10/29/2024, 15:12:36
1029	API Error	Error Fingerprint not match:	10/29/2024, 15:20:26
1030	API Error	Error Fingerprint not match:	10/29/2024, 15:20:34
1031	API Error	Error Fingerprint not match:	10/29/2024, 15:20:41
1032	API Error	Error Fingerprint not match:	10/29/2024, 15:21:55
1033	API Error	Error Fingerprint not match:	10/29/2024, 15:24:23
1034	API Error	Error Fingerprint not match:	10/29/2024, 15:24:31
1035	API Error	Error Fingerprint not match:	10/29/2024, 15:27:24
1036	API Error	Error Fingerprint not match:	10/29/2024, 15:27:58
1037	API Error	Error Fingerprint not match:	10/29/2024, 15:28:36
1038	API Error	Error Fingerprint not match:	10/29/2024, 15:28:44
1039	API Error	Error Fingerprint not match:	10/29/2024, 15:36:42
1040	API Error	Error Fingerprint not match:	10/29/2024, 15:36:51
1041	API Error	Error Fingerprint not match:	10/29/2024, 15:50:10
1042	API Error	Error Fingerprint not match:	10/29/2024, 15:53:24
1043	API Error	Error Fingerprint not match:	10/29/2024, 16:19:22
1044	API Error	Error Fingerprint not match:	10/29/2024, 16:20:15
1045	API Error	Error Fingerprint not match:	10/29/2024, 16:26:07
1046	API Error	Error Fingerprint not match:	10/29/2024, 16:30:24
1047	API Error	Error Fingerprint not match:	10/29/2024, 16:32:17
1048	API Error	Error Fingerprint not match:	10/29/2024, 16:50:06
1049	API Error	Error Fingerprint not match:	10/29/2024, 16:56:13
1050	API Error	Error Fingerprint not match:	10/29/2024, 17:20:43
1051	API Error	Error Fingerprint not match:	10/30/2024, 09:21:50
1052	API Error	Error Fingerprint not match:	10/30/2024, 09:36:54
1053	API Error	Error Fingerprint not match:	10/30/2024, 09:52:41
1054	API Error	Error Fingerprint not match:	10/30/2024, 11:11:12
1055	API Error	Error Fingerprint not match:	10/30/2024, 11:41:37
1056	API Error	Error Fingerprint not match:	10/30/2024, 12:38:25
1057	API Error	Error Fingerprint not match:	10/30/2024, 13:13:48
1058	API Error	Error Fingerprint not match:	10/30/2024, 13:13:56
1059	API Error	Error Fingerprint not match:	10/30/2024, 13:14:53
1060	API Error	Error Fingerprint not match:	10/30/2024, 14:16:30
1061	API Error	Error Fingerprint not match:	10/30/2024, 14:17:10
1062	API Error	Error Fingerprint not match:	10/30/2024, 15:05:27
1063	API Error	Error Fingerprint not match:	10/30/2024, 16:04:27
1064	API Error	Error Fingerprint not match:	10/30/2024, 16:04:35
1065	API Error	Error Fingerprint not match:	10/30/2024, 16:04:44
1066	API Error	Error Fingerprint not match:	10/30/2024, 16:18:01
1067	API Error	Error Fingerprint not match:	10/30/2024, 16:18:10
1068	API Error	Error Fingerprint not match:	10/30/2024, 16:18:16
1069	API Error	Error Fingerprint not match:	11/05/2024, 09:36:16
1070	API Error	Error Fingerprint not match:	11/05/2024, 09:39:28
1071	API Error	Error Fingerprint not match:	11/05/2024, 09:44:16
1072	API Error	Error Fingerprint not match:	11/05/2024, 09:44:26
1073	API Error	Error Fingerprint not match:	11/05/2024, 09:47:43
1074	API Error	Error Fingerprint not match:	11/05/2024, 10:10:43
1075	API Error	Employee not found.	11/05/2024, 11:17:42
1076	API Error	Error Fingerprint not match:	11/05/2024, 11:27:21
1077	API Error	Error Fingerprint not match:	11/05/2024, 12:59:24
1078	API Error	Error Fingerprint not match:	11/07/2024, 13:39:15
1079	API Error	Error Fingerprint not match:	11/07/2024, 13:39:59
1080	API Error	Error Fingerprint not match:	11/07/2024, 13:40:07
1081	API Error	Error Fingerprint not match:	11/07/2024, 13:40:15
1082	API Error	Error Fingerprint not match:	11/07/2024, 13:40:25
1083	API Error	Error Fingerprint not match:	11/07/2024, 13:44:02
1084	API Error	Error Fingerprint not match:	11/07/2024, 13:45:21
1085	API Error	Error Fingerprint not match:	11/07/2024, 13:46:29
1086	API Error	Error Fingerprint not match:	11/07/2024, 13:48:08
1087	API Error	Error Fingerprint not match:	11/07/2024, 13:49:38
1088	API Error	Error Fingerprint not match:	11/07/2024, 13:49:47
1089	API Error	Error Fingerprint not match:	11/07/2024, 13:50:00
1090	API Error	Error Fingerprint not match:	11/07/2024, 13:50:55
1091	API Error	Error Fingerprint not match:	11/07/2024, 13:51:08
1092	API Error	Error Fingerprint not match:	11/07/2024, 13:51:18
1093	API Error	Error Fingerprint not match:	11/07/2024, 13:51:28
1094	API Error	Error Fingerprint not match:	11/07/2024, 13:51:36
1095	API Error	Error Fingerprint not match:	11/07/2024, 13:51:44
1096	API Error	Error Fingerprint not match:	11/07/2024, 13:52:07
1097	API Error	Error Fingerprint not match:	11/07/2024, 13:52:18
1098	API Error	Error Fingerprint not match:	11/07/2024, 13:52:29
1099	API Error	Error Fingerprint not match:	11/07/2024, 13:53:02
1100	API Error	Error Fingerprint not match:	11/07/2024, 13:54:53
1101	API Error	Error Fingerprint not match:	11/07/2024, 14:19:19
1102	API Error	Error Fingerprint not match:	11/07/2024, 14:26:39
1103	API Error	Error Fingerprint not match:	11/07/2024, 14:47:26
1104	API Error	Error Fingerprint not match:	11/07/2024, 14:47:34
1105	API Error	Error Fingerprint not match:	11/07/2024, 14:47:42
1106	API Error	Error Fingerprint not match:	11/07/2024, 14:50:00
1107	API Error	Error Fingerprint not match:	11/07/2024, 15:11:00
1108	API Error	Error Fingerprint not match:	11/07/2024, 15:38:24
1109	API Error	Error Fingerprint not match:	11/07/2024, 15:59:17
1110	API Error	Error Fingerprint not match:	11/07/2024, 16:13:30
1111	API Error	Error Fingerprint not match:	11/07/2024, 16:13:39
1112	API Error	Error Fingerprint not match:	11/07/2024, 16:13:48
1113	API Error	Error Fingerprint not match:	11/07/2024, 16:51:52
1114	API Error	Error Fingerprint not match:	11/07/2024, 16:52:02
1115	API Error	Error Fingerprint not match:	11/07/2024, 16:53:09
1116	API Error	Error Fingerprint not match:	11/07/2024, 16:58:59
1117	API Error	Error Fingerprint not match:	11/07/2024, 16:59:57
1118	API Error	Error Fingerprint not match:	11/08/2024, 08:49:07
1119	API Error	Error Fingerprint not match:	11/08/2024, 09:01:37
1120	API Error	Error Fingerprint not match:	11/08/2024, 09:07:59
1121	API Error	Error Fingerprint not match:	11/08/2024, 09:30:51
1122	API Error	Error Fingerprint not match:	11/08/2024, 09:31:34
1123	API Error	Error Fingerprint not match:	11/08/2024, 10:02:24
1124	API Error	Error Fingerprint not match:	11/08/2024, 10:15:43
1125	API Error	Error Fingerprint not match:	11/08/2024, 11:26:53
1126	API Error	Error Fingerprint not match:	11/08/2024, 11:27:00
1127	API Error	Error Fingerprint not match:	11/08/2024, 11:27:28
1128	API Error	Error Fingerprint not match:	11/08/2024, 15:20:34
1129	API Error	Error Fingerprint not match:	11/08/2024, 15:46:05
1130	API Error	Error Fingerprint not match:	11/08/2024, 16:13:40
1131	API Error	Error Fingerprint not match:	11/08/2024, 16:53:23
1132	API Error	Error Fingerprint not match:	11/08/2024, 16:53:30
1133	API Error	Error Fingerprint not match:	11/08/2024, 16:53:38
1134	API Error	Error Fingerprint not match:	11/12/2024, 08:31:35
1135	API Error	Employee not found.	11/12/2024, 08:36:21
1136	API Error	Employee not found.	11/12/2024, 08:37:02
1137	API Error	Error Fingerprint not match:	11/12/2024, 10:06:15
1138	API Error	Error Fingerprint not match:	11/12/2024, 10:06:23
1139	API Error	Error Fingerprint not match:	11/12/2024, 10:11:46
1140	API Error	Error Fingerprint not match:	11/12/2024, 14:11:40
1141	API Error	Error Fingerprint not match:	11/14/2024, 09:18:43
1142	API Error	Error Fingerprint not match:	11/14/2024, 09:18:49
1143	API Error	Error Fingerprint not match:	11/14/2024, 09:19:39
1144	API Error	Error Fingerprint not match:	11/14/2024, 09:21:06
1145	API Error	Error Fingerprint not match:	11/14/2024, 09:21:17
1146	API Error	Error Fingerprint not match:	11/14/2024, 09:26:34
1147	API Error	Error Fingerprint not match:	11/14/2024, 09:26:41
1148	API Error	Error Fingerprint not match:	11/14/2024, 09:26:48
1149	API Error	Error Fingerprint not match:	11/14/2024, 10:55:40
1150	API Error	Error Fingerprint not match:	11/14/2024, 11:42:40
1151	API Error	Error Fingerprint not match:	11/14/2024, 11:42:47
1152	API Error	Error Fingerprint not match:	11/14/2024, 15:49:15
1153	API Error	Error Fingerprint not match:	11/14/2024, 15:49:24
1154	API Error	Error Fingerprint not match:	11/14/2024, 16:45:21
1155	API Error	Employee not found.	11/14/2024, 16:45:24
1156	API Error	Error Fingerprint not match:	11/14/2024, 16:45:34
1157	API Error	Error Fingerprint not match:	11/14/2024, 17:05:35
1158	API Error	Employee not found.	11/18/2024, 10:16:03
1159	API Error	Error Fingerprint not match:	11/18/2024, 10:16:58
1160	API Error	Error Fingerprint not match:	11/18/2024, 10:17:05
1161	API Error	Error Fingerprint not match:	11/18/2024, 10:17:12
1162	API Error	Error Fingerprint not match:	11/18/2024, 10:17:19
1163	API Error	Error Fingerprint not match:	11/18/2024, 11:06:32
1164	API Error	Error Fingerprint not match:	11/18/2024, 11:09:55
1165	API Error	Error Fingerprint not match:	11/18/2024, 11:10:03
1166	API Error	Error Fingerprint not match:	11/18/2024, 11:24:08
1167	API Error	Error Fingerprint not match:	11/18/2024, 11:24:17
1168	API Error	Error Fingerprint not match:	11/18/2024, 14:33:14
1169	API Error	Error Fingerprint not match:	11/18/2024, 15:05:22
1170	API Error	Error Fingerprint not match:	11/18/2024, 15:13:38
1171	API Error	Error Fingerprint not match:	11/18/2024, 15:13:59
1172	API Error	Error Fingerprint not match:	11/18/2024, 15:14:52
1173	API Error	Error Fingerprint not match:	11/18/2024, 15:15:41
1174	API Error	Error Fingerprint not match:	11/18/2024, 15:19:09
1175	API Error	Error Fingerprint not match:	11/18/2024, 15:30:32
1176	API Error	Error Fingerprint not match:	11/18/2024, 15:30:39
1177	API Error	Error Fingerprint not match:	11/18/2024, 16:06:20
1178	API Error	Error Fingerprint not match:	11/18/2024, 16:06:28
1179	API Error	Error Fingerprint not match:	11/18/2024, 16:42:17
1180	API Error	Error Fingerprint not match:	11/18/2024, 16:42:25
1181	API Error	Error Fingerprint not match:	11/18/2024, 16:42:34
1182	API Error	Error Fingerprint not match:	11/18/2024, 16:45:34
1183	API Error	Error Fingerprint not match:	11/18/2024, 16:45:42
1184	API Error	Error Fingerprint not match:	11/18/2024, 17:01:50
1185	API Error	Error Fingerprint not match:	11/18/2024, 17:01:58
1186	API Error	Error Fingerprint not match:	11/18/2024, 17:02:06
1187	API Error	Error Fingerprint not match:	11/19/2024, 08:51:17
1188	API Error	Error Fingerprint not match:	11/19/2024, 10:13:47
1189	API Error	Employee not found.	11/19/2024, 10:13:50
1190	API Error	Error Fingerprint not match:	11/19/2024, 10:28:38
1191	API Error	Error Fingerprint not match:	11/19/2024, 13:10:54
1192	API Error	Error Fingerprint not match:	11/19/2024, 15:02:52
1193	API Error	Error Fingerprint not match:	11/19/2024, 15:09:56
1194	API Error	Error Fingerprint not match:	11/19/2024, 15:28:32
1195	API Error	Error Fingerprint not match:	11/19/2024, 15:29:02
1196	API Error	Error Fingerprint not match:	11/19/2024, 15:29:09
1197	API Error	Error Fingerprint not match:	11/19/2024, 15:29:16
1198	API Error	Error Fingerprint not match:	11/19/2024, 15:30:31
1199	API Error	Error Fingerprint not match:	11/19/2024, 15:30:38
1200	API Error	Error Fingerprint not match:	11/19/2024, 15:30:45
1201	API Error	Error Fingerprint not match:	11/19/2024, 15:30:52
1202	API Error	Error Fingerprint not match:	11/19/2024, 15:32:11
1203	API Error	Error Fingerprint not match:	11/20/2024, 08:47:58
1204	API Error	Error Fingerprint not match:	11/20/2024, 08:52:29
1205	API Error	Error Fingerprint not match:	11/20/2024, 09:04:45
1206	API Error	Error Fingerprint not match:	11/20/2024, 09:04:51
1207	API Error	Employee has no fingerprint.	11/20/2024, 09:13:08
1208	API Error	Employee has no fingerprint.	11/20/2024, 09:13:30
1209	API Error	Employee has no fingerprint.	11/20/2024, 09:15:30
1210	API Error	Employee has no fingerprint.	11/20/2024, 09:15:56
1211	API Error	Employee has no fingerprint.	11/20/2024, 09:16:15
1212	API Error	Employee has no fingerprint.	11/20/2024, 09:16:34
1213	API Error	Employee has no fingerprint.	11/20/2024, 09:16:54
1214	API Error	Employee has no fingerprint.	11/20/2024, 09:17:12
1215	API Error	Error Fingerprint not match:	11/20/2024, 09:19:36
1216	API Error	Error Fingerprint not match:	11/20/2024, 09:19:46
1217	API Error	Error Fingerprint not match:	11/20/2024, 09:19:54
1218	API Error	Error Fingerprint not match:	11/20/2024, 09:20:01
1219	API Error	Employee has no fingerprint.	11/20/2024, 09:20:42
1220	API Error	Employee has no fingerprint.	11/20/2024, 09:21:05
1221	API Error	Error Fingerprint not match:	11/20/2024, 09:21:57
1222	API Error	Error Fingerprint not match:	11/20/2024, 09:22:05
1223	API Error	Error Fingerprint not match:	11/20/2024, 09:22:34
1224	API Error	Error Fingerprint not match:	11/20/2024, 09:22:41
1225	API Error	Error Fingerprint not match:	11/20/2024, 09:22:50
1226	API Error	Error Fingerprint not match:	11/20/2024, 09:22:58
1227	API Error	Error Fingerprint not match:	11/20/2024, 09:23:07
1228	API Error	Error Fingerprint not match:	11/20/2024, 09:23:15
1229	API Error	Error Fingerprint not match:	11/20/2024, 09:23:24
1230	API Error	Error Fingerprint not match:	11/20/2024, 09:23:33
1231	API Error	Error Fingerprint not match:	11/20/2024, 09:23:41
1232	API Error	Error Fingerprint not match:	11/20/2024, 09:24:09
1233	API Error	Error Fingerprint not match:	11/20/2024, 09:24:16
1234	API Error	Error Fingerprint not match:	11/20/2024, 09:24:25
1235	API Error	Employee has no fingerprint.	11/20/2024, 09:27:54
1236	API Error	Employee has no fingerprint.	11/20/2024, 09:28:21
1237	API Error	Error Fingerprint not match:	11/20/2024, 09:30:02
1238	API Error	Error Fingerprint not match:	11/20/2024, 09:30:09
1239	API Error	Error Fingerprint not match:	11/20/2024, 09:31:30
1240	API Error	Error Fingerprint not match:	11/20/2024, 09:31:37
1241	API Error	Error Fingerprint not match:	11/20/2024, 09:31:45
1242	API Error	Error Fingerprint not match:	11/20/2024, 09:31:52
1243	API Error	Error Fingerprint not match:	11/20/2024, 09:32:01
1244	API Error	Error Fingerprint not match:	11/20/2024, 09:32:08
1245	API Error	Error Fingerprint not match:	11/20/2024, 09:32:14
1246	API Error	Error Fingerprint not match:	11/20/2024, 09:32:19
1247	API Error	Employee not found.	11/20/2024, 09:35:12
1248	API Error	Error Fingerprint not match:	11/20/2024, 09:35:19
1249	API Error	Error Fingerprint not match:	11/20/2024, 09:35:43
1250	API Error	Error Fingerprint not match:	11/20/2024, 09:35:55
1251	API Error	Employee not found.	11/20/2024, 09:37:45
1252	API Error	Employee not found.	11/20/2024, 09:37:50
1253	API Error	Employee not found.	11/20/2024, 09:38:00
1254	API Error	Error Fingerprint not match:	11/20/2024, 09:38:07
1255	API Error	Error Fingerprint not match:	11/20/2024, 09:38:15
1256	API Error	Error Fingerprint not match:	11/20/2024, 09:38:22
1257	API Error	Error Fingerprint not match:	11/20/2024, 09:38:32
1258	API Error	Employee not found.	11/20/2024, 09:40:58
1259	API Error	Employee not found.	11/20/2024, 09:41:22
1260	API Error	Employee not found.	11/20/2024, 09:41:27
1261	API Error	Employee not found.	11/20/2024, 09:44:30
1262	API Error	Error Fingerprint not match:	11/20/2024, 09:47:00
1263	API Error	Error Fingerprint not match:	11/20/2024, 10:13:13
1264	API Error	Error Fingerprint not match:	11/20/2024, 12:11:18
1265	API Error	Error Fingerprint not match:	11/20/2024, 14:52:33
1266	API Error	Error Fingerprint not match:	11/20/2024, 15:44:28
1267	API Error	Error Fingerprint not match:	11/20/2024, 15:44:40
1268	API Error	Error Fingerprint not match:	11/20/2024, 16:16:30
1269	API Error	Error Fingerprint not match:	11/20/2024, 16:53:57
1270	API Error	Employee has no fingerprint.	11/21/2024, 11:23:59
1271	API Error	Employee has no fingerprint.	11/21/2024, 11:24:08
1272	API Error	Error Fingerprint not match:	11/21/2024, 12:33:56
1273	API Error	Error Fingerprint not match:	11/21/2024, 12:34:04
1274	API Error	Error Fingerprint not match:	11/21/2024, 12:34:22
1275	API Error	Error Fingerprint not match:	11/21/2024, 12:34:34
1276	API Error	Error Fingerprint not match:	11/21/2024, 12:34:42
1277	API Error	Error Fingerprint not match:	11/21/2024, 12:34:50
1278	API Error	Error Fingerprint not match:	11/21/2024, 12:34:59
1279	API Error	Error Fingerprint not match:	11/21/2024, 12:35:06
1280	API Error	Error Fingerprint not match:	11/21/2024, 12:58:19
1281	API Error	Error Fingerprint not match:	11/21/2024, 15:51:18
1282	API Error	Error Fingerprint not match:	11/21/2024, 15:56:54
1283	API Error	Error Fingerprint not match:	11/21/2024, 15:57:02
1284	API Error	Error Fingerprint not match:	11/21/2024, 16:10:14
1285	API Error	Error Fingerprint not match:	11/21/2024, 16:10:26
1286	API Error	Error Fingerprint not match:	11/21/2024, 16:10:35
1287	API Error	Error Fingerprint not match:	11/21/2024, 16:10:44
1288	API Error	Error Fingerprint not match:	11/21/2024, 16:10:53
1289	API Error	Employee has no fingerprint.	11/21/2024, 16:20:03
1290	API Error	Employee has no fingerprint.	11/21/2024, 16:20:29
1291	API Error	Employee has no fingerprint.	11/21/2024, 16:21:39
1292	API Error	Employee has no fingerprint.	11/21/2024, 16:22:03
1293	API Error	Error Fingerprint not match:	11/21/2024, 16:43:22
1294	API Error	Error Fingerprint not match:	11/22/2024, 09:35:25
1295	API Error	Employee has no fingerprint.	11/22/2024, 15:02:06
1296	API Error	Error Fingerprint not match:	11/22/2024, 15:38:24
1297	API Error	Error Fingerprint not match:	11/27/2024, 09:22:18
1298	API Error	Error Fingerprint not match:	11/27/2024, 09:43:39
1299	API Error	Error Fingerprint not match:	11/27/2024, 09:43:47
1300	API Error	Error Fingerprint not match:	11/27/2024, 09:44:47
1301	API Error	Error Fingerprint not match:	11/27/2024, 09:44:56
1302	API Error	Error Fingerprint not match:	11/27/2024, 09:45:04
1303	API Error	Error Fingerprint not match:	11/27/2024, 09:45:12
1304	API Error	Error Fingerprint not match:	11/27/2024, 09:45:20
1305	API Error	Employee has no fingerprint.	11/27/2024, 10:25:27
1306	API Error	Employee has no fingerprint.	11/27/2024, 10:25:55
1307	API Error	Employee has no fingerprint.	11/27/2024, 10:26:28
1308	API Error	Error Fingerprint not match:	11/27/2024, 10:27:09
1309	API Error	Employee has no fingerprint.	11/27/2024, 10:28:38
1310	API Error	Employee has no fingerprint.	11/27/2024, 10:30:54
1311	API Error	Employee has no fingerprint.	11/27/2024, 10:32:34
1312	API Error	Employee has no fingerprint.	11/27/2024, 10:32:51
1313	API Error	Employee has no fingerprint.	11/27/2024, 10:34:00
1314	API Error	Employee has no fingerprint.	11/27/2024, 10:34:14
1315	API Error	Employee has no fingerprint.	11/27/2024, 10:34:34
1316	API Error	Employee has no fingerprint.	11/27/2024, 10:34:53
1317	API Error	Employee has no fingerprint.	11/27/2024, 10:35:13
1318	API Error	Employee has no fingerprint.	11/27/2024, 10:35:32
1319	API Error	Employee has no fingerprint.	11/27/2024, 10:35:52
1320	API Error	Employee has no fingerprint.	11/27/2024, 10:36:09
1321	API Error	Employee has no fingerprint.	11/27/2024, 10:36:26
1322	API Error	Employee has no fingerprint.	11/27/2024, 10:36:50
1323	API Error	Employee has no fingerprint.	11/27/2024, 10:37:06
1324	API Error	Employee has no fingerprint.	11/27/2024, 10:37:28
1325	API Error	Employee has no fingerprint.	11/27/2024, 10:37:49
1326	API Error	Employee has no fingerprint.	11/27/2024, 10:38:12
1327	API Error	Employee has no fingerprint.	11/27/2024, 10:38:31
1328	API Error	Employee has no fingerprint.	11/27/2024, 10:38:51
1329	API Error	Employee has no fingerprint.	11/27/2024, 10:42:40
1330	API Error	Employee has no fingerprint.	11/27/2024, 10:43:39
1331	API Error	Employee not found.	11/27/2024, 10:44:07
1332	API Error	Employee has no fingerprint.	11/27/2024, 10:45:27
1333	API Error	Employee has no fingerprint.	11/27/2024, 10:46:24
1334	API Error	Employee has no fingerprint.	11/27/2024, 10:46:33
1335	API Error	Employee has no fingerprint.	11/27/2024, 10:46:58
1336	API Error	Employee has no fingerprint.	11/27/2024, 10:47:03
1337	API Error	Employee has no fingerprint.	11/27/2024, 10:47:35
1338	API Error	Employee has no fingerprint.	11/27/2024, 10:47:40
1339	API Error	Employee has no fingerprint.	11/27/2024, 10:48:46
1340	API Error	Employee has no fingerprint.	11/27/2024, 10:48:51
1341	API Error	Employee has no fingerprint.	11/27/2024, 10:51:57
1342	API Error	Employee has no fingerprint.	11/27/2024, 10:56:18
1343	API Error	Employee has no fingerprint.	11/27/2024, 10:57:39
1344	API Error	Error Fingerprint not match:	11/27/2024, 11:28:41
1345	API Error	Error Fingerprint not match:	11/27/2024, 11:28:56
1346	API Error	Error Fingerprint not match:	11/27/2024, 11:29:06
1347	API Error	Error Fingerprint not match:	11/27/2024, 18:44:26
1348	API Error	Error Fingerprint not match:	11/27/2024, 18:44:34
1349	API Error	Error Fingerprint not match:	11/27/2024, 18:44:41
1350	API Error	Error Fingerprint not match:	11/28/2024, 08:07:27
1351	API Error	Error Fingerprint not match:	11/28/2024, 08:15:04
1352	API Error	Error Fingerprint not match:	11/28/2024, 08:15:17
1353	API Error	Error Fingerprint not match:	11/28/2024, 08:25:00
1354	API Error	Employee has no fingerprint.	11/28/2024, 09:26:58
1355	API Error	Employee has no fingerprint.	11/28/2024, 09:29:32
1356	API Error	Employee has no fingerprint.	11/28/2024, 09:30:00
1357	API Error	Employee has no fingerprint.	11/28/2024, 09:30:15
1358	API Error	Error Fingerprint not match:	11/28/2024, 09:41:37
1359	API Error	Error Fingerprint not match:	11/28/2024, 09:41:51
1360	API Error	Error Fingerprint not match:	11/28/2024, 09:45:33
1361	API Error	Error Fingerprint not match:	11/28/2024, 12:05:43
1362	API Error	Error Fingerprint not match:	11/28/2024, 12:59:23
1363	API Error	Error Fingerprint not match:	11/28/2024, 17:04:01
1364	API Error	Error Fingerprint not match:	11/29/2024, 06:40:24
1365	API Error	Employee not found.	11/29/2024, 07:35:25
1366	API Error	Error Fingerprint not match:	11/29/2024, 07:36:00
1367	API Error	Employee not found.	11/29/2024, 07:36:25
1368	API Error	Error Fingerprint not match:	11/29/2024, 08:03:07
1369	API Error	Error Fingerprint not match:	11/29/2024, 08:03:24
1370	API Error	Error Fingerprint not match:	11/29/2024, 08:03:35
1371	API Error	Error Fingerprint not match:	11/29/2024, 08:54:40
1372	API Error	Error Fingerprint not match:	11/29/2024, 09:06:50
1373	API Error	Error Fingerprint not match:	11/29/2024, 12:26:44
1374	API Error	Error Fingerprint not match:	11/29/2024, 18:23:09
1375	API Error	Error Fingerprint not match:	12/02/2024, 07:51:59
1376	API Error	Error Fingerprint not match:	12/02/2024, 08:26:23
1377	API Error	Error Fingerprint not match:	12/02/2024, 08:26:31
1378	API Error	Error Fingerprint not match:	12/02/2024, 08:30:11
1379	API Error	Error Fingerprint not match:	12/02/2024, 08:30:20
1380	API Error	Error Fingerprint not match:	12/02/2024, 10:11:40
1381	API Error	Error Fingerprint not match:	12/02/2024, 14:52:17
1382	API Error	Error Fingerprint not match:	12/02/2024, 14:52:30
1383	API Error	Error Fingerprint not match:	12/03/2024, 07:45:04
1384	API Error	Error Fingerprint not match:	12/03/2024, 09:26:29
1385	API Error	Error Fingerprint not match:	12/03/2024, 09:58:48
1386	API Error	Error Fingerprint not match:	12/03/2024, 09:58:56
1387	API Error	Error Fingerprint not match:	12/03/2024, 09:59:04
1388	API Error	Error Fingerprint not match:	12/03/2024, 09:59:16
1389	API Error	Error Fingerprint not match:	12/03/2024, 09:59:27
1390	API Error	Error Fingerprint not match:	12/03/2024, 09:59:35
1391	API Error	Error Fingerprint not match:	12/03/2024, 11:21:01
1392	API Error	Error Fingerprint not match:	12/03/2024, 11:21:13
1393	API Error	Error Fingerprint not match:	12/03/2024, 11:21:24
1394	API Error	Error Fingerprint not match:	12/03/2024, 13:18:37
1395	API Error	Employee not found.	12/04/2024, 08:21:49
1396	API Error	Employee not found.	12/04/2024, 08:21:49
1397	API Error	Employee not found.	12/04/2024, 08:21:52
1398	API Error	Employee not found.	12/04/2024, 08:21:59
1399	API Error	Error Fingerprint not match:	12/04/2024, 08:22:08
1400	API Error	Error Fingerprint not match:	12/04/2024, 08:33:47
1401	API Error	Error Fingerprint not match:	12/04/2024, 08:33:54
1402	API Error	Error Fingerprint not match:	12/04/2024, 08:39:31
1403	API Error	Error Fingerprint not match:	12/04/2024, 08:39:38
1404	API Error	Error Fingerprint not match:	12/04/2024, 08:40:13
1405	API Error	Error Fingerprint not match:	12/04/2024, 08:41:04
1406	API Error	Error Fingerprint not match:	12/04/2024, 08:41:13
1407	API Error	Error Fingerprint not match:	12/04/2024, 08:41:23
1408	API Error	Employee not found.	12/04/2024, 08:41:26
1409	API Error	Error Fingerprint not match:	12/04/2024, 08:41:34
1410	API Error	Error Fingerprint not match:	12/04/2024, 08:41:43
1411	API Error	Error Fingerprint not match:	12/04/2024, 08:41:52
1412	API Error	Error Fingerprint not match:	12/04/2024, 08:42:02
1413	API Error	Error Fingerprint not match:	12/04/2024, 08:42:10
1414	API Error	Error Fingerprint not match:	12/04/2024, 08:42:22
1415	API Error	Error Fingerprint not match:	12/04/2024, 08:42:30
1416	API Error	Error Fingerprint not match:	12/04/2024, 08:42:39
1417	API Error	Error Fingerprint not match:	12/04/2024, 08:42:49
1418	API Error	Error Fingerprint not match:	12/04/2024, 08:43:32
1419	API Error	Error Fingerprint not match:	12/04/2024, 08:43:41
1420	API Error	Error Fingerprint not match:	12/04/2024, 08:43:52
1421	API Error	Error Fingerprint not match:	12/04/2024, 08:44:02
1422	API Error	Error Fingerprint not match:	12/04/2024, 08:44:09
1423	API Error	Error Fingerprint not match:	12/04/2024, 08:44:28
1424	API Error	Employee has no fingerprint.	12/04/2024, 08:51:58
1425	API Error	Employee has no fingerprint.	12/04/2024, 08:55:13
1426	API Error	Employee has no fingerprint.	12/04/2024, 08:55:34
1427	API Error	Employee has no fingerprint.	12/04/2024, 08:56:01
1428	API Error	Employee has no fingerprint.	12/04/2024, 08:56:24
1429	API Error	Employee has no fingerprint.	12/04/2024, 08:56:50
1430	API Error	Employee has no fingerprint.	12/04/2024, 09:00:19
1431	API Error	Employee has no fingerprint.	12/04/2024, 09:00:31
1432	API Error	Employee not found.	12/04/2024, 09:00:37
1433	API Error	Employee not found.	12/04/2024, 09:00:43
1434	API Error	Employee has no fingerprint.	12/04/2024, 09:00:47
1435	API Error	Employee has no fingerprint.	12/04/2024, 09:01:07
1436	API Error	Employee not found.	12/04/2024, 09:02:31
1437	API Error	Employee not found.	12/04/2024, 09:02:31
1438	API Error	Employee has no fingerprint.	12/04/2024, 09:02:37
1439	API Error	Employee not found.	12/04/2024, 09:03:03
1440	API Error	Employee not found.	12/04/2024, 09:04:10
1441	API Error	Error Fingerprint not match:	12/04/2024, 15:55:20
1442	API Error	Error Fingerprint not match:	12/04/2024, 15:55:32
1443	API Error	Error Fingerprint not match:	12/04/2024, 15:55:45
1444	API Error	Error Fingerprint not match:	12/04/2024, 15:55:54
1445	API Error	Error Fingerprint not match:	12/04/2024, 16:15:02
1446	API Error	Error Fingerprint not match:	12/04/2024, 19:49:14
1447	API Error	Error Fingerprint not match:	12/04/2024, 19:49:24
1448	API Error	Error Fingerprint not match:	12/04/2024, 19:49:34
1449	API Error	Error Fingerprint not match:	12/04/2024, 19:49:41
1450	API Error	Error Fingerprint not match:	12/04/2024, 19:50:00
1451	API Error	Error Fingerprint not match:	12/04/2024, 19:50:07
1452	API Error	Error Fingerprint not match:	12/04/2024, 19:50:14
1453	API Error	Error Fingerprint not match:	12/04/2024, 19:50:23
1454	API Error	Error Fingerprint not match:	12/04/2024, 19:50:30
1455	API Error	Error Fingerprint not match:	12/04/2024, 19:50:41
1456	API Error	Error Fingerprint not match:	12/04/2024, 19:51:08
1457	API Error	Error Fingerprint not match:	12/04/2024, 19:51:17
1458	API Error	Error Fingerprint not match:	12/04/2024, 19:51:24
1459	API Error	Error Fingerprint not match:	12/04/2024, 19:51:33
1460	API Error	Error Fingerprint not match:	12/04/2024, 19:53:07
1461	API Error	Error Fingerprint not match:	12/04/2024, 21:02:12
1462	API Error	Error Fingerprint not match:	12/05/2024, 06:44:50
1463	API Error	Error Fingerprint not match:	12/05/2024, 06:59:34
1464	API Error	Error Fingerprint not match:	12/05/2024, 06:59:43
1465	API Error	Error Fingerprint not match:	12/05/2024, 08:20:47
1466	API Error	Error Fingerprint not match:	12/05/2024, 08:20:55
1467	API Error	Employee not found.	12/05/2024, 08:24:01
1468	API Error	Error Fingerprint not match:	12/05/2024, 14:01:37
1469	API Error	Error Fingerprint not match:	12/05/2024, 20:56:26
1470	API Error	Employee not found.	12/05/2024, 20:56:30
1471	API Error	Error Fingerprint not match:	12/06/2024, 06:25:00
1472	API Error	Error Fingerprint not match:	12/06/2024, 10:19:51
1473	API Error	Error Fingerprint not match:	12/06/2024, 10:20:04
1474	API Error	Error Fingerprint not match:	12/07/2024, 08:33:06
1475	API Error	Error Fingerprint not match:	12/07/2024, 08:34:25
1476	API Error	Error Fingerprint not match:	12/09/2024, 08:47:52
1477	API Error	Error Fingerprint not match:	12/09/2024, 08:48:00
1478	API Error	Error Fingerprint not match:	12/09/2024, 10:50:44
1479	API Error	Error Fingerprint not match:	12/09/2024, 17:35:05
1480	API Error	Error Fingerprint not match:	12/09/2024, 17:35:14
1481	API Error	Employee has no fingerprint.	12/09/2024, 20:55:01
1482	API Error	Employee has no fingerprint.	12/09/2024, 20:55:12
1483	API Error	Error Fingerprint not match:	12/10/2024, 06:47:17
1484	API Error	Error Fingerprint not match:	12/10/2024, 06:47:39
1485	API Error	Error Fingerprint not match:	12/10/2024, 06:47:47
1486	API Error	Error Fingerprint not match:	12/10/2024, 07:35:56
1487	API Error	Error Fingerprint not match:	12/10/2024, 07:36:04
1488	API Error	Error Fingerprint not match:	12/10/2024, 07:36:12
1489	API Error	Error Fingerprint not match:	12/10/2024, 08:08:33
1490	API Error	Error Fingerprint not match:	12/10/2024, 08:08:41
1491	API Error	Error Fingerprint not match:	12/10/2024, 08:08:50
1492	API Error	Employee not found.	12/10/2024, 08:08:56
1493	API Error	Employee not found.	12/10/2024, 08:08:57
1494	API Error	Error Fingerprint not match:	12/10/2024, 08:29:18
1495	API Error	Error Fingerprint not match:	12/10/2024, 08:29:26
1496	API Error	Error Fingerprint not match:	12/10/2024, 08:29:48
1497	API Error	Error Fingerprint not match:	12/10/2024, 08:29:55
1498	API Error	Error Fingerprint not match:	12/10/2024, 08:30:02
1499	API Error	Error Fingerprint not match:	12/10/2024, 08:30:09
1500	API Error	Error Fingerprint not match:	12/10/2024, 08:30:21
1501	API Error	Error Fingerprint not match:	12/10/2024, 08:34:09
1502	API Error	Error Fingerprint not match:	12/10/2024, 08:34:18
1503	API Error	Error Fingerprint not match:	12/10/2024, 09:06:46
1504	API Error	Error Fingerprint not match:	12/10/2024, 09:21:37
1505	API Error	Error Fingerprint not match:	12/10/2024, 12:54:25
1506	API Error	Error Fingerprint not match:	12/11/2024, 08:15:48
1507	API Error	Error Fingerprint not match:	12/11/2024, 08:35:32
1508	API Error	Error Fingerprint not match:	12/11/2024, 08:35:40
1509	API Error	Error Fingerprint not match:	12/11/2024, 09:16:26
1510	API Error	Error Fingerprint not match:	12/11/2024, 12:38:18
1511	API Error	Error Fingerprint not match:	12/11/2024, 13:27:44
1512	API Error	Error Fingerprint not match:	12/11/2024, 13:27:53
1513	API Error	Error Fingerprint not match:	12/11/2024, 13:28:02
1514	API Error	Error Fingerprint not match:	12/11/2024, 13:28:11
1515	API Error	Error Fingerprint not match:	12/11/2024, 13:28:19
1516	API Error	Error Fingerprint not match:	12/11/2024, 13:28:28
1517	API Error	Error Fingerprint not match:	12/12/2024, 06:51:28
1518	API Error	Error Fingerprint not match:	12/12/2024, 07:30:24
1519	API Error	Error Fingerprint not match:	12/12/2024, 07:45:33
1520	API Error	Error Fingerprint not match:	12/12/2024, 07:45:40
1521	API Error	Error Fingerprint not match:	12/12/2024, 08:12:02
1522	API Error	Error Fingerprint not match:	12/12/2024, 08:51:40
1523	API Error	Error Fingerprint not match:	12/12/2024, 09:16:54
1524	API Error	Employee has no fingerprint.	12/12/2024, 09:23:40
1525	API Error	Employee has no fingerprint.	12/12/2024, 09:23:59
1526	API Error	Employee has no fingerprint.	12/12/2024, 09:31:16
1527	API Error	Employee has no fingerprint.	12/12/2024, 09:31:45
1528	API Error	Employee has no fingerprint.	12/12/2024, 09:32:59
1529	API Error	Employee has no fingerprint.	12/12/2024, 09:33:22
1530	API Error	Employee has no fingerprint.	12/12/2024, 09:33:56
1531	API Error	Error Fingerprint not match:	12/12/2024, 10:44:30
1532	API Error	Error Fingerprint not match:	12/12/2024, 12:00:56
1533	API Error	Error Fingerprint not match:	12/12/2024, 15:10:48
1534	API Error	Error Fingerprint not match:	12/12/2024, 17:12:34
1535	API Error	Error Fingerprint not match:	12/12/2024, 17:25:42
1536	API Error	Error Fingerprint not match:	12/12/2024, 17:28:05
1537	API Error	Employee has no fingerprint.	12/12/2024, 18:08:18
1538	API Error	Error Fingerprint not match:	12/12/2024, 19:31:58
1539	API Error	Error Fingerprint not match:	12/13/2024, 06:59:39
1540	API Error	Error Fingerprint not match:	12/13/2024, 06:59:48
1541	API Error	Error Fingerprint not match:	12/13/2024, 08:12:49
1542	API Error	Error Fingerprint not match:	12/13/2024, 08:15:42
1543	API Error	Error Fingerprint not match:	12/13/2024, 09:20:26
1544	API Error	Error Fingerprint not match:	12/13/2024, 09:20:44
1545	API Error	Error Fingerprint not match:	12/13/2024, 09:21:04
1546	API Error	Error Fingerprint not match:	12/13/2024, 09:21:33
1547	API Error	Error Fingerprint not match:	12/13/2024, 09:49:17
1548	API Error	Error Fingerprint not match:	12/13/2024, 11:31:02
1549	API Error	Error Fingerprint not match:	12/13/2024, 12:27:49
1550	API Error	Error Fingerprint not match:	12/13/2024, 13:00:04
1551	API Error	Employee not found.	12/13/2024, 23:57:21
1552	API Error	Employee not found.	12/13/2024, 23:57:30
1553	API Error	Employee not found.	12/13/2024, 23:57:57
1554	API Error	Employee not found.	12/13/2024, 23:58:02
1555	API Error	Employee not found.	12/13/2024, 23:58:08
1556	API Error	Employee not found.	12/13/2024, 23:58:20
1557	API Error	Employee not found.	12/13/2024, 23:58:42
1558	API Error	Employee not found.	12/13/2024, 23:58:46
1559	API Error	Employee not found.	12/13/2024, 23:58:52
1560	API Error	Employee not found.	12/13/2024, 23:58:58
1561	API Error	Employee not found.	12/14/2024, 24:00:06
1562	API Error	Employee not found.	12/14/2024, 24:00:10
1563	API Error	Employee not found.	12/14/2024, 24:00:16
1564	API Error	Employee not found.	12/14/2024, 24:00:32
1565	API Error	Employee not found.	12/14/2024, 24:00:35
1566	API Error	Employee not found.	12/14/2024, 24:00:40
1567	API Error	Employee not found.	12/14/2024, 24:00:46
1568	API Error	Employee not found.	12/14/2024, 24:00:52
1569	API Error	Employee not found.	12/14/2024, 24:01:07
1570	API Error	Employee not found.	12/14/2024, 24:01:26
1571	API Error	Employee has no fingerprint.	12/14/2024, 24:01:43
1572	API Error	Employee has no fingerprint.	12/14/2024, 24:02:20
1573	API Error	Employee has no fingerprint.	12/14/2024, 24:02:43
1574	API Error	Employee has no fingerprint.	12/14/2024, 24:03:21
1575	API Error	Employee has no fingerprint.	12/16/2024, 21:44:44
1576	API Error	Employee has no fingerprint.	12/16/2024, 21:45:08
1577	API Error	Employee has no fingerprint.	12/16/2024, 21:45:38
1578	API Error	Employee has no fingerprint.	12/16/2024, 21:45:57
1579	API Error	Employee has no fingerprint.	12/16/2024, 21:46:24
1580	API Error	Employee has no fingerprint.	12/16/2024, 21:46:43
1581	API Error	Employee has no fingerprint.	12/16/2024, 21:46:50
1582	API Error	Employee has no fingerprint.	12/16/2024, 21:47:08
1583	API Error	Employee has no fingerprint.	12/16/2024, 21:47:25
1584	API Error	Employee has no fingerprint.	12/16/2024, 21:48:51
1585	API Error	Employee has no fingerprint.	12/16/2024, 21:49:11
1586	API Error	Employee has no fingerprint.	12/16/2024, 21:49:36
1587	API Error	Employee has no fingerprint.	12/16/2024, 21:50:02
1588	API Error	Employee has no fingerprint.	12/16/2024, 21:52:34
1589	API Error	Employee has no fingerprint.	12/16/2024, 21:52:58
1590	API Error	Employee has no fingerprint.	12/16/2024, 21:53:23
1591	API Error	Employee has no fingerprint.	12/16/2024, 21:54:08
1592	API Error	Employee has no fingerprint.	12/16/2024, 21:54:41
1593	API Error	Error Fingerprint not match:	12/16/2024, 21:55:23
1594	API Error	Error Fingerprint not match:	12/16/2024, 21:55:31
1595	API Error	Error Fingerprint not match:	12/16/2024, 21:55:39
1596	API Error	Employee has no fingerprint.	12/16/2024, 21:56:28
1597	API Error	Employee has no fingerprint.	12/16/2024, 21:56:43
1598	API Error	Error Fingerprint not match:	12/17/2024, 19:03:39
1599	API Error	Error Fingerprint not match:	12/18/2024, 07:59:15
1600	API Error	Error Fingerprint not match:	12/18/2024, 07:59:22
1601	API Error	Error Fingerprint not match:	12/18/2024, 08:37:16
1602	API Error	Error Fingerprint not match:	12/18/2024, 08:37:25
1603	API Error	Error Fingerprint not match:	12/18/2024, 09:53:39
1604	API Error	Error Fingerprint not match:	12/18/2024, 16:15:08
1605	API Error	Error Fingerprint not match:	12/18/2024, 18:04:54
1606	API Error	Error Fingerprint not match:	12/19/2024, 06:46:39
1607	API Error	Error Fingerprint not match:	12/19/2024, 06:47:16
1608	API Error	Error Fingerprint not match:	12/19/2024, 10:02:01
1609	API Error	Error Fingerprint not match:	12/19/2024, 14:53:15
1610	API Error	Error Fingerprint not match:	12/19/2024, 18:25:59
1611	API Error	Error Fingerprint not match:	12/19/2024, 19:37:52
1612	API Error	Error Fingerprint not match:	12/20/2024, 06:32:38
1613	API Error	Error Fingerprint not match:	12/20/2024, 08:06:10
1614	API Error	Error Fingerprint not match:	12/20/2024, 08:16:52
1615	API Error	Error Fingerprint not match:	12/20/2024, 08:17:29
1616	API Error	Error Fingerprint not match:	12/20/2024, 08:17:38
1617	API Error	Error Fingerprint not match:	12/20/2024, 08:21:06
1618	API Error	Error Fingerprint not match:	12/20/2024, 08:27:37
1619	API Error	Error Fingerprint not match:	12/20/2024, 09:09:06
1620	API Error	Error Fingerprint not match:	12/20/2024, 09:58:16
1621	API Error	Error Fingerprint not match:	12/20/2024, 09:58:25
1622	API Error	Error Fingerprint not match:	12/20/2024, 14:16:22
1623	API Error	Error Fingerprint not match:	12/20/2024, 14:16:31
1624	API Error	Error Fingerprint not match:	12/20/2024, 14:16:40
1625	API Error	Employee not found.	12/20/2024, 21:02:21
1626	API Error	Error Fingerprint not match:	01/15/2025, 06:12:12
1627	API Error	Error Fingerprint not match:	01/15/2025, 06:39:52
1628	API Error	Error Fingerprint not match:	01/15/2025, 07:46:02
1629	API Error	Error Fingerprint not match:	01/15/2025, 07:46:10
1630	API Error	Error Fingerprint not match:	01/15/2025, 07:46:23
1631	API Error	Error Fingerprint not match:	01/15/2025, 08:23:08
1632	API Error	Employee not found.	01/15/2025, 08:23:11
1633	API Error	Error Fingerprint not match:	01/15/2025, 08:33:00
1634	API Error	Error Fingerprint not match:	01/15/2025, 08:33:08
1635	API Error	Error Fingerprint not match:	01/15/2025, 08:33:15
1636	API Error	Error Fingerprint not match:	01/15/2025, 08:33:23
1637	API Error	Error Fingerprint not match:	01/15/2025, 08:33:29
1638	API Error	Error Fingerprint not match:	01/15/2025, 08:33:36
1639	API Error	Error Fingerprint not match:	01/15/2025, 08:33:42
1640	API Error	Error Fingerprint not match:	01/15/2025, 08:33:50
1641	API Error	Error Fingerprint not match:	01/15/2025, 08:33:59
1642	API Error	Error Fingerprint not match:	01/15/2025, 08:34:10
1643	API Error	Error Fingerprint not match:	01/15/2025, 08:34:26
1644	API Error	Error Fingerprint not match:	01/15/2025, 08:34:32
1645	API Error	Employee not found.	01/15/2025, 08:34:35
1646	API Error	Error Fingerprint not match:	01/15/2025, 08:34:44
1647	API Error	Error Fingerprint not match:	01/15/2025, 08:34:51
1648	API Error	Error Fingerprint not match:	01/15/2025, 08:34:57
1649	API Error	Error Fingerprint not match:	01/15/2025, 08:35:03
1650	API Error	Error Fingerprint not match:	01/15/2025, 09:10:10
1651	API Error	Error Fingerprint not match:	01/15/2025, 09:17:28
1652	API Error	Error Fingerprint not match:	01/15/2025, 10:09:48
1653	API Error	Error Fingerprint not match:	01/15/2025, 10:09:57
1654	API Error	Error Fingerprint not match:	01/15/2025, 10:10:04
1655	API Error	Error Fingerprint not match:	01/15/2025, 10:10:13
1656	API Error	Error Fingerprint not match:	01/15/2025, 12:33:49
1657	API Error	Error Fingerprint not match:	01/15/2025, 12:39:51
1658	API Error	Error Fingerprint not match:	01/15/2025, 12:44:09
1659	API Error	Error Fingerprint not match:	01/15/2025, 12:44:20
1660	API Error	Error Fingerprint not match:	01/15/2025, 14:56:27
1661	API Error	Error Fingerprint not match:	01/15/2025, 18:30:03
1662	API Error	Error Fingerprint not match:	01/16/2025, 07:08:04
1663	API Error	Error Fingerprint not match:	01/16/2025, 08:07:03
1664	API Error	Error Fingerprint not match:	01/16/2025, 08:07:12
1665	API Error	Error Fingerprint not match:	01/16/2025, 09:16:28
1666	API Error	Error Fingerprint not match:	01/16/2025, 09:16:37
1667	API Error	Error Fingerprint not match:	01/16/2025, 09:30:52
1668	API Error	Error Fingerprint not match:	01/16/2025, 09:31:00
1669	API Error	Error Fingerprint not match:	01/16/2025, 13:08:53
1670	API Error	Error Fingerprint not match:	01/17/2025, 07:51:46
1671	API Error	Error Fingerprint not match:	01/17/2025, 07:51:58
1672	API Error	Error Fingerprint not match:	01/17/2025, 07:52:05
1673	API Error	Error Fingerprint not match:	01/17/2025, 07:52:13
1674	API Error	Error Fingerprint not match:	01/17/2025, 08:16:20
1675	API Error	Error Fingerprint not match:	01/17/2025, 09:03:39
1676	API Error	Error Fingerprint not match:	01/20/2025, 06:58:58
1677	API Error	Employee has no fingerprint.	01/20/2025, 14:26:17
1678	API Error	Employee has no fingerprint.	01/20/2025, 14:48:06
1679	API Error	Error Fingerprint not match:	01/23/2025, 17:34:46
1680	API Error	Error Fingerprint not match:	01/24/2025, 10:38:08
1681	API Error	Error Fingerprint not match:	01/24/2025, 10:38:16
1682	API Error	Error Fingerprint not match:	01/24/2025, 12:26:41
1683	API Error	Error Fingerprint not match:	01/24/2025, 12:31:54
1684	API Error	Error Fingerprint not match:	01/24/2025, 12:42:31
1685	API Error	Error Fingerprint not match:	01/24/2025, 13:12:38
1686	API Error	Error Fingerprint not match:	01/27/2025, 10:23:58
1687	API Error	Error Fingerprint not match:	01/27/2025, 10:24:08
1688	API Error	Error Fingerprint not match:	01/27/2025, 10:24:19
1689	API Error	Error Fingerprint not match:	01/27/2025, 10:24:26
1690	API Error	Error Fingerprint not match:	01/27/2025, 10:24:40
1691	API Error	Error Fingerprint not match:	01/27/2025, 18:09:09
1692	API Error	Employee not found.	01/27/2025, 18:09:12
1693	API Error	Error Fingerprint not match:	01/28/2025, 12:20:10
1694	API Error	Error Fingerprint not match:	01/28/2025, 12:20:20
1695	API Error	Error Fingerprint not match:	01/28/2025, 12:59:59
1696	API Error	Error Fingerprint not match:	01/28/2025, 13:00:08
1697	API Error	Error Fingerprint not match:	01/28/2025, 13:02:37
1698	API Error	Error Fingerprint not match:	01/28/2025, 13:02:46
1699	API Error	Error Fingerprint not match:	01/30/2025, 06:51:01
1700	API Error	Error Fingerprint not match:	01/30/2025, 06:51:08
1701	API Error	Error Fingerprint not match:	01/30/2025, 06:51:24
1702	API Error	Error Fingerprint not match:	02/03/2025, 21:18:35
1703	API Error	Error Fingerprint not match:	02/03/2025, 21:18:43
1704	API Error	Error Fingerprint not match:	02/04/2025, 07:25:44
1705	API Error	Error Fingerprint not match:	02/04/2025, 07:26:05
1706	API Error	Error Fingerprint not match:	02/17/2025, 10:48:30
1707	API Error	Error Fingerprint not match:	02/17/2025, 15:11:51
1708	API Error	Error Fingerprint not match:	02/17/2025, 15:11:59
1709	API Error	Error Fingerprint not match:	02/17/2025, 15:12:07
1710	API Error	Error Fingerprint not match:	02/17/2025, 15:12:15
1711	API Error	Error Fingerprint not match:	02/18/2025, 15:07:29
1712	API Error	Error Fingerprint not match:	02/18/2025, 15:07:36
1713	API Error	Error Fingerprint not match:	02/18/2025, 15:07:43
1714	API Error	Error Fingerprint not match:	02/18/2025, 15:07:50
1715	API Error	Error Fingerprint not match:	02/18/2025, 15:07:57
1716	API Error	Error Fingerprint not match:	02/18/2025, 16:22:47
1717	API Error	Error Fingerprint not match:	03/24/2025, 11:09:22
1718	API Error	Error Fingerprint not match:	03/24/2025, 11:09:57
1719	API Error	Error Fingerprint not match:	04/02/2025, 11:19:15
1720	API Error	Error Fingerprint not match:	04/02/2025, 13:02:43
1721	API Error	Error Fingerprint not match:	04/02/2025, 13:04:26
1722	API Error	Error Fingerprint not match:	04/02/2025, 17:09:23
1723	API Error	Error Fingerprint not match:	04/02/2025, 17:22:36
1724	API Error	Error Fingerprint not match:	04/03/2025, 06:24:30
1725	API Error	Error Fingerprint not match:	04/03/2025, 06:24:38
1726	API Error	Error Fingerprint not match:	04/03/2025, 06:24:51
1727	API Error	Error Fingerprint not match:	04/03/2025, 06:25:02
1728	API Error	Error Fingerprint not match:	04/03/2025, 06:26:19
1729	API Error	Error Fingerprint not match:	04/03/2025, 08:03:36
1730	API Error	Employee has no fingerprint.	04/03/2025, 08:08:27
1731	API Error	Error Fingerprint not match:	04/03/2025, 08:40:08
1732	API Error	Error Fingerprint not match:	04/03/2025, 08:40:23
1733	API Error	Error Fingerprint not match:	04/03/2025, 08:40:33
1734	API Error	Error Fingerprint not match:	04/03/2025, 08:52:31
1735	API Error	Error Fingerprint not match:	04/03/2025, 08:52:44
1736	API Error	Error Fingerprint not match:	04/03/2025, 08:52:52
1737	API Error	Error Fingerprint not match:	04/03/2025, 08:53:01
1738	API Error	Error Fingerprint not match:	04/03/2025, 09:32:13
1739	API Error	Error Fingerprint not match:	04/03/2025, 12:33:55
1740	API Error	Error Fingerprint not match:	04/03/2025, 12:34:08
1741	API Error	Error Fingerprint not match:	04/03/2025, 12:49:43
1742	API Error	Error Fingerprint not match:	04/03/2025, 13:04:31
1743	API Error	Error Fingerprint not match:	04/03/2025, 16:28:22
1744	API Error	Employee has no fingerprint.	05/05/2025, 16:10:03
1745	API Error	Employee has no fingerprint.	05/05/2025, 16:10:24
1746	API Error	Employee has no fingerprint.	05/05/2025, 16:11:43
\.


--
-- TOC entry 3375 (class 0 OID 491528)
-- Dependencies: 218
-- Data for Name: _dblogstotal; Type: TABLE DATA; Schema: public; Owner: default
--

COPY public._dblogstotal (id, loginstoday, notlogin, date) FROM stdin;
2	21	31	2024-05-01
3	42	17	2024-05-02
4	46	13	2024-05-03
5	39	26	2024-05-04
6	11	53	2024-05-05
7	37	19	2024-05-06
8	48	32	2024-05-07
9	36	41	2024-05-08
86	14	64	2024-09-24
34	1	67	2024-07-10
57	1	62	2024-08-15
35	0	68	2024-07-11
51	2	60	2024-08-07
17	36	41	2024-04-10
144	16	62	2024-12-18
58	0	63	2024-08-16
26	0	68	2024-06-07
60	0	62	2024-08-19
27	2	66	2024-06-10
28	0	68	2024-06-11
72	0	76	2024-09-04
76	0	76	2024-09-10
59	0	63	2024-08-18
53	6	56	2024-08-09
83	0	79	2024-09-19
56	0	64	2024-08-14
63	2	66	2024-08-22
21	0	68	2024-05-11
119	5	88	2024-10-30
103	0	93	2024-10-09
22	0	68	2024-05-14
80	0	77	2024-09-16
23	4	64	2024-05-16
64	0	68	2024-08-26
54	1	61	2024-08-12
24	0	68	2024-05-22
29	1	67	2024-07-01
30	2	66	2024-07-02
112	5	88	2024-10-18
79	1	76	2024-09-13
41	1	67	2024-07-25
36	2	66	2024-07-15
126	4	87	2024-11-20
114	0	93	2024-10-21
43	0	68	2024-07-29
128	7	73	2024-11-27
12	4	65	2024-05-09
37	0	68	2024-07-18
73	1	75	2024-09-05
38	0	68	2024-07-19
153	0	103	2025-03-25
47	1	62	2024-08-02
88	0	80	2024-09-26
48	0	63	2024-08-04
44	0	68	2024-07-30
115	3	90	2024-10-24
108	0	93	2024-10-14
81	0	80	2024-09-17
65	0	68	2024-08-27
49	0	63	2024-08-05
46	0	67	2024-08-01
50	0	63	2024-08-06
145	0	78	2024-12-27
55	1	61	2024-08-13
93	2	82	2024-09-30
52	0	64	2024-08-08
42	3	66	2024-07-26
39	2	66	2024-07-23
120	0	93	2024-10-31
101	0	93	2024-10-08
62	7	61	2024-08-21
70	0	76	2024-09-02
74	0	76	2024-09-06
25	0	68	2024-06-03
85	4	74	2024-09-23
66	14	62	2024-08-28
61	0	65	2024-08-20
31	2	66	2024-07-03
71	0	76	2024-09-03
45	4	64	2024-07-31
32	2	66	2024-07-04
20	8	60	2024-05-10
82	1	79	2024-09-18
116	0	93	2024-10-25
136	0	75	2024-12-04
98	2	91	2024-10-04
95	6	86	2024-10-02
40	0	68	2024-07-24
33	2	66	2024-07-05
77	4	73	2024-09-11
117	0	93	2024-10-28
100	0	93	2024-10-06
130	14	62	2024-11-29
118	1	92	2024-10-29
97	12	79	2024-10-03
94	20	75	2024-10-01
89	4	76	2024-09-27
104	9	84	2024-10-10
78	0	77	2024-09-12
84	12	57	2024-09-20
67	5	71	2024-08-29
68	0	76	2024-08-30
69	0	76	2024-09-01
129	4	76	2024-11-28
131	1	75	2024-12-01
75	0	76	2024-09-09
109	2	91	2024-10-15
147	3	80	2025-01-20
110	0	93	2024-10-17
87	0	80	2024-09-25
90	0	79	2024-09-28
159	0	103	2025-03-30
91	0	79	2024-09-29
122	0	93	2024-11-04
106	2	91	2024-10-11
139	0	76	2024-12-09
123	4	89	2024-11-07
107	0	93	2024-10-13
99	0	93	2024-10-07
174	0	106	2025-05-06
124	1	92	2024-11-12
168	0	112	2025-04-09
149	2	84	2025-01-23
173	0	106	2025-05-05
133	0	75	2024-12-02
134	0	75	2024-12-03
125	5	88	2024-11-18
138	12	63	2024-12-06
140	0	76	2024-12-10
166	0	112	2025-04-04
162	8	104	2025-04-02
142	2	74	2024-12-11
143	20	57	2024-12-12
155	0	103	2025-03-26
151	0	103	2025-03-24
156	0	103	2025-03-27
160	0	103	2025-04-01
157	0	103	2025-03-28
170	0	112	2025-04-10
164	17	95	2025-04-03
167	0	112	2025-04-06
171	0	112	2025-04-13
172	0	112	2025-04-14
\.


--
-- TOC entry 3392 (class 0 OID 0)
-- Dependencies: 221
-- Name: _dbaccesslog_id_seq; Type: SEQUENCE SET; Schema: public; Owner: default
--

SELECT pg_catalog.setval('public._dbaccesslog_id_seq', 2105, true);


--
-- TOC entry 3393 (class 0 OID 0)
-- Dependencies: 223
-- Name: _dbadmin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: default
--

SELECT pg_catalog.setval('public._dbadmin_id_seq', 8, true);


--
-- TOC entry 3394 (class 0 OID 0)
-- Dependencies: 215
-- Name: _dbemployee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: default
--

SELECT pg_catalog.setval('public._dbemployee_id_seq', 1097, true);


--
-- TOC entry 3395 (class 0 OID 0)
-- Dependencies: 219
-- Name: _dberror_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: default
--

SELECT pg_catalog.setval('public._dberror_log_id_seq', 1746, true);


--
-- TOC entry 3396 (class 0 OID 0)
-- Dependencies: 217
-- Name: _dblogstotal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: default
--

SELECT pg_catalog.setval('public._dblogstotal_id_seq', 174, true);


--
-- TOC entry 3215 (class 2606 OID 491535)
-- Name: _dblogstotal PK_1a0f215e225de485d6cc11819ff; Type: CONSTRAINT; Schema: public; Owner: default
--

ALTER TABLE ONLY public._dblogstotal
    ADD CONSTRAINT "PK_1a0f215e225de485d6cc11819ff" PRIMARY KEY (id);


--
-- TOC entry 3223 (class 2606 OID 3997709)
-- Name: _dbadmin PK_aafdc29763117d8e4c2f03e141b; Type: CONSTRAINT; Schema: public; Owner: default
--

ALTER TABLE ONLY public._dbadmin
    ADD CONSTRAINT "PK_aafdc29763117d8e4c2f03e141b" PRIMARY KEY (id);


--
-- TOC entry 3219 (class 2606 OID 3391496)
-- Name: _dberror_log PK_e66c5f72bea48f60d4be155c7ce; Type: CONSTRAINT; Schema: public; Owner: default
--

ALTER TABLE ONLY public._dberror_log
    ADD CONSTRAINT "PK_e66c5f72bea48f60d4be155c7ce" PRIMARY KEY (id);


--
-- TOC entry 3213 (class 2606 OID 164050)
-- Name: _dbemployee PK_ece3de3563d87a6a0b6fafc20de; Type: CONSTRAINT; Schema: public; Owner: default
--

ALTER TABLE ONLY public._dbemployee
    ADD CONSTRAINT "PK_ece3de3563d87a6a0b6fafc20de" PRIMARY KEY (id);


--
-- TOC entry 3221 (class 2606 OID 3391513)
-- Name: _dbaccesslog PK_efa0ef24a810fab7376c46dfa83; Type: CONSTRAINT; Schema: public; Owner: default
--

ALTER TABLE ONLY public._dbaccesslog
    ADD CONSTRAINT "PK_efa0ef24a810fab7376c46dfa83" PRIMARY KEY (id);


--
-- TOC entry 3225 (class 2606 OID 4243458)
-- Name: _dbadmin UQ_4d7e871c7b5224038977b5ccabe; Type: CONSTRAINT; Schema: public; Owner: default
--

ALTER TABLE ONLY public._dbadmin
    ADD CONSTRAINT "UQ_4d7e871c7b5224038977b5ccabe" UNIQUE (email);


--
-- TOC entry 3217 (class 2606 OID 491543)
-- Name: _dblogstotal UQ_b4db6d0426364a9cd456eafada8; Type: CONSTRAINT; Schema: public; Owner: default
--

ALTER TABLE ONLY public._dblogstotal
    ADD CONSTRAINT "UQ_b4db6d0426364a9cd456eafada8" UNIQUE (date);


--
-- TOC entry 3227 (class 2606 OID 3997711)
-- Name: _dbadmin UQ_f4c62cf79e66f9cc80901e225ee; Type: CONSTRAINT; Schema: public; Owner: default
--

ALTER TABLE ONLY public._dbadmin
    ADD CONSTRAINT "UQ_f4c62cf79e66f9cc80901e225ee" UNIQUE (username);


--
-- TOC entry 3228 (class 2606 OID 3391515)
-- Name: _dbaccesslog FK_7c4bd03105d915de245be936b26; Type: FK CONSTRAINT; Schema: public; Owner: default
--

ALTER TABLE ONLY public._dbaccesslog
    ADD CONSTRAINT "FK_7c4bd03105d915de245be936b26" FOREIGN KEY ("employeeId") REFERENCES public._dbemployee(id);


--
-- TOC entry 2062 (class 826 OID 32769)
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: cloud_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE cloud_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO neon_superuser WITH GRANT OPTION;


--
-- TOC entry 2061 (class 826 OID 32768)
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: cloud_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE cloud_admin IN SCHEMA public GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLES TO neon_superuser WITH GRANT OPTION;


-- Completed on 2025-05-06 09:22:06

--
-- PostgreSQL database dump complete
--

-- psql -U postgres -d eingress_local -f vercel_backup.sql

-- DATABASE_URL=postgresql://postgres:ronbryll%40localhost@localhost:5432/eingress_local

-- TypeOrmModule in app.module.ts(backend)
-- type: 'postgres',
-- host: 'localhost',
-- port: 5432,
-- username: 'postgres',
-- password: 'ronbryll@localhost', // Make sure this is correct
-- database: 'eingress_local',

-- Verify the database in psql
-- \dt
-- SELECT * FROM public._dbaccesslog LIMIT 10;

-- environment.ts and environment.prod.ts(frontend)
-- baseURL: 'http://192.168.254.107:3000/'

-- user.service.ts(frontend)
-- import { environment } from '../environments/environment';

-- main.ts(backend)
-- app.enableCors({
--     origin: ['http://localhost:4200', 'http://192.168.254.107:4200'], // Allow both origins
--     credentials: true, // If you need to handle authentication headers or cookies
--   });  // Enable CORS

