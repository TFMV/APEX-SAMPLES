/*  VERSION 2

The "insert into" statements below populate some of the tables
in the TEAMS database.  Some tables are not populated.

****  NOTE!!  **** 
The script to create triggers should be run before running 
this script.  Triggers must be in place so the primary key values 
are populated as the rows are inserted.

*/


/*  
Insert data into the TEAMS table.
The project ID is not populated yet. 
Projects will be assigned to teams after APEX forms
are created.
*/

INSERT INTO teams 
  (team_name)
  VALUES ('Database Designers');

INSERT INTO teams
  (team_name)
  VALUES ('Software Consultants');

INSERT INTO teams
  (team_name)
  VALUES ('IT Professionals');

INSERT INTO teams
  (team_name)
  VALUES ('Technology Solutions');

INSERT INTO teams
  (team_name)
  VALUES ('DBMS Associates');

INSERT INTO teams
  (team_name)
  VALUES ('System Designers');

INSERT INTO teams
  (team_name)
  VALUES ('Developers, Inc.');

INSERT INTO teams
  (team_name)
  VALUES ('Digital Solutions');


/*  
Insert and update data into the STUDENTS table
*/


INSERT INTO students
  (stdfname, stdlname, stdmajor, stduserid)
  VALUES ('ADRIENNE','KRY','ISYS','AKRY');

-- Assign student to a team. 
UPDATE students
  set std_teamid = (select teamid from teams where team_name = 'Digital Solutions')
WHERE stduserid = 'AKRY';

INSERT INTO students
  (stdfname, stdlname, stdmajor, stduserid)
  VALUES ('BARBARA','KRY','ISYS','BKRY');

-- Assign student to a team. 
UPDATE students
  set std_teamid = (select teamid from teams where team_name = 'IT Professionals')
WHERE stduserid = 'BKRY';


INSERT INTO students
  (stdfname, stdlname, stdmajor, stduserid)
  VALUES ('BOB','SMITH','ISYS','BSMITH');

-- Assign student to a team. 
UPDATE students
  set std_teamid = (select teamid from teams where team_name = 'System Designers')
WHERE stduserid = 'BSMITH';

INSERT INTO students
  (stdfname, stdlname, stdmajor, stduserid)
  VALUES ('CARLOS','ALVAREZ','ISYS','CALVAR');

-- Assign student to a team. 
UPDATE students
  set std_teamid = (select teamid from teams where team_name = 'System Designers')
WHERE stduserid = 'CALVAR';


INSERT INTO students
  (stdfname, stdlname, stdmajor, stduserid)
  VALUES ('CARLOS','MOYA','ISYS','CMOYA');

-- Assign student to a team. 
UPDATE students
  set std_teamid = (select teamid from teams where team_name = 'Technology Solutions')
WHERE stduserid = 'CMOYA';

INSERT INTO students
  (stdfname, stdlname, stdmajor, stduserid)
  VALUES ('CARLA','SANCHEZ','ISYS','CSANCH');

-- The student above is not assigned to a team.

INSERT INTO students
  (stdfname, stdlname, stdmajor, stduserid)
  VALUES ('DON','OLIVER','ISYS','DOLIVE');

-- Assign student to a team. 
UPDATE students
  set std_teamid = (select teamid from teams where team_name = 'System Designers')
WHERE stduserid = 'DOLIVE';

INSERT INTO students
  (stdfname, stdlname, stdmajor, stduserid)
  VALUES ('YURI','ANTIPOV','ISYS','YANTIP');

-- Assign student to a team. 
UPDATE students
  set std_teamid = (select teamid from teams where team_name = 'Developers, Inc.')
WHERE stduserid = 'YANTIP';

INSERT INTO students
  (stdfname, stdlname, stdmajor, stduserid)
  VALUES ('KARI','MELENDREZ','ISYS','KMELEN');

-- Assign student to a team. 
UPDATE students
  set std_teamid = (select teamid from teams where team_name = 'IT Professionals')
