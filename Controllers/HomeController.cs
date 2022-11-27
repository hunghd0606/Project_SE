using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Project_SE.Models;
using Project_SE.Models;
namespace Project_SE.Controllers
{
    public class HomeController : Controller
    {
        public IActionResult Index()
        {
            using (ShoppingOnlineTextContext context = new ShoppingOnlineTextContext())
            {
                ViewBag.role = 3;
                ViewBag.listAccount = context.Accounts.Include(u1 => u1.Status).Where(u => u.Role.RoleId == 3).ToList();
                return View();
            }

        }
        public IActionResult DSNguoiBan()
        {
            using (ShoppingOnlineTextContext context = new ShoppingOnlineTextContext())
            {
                ViewBag.role = 2;
                ViewBag.listAccount = context.Accounts.Include(u1 => u1.Status).Where(u => u.Role.RoleId == 2).ToList();
                return View("Index");
            }

        }
        public IActionResult NextUpdate(int id)
        {
            using (ShoppingOnlineTextContext context = new ShoppingOnlineTextContext())
            {
                Account account = context.Accounts.Include(u1 => u1.Status).Where(u => u.Id == id).FirstOrDefault();
                ViewBag.listAccount = context.Accounts.Include(u1 => u1.Status).Where(u => u.Role.RoleId != 1).ToList();
                return View("UpdateAccount", account);
            }
        }
        public IActionResult ChangeActiveAccount(int id,int lo)
        {
            if (id != null)
            {
                using (ShoppingOnlineTextContext context = new ShoppingOnlineTextContext())
                {
                    Account account = context.Accounts.Where(u => u.Id == id).FirstOrDefault();
                    if (account != null && account.Id == id)
                    {
                        account.StatusId = lo;
                        context.Accounts.Update(account);
                        context.SaveChanges();
                    }
                }
            }

            return RedirectToAction("Index");
        }
        public IActionResult DeleteAcount(int id)
        {
            if(id != null)
            {
                using (ShoppingOnlineTextContext context = new ShoppingOnlineTextContext())
                {
                    Account account = context.Accounts.Where(u => u.Id == id).FirstOrDefault();
                    if(account != null && account.Id == id)
                    {
                        context.Accounts.Remove(account);
                        context.SaveChanges();
                    }
                }
            }
            
            return RedirectToAction("Index");
        }
        [HttpPost]
        public IActionResult SaveAccount(Account account, int id)
        {
            if (account != null && id != null)
            {
                using (ShoppingOnlineTextContext context = new ShoppingOnlineTextContext())
                {
                    Account accountDB = context.Accounts.Include(u1 => u1.Status).Where(u => u.Id == id).FirstOrDefault();
                    if (accountDB.DisplayName != account.DisplayName.Trim() || accountDB.Address != account.Address.Trim() ||
                         accountDB.Email != account.Email.Trim() || accountDB.Phone != account.Phone.Trim())
                    {
                        accountDB.DisplayName = account.DisplayName.Trim();
                        accountDB.Address = account.Address.Trim();
                        accountDB.Email = account.Email.Trim();
                        accountDB.Phone = account.Phone.Trim();
                        context.Accounts.Update(accountDB);
                        context.SaveChanges();
                    }

                }
            }

            return RedirectToAction("Index");
        }
        public IActionResult searchProductSelect(int id)
        {

            return View();  
        }
    }
}
