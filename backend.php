<?php
header('Content-Type: text/html; charset=utf-8');

// Palabras clave asociadas a comandos específicos
$commandKeywords = array(
    "adios" => array("adios", "hasta luego", "nos vemos", "chau"),
    "hola" => array("hola"),
    "ver_alojamientos_populares" => array("populares"),
    "mostrar_alojamientos" => array("todos"),
    "mostrar_venta" => array("venta"),
    "mostrar_renta" => array("renta"),
);

// Obtener el mensaje del usuario del POST
$userInput = $_POST["userInput"];

// Convertir el mensaje a una palabra clave o a una colonia
$keywordOrColony = convert_to_keyword_or_colony($userInput);

// Procesar la consulta del usuario y obtener una respuesta
$prologResult = procesar_consulta($userInput, $keywordOrColony);

// Devolver la respuesta
echo $prologResult;

// Consultas específicas
function procesar_consulta($userInput, $keywordOrColony) {
    if (preg_match('/(características|caracteristicas) (de|tiene) (.+)/i', $userInput, $matches)) {
        return consultar_caracteristicas($matches[3]);
    } elseif (preg_match('/(precio|presupuesto) de (\d+)/i', $userInput, $matches)) {
        return consultar_precio($matches[2]);
    } elseif (preg_match('/(quién|quien) es el propietario de (.+)/i', $userInput, $matches)) {
        return consultar_propietario($matches[2]);
    } elseif (preg_match('/(\d+) cuartos/i', $userInput, $matches)) {
        return consultar_cuartos($matches[1]);
    } elseif (preg_match('/(cómo|como) contacto a (.+)/i', $userInput, $matches)) {
        return contactar_propietario($matches[2]);
    } elseif (preg_match('/(venta|renta) en (.+)/i', $userInput, $matches)) {
        return consultar_por_operacion_y_colonia($matches[1], $matches[2]);
    }
    return prolog_query($keywordOrColony);
}

// Función para manejar consultas sobre operación y colonia
function consultar_por_operacion_y_colonia($operacion, $colonia) {
    $prologResponse = shell_exec('swipl -f backend.pl -g "buscar_alojamientos_por_operacion_y_colonia('.$operacion.', '.$colonia.', Respuesta), write(Respuesta), halt." -t halt');

    if ($prologResponse !== null) {
        $alojamientos = explode(',', $prologResponse);
        $formattedResponse = "Alojamientos en la colonia $colonia:\n";
        foreach ($alojamientos as $alojamiento) {
            $formattedResponse .= "- $alojamiento\n";
        }
        return nl2br($formattedResponse);
    } else {
        return "Parece que no hay alojamientos en $operacion en $colonia. Intenta buscar un alojamiento cerca de tu colonia.";
    }
}

// Función para manejar consultas sobre cómo contactar al propietario de un alojamiento
function contactar_propietario($nombreAlojamiento) {
    $prologResponse = shell_exec('swipl -f backend.pl -g "numero_telefono_propietario(\''.$nombreAlojamiento.'\', Propietario), format(\'Puedes contactar ~w al: ~w\', [\''.$nombreAlojamiento.'\', Propietario]), propietario(Propietario, Telefono), write(Telefono), halt." -t halt');
    if ($prologResponse !== null) {
        return $prologResponse;
    } else {
        return "Parece que no hay algún propietario llamado $nombreAlojamiento. Asegúrate de haber escrito correctamente el nombre del propietario.";
    }
}

function consultar_cuartos($habitaciones) {
    $prologResponse = shell_exec('swipl -f backend.pl -g "format_respuesta_habitaciones('.$habitaciones.', Respuesta), write(Respuesta), halt." -t halt');
    if ($prologResponse !== null) {
        return $prologResponse;
    } else {
        return "Parece que tu mensaje puede haber sido mal escrito o no es del todo claro. ¿Podrías brindar más detalles o aclarar con qué necesitas ayuda?";
    }
}

// Función para manejar consultas sobre características de alojamientos específicos
function consultar_caracteristicas($nombreAlojamiento) {
    $prologResponse = shell_exec('swipl -f backend.pl -g "caracteristicas_alojamiento(\''.$nombreAlojamiento.'\', Caracteristicas), write(Caracteristicas), halt." -t halt');
    if ($prologResponse !== null) {
        $alojamientos = explode(',', $prologResponse);
        $formattedResponse = "Caracteristicas de $nombreAlojamiento:\n";
        foreach ($alojamientos as $alojamiento) {
            $formattedResponse .= "- $alojamiento\n";
        }
        return nl2br($formattedResponse);
    } else {
        return "No reconozco ese alojamiento en mi base de conocimientos puedes verificar si esta correctamente escrito";
    }
}

