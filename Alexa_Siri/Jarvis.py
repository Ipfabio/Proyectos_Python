import speech_recognition as sr # Reconoce la voz
import pyttsx3 # Para escuchar SU voz
import pywhatkit # Para que realice las acciones
import datetime
import wikipedia # Para que realice busquedas en wikipedia

name = 'Jarvis' # Declaramos SU nombre
listener = sr.Recognizer() # Nos reconoce

engine = pyttsx3.init() # inicializamos

voices = engine.getProperty('voices') # Regresa una lista de las voces
engine.setProperty('voice', voices[0].id) # Establecemos una voz

#for voice in voices: Podemos iterar para ver los distintos registros de voces
#   print(voice)

def talk(text):
    engine.say(text) # Diga el texto que le pasamos
    engine.runAndWait()

def listen():
    try:
        with sr.Microphone() as source:
            print("Escuchando...")
            voice = listener.listen(source) # source = microphone
            rec = listener.recognize_google(voice) # Utilizamos la api de google
            rec = rec.lower()
            if name in rec: # Si no decimos el nombre, no responde
                rec = rec.replace(name, '') # Para evitar que diga su nombre al repetir
                print(rec) # Repite lo que decimos
    except:
        pass
    return rec

def run():
    rec = listen() # aquí asignamos a la var 'rec' lo que sale de 'listen'
    if 'reproduce' in rec:
        music = rec.replace('reproduce', '') # Para que no repita 'reproduce'
        talk(f'Reproduciendo {music}')
        pywhatkit.playonyt(music) # Para que realmente busque en YT
    elif 'hora' in rec:
        hora = datetime.datetime.now().strftime('%H:%M')
        talk(f'Son las {hora}')
    elif 'busca' in rec:
        order = rec.replace('busca', '')
        info = wikipedia.summary(order, 1)
        talk(info)
    else:
        talk('Vuelve a intentarlo')

while True:
    run()