WHERE stduserid = 'KMELEN';


INSERT INTO students
  (stdfname, stdlname, stdmajor, stduserid)
  VALUES ('SARA','DAVIS','ISYS','SDAVIS');

-- Assign student to a team. 
UPDATE students
  set std_teamid = (select teamid from teams where team_name = 'IT Professionals')
WHERE stduserid = 'SDAVIS';


INSERT INTO students
  (stdfname, stdlname, stdmajor, stduserid)
  VALUES ('PETER','CHEN','ISYS','PCHEN');

-- Assign student to a team. 
UPDATE students
  set std_teamid = (select teamid from teams where team_name = 'Technology Solutions')
WHERE stduserid = 'PCHEN';

INSERT INTO students
  (stdfname, stdlname, stdmajor, stduserid)
  VALUES ('TARIQ','HASHEMI','ISYS','THASHE');

-- Assign student to a team. 
UPDATE students
  set std_teamid = (select teamid from teams where team_name = 'Technology Solutions')
WHERE stduserid = 'THASHE';

INSERT INTO students
  (stdfname, stdlname, stdmajor, stduserid)
  VALUES ('TERESA','ROBERTS','ACCT','TROBER');

-- The student above is not assigned to a team. 


INSERT INTO students
  (stdfname, stdlname, stdmajor, stduserid)
  VALUES ('STEPHANIE','AGASSI','MKTG','SAGA');

-- Assign student to a team. 
UPDATE students
  set std_teamid = (select teamid from teams where team_name = 'IT Professionals')
WHERE stduserid = 'SAGA';


INSERT INTO students
  (stdfname, stdlname, stdmajor, stduserid)
  VALUES ('RYAN','FEDERER','COMPSC','RFED');

-- Assign student to a team. 
UPDATE students
  set std_teamid = (select teamid from teams where team_name = 'IT Professionals')
WHERE stduserid = 'RFED';


/*  
Insert data into the EVAL_ITEMS table  
*/

INSERT INTO eval_items 
  (eval_descrip, eval_item_code)
 VALUES('Reliably meets deadlines.','RELIABLE');
INSERT INTO eval_items 
  (eval_descrip, eval_item_code)
 VALUES('Quality and amount of work done.','CONTRIBUTE');
INSERT INTO eval_items 
  (eval_descrip, eval_item_code)
 VALUES('Works well with others.','INTERPERS');
INSERT INTO eval_items 
  (eval_descrip, eval_item_code)
 VALUES('Behaves professionally.','PROFESSIONAL');



/*  
Data is inserted into the EVALUATIONS and eval_item_scores tables.
*/

/* ***** one evaluation and its evaluation item scores */
--01
INSERT INTO evaluations
  (evalsemester, evalyear, evaluatorID, evaluateeID)
  VALUES ('Fall',2012
	, (select stdid from students
	where stduserid = 'THASHE')
	, (select stdid from students
	where stduserid = 'CMOYA')
	);

INSERT INTO eval_item_scores 
  (eval_id, eval_item_id, score)
  VALUES(
	(select eval_id from evaluations
	where evaluatorID = (select stdid from students
		where stduserid = 'THASHE')
	and evaluateeID = (select stdid from students
		where stduserid = 'CMOYA'))
	, (select eval_item_id from eval_items
	where eval_item_code = 'RELIABLE')
	,80);

INSERT INTO eval_item_scores
  (eval_id, eval_item_id, score)
  VALUES(
	(select eval_id from evaluations
	where evaluatorID = (select stdid from students
		where stduserid = 'THASHE')
	and evaluateeID = (select stdid from students
		where stduserid = 'CMOYA'))
	, (select eval_item_id from eval_items
	where eval_item_code = 'CONTRIBUTE')
 	,75);

INSERT INTO eval_item_scores
  (eval_id, eval_item_id, score)
  VALUES(
	(select eval_id from evaluations
	where evaluatorID = (select stdid from students
		where stduserid = 'THASHE')
	and evaluateeID = (select stdid from students
		where stduserid = 'CMOYA'))
	, (select eval_item_id from eval_items
	where eval_item_code = 'INTERPERS')
	,85);

