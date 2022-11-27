using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Project_SE.Models;
using System.Collections;
using System.Security.Cryptography;

namespace Project_SE.Controllers
{
    public class ProductController : Controller
    {
        public IActionResult Index()
        {
            return RedirectToAction("ProductDiscount");
        }
        public IActionResult detailProduct(int pId)
        {

            using (ShoppingOnlineTextContext context = new ShoppingOnlineTextContext())
            {
                Product product = context.Products.Include(u => u.Discount).Where(u => u.Id == pId).FirstOrDefault();
                ViewBag.PidD = pId;
                return View("DetailProduct", product);
            }

        }
        public IActionResult Update(Product product, string codeer)
        {

            using (ShoppingOnlineTextContext context = new ShoppingOnlineTextContext())
            {
                Product productD = context.Products.Include(u => u.Discount).Where(u => u.Code.Trim().Equals(codeer.Trim())).First();
                DiscoutP discoutP = context.DiscoutPs.Where(u => u.Quantity == product.Discount.Quantity && u.PercentP == product.Discount.PercentP).FirstOrDefault();
                int pIdX = productD.Id;
                if (discoutP == null)
                {
                    context.DiscoutPs.Add(product.Discount);
                    context.SaveChanges();
                    discoutP = context.DiscoutPs.Where(u => u.Quantity == product.Discount.Quantity && u.PercentP == product.Discount.PercentP).FirstOrDefault();
                    productD.Discount = discoutP;
                }
                else
                {
                    productD.Discount = discoutP;
                }
                productD.Name = product.Name;
                productD.QuantitySale = product.QuantitySale;
                productD.Quantity = product.Quantity;
                productD.Price = product.Price;
                productD.Description = product.Description;
                productD.Img = product.Img;
                context.Products.Update(productD);
                context.SaveChanges();
                return RedirectToAction("ProductDiscount", new { pId = productD.Id });
            }

        }
        public IActionResult sortProduct(int pPrice)
        {

            return RedirectToAction("ProductDiscount");
        }
        public IActionResult deleteProduct(int pId)
        {
            try
            {
                using (ShoppingOnlineTextContext context = new ShoppingOnlineTextContext())
                {
                    Product product = context.Products.Include(u => u.Discount).Where(u => u.Id == pId).First();
                    product.IsExit = false;
                    context.Products.Update(product);
                    //context.Remove(product);
                    context.SaveChanges();
                }
            }
            catch (Exception)
            {
            }
            return RedirectToAction("ProductDiscount");
        }

        public IActionResult ProductDiscount()
        {
            using (ShoppingOnlineTextContext context = new ShoppingOnlineTextContext())
            {
                ViewBag.listProduct = context.Products.Include(u => u.Discount).Include(u => u.Category).Include(u => u.Account).Where(u=> u.IsExit == true).ToList();
                return View("listProductDiscount");
            }
        }
        public IActionResult ProductDiscountIsDelete()
        {
            using (ShoppingOnlineTextContext context = new ShoppingOnlineTextContext())
            {
                ViewBag.listProduct = context.Products.Include(u => u.Discount).Include(u => u.Category).Include(u => u.Account).Where(u => u.IsExit == false).ToList();
                return View("listProductDiscount");
            }
        }
        public IActionResult searchProductSelect(int chose1, int chose2, String nameSe, int sor)
        {
            String sea = "";
            if (nameSe != null && !nameSe.Trim().Equals(""))
            {
                sea = nameSe;
            }
            using (ShoppingOnlineTextContext context = new ShoppingOnlineTextContext())
            {
                var products = context.Products.Include(u => u.Discount).Include(u => u.Category).Include(u => u.Account).ToList();
                List<Product> productList = new List<Product>();
                productList = products;
                if (sor == 0)
                {
                    productList.Sort((t1, t2) => t1.Price > t2.Price ? 1 : -1);
                }
                if (sor == 1)
                {
                    productList.Sort((t1, t2) => t1.Price < t2.Price ? 1 : -1);
                }
                ViewBag.sor = sor == null ? 2 : sor;
                if (chose1 == 1)
                {
                    productList = (List<Product>)productList.Where(u => u.Discount.Quantity > 0 && u.Discount.PercentP > 0).ToList();
                }
                if (chose1 == 2)
                {
                    productList = (List<Product>)productList.Where(u => u.Discount.Quantity == 0 && u.Discount.PercentP == 0).ToList();
                }
                switch (chose2)
                {
                    case 0:
                        productList = productList.Where(u => u.Account.DisplayName.Contains(sea)).ToList();
                        break;
                    case 1:
                        productList = productList.Where(u => u.Name.Contains(sea)).ToList();
                        break;
                    case 2:
                        productList = productList.Where(u => u.Code.Contains(sea)).ToList();
                        break;
                }
                ViewBag.chose1 = chose1;
                ViewBag.chose2 = chose2;
                ViewBag.sea = sea;
                ViewBag.listProduct = productList.ToList();
                return View("listProductDiscount");
            }
        }
    }
}
