USE [Test]
GO
/****** Object:  StoredProcedure [dbo].[SP_Add_Job]    Script Date: 11/18/2019 2:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Add_Job]      
    @JobTitle NVARCHAR(250) ,      
    @JobImage NVARCHAR(Max) ,      
    @CityId int ,      
    @IsActive BIT ,      
    @CreatedBY NVARCHAR(50) ,      
    @CreatedDateTime DATETIME ,      
    @UpdatedBY NVARCHAR(50),    
    @UpdatedDateTime DATETIME    
        
AS      
    BEGIN      
 DECLARE @JobId as BIGINT    
        INSERT  INTO [Job]      
                (JobTitle ,      
                 JobImage ,      
                 CityId ,      
                 IsActive ,      
                 CreatedBY ,      
                 CreatedDateTime ,      
                 UpdatedBY ,      
                 UpdatedDateTime    
             )      
        VALUES  ( @JobTitle ,      
                  @JobImage ,      
                  @CityId ,      
                  @IsActive ,      
                  @CreatedBY ,        
                  @CreatedDateTime ,     
                  @UpdatedBY ,      
                  @UpdatedDateTime                      
                      
             );     
        SET @JobId = SCOPE_IDENTITY();     
        SELECT  @JobId AS JobId;      
    END;      
    
GO
/****** Object:  StoredProcedure [dbo].[SP_Job_List]    Script Date: 11/18/2019 2:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Job_List]      
AS  
BEGIN  
      
    SET NOCOUNT ON;  
    select * from [Job]   
    END  
GO
/****** Object:  StoredProcedure [dbo].[SP_Update_Job]    Script Date: 11/18/2019 2:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Update_Job]    
    @JobId INT,  
    @JobTitle NVARCHAR(250) ,        
    @JobImage NVARCHAR(Max) ,        
    @CityId INT ,        
    @IsActive BIT ,    
    @UpdatedBY NVARCHAR(50),      
    @UpdatedDateTime DATETIME      
          
AS        
    BEGIN        
     UPDATE job   
     SET    
            job.JobTitle = @JobTitle,    
            job.JobImage = @JobImage ,    
            job.CityId = @CityId ,    
            job.IsActive = @IsActive ,    
            job.UpdatedBY = @UpdatedBY ,    
            job.UpdatedDateTime = @UpdatedDateTime  
  FROM [Job] job    
  WHERE JobId = @JobId   
    END;    
GO
/****** Object:  Table [dbo].[Job]    Script Date: 11/18/2019 2:45:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Job](
	[JobID] [int] IDENTITY(1,1) NOT NULL,
	[JobTitle] [nchar](250) NULL,
	[JobImage] [nvarchar](max) NULL,
	[CityId] [int] NULL,
	[IsActive] [bit] NULL,
	[CreatedBY] [nvarchar](50) NULL,
	[CreatedDateTime] [datetime] NULL,
	[UpdatedBY] [nvarchar](50) NULL,
	[UpdatedDateTime] [datetime] NULL,
 CONSTRAINT [PK_Job] PRIMARY KEY CLUSTERED 
(
	[JobID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