/* ***** */

/* ***** one evaluation and its evaluation item scores */
--02
INSERT INTO evaluations
  (evalsemester, evalyear, evaluatorID, evaluateeID)
  VALUES ('Fall',2012
	, (select stdid from students
	where stduserid = 'THASHE')
	, (select stdid from students
	where stduserid = 'PCHEN')
	);

INSERT INTO eval_item_scores
  (eval_id, eval_item_id, score)
  VALUES(
	(select eval_id from evaluations
	where evaluatorID = (select stdid from students
		where stduserid = 'THASHE')
	and evaluateeID = (select stdid from students
		where stduserid = 'PCHEN'))
	, (select eval_item_id from eval_items
	where eval_item_code = 'RELIABLE')
	,95);

INSERT INTO eval_item_scores
  (eval_id, eval_item_id, score)
  VALUES(
	(select eval_id from evaluations
	where evaluatorID = (select stdid from students
		where stduserid = 'THASHE')
	and evaluateeID = (select stdid from students
		where stduserid = 'PCHEN'))
	, (select eval_item_id from eval_items
	where eval_item_code = 'CONTRIBUTE')
	,95);

INSERT INTO eval_item_scores
  (eval_id, eval_item_id, score)
  VALUES(
	(select eval_id from evaluations
	where evaluatorID = (select stdid from students
		where stduserid = 'THASHE')
	and evaluateeID = (select stdid from students
		where stduserid = 'PCHEN'))
	, (select eval_item_id from eval_items
	where eval_item_code = 'INTERPERS')
	,100);


/* ***** */


/* ***** one evaluation and its evaluation item scores */
--03

INSERT INTO evaluations
  (evalsemester, evalyear, evaluatorID, evaluateeID)
  VALUES ('Spring',2012
	, (select stdid from students
	where stduserid = 'BKRY')
	, (select stdid from students
	where stduserid = 'KMELEN')
	);


INSERT INTO eval_item_scores
  (eval_id, eval_item_id, score)
  VALUES(
	(select eval_id from evaluations
	where evaluatorID = (select stdid from students
		where stduserid = 'BKRY')
	and evaluateeID = (select stdid from students
		where stduserid = 'KMELEN'))
	, (select eval_item_id from eval_items
	where eval_item_code = 'RELIABLE')
	,85);


INSERT INTO eval_item_scores
  (eval_id, eval_item_id, score)
  VALUES(
	(select eval_id from evaluations
	where evaluatorID = (select stdid from students
		where stduserid = 'BKRY')
	and evaluateeID = (select stdid from students
		where stduserid = 'KMELEN'))
	, (select eval_item_id from eval_items
	where eval_item_code = 'CONTRIBUTE')
	,89);

INSERT INTO eval_item_scores
  (eval_id, eval_item_id, score)
  VALUES(
	(select eval_id from evaluations
	where evaluatorID = (select stdid from students
		where stduserid = 'BKRY')
	and evaluateeID = (select stdid from students
		where stduserid = 'KMELEN'))
	, (select eval_item_id from eval_items
	where eval_item_code = 'INTERPERS')
	,95);

/* ***** */


/* ***** one evaluation and its evaluation item scores */
--04

INSERT INTO evaluations
  (evalsemester, evalyear, evaluatorID, evaluateeID)
  VALUES ('Spring',2012
	, (select stdid from students
	where stduserid = 'BKRY')
	, (select stdid from students
	where stduserid = 'SDAVIS')
	);


INSERT INTO eval_item_scores
  (eval_id, eval_item_id, score)
  VALUES(
	(select eval_id from evaluations
	where evaluatorID = (select stdid from students
		where stduserid = 'BKRY')
	and evaluateeID = (select stdid from students
		where stduserid = 'SDAVIS'))
	, (select eval_item_id from eval_items
	where eval_item_code = 'RELIABLE')
	,100);


