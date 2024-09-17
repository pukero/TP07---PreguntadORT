using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using TP07___PreguntadORT.Models;

namespace TP07___PreguntadORT.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }

    public IActionResult Index()
    {
        return View();
    }

    public IActionResult ConfigurarJuego() 
    {
       List<Categoria> categorias = Juego.ObtenerCategorias();
       List<Dificultad> dificultades = Juego.ObtenerDificultades();
       ViewBag.Categorias = categorias;
       ViewBag.Dificultades = dificultades;
       return View();
    }

    public IActionResult Comenzar(string username, int dificultad, int categoria)
    {
        if (string.IsNullOrEmpty(username) || dificultad == 0 || categoria == 0)
        {
            return RedirectToAction("ConfigurarJuego");
        }
        
        Juego.CargarPartida(username, dificultad, categoria);
        return RedirectToAction("Jugar");
    }

    public IActionResult Jugar()
    {
        Pregunta pregunta = Juego.ObtenerProximaPregunta();
        if (pregunta == null)
        {
            return View("Fin");
        }

        ViewBag.Username = Juego.Username;
        ViewBag.PuntajeActual = Juego.PuntajeActual;
        ViewBag.Pregunta = pregunta;
        ViewBag.Respuestas = Juego.ObtenerProximasRespuestas(pregunta.IdPregunta);
        
        return View();
    }

    [HttpPost]
    public IActionResult VerificarRespuesta(int idPregunta, int idRespuesta)
    {
        bool esCorrecta = Juego.VerificarRespuesta(idRespuesta);
        ViewBag.EsCorrecta = esCorrecta;
        ViewBag.Pregunta = Juego.PreguntaActual;
        ViewBag.RespuestaCorrecta = Juego.ListaRespuestas?.FirstOrDefault(r => r.Correcta);

        if (Juego.PreguntaActual == null)
        {
            return View("Fin");
        }

        return View("Respuesta");
    }

    public IActionResult Fin()
    {
        ViewBag.Username = Juego.Username;
        ViewBag.PuntajeFinal = Juego.PuntajeActual;
        return View();
    }
}