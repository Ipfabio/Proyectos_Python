
#Events:
an event is triggered by a certain action:
    Closing the window triggers the sg.WIN_CLOSED event
    In SimpleGUI, every element can trigger an event.

#Example: A button click triggers another event.
The name o that event will be the name, or rather the key, of that button

Our button is calle 'button' and that would be the key and the event name

Podemos llamarlos if event == nombre o utilizando la 'key'
Se recomienda usar el sistema de nombrar las 'key' = '-BUTTON1-' En mayuscula y con guiones

#Values:
Are kind  of similar to events, except, they return more information (In PySimpleGUI)
There are several elements that can contain values, like Input.
These values are stored in one dictionary, called values.
You can access that one with the name of the input element.
If an input element does not have a key it gets a number assigned

#Updating elements:
Every element has an update method.
It can be used to change text, visibility, etc.

#Concepts to understand
1. Elements & Layout
2. Events & Values
3. Update
----------------------------
import PySimpleGUI as sg
# Para añadir otro elemento en el mismo 'row' simplemente hay que añadirlo en la misma 'lista anidada'
layout = [
    [sg.Text('Text', enable_events=True, key='-TEXT-'),
    sg.Spin(['item 1', 'item 2'])],  # Top row
    [sg.Button('Button', key='-BUTTON1-')],  # Second row
    [sg.Input(key='-INPUT-')],  # Third row
    [sg.Text('Hello!'), sg.Button('Test Button', key='-BUTTON2-')]
]

window = sg.Window('Converter', layout)  # Title,Layout

while True:
    event, values = window.read()

    if event == sg.WIN_CLOSED:
        break

    if event == '-BUTTON1-':
        # Así actualizamos el texto ej: .update(['-INPUT-']) en este caso actualiza el texto por lo que escribimos al apretar el boton
        window['-TEXT-'].update(visible=False)
        # Si lo dejamos vacío recibimos todos los 'values', podemos pasarle la 'key' para indicar cual queremos
        # print(values['-INPUT-'])

    if event == '-BUTTON2-':
        print('Boton de pruebas')

    if event == '-TEXT-':
        print('text was pressed')

window.close()