INSERT INTO eval_item_scores
  (eval_id, eval_item_id, score)
  VALUES(
	(select eval_id from evaluations
	where evaluatorID = (select stdid from students
		where stduserid = 'BKRY')
	and evaluateeID = (select stdid from students
		where stduserid = 'SDAVIS'))
	, (select eval_item_id from eval_items
	where eval_item_code = 'CONTRIBUTE')
	,100);


INSERT INTO eval_item_scores
  (eval_id, eval_item_id, score)
  VALUES(
	(select eval_id from evaluations
	where evaluatorID = (select stdid from students
		where stduserid = 'BKRY')
	and evaluateeID = (select stdid from students
		where stduserid = 'SDAVIS'))
	, (select eval_item_id from eval_items
	where eval_item_code = 'INTERPERS')
	,100);

/* ***** */



/* ***** one evaluation and its evaluation item scores */
--05
INSERT INTO evaluations
  (evalsemester, evalyear, evaluatorID, evaluateeID)
  VALUES ('Spring',2012
	, (select stdid from students
	where stduserid = 'KMELEN')
	, (select stdid from students
	where stduserid = 'BKRY')
	);


INSERT INTO eval_item_scores
  (eval_id, eval_item_id, score)
  VALUES(
	(select eval_id from evaluations
	where evaluatorID = (select stdid from students
		where stduserid = 'KMELEN')
	and evaluateeID = (select stdid from students
		where stduserid = 'BKRY'))
	, (select eval_item_id from eval_items
	where eval_item_code = 'RELIABLE')
	,70);

INSERT INTO eval_item_scores
  (eval_id, eval_item_id, score)
  VALUES(
	(select eval_id from evaluations
	where evaluatorID = (select stdid from students
		where stduserid = 'KMELEN')
	and evaluateeID = (select stdid from students
		where stduserid = 'BKRY'))
	, (select eval_item_id from eval_items
	where eval_item_code = 'CONTRIBUTE')
	,80);


INSERT INTO eval_item_scores
  (eval_id, eval_item_id, score)
  VALUES(
	(select eval_id from evaluations
	where evaluatorID = (select stdid from students
		where stduserid = 'KMELEN')
	and evaluateeID = (select stdid from students
		where stduserid = 'BKRY'))
	, (select eval_item_id from eval_items
	where eval_item_code = 'INTERPERS')
	,85);

/* ***** */


/* ***** one evaluation and its evaluation item scores */
--06
INSERT INTO evaluations
  (evalsemester, evalyear, evaluatorID, evaluateeID)
  VALUES ('Spring',2012
	, (select stdid from students
	where stduserid = 'SDAVIS')
	, (select stdid from students
	where stduserid = 'BKRY')
	);

INSERT INTO eval_item_scores
  (eval_id, eval_item_id, score)
  VALUES(
	(select eval_id from evaluations
	where evaluatorID = (select stdid from students
		where stduserid = 'SDAVIS')
	and evaluateeID = (select stdid from students
		where stduserid = 'BKRY'))
	, (select eval_item_id from eval_items
	where eval_item_code = 'RELIABLE')
	,95);

INSERT INTO eval_item_scores
  (eval_id, eval_item_id, score)
  VALUES(
	(select eval_id from evaluations
	where evaluatorID = (select stdid from students
		where stduserid = 'SDAVIS')
	and evaluateeID = (select stdid from students
		where stduserid = 'BKRY'))
	, (select eval_item_id from eval_items
	where eval_item_code = 'CONTRIBUTE')
	,90);


INSERT INTO eval_item_scores
  (eval_id, eval_item_id, score)
  VALUES(
	(select eval_id from evaluations
	where evaluatorID = (select stdid from students
		where stduserid = 'SDAVIS')
	and evaluateeID = (select stdid from students
		where stduserid = 'BKRY'))
	, (select eval_item_id from eval_items
	where eval_item_code = 'INTERPERS')
	,90);

/* ***** */


