var builder = WebApplication.CreateBuilder(args);
//Add them
builder.Services.AddControllersWithViews(); //Web hoat dong tren co so tu controller sang View
var app = builder.Build();
//Can sua
//app.MapGet("/", () => "Hello World!");
app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}"
    );
app.UseStaticFiles();
app.Run();