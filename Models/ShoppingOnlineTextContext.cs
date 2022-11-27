using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace Project_SE.Models
{
    public partial class ShoppingOnlineTextContext : DbContext
    {
        public ShoppingOnlineTextContext()
        {
        }

        public ShoppingOnlineTextContext(DbContextOptions<ShoppingOnlineTextContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Account> Accounts { get; set; } = null!;
        public virtual DbSet<Cart> Carts { get; set; } = null!;
        public virtual DbSet<Category> Categories { get; set; } = null!;
        public virtual DbSet<DiscoutP> DiscoutPs { get; set; } = null!;
        public virtual DbSet<Order> Orders { get; set; } = null!;
        public virtual DbSet<OrderDetail> OrderDetails { get; set; } = null!;
        public virtual DbSet<Product> Products { get; set; } = null!;
        public virtual DbSet<Role> Roles { get; set; } = null!;
        public virtual DbSet<StatusA> StatusAs { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseSqlServer("server =localhost; database = ShoppingOnlineText;uid=sa;pwd=123;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Account>(entity =>
            {
                entity.ToTable("Account");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.Address)
                    .HasMaxLength(255)
                    .HasColumnName("address");

                entity.Property(e => e.DisplayName)
                    .HasMaxLength(255)
                    .HasColumnName("displayName");

                entity.Property(e => e.Email)
                    .HasMaxLength(255)
                    .HasColumnName("email");

                entity.Property(e => e.Password)
                    .HasMaxLength(255)
                    .HasColumnName("password");

                entity.Property(e => e.Phone)
                    .HasMaxLength(255)
                    .HasColumnName("phone");

                entity.Property(e => e.RoleId).HasColumnName("role_id");

                entity.Property(e => e.StatusId).HasColumnName("status_id");

                entity.Property(e => e.Username)
                    .HasMaxLength(255)
                    .HasColumnName("username");

                entity.HasOne(d => d.Role)
                    .WithMany(p => p.Accounts)
                    .HasForeignKey(d => d.RoleId)
                    .HasConstraintName("FK_Account_Role");

                entity.HasOne(d => d.Status)
                    .WithMany(p => p.Accounts)
                    .HasForeignKey(d => d.StatusId)
                    .HasConstraintName("FK_Account_statusA");
            });

            modelBuilder.Entity<Cart>(entity =>
            {
                entity.ToTable("Cart");

                entity.Property(e => e.CartId).HasColumnName("cartId");

                entity.Property(e => e.AccountId).HasColumnName("account_id");

                entity.Property(e => e.ProductId).HasColumnName("productId");

                entity.Property(e => e.Quantity).HasColumnName("quantity");

                entity.HasOne(d => d.Account)
                    .WithMany(p => p.Carts)
                    .HasForeignKey(d => d.AccountId)
                    .OnDelete(DeleteBehavior.Cascade)
                    .HasConstraintName("FK_Cart_Account");

                entity.HasOne(d => d.Product)
                    .WithMany(p => p.Carts)
                    .HasForeignKey(d => d.ProductId)
                    .HasConstraintName("FK_Cart_Product");
            });

            modelBuilder.Entity<Category>(entity =>
            {
                entity.ToTable("Category");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.CategoryName)
                    .HasMaxLength(250)
                    .HasColumnName("categoryName");
            });

            modelBuilder.Entity<DiscoutP>(entity =>
            {
                entity.HasKey(e => e.DiscountId);

                entity.ToTable("discoutP");

                entity.Property(e => e.DiscountId).HasColumnName("discount_id");

                entity.Property(e => e.PercentP).HasColumnName("percentP");

                entity.Property(e => e.Quantity).HasColumnName("quantity");
            });

            modelBuilder.Entity<Order>(entity =>
            {
                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.CreatedOrderDate)
                    .HasColumnType("date")
                    .HasColumnName("created_Order_date")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.CreatedSaleDate)
                    .HasColumnType("date")
                    .HasColumnName("created_Sale_date");

                entity.Property(e => e.IsDiscount).HasColumnName("isDiscount");

                entity.Property(e => e.Note)
                    .HasMaxLength(250)
                    .HasColumnName("note");

                entity.Property(e => e.OrderDetailId).HasColumnName("orderDetail_id");

                entity.Property(e => e.ShipId).HasColumnName("ship_id");

                entity.Property(e => e.StatusOId).HasColumnName("statusO_id");

                entity.Property(e => e.TotalPrice).HasColumnName("totalPrice");

                entity.HasOne(d => d.OrderDetail)
                    .WithMany(p => p.Orders)
                    .HasForeignKey(d => d.OrderDetailId)
                    .HasConstraintName("FK_Orders_OrderDetail");

                entity.HasOne(d => d.Ship)
                    .WithMany(p => p.Orders)
                    .HasForeignKey(d => d.ShipId)
                    .OnDelete(DeleteBehavior.Cascade)
                    .HasConstraintName("FK_Orders_Account");

                entity.HasOne(d => d.StatusO)
                    .WithMany(p => p.Orders)
                    .HasForeignKey(d => d.StatusOId)
                    .HasConstraintName("FK_Orders_statusA");
            });

            modelBuilder.Entity<OrderDetail>(entity =>
            {
                entity.ToTable("OrderDetail");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.AccountOrderId).HasColumnName("account_order_id");

                entity.Property(e => e.ProductId).HasColumnName("product_Id");

                entity.Property(e => e.Quantity).HasColumnName("quantity");

                entity.HasOne(d => d.AccountOrder)
                    .WithMany(p => p.OrderDetails)
                    .HasForeignKey(d => d.AccountOrderId)
                    .OnDelete(DeleteBehavior.Cascade)
                    .HasConstraintName("FK_OrderDetail_Account");

                entity.HasOne(d => d.Product)
                    .WithMany(p => p.OrderDetails)
                    .HasForeignKey(d => d.ProductId)
                    .HasConstraintName("FK_OrderDetail_Product");
            });

            modelBuilder.Entity<Product>(entity =>
            {
                entity.ToTable("Product");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.AccountId).HasColumnName("account_id");

                entity.Property(e => e.CategoryId).HasColumnName("categoryId");

                entity.Property(e => e.Code)
                    .HasMaxLength(250)
                    .HasColumnName("code");

                entity.Property(e => e.CreateDate)
                    .HasColumnType("date")
                    .HasColumnName("createDate")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.Description)
                    .HasMaxLength(1000)
                    .HasColumnName("description");

                entity.Property(e => e.DiscountId).HasColumnName("discount_id");

                entity.Property(e => e.Img)
                    .HasMaxLength(250)
                    .HasColumnName("img");

                entity.Property(e => e.IsExit).HasColumnName("isExit");

                entity.Property(e => e.Name)
                    .HasMaxLength(250)
                    .HasColumnName("name");

                entity.Property(e => e.Price).HasColumnName("price");

                entity.Property(e => e.Quantity).HasColumnName("quantity");

                entity.Property(e => e.QuantitySale).HasColumnName("quantitySale");

                entity.HasOne(d => d.Account)
                    .WithMany(p => p.Products)
                    .HasForeignKey(d => d.AccountId)
                    .OnDelete(DeleteBehavior.Cascade)
                    .HasConstraintName("FK_Product_Account");

                entity.HasOne(d => d.Category)
                    .WithMany(p => p.Products)
                    .HasForeignKey(d => d.CategoryId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Product_Category");

                entity.HasOne(d => d.Discount)
                    .WithMany(p => p.Products)
                    .HasForeignKey(d => d.DiscountId)
                    .HasConstraintName("FK_Product_discoutP");
            });

            modelBuilder.Entity<Role>(entity =>
            {
                entity.ToTable("Role");

                entity.Property(e => e.RoleId).HasColumnName("role_id");

                entity.Property(e => e.RoleName)
                    .HasMaxLength(50)
                    .HasColumnName("role_name");
            });

            modelBuilder.Entity<StatusA>(entity =>
            {
                entity.HasKey(e => e.StatusId);

                entity.ToTable("statusA");

                entity.Property(e => e.StatusId).HasColumnName("status_id");

                entity.Property(e => e.RoleId).HasColumnName("role_id");

                entity.Property(e => e.StatusName)
                    .HasMaxLength(50)
                    .HasColumnName("status_name");

                entity.HasOne(d => d.Role)
                    .WithMany(p => p.StatusAs)
                    .HasForeignKey(d => d.RoleId)
                    .HasConstraintName("FK_statusA_Role");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
