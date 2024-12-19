using Microsoft.EntityFrameworkCore;
using ClientsBackend.Data;
using ClientsBackend.Services;

var builder = WebApplication.CreateBuilder(args);

// Registra el DBClientsContext
builder.Services.AddDbContext<DBClientsContext>(options =>
    options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection")));

// Registrar el servicio ClientService
builder.Services.AddScoped<ClientService>();

// Configura CORS
builder.Services.AddCors(options =>
{
    options.AddPolicy("AllowFrontend", policy =>
    {
        policy.WithOrigins("http://localhost:4200") // Direcci�n del frontend
              .AllowAnyHeader()
              .AllowAnyMethod();
    });
});

// Agregar otros servicios
builder.Services.AddControllers();

// Configuraci�n de Swagger
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

app.UseCors("AllowFrontend");

// Configuraci�n de la tuber�a de solicitud HTTP
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseAuthorization();

// Mapear los controladores
app.MapControllers();

app.Run();