/* ***** one evaluation and its evaluation item scores */
--07
INSERT INTO evaluations
  (evalsemester, evalyear, evaluatorID, evaluateeID)
  VALUES ('Spring',2012
	, (select stdid from students
	where stduserid = 'SDAVIS')
	, (select stdid from students
	where stduserid = 'KMELEN')
	);

INSERT INTO eval_item_scores
  (eval_id, eval_item_id, score)
  VALUES(
	(select eval_id from evaluations
	where evaluatorID = (select stdid from students
		where stduserid = 'SDAVIS')
	and evaluateeID = (select stdid from students
		where stduserid = 'KMELEN'))
	, (select eval_item_id from eval_items
	where eval_item_code = 'RELIABLE')
	,95);

INSERT INTO eval_item_scores
  (eval_id, eval_item_id, score)
  VALUES(
	(select eval_id from evaluations
	where evaluatorID = (select stdid from students
		where stduserid = 'SDAVIS')
	and evaluateeID = (select stdid from students
		where stduserid = 'KMELEN'))
	, (select eval_item_id from eval_items
	where eval_item_code = 'CONTRIBUTE')
	,95);


INSERT INTO eval_item_scores
  (eval_id, eval_item_id, score)
  VALUES(
	(select eval_id from evaluations
	where evaluatorID = (select stdid from students
		where stduserid = 'SDAVIS')
	and evaluateeID = (select stdid from students
		where stduserid = 'KMELEN'))
	, (select eval_item_id from eval_items
	where eval_item_code = 'INTERPERS')
	,85);

/* ***** */



/* ***** one evaluation and its evaluation item scores */
--08
INSERT INTO evaluations
  (evalsemester, evalyear, evaluatorID, evaluateeID)
  VALUES ('Fall',2012
	, (select stdid from students
	where stduserid = 'CALVAR')
	, (select stdid from students
	where stduserid = 'BSMITH')
	);


INSERT INTO eval_item_scores
  (eval_id, eval_item_id, score)
  VALUES(
	(select eval_id from evaluations
	where evaluatorID = (select stdid from students
		where stduserid = 'CALVAR')
	and evaluateeID = (select stdid from students
		where stduserid = 'BSMITH'))
	, (select eval_item_id from eval_items
	where eval_item_code = 'RELIABLE')
	,88);

INSERT INTO eval_item_scores
  (eval_id, eval_item_id, score)
  VALUES(
	(select eval_id from evaluations
	where evaluatorID = (select stdid from students
		where stduserid = 'CALVAR')
	and evaluateeID = (select stdid from students
		where stduserid = 'BSMITH'))
	, (select eval_item_id from eval_items
	where eval_item_code = 'CONTRIBUTE')
	,90);


INSERT INTO eval_item_scores
  (eval_id, eval_item_id, score)
  VALUES(
	(select eval_id from evaluations
	where evaluatorID = (select stdid from students
		where stduserid = 'CALVAR')
	and evaluateeID = (select stdid from students
		where stduserid = 'BSMITH'))
	, (select eval_item_id from eval_items
	where eval_item_code = 'INTERPERS')
	,95);


/* ***** */


/* ***** one evaluation and its evaluation item scores */
--09

INSERT INTO evaluations
  (evalsemester, evalyear, evaluatorID, evaluateeID)
  VALUES ('Fall',2012
	, (select stdid from students
	where stduserid = 'CALVAR')
	, (select stdid from students
	where stduserid = 'DOLIVE')
	);

INSERT INTO eval_item_scores
  (eval_id, eval_item_id, score)
  VALUES(
	(select eval_id from evaluations
	where evaluatorID = (select stdid from students
		where stduserid = 'CALVAR')
	and evaluateeID = (select stdid from students
		where stduserid = 'DOLIVE'))
	, (select eval_item_id from eval_items
	where eval_item_code = 'RELIABLE')
	,85);

