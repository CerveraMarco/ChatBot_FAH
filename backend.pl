:- use_module(library(utf8)).
:- set_prolog_flag(encoding, utf8).
%:- encoding(utf8).
% Definición de alojamiento
operacion(venta).
operacion(renta).

tipodepropiedad(departamento).
tipodepropiedad(casa).

% Definición de colonias
colonia('bacalar').
colonia('colonos').
colonia('xlapac').
colonia('sisal').
colonia('chichimila').
colonia('tequila').
colonia('santa ana').
colonia('san juan').
colonia('san benito').
colonia('santa isabel').
colonia('san lucas').
colonia('san bernardo').
colonia('san francisco').
colonia('san jose').
colonia('san miguel').
colonia('santiago').
colonia('san pedro').
colonia('san juditas').
colonia('san antonio').
colonia('san gabriel').

% Colonias cercanas
colonias_cercanas(colonia('bacalar'), colonia('colonos')).
colonias_cercanas(colonia('colonos'), colonia('bacalar')).
colonias_cercanas(colonia('bacalar'), colonia('xlapac')).
colonias_cercanas(colonia('xlapac'), colonia('bacalar')).
colonias_cercanas(colonia('colonos'), colonia('san francisco')).
colonias_cercanas(colonia('san francisco'), colonia('colonos')).
colonias_cercanas(colonia('xlapac'), colonia('san miguel')).
colonias_cercanas(colonia('san miguel'), colonia('xlapac')).
colonias_cercanas(colonia('sisal'), colonia('santa ana')).
colonias_cercanas(colonia('santa ana'), colonia('sisal')).
colonias_cercanas(colonia('san juan'), colonia('san benito')).
colonias_cercanas(colonia('san benito'), colonia('san juan')).
colonias_cercanas(colonia('san lucas'), colonia('san bernardo')).
colonias_cercanas(colonia('san bernardo'), colonia('san lucas')).
colonias_cercanas(colonia('tequila'), colonia('santa isabel')).
colonias_cercanas(colonia('santa isabel'), colonia('tequila')).
colonias_cercanas(colonia('santiago'), colonia('san pedro')).
colonias_cercanas(colonia('san pedro'), colonia('santiago')).
colonias_cercanas(colonia('san juditas'), colonia('san antonio')).
colonias_cercanas(colonia('san antonio'), colonia('san juditas')).

% Propietarios
propietario('Luisa Pérez', 9988774444).
propietario('Jorge Mendoza', 9990001111).
propietario('Marco Cervera', 9990000001).
propietario('Ana Canul', 9990000002).
propietario('Ana Medina', 9990000003).
propietario('David Torres', 9990000004).
propietario('Yahir Ademar', 9990000005).
propietario('Carlos Poot', 9990000006).
propietario('Amy Poot', 9990000007).
propietario('Jafet Cocom', 9990000008).
propietario('Edgar Yam', 9990000009).
propietario('Manuel Masa', 9990000010).
propietario('Daniel Dzib', 9990000011).
propietario('Sandra Romer', 9990000012).
propietario('Lucia Ruiz', 9990000013).
propietario('Roberto Flores', 9990000014).
propietario('Elena Romero', 9990000015).
propietario('Javier Carona', 9990000016).
propietario('Guadalupe Vargas', 9990000017).

% Relaciones de es_propietario
es_propietario('Marco Cervera', 'Departamentos Cerveras').
es_propietario('Ana Canul', 'Casa Girasol').
es_propietario('Ana Medina', 'Casa Anny').
es_propietario('David Torres', 'Torres del Anochecer').
es_propietario('Yahir Ademar', 'Casa Bonita').
es_propietario('Carlos Poot', 'Casa del Parque').
es_propietario('Amy Poot', 'Departamento Amy').
es_propietario('Jafet Cocom', 'Casa Cocom').
es_propietario('Edgar Yam', 'Chalet del Atardecer').
es_propietario('Manuel Masa', 'Casa Encantada').
es_propietario('Daniel Dzib', 'Quinta Primavera').
es_propietario('Sandra Romer', 'Bandidas').
es_propietario('Lucia Ruiz', 'Casita Acogedora').
es_propietario('Roberto Flores', 'Suspiro').
es_propietario('Elena Romero', 'Hogar Dulce Hogar').
es_propietario('Javier Carona', 'Encantos').
es_propietario('Guadalupe Vargas', 'Casa del Sueño').

