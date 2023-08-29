using System.Data;
using Microsoft.AspNetCore.Components;
using Microsoft.AspNetCore.Components.Web;
using BlazorProject.Data;
using Data.Services;
using Data.Models;
using Npgsql;


var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddRazorPages();
builder.Services.AddServerSideBlazor();
builder.Services.AddTransient<IDbConnection>(provider => new NpgsqlConnection("User ID=postgres;Password=1234;" +
                                                                              "Host=localhost;Port=5433;" +
                                                                              "Database=easy_translate;"));
builder.Services.AddSingleton<AddClientService>();
builder.Services.AddSingleton<LanguageService>();
builder.Services.AddSingleton<ClientFindTranslatorService>();
builder.Services.AddSingleton<TaskService>();
builder.Services.AddSingleton<MyTasksService>();
builder.Services.AddSingleton<TaskReviewService>();
builder.Services.AddSingleton<TranslatorCompetenceService>();
builder.Services.AddSingleton<TranslatorEmploymentService>();
builder.Services.AddSingleton<TranslatorWithLowestFeeService>();
builder.Services.AddSingleton<FeesAndCategories>();
builder.Services.AddScoped<LoginIdentity>(p => new LoginIdentity()
{
    Id = 22,
    Name = "Home Travel Agency"
});

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();

app.UseStaticFiles();


app.UseRouting();

app.MapBlazorHub();
app.MapFallbackToPage("/_Host");

app.Run();

