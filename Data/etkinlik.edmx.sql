
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 12/13/2016 16:42:16
-- Generated from EDMX file: C:\Users\Elif\Desktop\MVC\Etkinlik - Copy\Data\etkinlik.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [etkinlik];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_UserTypeUser]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UserSet] DROP CONSTRAINT [FK_UserTypeUser];
GO
IF OBJECT_ID(N'[dbo].[FK_UserActivity]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ActivitySet] DROP CONSTRAINT [FK_UserActivity];
GO
IF OBJECT_ID(N'[dbo].[FK_KategoriActivity]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ActivitySet] DROP CONSTRAINT [FK_KategoriActivity];
GO
IF OBJECT_ID(N'[dbo].[FK_SikayetActivity]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ActivitySet] DROP CONSTRAINT [FK_SikayetActivity];
GO
IF OBJECT_ID(N'[dbo].[FK_UserComment]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CommentSet] DROP CONSTRAINT [FK_UserComment];
GO
IF OBJECT_ID(N'[dbo].[FK_ActivityComment]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CommentSet] DROP CONSTRAINT [FK_ActivityComment];
GO
IF OBJECT_ID(N'[dbo].[FK_ActivityComment1]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CommentSet] DROP CONSTRAINT [FK_ActivityComment1];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[UserSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UserSet];
GO
IF OBJECT_ID(N'[dbo].[UserTypeSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UserTypeSet];
GO
IF OBJECT_ID(N'[dbo].[ActivitySet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ActivitySet];
GO
IF OBJECT_ID(N'[dbo].[CommentSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CommentSet];
GO
IF OBJECT_ID(N'[dbo].[SikayetSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SikayetSet];
GO
IF OBJECT_ID(N'[dbo].[KategoriSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[KategoriSet];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'UserSet'
CREATE TABLE [dbo].[UserSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [UserTypeId] int  NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Mail] nvarchar(max)  NOT NULL,
    [Telefon] nvarchar(max)  NOT NULL,
    [Password] nvarchar(max)  NOT NULL,
    [Avatar] varbinary(max)  NULL
);
GO

-- Creating table 'UserTypeSet'
CREATE TABLE [dbo].[UserTypeSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Yetki] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'ActivitySet'
CREATE TABLE [dbo].[ActivitySet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [UserId] int  NOT NULL,
    [KategoriId] int  NOT NULL,
    [SikayetId] int  NOT NULL,
    [Title] nvarchar(max)  NOT NULL,
    [Text] nvarchar(max)  NOT NULL,
    [Resim] varbinary(max)  NULL,
    [Date] datetime  NOT NULL
);
GO

-- Creating table 'CommentSet'
CREATE TABLE [dbo].[CommentSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [UserId] int  NOT NULL,
    [ActivityId] int  NOT NULL,
    [Text] nvarchar(max)  NOT NULL,
    [Tarih] datetime  NOT NULL,
    [Verified] bit  NOT NULL
);
GO

-- Creating table 'SikayetSet'
CREATE TABLE [dbo].[SikayetSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Konu] nvarchar(max)  NOT NULL,
    [Aciklama] nvarchar(max)  NOT NULL,
    [Tarih] datetime  NOT NULL
);
GO

-- Creating table 'KategoriSet'
CREATE TABLE [dbo].[KategoriSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [KategoriAdi] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'LogSet'
CREATE TABLE [dbo].[LogSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [UserId] int  NOT NULL,
    [Subject] nvarchar(max)  NOT NULL,
    [Detail] nvarchar(max)  NOT NULL,
    [Date] datetime  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'UserSet'
ALTER TABLE [dbo].[UserSet]
ADD CONSTRAINT [PK_UserSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'UserTypeSet'
ALTER TABLE [dbo].[UserTypeSet]
ADD CONSTRAINT [PK_UserTypeSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ActivitySet'
ALTER TABLE [dbo].[ActivitySet]
ADD CONSTRAINT [PK_ActivitySet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'CommentSet'
ALTER TABLE [dbo].[CommentSet]
ADD CONSTRAINT [PK_CommentSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'SikayetSet'
ALTER TABLE [dbo].[SikayetSet]
ADD CONSTRAINT [PK_SikayetSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'KategoriSet'
ALTER TABLE [dbo].[KategoriSet]
ADD CONSTRAINT [PK_KategoriSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'LogSet'
ALTER TABLE [dbo].[LogSet]
ADD CONSTRAINT [PK_LogSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [UserTypeId] in table 'UserSet'
ALTER TABLE [dbo].[UserSet]
ADD CONSTRAINT [FK_UserTypeUser]
    FOREIGN KEY ([UserTypeId])
    REFERENCES [dbo].[UserTypeSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserTypeUser'
CREATE INDEX [IX_FK_UserTypeUser]
ON [dbo].[UserSet]
    ([UserTypeId]);
GO

-- Creating foreign key on [UserId] in table 'ActivitySet'
ALTER TABLE [dbo].[ActivitySet]
ADD CONSTRAINT [FK_UserActivity]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[UserSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserActivity'
CREATE INDEX [IX_FK_UserActivity]
ON [dbo].[ActivitySet]
    ([UserId]);
GO

-- Creating foreign key on [KategoriId] in table 'ActivitySet'
ALTER TABLE [dbo].[ActivitySet]
ADD CONSTRAINT [FK_KategoriActivity]
    FOREIGN KEY ([KategoriId])
    REFERENCES [dbo].[KategoriSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_KategoriActivity'
CREATE INDEX [IX_FK_KategoriActivity]
ON [dbo].[ActivitySet]
    ([KategoriId]);
GO

-- Creating foreign key on [SikayetId] in table 'ActivitySet'
ALTER TABLE [dbo].[ActivitySet]
ADD CONSTRAINT [FK_SikayetActivity]
    FOREIGN KEY ([SikayetId])
    REFERENCES [dbo].[SikayetSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SikayetActivity'
CREATE INDEX [IX_FK_SikayetActivity]
ON [dbo].[ActivitySet]
    ([SikayetId]);
GO

-- Creating foreign key on [UserId] in table 'CommentSet'
ALTER TABLE [dbo].[CommentSet]
ADD CONSTRAINT [FK_UserComment]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[UserSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserComment'
CREATE INDEX [IX_FK_UserComment]
ON [dbo].[CommentSet]
    ([UserId]);
GO

-- Creating foreign key on [ActivityId] in table 'CommentSet'
ALTER TABLE [dbo].[CommentSet]
ADD CONSTRAINT [FK_ActivityComment]
    FOREIGN KEY ([ActivityId])
    REFERENCES [dbo].[ActivitySet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ActivityComment'
CREATE INDEX [IX_FK_ActivityComment]
ON [dbo].[CommentSet]
    ([ActivityId]);
GO

-- Creating foreign key on [ActivityId] in table 'CommentSet'
ALTER TABLE [dbo].[CommentSet]
ADD CONSTRAINT [FK_ActivityComment1]
    FOREIGN KEY ([ActivityId])
    REFERENCES [dbo].[ActivitySet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ActivityComment1'
CREATE INDEX [IX_FK_ActivityComment1]
ON [dbo].[CommentSet]
    ([ActivityId]);
GO

-- Creating foreign key on [UserId] in table 'LogSet'
ALTER TABLE [dbo].[LogSet]
ADD CONSTRAINT [FK_UserLog]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[UserSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserLog'
CREATE INDEX [IX_FK_UserLog]
ON [dbo].[LogSet]
    ([UserId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------