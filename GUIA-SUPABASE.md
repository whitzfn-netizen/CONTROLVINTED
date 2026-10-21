# Guía: ver los mismos datos en todos tus dispositivos

Esta guía conecta la web con **Supabase**, una base de datos en la nube con plan gratuito. Cuando termines, abrirás
https://whitzfn-netizen.github.io/CONTROLVINTED/ en el móvil o en el ordenador, entrarás con tu correo y contraseña,
y verás las mismas cuentas, deudas y ajustes en todos. Lo que cambies en uno aparece solo en los demás en menos de un segundo.

Se tarda unos 10 minutos. No hace falta saber programar.

---

## Antes de empezar: haz una copia

En el dispositivo donde tienes tus datos ahora, abre la web y descarga las dos copias:

1. Pestaña **📦 VINTED** → botón **Copia de seguridad** → **Descargar copia**.
2. Pestaña **💸 DEUDAS** → botón **Copia de las deudas** → **Descargar copia**.

Guarda los dos archivos. Si algo saliera mal, con ellos se recupera todo.

---

## Paso 1. Crear la cuenta y el proyecto en Supabase

1. Entra en https://supabase.com y pulsa **Start your project**. Lo más fácil es entrar con **Continue with GitHub**.
2. Pulsa **New project**.
3. Rellena:
   - **Name:** `CONTROLVINTED`
   - **Database Password:** pulsa **Generate a password** y guárdala en un sitio seguro. La web no la usa, pero Supabase la pide.
   - **Region:** una de Europa, por ejemplo *Central EU (Frankfurt)*.
   - **Plan:** Free.
4. Pulsa **Create new project** y espera uno o dos minutos a que termine.

## Paso 2. Crear la tabla y las reglas de seguridad

1. En el menú de la izquierda, entra en **SQL Editor**.
2. Pulsa **New query** (o el **+**).
3. Abre el archivo [`supabase-setup.sql`](https://github.com/whitzfn-netizen/CONTROLVINTED/blob/main/supabase-setup.sql),
   pulsa el botón de **copiar** (arriba a la derecha del código) y pégalo entero en el editor de Supabase.
4. Pulsa **Run**. Debe aparecer *Success. No rows returned*.

Esto crea una tabla en la que **cada fila pertenece a un usuario**, y reglas que impiden que nadie sin tu sesión pueda leerla, cambiarla o borrarla.

## Paso 3. Crear tu usuario

1. Menú de la izquierda → **Authentication** → **Users**.
2. Pulsa **Add user** → **Create new user**.
3. Escribe tu correo y una contraseña larga. Usa una **distinta** de tu clave maestra de las contraseñas.
4. Marca **Auto Confirm User** y pulsa **Create user**.

Con este correo y esta contraseña entrarás en la web desde cada dispositivo.

## Paso 4. Cerrar el registro a desconocidos

1. **Authentication** → **Sign In / Providers** (en algunas versiones aparece como **Providers** o **Settings**).
2. Desactiva **Allow new users to sign up** y pulsa **Save**.

Así nadie más puede crearse una cuenta en tu proyecto. Aunque alguien lo hiciera, las reglas del paso 2 no le dejarían ver tus datos.

## Paso 5. Copiar los dos datos públicos

1. Abajo a la izquierda, entra en **Project Settings** (la rueda dentada).
2. En **Data API** (o en la página principal del proyecto) copia la **Project URL**. Es algo como `https://abcdefghijkl.supabase.co`.
3. En **API Keys** copia la **Publishable key** (empieza por `sb_publishable_`). Si solo ves claves antiguas, copia la **anon public**.

⚠️ **No copies nunca la clave `secret` ni la `service_role`.** Esas dan acceso total y no deben estar en la web.

## Paso 6. Poner esos datos en la web

Elige una de las dos opciones:

- **Opción fácil:** envíame la Project URL y la Publishable key en el chat y lo dejo puesto yo. Son datos públicos, se pueden compartir.
- **Tú mismo:** abre [`config.js`](https://github.com/whitzfn-netizen/CONTROLVINTED/blob/main/config.js) en GitHub, pulsa el **lápiz** (Edit),
  pega la URL entre las comillas de `url: ''` y la clave entre las de `anonKey: ''`, y pulsa **Commit changes**.

GitHub Pages tarda uno o dos minutos en actualizarse.

## Paso 7. Subir tus datos actuales a la nube

Hazlo **primero en el dispositivo donde ya tienes las cuentas y las deudas**:

1. Abre https://whitzfn-netizen.github.io/CONTROLVINTED/ (si la tenías abierta, recarga la página).
2. Aparece **Entrar**: escribe el correo y la contraseña del paso 3.
3. La web detecta los datos de ese navegador y pregunta si quieres subirlos: pulsa **Subir a la nube**.
4. Arriba debe poner **Guardado en la nube · privado**.

## Paso 8. Entrar desde los demás dispositivos

En cada móvil u ordenador: abre el mismo enlace, entra con el mismo correo y contraseña, y ya está. Solo se pide una vez por dispositivo.

Tu clave maestra de las contraseñas también viaja con los datos: en cada dispositivo pulsa **Desbloquear** y escribe la misma clave maestra de siempre.

---

## Preguntas frecuentes

**¿Es seguro que la URL y la clave pública estén en GitHub?**
Sí. Solo sirven para encontrar el proyecto. Para leer o cambiar datos hace falta iniciar sesión con tu correo y contraseña,
y las reglas de la tabla solo dejan a cada usuario ver sus propias filas. Las contraseñas de Vinted y del correo, el PIN, el PUK y los códigos
además siguen cifrados con tu clave maestra antes de salir del dispositivo: ni Supabase puede leerlos.

**¿Cómo cierro la sesión en un dispositivo?**
Pulsa la etiqueta **Guardado en la nube · privado** (arriba, debajo del título) → **Cerrar sesión en este dispositivo**.

**Si no tengo internet, ¿qué pasa?**
La web avisa de que no puede conectar y te deja **Reintentar** o **Seguir sin sincronizar**. Si sigues sin sincronizar, lo que cambies se queda solo en ese navegador.

**Supabase gratis, ¿tiene alguna pega?**
Si el proyecto pasa una semana sin usarse, Supabase lo pone en pausa. Los datos no se pierden: entra en supabase.com, abre el proyecto y pulsa **Restore**.

**¿Siguen funcionando las copias de seguridad?**
Sí, igual que antes. Te recomiendo descargar las dos copias de vez en cuando.