INSERT INTO eval_item_scores
  (eval_id, eval_item_id, score)
  VALUES(
	(select eval_id from evaluations
	where evaluatorID = (select stdid from students
		where stduserid = 'CALVAR')
	and evaluateeID = (select stdid from students
		where stduserid = 'DOLIVE'))
	, (select eval_item_id from eval_items
	where eval_item_code = 'CONTRIBUTE')
	,85);

INSERT INTO eval_item_scores
  (eval_id, eval_item_id, score)
  VALUES(
	(select eval_id from evaluations
	where evaluatorID = (select stdid from students
		where stduserid = 'CALVAR')
	and evaluateeID = (select stdid from students
		where stduserid = 'DOLIVE'))
	, (select eval_item_id from eval_items
	where eval_item_code = 'INTERPERS')
	,80);


/* ***** */


/* ***** one evaluation and its evaluation item scores */
--10

INSERT INTO evaluations
  (evalsemester, evalyear, evaluatorID, evaluateeID)
  VALUES ('Fall',2012
	, (select stdid from students
	where stduserid = 'PCHEN')
	, (select stdid from students
	where stduserid = 'THASHE')
	);

INSERT INTO eval_item_scores
  (eval_id, eval_item_id, score)
  VALUES(
	(select eval_id from evaluations
	where evaluatorID = (select stdid from students
		where stduserid = 'PCHEN')
	and evaluateeID = (select stdid from students
		where stduserid = 'THASHE'))
	, (select eval_item_id from eval_items
	where eval_item_code = 'RELIABLE')
	,92);

INSERT INTO eval_item_scores
  (eval_id, eval_item_id, score)
  VALUES(
	(select eval_id from evaluations
	where evaluatorID = (select stdid from students
		where stduserid = 'PCHEN')
	and evaluateeID = (select stdid from students
		where stduserid = 'THASHE'))
	, (select eval_item_id from eval_items
	where eval_item_code = 'CONTRIBUTE')
	,98);


INSERT INTO eval_item_scores
  (eval_id, eval_item_id, score)
  VALUES(
	(select eval_id from evaluations
	where evaluatorID = (select stdid from students
		where stduserid = 'PCHEN')
	and evaluateeID = (select stdid from students
		where stduserid = 'THASHE'))
	, (select eval_item_id from eval_items
	where eval_item_code = 'INTERPERS')
	,90);


/* ***** */


/* ***** one evaluation and its evaluation item scores */
--11

INSERT INTO evaluations
  (evalsemester, evalyear, evaluatorID, evaluateeID)
  VALUES ('Fall',2012
	, (select stdid from students
	where stduserid = 'PCHEN')
	, (select stdid from students
	where stduserid = 'CMOYA')
	);

INSERT INTO eval_item_scores
  (eval_id, eval_item_id, score)
  VALUES(
	(select eval_id from evaluations
	where evaluatorID = (select stdid from students
		where stduserid = 'PCHEN')
	and evaluateeID = (select stdid from students
		where stduserid = 'CMOYA'))
	, (select eval_item_id from eval_items
	where eval_item_code = 'RELIABLE')
	,75);

INSERT INTO eval_item_scores
  (eval_id, eval_item_id, score)
  VALUES(
	(select eval_id from evaluations
	where evaluatorID = (select stdid from students
		where stduserid = 'PCHEN')
	and evaluateeID = (select stdid from students
		where stduserid = 'CMOYA'))
	, (select eval_item_id from eval_items
	where eval_item_code = 'CONTRIBUTE')
	,80);

INSERT INTO eval_item_scores
  (eval_id, eval_item_id, score)
  VALUES(
	(select eval_id from evaluations
	where evaluatorID = (select stdid from students
		where stduserid = 'PCHEN')
	and evaluateeID = (select stdid from students
		where stduserid = 'CMOYA'))
	, (select eval_item_id from eval_items
	where eval_item_code = 'INTERPERS')
	,70);


/* ***** */


/* ***** one evaluation and its evaluation item scores */
--12

