

select * from dbo.final_clean

select distinct(post_uniqueid), * from dbo.final_clean where post_event_list like '%,1,%'

and post_prop14 like '%cart%'

--DATA SET -- Contains 1048575 rows

Select * From dbo.final_clean;


--Adding Column with Status as purchase and not Purchase -- 1048575 rows Updated

	ALTER TABLE dbo.final_clean ADD status nvarchar(255);

update t set
 status= (case when t.post_event_list like '%,1,%' then 'Purchase'
	else 'Not Purchase'
	END )
	From dbo.final_clean t ;
	


--Rows with Status = Purchase -- 969 Rows

Select distinct(post_uniqueid),* from dbo.final_Clean where status = 'Purchase'


-- Rows with Status - not purchas and ("cart" in Post_Referrer or post_prop14)  ----- 26065 Rows

select distinct(post_uniqueid),* from dbo.final_clean where status='Not Purchase'
and post_prop14 like '%cart%'
or post_referrer like '%cart%'