% Alojamientos
alojamiento('Departamentos Cerveras', tipodepropiedad(departamento), operacion(venta), colonia('bacalar'), 2, 2, valladolid, 1400, disponible).
alojamiento('Casa Girasol', tipodepropiedad(casa), operacion(renta), colonia('bacalar'), 2, 4, valladolid, 2400, disponible).
alojamiento('Casa Anny', tipodepropiedad(casa), operacion(renta), colonia('bacalar'), 1, 2, valladolid, 2400, disponible).
alojamiento('Torres del Anochecer', tipodepropiedad(departamento), operacion(renta), colonia('xlapac'), 1, 3, valladolid, 1400, disponible).
alojamiento('Casa Bonita', tipodepropiedad(casa), operacion(venta), colonia('bacalar'), 1, 5, valladolid, 1400, disponible).
alojamiento('Casa del Parque', tipodepropiedad(casa), operacion(renta), colonia('sisal'), 1, 4, valladolid, 2400, disponible).
alojamiento('Departamento Amy', tipodepropiedad(departamento), operacion(venta), colonia('santa ana'), 1, 2, valladolid, 2400, disponible).
alojamiento('Casa Cocom', tipodepropiedad(casa), operacion(renta), colonia('san juan'), 2, 5, valladolid, 1400, disponible).
alojamiento('Chalet del Atardecer', tipodepropiedad(casa), operacion(renta), colonia('san benito'), 1, 3, valladolid, 2400, disponible).
alojamiento('Apartementos del Amancer', tipodepropiedad(departamento), operacion(venta), colonia('santa isabel'), 1, 5, valladolid, 1400, disponible).
alojamiento('Casa Encantada', tipodepropiedad(casa), operacion(renta), colonia('san lucas'), 1, 4, valladolid, 2400, disponible).
alojamiento('Quinta Primavera', tipodepropiedad(casa), operacion(renta), colonia('san bernardo'), 1, 3, valladolid, 2400, disponible).
alojamiento('Bandidas', tipodepropiedad(departamento), operacion(venta), colonia('san francisco'), 1, 5, valladolid, 1400, disponible).
alojamiento('Casita Acogedora', tipodepropiedad(casa), operacion(renta), colonia('san jose'), 1, 4, valladolid, 2400, disponible).
alojamiento('Suspiro', tipodepropiedad(departamento), operacion(venta), colonia('san miguel'), 1, 2, valladolid, 2400, disponible).
alojamiento('Hogar Dulce Hogar', tipodepropiedad(casa), operacion(renta), colonia('santiago'), 1, 3, valladolid, 2400, disponible).
alojamiento('Encantos', tipodepropiedad(departamento), operacion(venta), colonia('san pedro'), 1, 5, valladolid, 1400, disponible).
alojamiento('Casa del Sueño', tipodepropiedad(casa), operacion(renta), colonia('san juan'), 1, 4, valladolid, 2400, disponible).


% Regla para encontrar todos los alojamientos
find_all_alojamientos(Alojamientos) :-
    findall(Nombre, alojamiento(Nombre, _, _, _, _, _, _, _, _), Alojamientos).

%%%%%
% Encuentra alojamientos en la colonia especificada
find_alojamientos_por_colonia(Colonia, Alojamientos) :-
    findall(Nombre, alojamiento(Nombre, _, _, colonia(Colonia), _, _, _, _, _), Alojamientos).

% Encuentra alojamientos en colonias cercanas a la colonia especificada
find_alojamientos_por_colonias_cercanas(Colonia, Alojamientos) :-
    findall(Nombre, 
        (colonias_cercanas(colonia(Colonia), colonia(ColoniaCercana)),
        alojamiento(Nombre, _, _, colonia(ColoniaCercana), _, _, _, _, _)), 
        Alojamientos).

% Combina los resultados de ambas búsquedas y elimina duplicados
buscar_alojamientos(Colonia, AlojamientosUnicos) :-
    find_alojamientos_por_colonia(Colonia, AlojamientosColonia),
    find_alojamientos_por_colonias_cercanas(Colonia, AlojamientosCercanas),
    append(AlojamientosColonia, AlojamientosCercanas, AlojamientosCombinados),
    sort(AlojamientosCombinados, AlojamientosUnicos).
%%%%%


% Regla para encontrar alojamientos populares por estrellas (4 estrellas o más)
find_alojamientos_populares(Alojamientos) :-
    findall(Nombre, (alojamiento(Nombre, _, _, _, _, Estrellas, _, _, _), Estrellas >= 4), Alojamientos).

% Regla para formatear la respuesta como lista
format_respuesta(Alojamientos, Alojamientos).