INSERT INTO evaluations
  (evalsemester, evalyear, evaluatorID, evaluateeID)
  VALUES ('Fall',2012
	, (select stdid from students
	where stduserid = 'BSMITH')
	, (select stdid from students
	where stduserid = 'DOLIVE')
	);

INSERT INTO eval_item_scores
  (eval_id, eval_item_id, score)
  VALUES(
	(select eval_id from evaluations
	where evaluatorID = (select stdid from students
		where stduserid = 'BSMITH')
	and evaluateeID = (select stdid from students
		where stduserid = 'DOLIVE'))
	, (select eval_item_id from eval_items
	where eval_item_code = 'RELIABLE')
	,90);

INSERT INTO eval_item_scores
  (eval_id, eval_item_id, score)
  VALUES(
	(select eval_id from evaluations
	where evaluatorID = (select stdid from students
		where stduserid = 'BSMITH')
	and evaluateeID = (select stdid from students
		where stduserid = 'DOLIVE'))
	, (select eval_item_id from eval_items
	where eval_item_code = 'CONTRIBUTE')
	,92);


INSERT INTO eval_item_scores
  (eval_id, eval_item_id, score)
  VALUES(
	(select eval_id from evaluations
	where evaluatorID = (select stdid from students
		where stduserid = 'BSMITH')
	and evaluateeID = (select stdid from students
		where stduserid = 'DOLIVE'))
	, (select eval_item_id from eval_items
	where eval_item_code = 'INTERPERS')
	,95);


/* ***** */


/* ***** one evaluation and its evaluation item scores */
--13

INSERT INTO evaluations
  (evalsemester, evalyear, evaluatorID, evaluateeID)
  VALUES ('Fall',2012
	, (select stdid from students
	where stduserid = 'DOLIVE')
	, (select stdid from students
	where stduserid = 'CALVAR')
	);

INSERT INTO eval_item_scores
  (eval_id, eval_item_id, score)
  VALUES(
	(select eval_id from evaluations
	where evaluatorID = (select stdid from students
		where stduserid = 'DOLIVE')
	and evaluateeID = (select stdid from students
		where stduserid = 'CALVAR'))
	, (select eval_item_id from eval_items
	where eval_item_code = 'RELIABLE')
	,75);

INSERT INTO eval_item_scores
  (eval_id, eval_item_id, score)
  VALUES(
	(select eval_id from evaluations
	where evaluatorID = (select stdid from students
		where stduserid = 'DOLIVE')
	and evaluateeID = (select stdid from students
		where stduserid = 'CALVAR'))
	, (select eval_item_id from eval_items
	where eval_item_code = 'CONTRIBUTE')
	,70);


INSERT INTO eval_item_scores
  (eval_id, eval_item_id, score)
  VALUES(
	(select eval_id from evaluations
	where evaluatorID = (select stdid from students
		where stduserid = 'DOLIVE')
	and evaluateeID = (select stdid from students
		where stduserid = 'CALVAR'))
	, (select eval_item_id from eval_items
	where eval_item_code = 'INTERPERS')
	,72);


/* ***** */


/* ***** one evaluation and its evaluation item scores */
--14

INSERT INTO evaluations
  (evalsemester, evalyear, evaluatorID, evaluateeID)
  VALUES ('Spring',2012
	, (select stdid from students
	where stduserid = 'BKRY')
	, (select stdid from students
	where stduserid = 'RFED')
	);

INSERT INTO eval_item_scores
  (eval_id, eval_item_id, score)
  VALUES(
	(select eval_id from evaluations
	where evaluatorID = (select stdid from students
		where stduserid = 'BKRY')
	and evaluateeID = (select stdid from students
		where stduserid = 'RFED'))
	, (select eval_item_id from eval_items
	where eval_item_code = 'RELIABLE')
	,85);


INSERT INTO eval_item_scores
  (eval_id, eval_item_id, score)
  VALUES(
	(select eval_id from evaluations
	where evaluatorID = (select stdid from students
		where stduserid = 'BKRY')
	and evaluateeID = (select stdid from students
		where stduserid = 'RFED'))
	, (select eval_item_id from eval_items
	where eval_item_code = 'CONTRIBUTE')
	,92);