// Función para manejar consultas sobre precio de alojamientos específicos
function consultar_precio($presupuesto) {
    $prologResponse = shell_exec('swipl -f backend.pl -g "precio_alojamiento_presupuesto('.$presupuesto.', NombreAlojamiento, Precio), format(\'Nombre: ~w, Precio: ~w\n\', [NombreAlojamiento, Precio]), fail." -t halt');
    if ($prologResponse !== null) {
        $alojamientos = explode(',', $prologResponse);
        $formattedResponse = "Alojamientos con precio de $presupuesto:\n";
        foreach ($alojamientos as $alojamiento) {
            $formattedResponse .= " $alojamiento\n";
        }
        return nl2br($formattedResponse);
    } else {
        return "No se ha encontrado ningún departamento disponible con el presupuesto de $presupuesto.";
    }
}

// Función para manejar consultas sobre el propietario de un alojamiento específico
function consultar_propietario($nombreAlojamiento) {
    $prologResponse = shell_exec('swipl -f backend.pl -g "propietario_de_alojamiento(\''.$nombreAlojamiento.'\', Propietario), format(\'El propietario de ~w es ~w.\', [\''.$nombreAlojamiento.'\', Propietario]), halt." -t halt');
    if ($prologResponse !== null) {
        return $prologResponse;
    } else {
        return "Parece que tu mensaje puede haber sido mal escrito o no es del todo claro. ¿Podrías brindar más detalles o aclarar con qué necesitas ayuda?";
    }
}

// Función para procesar la consulta del usuario y obtener una respuesta
function prolog_query($keywordOrColony) {
    if ($keywordOrColony === "hola") {
        return "¡Hola! ¿En qué puedo ayudarte?";
    } elseif ($keywordOrColony === "adios") {
        return "Hasta luego. ¡Que tengas un buen día!";
    }

    if (array_key_exists($keywordOrColony, $GLOBALS['commandKeywords'])) {
        $prologResponse = shell_exec('swipl -f backend.pl -g "bot_response(\''.$keywordOrColony.'\', Response), write(Response), halt." -t halt');
        $prologResponse = trim($prologResponse, '[]');
        if ($prologResponse !== null) {
            $alojamientos = explode(',', $prologResponse);
            $formattedResponse = "Alojamientos encontrados fueron:\n";
            foreach ($alojamientos as $alojamiento) {
                $formattedResponse .= "- $alojamiento\n";
            }
            return nl2br($formattedResponse);
        } else {
            return "Parece que no hay alojamientos disponibles. Intenta buscar un alojamiento cerca de tu colonia.";
        }
    } else {
        $prologResponse = shell_exec('swipl -f backend.pl -g "buscar_alojamientos(\''.$keywordOrColony.'\', Response), write(Response), halt." -t halt');
        $prologResponse = trim($prologResponse, '[]');
        if ($prologResponse !== null) {
            $alojamientos = explode(',', $prologResponse);
            $formattedResponse = "Alojamientos en la colonia $keywordOrColony:\n";
            foreach ($alojamientos as $alojamiento) {
                $formattedResponse .= "- $alojamiento\n";
            }
            return nl2br($formattedResponse);
        } else {
            return "Parece que no hay alojamientos en $keywordOrColony. Intenta buscar un alojamiento cerca de tu colonia.";
        }
    }
}

function convert_to_keyword_or_colony($userInput) {
    $userInput = strtolower($userInput);
    $colonies = array(
        "centro", "bacalar", "colonos", "xlapac", "sisal", "chichimila", "tequila", "santa ana", "san juan",
        "san benito", "santa isabel", "san lucas", "san bernardo", "san francisco", "san jose", "san miguel",
        "santiago", "san pedro", "san juditas", "san antonio", "san gabriel"
    );

    foreach ($colonies as $colony) {
        if (strpos($userInput, $colony) !== false) {
            return $colony;
        }
    }

    foreach ($GLOBALS['commandKeywords'] as $command => $associatedKeywords) {
        foreach ($associatedKeywords as $associatedKeyword) {
            if (strpos($userInput, $associatedKeyword) !== false) {
                return $command;
            }
        }
    }

    return "error";
}
?>