% Regla para responder a mensajes específicos
% Regla para responder a mensajes específicos
bot_response(Mensaje, Respuesta) :-
    (   Mensaje = 'hola' ->
        Respuesta = '¡Hola! ¿En qué puedo ayudarte?'
    ;   Mensaje = 'mostrar_alojamientos' ->
        find_all_alojamientos(Alojamientos),
        format_respuesta(Alojamientos, Respuesta)
    ;   Mensaje = 'ver_alojamientos_populares' ->
        find_alojamientos_populares(Alojamientos),
        format_respuesta(Alojamientos, Respuesta)
    ;   Mensaje = 'mostrar_venta' ->
        find_alojamientos_venta(Alojamientos),
        format_respuesta(Alojamientos, Respuesta)
    ;   Mensaje = 'mostrar_renta' ->
        find_alojamientos_renta(Alojamientos),
        format_respuesta(Alojamientos, Respuesta)
    ;   Mensaje = 'adios' ->
        Respuesta = '¡Adiós! Espero verte pronto.'
    ;   Mensaje = 'error' ->
        Respuesta = 'Lo siento, no entendí tu consulta. Por favor, intenta de nuevo.'
    ).

% Regla para encontrar alojamientos en venta
find_alojamientos_venta(Alojamientos) :-
    findall(Nombre, alojamiento(Nombre, _, operacion(venta), _, _, _, _, _, _), Alojamientos).

% Regla para encontrar alojamientos en renta
find_alojamientos_renta(Alojamientos) :-
    findall(Nombre, alojamiento(Nombre, _, operacion(renta), _, _, _, _, _, _), Alojamientos).


% Regla para encontrar las características de un alojamiento por su nombre
caracteristicas_alojamiento(NombreAlojamiento, Caracteristicas) :-
    alojamiento(NombreAlojamiento, tipodepropiedad(Tipo), operacion(Operacion), colonia(Colonia), Habitaciones, Estrellas, Ciudad, Precio, Disponible),
    format(atom(Caracteristicas), 'Nombre: ~w, Tipo de propiedad: ~w, Operación: ~w, Ciudad: ~w, Número de habitaciones: ~w, Calificación: ~w estrellas, Ciudad: ~w, Precio: ~w, Estado: ~w\n', 
           [NombreAlojamiento, Tipo, Operacion, Colonia, Habitaciones, Estrellas, Ciudad, Precio, Disponible]).

% Regla para encontrar alojamientos cuyo precio sea igual o menor que el presupuesto dado
precio_alojamiento_presupuesto(Presupuesto, NombreAlojamiento, Precio) :-
    alojamiento(NombreAlojamiento, _, _, _, _, _, _, Precio, _),
    Precio =< Presupuesto.

% Regla para encontrar el propietario de un alojamiento dado su nombre
propietario_de_alojamiento(NombreAlojamiento, Propietario) :-
    es_propietario(Propietario, NombreAlojamiento).

% Regla para formatear la respuesta sobre el propietario
format_respuesta_propietario(NombreAlojamiento, Respuesta) :-
    (   propietario_de_alojamiento(NombreAlojamiento, Propietario) ->
        format(atom(Respuesta), 'El propietario de ~w es ~w.', [NombreAlojamiento, Propietario])
    ;   format(atom(Respuesta), 'No se encontró el propietario de ~w.', [NombreAlojamiento])
    ).

% Regla para encontrar alojamientos con un número específico de habitaciones
num_habitaciones(NUM_HAB, NombreAlojamiento) :-
    alojamiento(NombreAlojamiento, _, _, _, NUM_HAB, _, _, _, _).

% Regla para formatear la respuesta sobre el número de habitaciones
format_respuesta_habitaciones(NUM_HAB, Respuesta) :-
    findall(Nombre, num_habitaciones(NUM_HAB, Nombre), Alojamientos),
    atomic_list_concat(Alojamientos, ', ', ListaAlojamientos),
    format(atom(Respuesta), 'Alojamientos con ~w habitaciones: ~w', [NUM_HAB, ListaAlojamientos]).

numero_telefono_propietario(NombrePropietario, NumeroTelefono) :-
    propietario(NombrePropietario, NumeroTelefono).

% Regla para buscar alojamientos por operación y colonia
buscar_alojamientos_por_operacion_y_colonia(Operacion, Colonia, Respuesta) :-
    findall(NombreAlojamiento, 
            (alojamiento(NombreAlojamiento, _, operacion(Operacion), colonia(Colonia), _, _, _, _, _)), 
            Alojamientos),
    atomic_list_concat(Alojamientos, ', ', Respuesta).
