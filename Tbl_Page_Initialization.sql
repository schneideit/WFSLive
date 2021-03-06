USE WFS_ERP
GO

ALTER TABLE Tbl_Privilege
DROP CONSTRAINT fk_Tbl_Privilege_Tbl_Page

DELETE Tbl_Page

DECLARE @pOrder SMALLINT =1

--Dashboard
INSERT [dbo].[Tbl_Page] ([PageID], [Description], [ActionValue], [ParentPageID], [DisplayOrder], [ActionUrl], [ShowInMenu], [ShowInPrivilege], [UIData]) 
VALUES (N'DB', N'Dashboard', 3, NULL,@pOrder, NULL, 1, 1, N'fa fa-tachometer')
	SET @pOrder=@pOrder+1
	INSERT [dbo].[Tbl_Page] ([PageID], [Description], [ActionValue], [ParentPageID], [DisplayOrder], [ActionUrl], [ShowInMenu], [ShowInPrivilege], [UIData]) 
	VALUES (N'SDB', N'Students', 3, N'DB', @pOrder, N'#', 1, 1, NULL)

	SET @pOrder=@pOrder+1
	INSERT [dbo].[Tbl_Page] ([PageID], [Description], [ActionValue], [ParentPageID], [DisplayOrder], [ActionUrl], [ShowInMenu], [ShowInPrivilege], [UIData]) 
	VALUES (N'EDB', N'Manager Dashboard', 3, N'DB', @pOrder, N'#', 1, 1, NULL)

--Enquiries
SET @pOrder=@pOrder+1
INSERT [dbo].[Tbl_Page] ([PageID], [Description], [ActionValue], [ParentPageID], [DisplayOrder], [ActionUrl], [ShowInMenu], [ShowInPrivilege], [UIData]) 
VALUES (N'ENQ', N'Enquiries', 3, NULL,@pOrder, NULL, 1, 1, N'fa fa-check-square-o')

	SET @pOrder=@pOrder+1
	INSERT [dbo].[Tbl_Page] ([PageID], [Description], [ActionValue], [ParentPageID], [DisplayOrder], [ActionUrl], [ShowInMenu], [ShowInPrivilege], [UIData]) 
	VALUES (N'VENQ', N'Enquiries', 3, N'ENQ', @pOrder, N'ListEnquiry.aspx', 1, 1, NULL)

--Students
SET @pOrder=@pOrder+1
INSERT [dbo].[Tbl_Page] ([PageID], [Description], [ActionValue], [ParentPageID], [DisplayOrder], [ActionUrl], [ShowInMenu], [ShowInPrivilege], [UIData]) 
VALUES (N'STD', N'Students', 3, NULL, @pOrder, null, 1, 1, N'fa fa-user')
	
	SET @pOrder=@pOrder+1
	INSERT [dbo].[Tbl_Page] ([PageID], [Description], [ActionValue], [ParentPageID], [DisplayOrder], [ActionUrl], [ShowInMenu], [ShowInPrivilege], [UIData]) 
	VALUES (N'STUDV', N'Students', 3, 'STD', @pOrder, 'ViewStudents.aspx', 1, 1, null)

	SET @pOrder=@pOrder+1
	INSERT [dbo].[Tbl_Page] ([PageID], [Description], [ActionValue], [ParentPageID], [DisplayOrder], [ActionUrl], [ShowInMenu], [ShowInPrivilege], [UIData]) 
	VALUES (N'STUD', N'Create Students', 3, 'STD', @pOrder, 'Student.aspx', 0, 1, null)

	SET @pOrder=@pOrder+1
	INSERT [dbo].[Tbl_Page] ([PageID], [Description], [ActionValue], [ParentPageID], [DisplayOrder], [ActionUrl], [ShowInMenu], [ShowInPrivilege], [UIData]) 
	VALUES (N'SCH', N'Assessment', 3, 'STD', @pOrder, 'Assessment.aspx', 1, 1, 'fa fa-certificate')

	SET @pOrder=@pOrder+1
	INSERT [dbo].[Tbl_Page] ([PageID], [Description], [ActionValue], [ParentPageID], [DisplayOrder], [ActionUrl], [ShowInMenu], [ShowInPrivilege], [UIData]) 
	VALUES (N'PYMT', N'Make Payment', 3, 'STD', @pOrder, 'Payment.aspx', 1, 1, 'fa fa-dollar')

	SET @pOrder=@pOrder+1
	INSERT [dbo].[Tbl_Page] ([PageID], [Description], [ActionValue], [ParentPageID], [DisplayOrder], [ActionUrl], [ShowInMenu], [ShowInPrivilege], [UIData]) 
	VALUES (N'ATTN', N'Attendance', 3, 'STD', @pOrder, 'Attendance.aspx', 1, 1, 'fa fa-calendar')

