//
//  ViewController.swift
//  ¿Qué personaje eres?
//
//  Created by user252760 on 3/23/24.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var labelPregunta: UILabel!
    @IBOutlet weak var botonA: UIButton!
    
    
    let preguntas: [String] = [
        "¿Qué tipo de música prefieres?",
        "¿Cuál es tu idea de una noche perfecta?",
        "¿Qué actividad te gustaría hacer en tu tiempo libre?",
        "¿Cómo describirías tu estilo de vestir?",
        "¿Qué tipo de trabajo te atrae más?"
    ]
    
    struct Respuesta {
        let texto: String
        var puntaje: Int
    }

    var respuestasA: [Respuesta] = [
        Respuesta(texto: " a) Rock clásico.", puntaje: 0),
        Respuesta(texto: " a) Una cena tranquila en casa con amigos.", puntaje: 0),
        Respuesta(texto: "a) Visitar galerías de arte.", puntaje: 0),
        Respuesta(texto: " a) Casual y cómodo.", puntaje: 0),
        Respuesta(texto: " a) Algo relacionado con la música.", puntaje: 0)
    ]
    
    var respuestasB: [Respuesta] = [
        Respuesta(texto: " b) Hip-hop.", puntaje: 0),
        Respuesta(texto: " b) Una fiesta salvaje en un club nocturno.", puntaje: 0),
        Respuesta(texto: " b) Practicar deportes al aire libre.", puntaje: 0),
        Respuesta(texto: " b) Elegante y a la moda.", puntaje: 0),
        Respuesta(texto: " b) Emprendimiento propio.", puntaje: 0)
    ]
    
    var respuestasC: [Respuesta] = [
        Respuesta(texto: " c) Jazz.", puntaje: 0),
        Respuesta(texto: " c) Disfrutar de una película en el cine.", puntaje: 0),
        Respuesta(texto: " c) Leer un buen libro en casa.", puntaje: 0),
        Respuesta(texto: " c) Retro y vintage.", puntaje: 0),
        Respuesta(texto: " c) Trabajo creativo como escribir o pintar.", puntaje: 0)
    ]
    
    var indicePreguntaActual = 0

    @IBAction func botonAPresionado(_ sender: UIButton) {
        respuestasA[indicePreguntaActual].puntaje += 1
        siguientePregunta()
    }
    
    
    func siguientePregunta() {
        indicePreguntaActual += 1
        if indicePreguntaActual < preguntas.count {
            // Actualiza las etiquetas de los botones y el texto de la pregunta
            botonA.setTitle(respuestasA[indicePreguntaActual].texto, for: .normal)
            // Haz lo mismo para botonB y botonC
            labelPregunta.text = preguntas[indicePreguntaActual]
        } else {
            // Navega al ResultViewController
            let resultViewController = storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
            // Configura el ResultViewController...
            navigationController?.pushViewController(resultViewController, animated: true)
            performSegue(withIdentifier: "mostrarResultado", sender: nil)
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mostrarResultado" {
            let resultViewController = segue.destination as! ResultViewController
            let puntajes = [respuestasA.map { $0.puntaje }.reduce(0, +), respuestasB.map { $0.puntaje }.reduce(0, +), respuestasC.map { $0.puntaje }.reduce(0, +)]
            let maxPuntaje = puntajes.max()
            if puntajes[0] == maxPuntaje {
                resultViewController.title = "Tu Serías Mr. White (Larry Dimmick)"
                resultViewController.description = "Eres leal y confiable, con un enfoque práctico en la vida. Siempre estás dispuesto a ayudar a tus amigos y familiares."
                resultViewController.imageView.image = UIImage(named: "mrwhite")
            } else if puntajes[1] == maxPuntaje {
                // Haz lo mismo para Mr. Blonde
            } else {
                // Haz lo mismo para Mr. Pink
            }
        }
    }
    
}

