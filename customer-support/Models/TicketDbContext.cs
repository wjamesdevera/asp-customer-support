using MySql.Data.EntityFramework;
using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Data.Entity;
using System.Data.Entity.Core.Metadata.Edm;
using System.Linq;
using System.Web;

namespace customer_support.Models
{
    [DbConfigurationType(typeof(MySqlEFConfiguration))]
    public class TicketDbContext: DbContext
    {
        public DbSet<UserModel> Users { get; set; }
        public DbSet<TicketModel> Tickets { get; set; }
        public DbSet<CommentModel> Comments { get; set; }
        public TicketDbContext(): base()
        {
        }
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            modelBuilder.Entity<UserModel>()
                .HasKey(x => x.Id)
                .ToTable("users_tbl");

            modelBuilder.Entity<UserModel>()
                .Property(x => x.FirstName)
                .HasColumnName("first_name");

            modelBuilder.Entity<UserModel>()
                .Property(x => x.LastName)
                .HasColumnName("last_name");

            modelBuilder.Entity<UserModel>()
                .Property(x => x.Email)
                .HasColumnName("email")
                .IsRequired();

            modelBuilder.Entity<UserModel>()
                .Property(x => x.Password)
                .HasColumnName("password");

            modelBuilder.Entity<UserModel>()
                .Property(x => x.CreatedAt)
                .HasColumnName("created_at");

            modelBuilder.Entity<UserModel>()
                .Property(x => x.UpdatedAt)
                .HasColumnName("updated_at");

            modelBuilder.Entity<TicketModel>()
                .HasKey(x => x.Id)
                .ToTable("tickets_tbl");

            modelBuilder.Entity<TicketModel>()
                .Property(x => x.UserId)
                .HasColumnName("user_id");

            modelBuilder.Entity<TicketModel>()
                .Property(x => x.Title)
                .HasColumnName("title");

            modelBuilder.Entity<TicketModel>()
                .Property(x => x.Description)
                .HasColumnName("description");


            modelBuilder.Entity<TicketModel>()
                .Property(x => x.CreatedAt)
                .HasColumnName("created_at");

            modelBuilder.Entity<TicketModel>()
                .Property(x => x.UpdatedAt)
                .HasColumnName("updated_at");

            modelBuilder.Entity<CommentModel>()
                .HasKey(x => x.Id)
                .ToTable("comments_tbl");

            modelBuilder.Entity<CommentModel>()
                .Property(x => x.UserId)
                .HasColumnName("user_id");
            
            modelBuilder.Entity<CommentModel>()
                .Property(x => x.TicketId)
                .HasColumnName("ticket_id");

            modelBuilder.Entity<CommentModel>()
                .Property(x => x.Comment)
                .HasColumnName("comment");


            modelBuilder.Entity<CommentModel>()
                .Property(x => x.CreatedAt)
                .HasColumnName("created_at");

            modelBuilder.Entity<CommentModel>()
                .Property(x => x.UpdatedAt)
                .HasColumnName("updated_at");
        }

    }
}