--Settings
SET @pOrder=@pOrder+1
INSERT [dbo].[Tbl_Page] ([PageID], [Description], [ActionValue], [ParentPageID], [DisplayOrder], [ActionUrl], [ShowInMenu], [ShowInPrivilege], [UIData]) 
VALUES (N'SET', N'Settings', 3, NULL,@pOrder, NULL, 1, 1, N'fa fa-cog')
	SET @pOrder=@pOrder+1
	INSERT [dbo].[Tbl_Page] ([PageID], [Description], [ActionValue], [ParentPageID], [DisplayOrder], [ActionUrl], [ShowInMenu], [ShowInPrivilege], [UIData]) 
	VALUES (N'TRN', N'Trainers', 3, N'SET', @pOrder, N'ViewTrainers.aspx', 1, 1, NULL)

	SET @pOrder=@pOrder+1
	INSERT [dbo].[Tbl_Page] ([PageID], [Description], [ActionValue], [ParentPageID], [DisplayOrder], [ActionUrl], [ShowInMenu], [ShowInPrivilege], [UIData]) 
	VALUES (N'TRN', N'Trainers', 3, N'SET', @pOrder, N'Trainers.aspx', 0, 1, NULL)

	SET @pOrder=@pOrder+1
	INSERT [dbo].[Tbl_Page] ([PageID], [Description], [ActionValue], [ParentPageID], [DisplayOrder], [ActionUrl], [ShowInMenu], [ShowInPrivilege], [UIData]) 
	VALUES (N'SCDL', N'Schedules', 3, N'ENQ', @pOrder, N'ViewSchedules.aspx', 1, 1, NULL)

	SET @pOrder=@pOrder+1
	INSERT [dbo].[Tbl_Page] ([PageID], [Description], [ActionValue], [ParentPageID], [DisplayOrder], [ActionUrl], [ShowInMenu], [ShowInPrivilege], [UIData]) 
	VALUES (N'SCDL', N'Schedules', 3, N'ENQ', @pOrder, N'Schedule.aspx', 0, 1, NULL)

--User Management
SET @pOrder=@pOrder+1
INSERT [dbo].[Tbl_Page] ([PageID], [Description], [ActionValue], [ParentPageID], [DisplayOrder], [ActionUrl], [ShowInMenu], [ShowInPrivilege], [UIData]) 
VALUES (N'USRMG', N'User Management', 3, NULL,@pOrder, NULL, 1, 1, N'fa fa-user')

	SET @pOrder=@pOrder+1
	INSERT [dbo].[Tbl_Page] ([PageID], [Description], [ActionValue], [ParentPageID], [DisplayOrder], [ActionUrl], [ShowInMenu], [ShowInPrivilege], [UIData]) 
	VALUES (N'UROL', N'Role', 3, N'USRMG', @pOrder, N'RoleSearch.aspx', 1, 1, NULL)

	SET @pOrder=@pOrder+1
	INSERT [dbo].[Tbl_Page] ([PageID], [Description], [ActionValue], [ParentPageID], [DisplayOrder], [ActionUrl], [ShowInMenu], [ShowInPrivilege], [UIData]) 
	VALUES (N'UROLAD', N'Create Role', 3, N'USRMG', @pOrder, N'RoleAdd.aspx', 0, 1, NULL)

	SET @pOrder=@pOrder+1
	INSERT [dbo].[Tbl_Page] ([PageID], [Description], [ActionValue], [ParentPageID], [DisplayOrder], [ActionUrl], [ShowInMenu], [ShowInPrivilege], [UIData]) 
	VALUES (N'USR', N'Users', 3, N'USRMG', @pOrder, N'UserSearch.aspx', 1, 1, NULL)

	SET @pOrder=@pOrder+1
	INSERT [dbo].[Tbl_Page] ([PageID], [Description], [ActionValue], [ParentPageID], [DisplayOrder], [ActionUrl], [ShowInMenu], [ShowInPrivilege], [UIData]) 
	VALUES (N'USRAD', N'Create User', 3, N'USRMG', @pOrder, N'UserAdd.aspx', 0, 1, NULL)


	SET @pOrder=@pOrder+1
	INSERT [dbo].[Tbl_Page] ([PageID], [Description], [ActionValue], [ParentPageID], [DisplayOrder], [ActionUrl], [ShowInMenu], [ShowInPrivilege], [UIData]) 
	VALUES (N'USRCP', N'User Change Password', 3, N'USRMG', @pOrder, NULL, 0, 1, NULL)

--Logout
SET @pOrder=@pOrder+1
INSERT [dbo].[Tbl_Page] ([PageID], [Description], [ActionValue], [ParentPageID], [DisplayOrder], [ActionUrl], [ShowInMenu], [ShowInPrivilege], [UIData]) 
VALUES (N'EXT', N'Logout', 3, NULL,@pOrder, 'Login.aspx', 1, 1, N'fa fa-sign-out')
	

DELETE Tbl_Privilege
WHERE PageID NOT IN (Select PageID from Tbl_Page)		

ALTER TABLE Tbl_Privilege
ADD CONSTRAINT fk_Tbl_Privilege_Tbl_Page FOREIGN KEY (PageID)
REFERENCES Tbl_Page(PageID)


--Adding all privilege to admin user ROLE ID=1
DELETE Tbl_Privilege WHERE RoleID =1
GO
INSERT INTO Tbl_Privilege
SELECT 1,PageID, ActionValue,1,GETDATE(),'::1',NULL,NULL,NULL
FROM Tbl_Page
WHERE PageID NOT IN(SELECT PageID FROM Tbl_Privilege WHERE RoleID = 1)