INSERT INTO eval_item_scores
  (eval_id, eval_item_id, score)
  VALUES(
	(select eval_id from evaluations
	where evaluatorID = (select stdid from students
		where stduserid = 'BKRY')
	and evaluateeID = (select stdid from students
		where stduserid = 'RFED'))
	, (select eval_item_id from eval_items
	where eval_item_code = 'INTERPERS')
	,95);


/* ***** */



/*  Insert workshop data */

insert into workshops (wkshp_name)
  values ('Effective Leadership');

insert into workshops (wkshp_name)
  values ('Communicating Effectively');

insert into workshops (wkshp_name)
  values ('Active Listening');

insert into workshops (wkshp_name)
  values ('Get Organized');


/* Data inserted into attendance. */


insert into attendances
   (attnd_wkshp_id, attnd_stdid)
   values (
	(select wkshp_id from workshops
	where wkshp_name = 'Effective Leadership')
	, (select stdid from students
	where stduserid = 'BSMITH')
	   );


insert into attendances
   (attnd_wkshp_id, attnd_stdid)
   values (
	(select wkshp_id from workshops
	where wkshp_name = 'Effective Leadership')
	, (select stdid from students
	where stduserid = 'CSANCH')
	   );


insert into attendances
   (attnd_wkshp_id, attnd_stdid)
   values (
	(select wkshp_id from workshops
	where wkshp_name = 'Effective Leadership')
	, (select stdid from students
	where stduserid = 'THASHE')
	   );

insert into attendances
   (attnd_wkshp_id, attnd_stdid)
   values (
	(select wkshp_id from workshops
	where wkshp_name = 'Effective Leadership')
	, (select stdid from students
	where stduserid = 'BKRY')
	   );


insert into attendances
   (attnd_wkshp_id, attnd_stdid)
   values (
	(select wkshp_id from workshops
	where wkshp_name = 'Effective Leadership')
	, (select stdid from students
	where stduserid = 'RFED')
	   );

insert into attendances
   (attnd_wkshp_id, attnd_stdid)
   values (
	(select wkshp_id from workshops
	where wkshp_name = 'Effective Leadership')
	, (select stdid from students
	where stduserid = 'SDAVIS')
	   );


insert into attendances
   (attnd_wkshp_id, attnd_stdid)
   values (
	(select wkshp_id from workshops
	where wkshp_name = 'Effective Leadership')
	, (select stdid from students
	where stduserid = 'SAGA')
	   );


insert into attendances
   (attnd_wkshp_id, attnd_stdid)
   values (
	(select wkshp_id from workshops
	where wkshp_name = 'Communicating Effectively')
	, (select stdid from students
	where stduserid = 'SDAVIS')
	   );

insert into attendances
   (attnd_wkshp_id, attnd_stdid)
   values (
	(select wkshp_id from workshops
	where wkshp_name = 'Communicating Effectively')
	, (select stdid from students
	where stduserid = 'RFED')
	   );

insert into attendances
   (attnd_wkshp_id, attnd_stdid)
   values (
	(select wkshp_id from workshops
	where wkshp_name = 'Communicating Effectively')
	, (select stdid from students
	where stduserid = 'SAGA')
	   );


insert into attendances
   (attnd_wkshp_id, attnd_stdid)
   values (
	(select wkshp_id from workshops
	where wkshp_name = 'Active Listening')
	, (select stdid from students
	where stduserid = 'SAGA')
	   );

insert into attendances
   (attnd_wkshp_id, attnd_stdid)
   values (
	(select wkshp_id from workshops
	where wkshp_name = 'Active Listening')
	, (select stdid from students
	where stduserid = 'DOLIVE')
	   );

insert into attendances
   (attnd_wkshp_id, attnd_stdid)
   values (
	(select wkshp_id from workshops
	where wkshp_name = 'Active Listening')
	, (select stdid from students
	where stduserid = 'BKRY')
	   );

