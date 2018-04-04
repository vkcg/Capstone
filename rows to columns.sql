SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE PrintCustomers_Cursor
AS
BEGIN
      SET NOCOUNT ON;
 
      --DECLARE THE VARIABLES FOR HOLDING DATA.
      DECLARE @CustomerId INT
             
         --DECLARE THE CURSOR FOR A QUERY.
      DECLARE PrintCustomers CURSOR 
      FOR
      SELECT DISTINCT post_uniqueid FROM dbo.sheet7;
 
      --OPEN CURSOR.
      OPEN PrintCustomers
 
      --FETCH THE RECORD INTO THE VARIABLES.
      FETCH NEXT FROM PrintCustomers INTO
      @CustomerId
 
      --LOOP UNTIL RECORDS ARE AVAILABLE.
      WHILE @@FETCH_STATUS = 0
      BEGIN
            
             --PRINT CURRENT RECORD.
             PRINT @CustomerId
    
           
             --FETCH THE NEXT RECORD INTO THE VARIABLES.
             FETCH NEXT FROM PrintCustomers INTO
             @CustomerId
      END
 
      --CLOSE THE CURSOR.
      CLOSE PrintCustomers
      DEALLOCATE PrintCustomers
END
GO