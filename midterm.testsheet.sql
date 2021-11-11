--- For questions below, use the following schema definition.;

--- bbuser(uid, fname, lname, email, dob);
--- post(sid, uid, tim, posttxt, pubtype);
--- friend(tim, from_uid, to_uid);
--- unfriend(tim, from_uid, to_uid);
--- likeevent(tim, uid, sid);



---1. Find email of bbuser with id =12345;
--- Since ids are  8 digits long  we will look for a uid = 10905210;
--- I would like to find the following record;
--- 196696840,Rici,M'Chirrie,rmchirrie7@webnode.com,2018-09-12;
select * from bbuser where uid = 196686840;

--- <!-- This is the correct answer -->
select email from bbuser where uid = 196696840;

---2.  Find the user id of John Doe, dob: 1999-01-01.;

--- in the bbuser table there will be a record called John Doe and the dob column
--- should be '1999'-01-01
--- THe as date part should be the data type used when the column was created.
select uid from bbuser where  fname ='John' and lname='Doe' and dob = cast('1999-01-01' as date);


--- There will be no John Doe in my database since I created my table with fake data automatically
--- To get a record back I will be using  the following record.

select uid from bbuser where fname = 'Elliot' and lname='Holhouse' and dob = cast('2007-10-02'as date);
--- Returns the uid
    -----------
---- 128322865

---- Select all from the bbuser and limit to just the first 3 records
---  SELECT * FROM post  limit 3;

--- (5 points) Get all posts by user id=12345, in time order.

Select * FROM post  where uid=12345 order by tim;
--- I do not have a uid with that number in it so I will rewrite  it

Select * FROM post where uid = 10978122 ORDER BY  tim;

--- (5 points) Get all posts (uid, tim, posttxt) by John Doe, dob: 1999-01-01, in time order.;
SELECT b.uid, b.tim, b.posttext FROM bbuser a inner join post b on a.uid = b.uid WHERE fname='Elliot' and lname='Holhouse' and dob=cast('2007-10-02' as date) order by b.tim;


---     uid    |         tim         |                                          posttext
-----------+---------------------+---------------------------------------------------------------------------------------------
--   128322865 | 2020-03-09 00:00:00 | enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis




---- 6. (5 points ) did Jack johnson wver tried to friend john jackson?
----    (e.g. clicked a button that created a friend record).

Select count(*)> 0
    FROM bbuser a INNER JOIN
    friend b on a.uid = b.from_uid
    INNER JOIN bbuser c on b.to_uid = c.uid
    WHERE (a.fname, a.lname) = ('Jack','Johnson') AND
    (c.fname, c.lname) = ('John', 'Jackson');

