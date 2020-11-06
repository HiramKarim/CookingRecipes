# CookingRecipes
Uala Exercice Application

Desarrollo de una app para consulta de libros

Se quiere hacer una app para poder buscar recetas de cocina.

Puntos a resolver

La pantalla inicial de la app debe contener un buscador y un listado. A medida que el usuario escribe en el buscador, el listado debe actualizarse con los resultados. El endpoint para buscar es:
https://www.themealdb.com/api/json/v1/1/search.php?s={string}

De cada plato, se tiene que ver: La foto (strMealThumb), el nombre (strMeal)y la categoría (strCategory).

Al hacer tap en cualquiera de las filas, se debe ver otra pantalla con los detalles del plato. El usuario debe ver el nombre del plato y las instrucciones (strInstructions).
Los datos se puede obtener desde los resultados de la búsqueda, o llamando por el id del plato a:
https://www.themealdb.com/api/json/v1/1/lookup.php?i={id}

En la pantalla de detalle, agregar el listado de ingredientes (strIngredientN). Todos los platos vuelven con un listado del strIngrediente1 al strIngrediente20, aunque el valor puede ser null.

En la pantalla inicial (el buscador) agregar un banner inferior que muestre la imagen de un plato random. El plato random se debe obtener con el ws:
https://www.themealdb.com/api/json/v1/1/random.php
Cada 30 segundos, la imagen del plato debe cambiar por otra (también random)

En la pantalla de detalle, agregar el video (strYoutube).


Tiempo de resolución
4 horas

Criterios de evaluación
El proyecto debe ser entregado dentro del tiempo de resolución, desde el momento en que se envía el mail. 

No es indispensable terminar todos los puntos para entregar el ejercicio.

Hacer Unit Testing no es obligatorio pero será considerado como un punto a favor, y es tenido en cuenta al ver hasta que punto se llegó a completar.

No hay ninguna restricción de que lenguaje utilizar, frameworks, dependencias, librerías, etc. Queda al criterio del candidato.

No hay restricción de diseño, queda a criterio del candidato.

Se va a evaluar el uso de git. Es preferible hacer commits atómicos, por función y bien definidos.


Entrega
El proyecto deberá ser subido a un repositorio git y enviarnos el link en la hora de finalización.
