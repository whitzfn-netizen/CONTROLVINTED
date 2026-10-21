# Guía: ver los mismos datos en todos tus dispositivos

Cuando termines, abrirás https://whitzfn-netizen.github.io/CONTROLVINTED/ en el móvil o en el ordenador y verás las mismas
cuentas, deudas y ajustes en todos. Lo que cambies en uno aparece solo en los demás en unos 15 segundos.

Los datos se guardan en tu propio GitHub, **cifrados** con una clave que solo sabes tú. No hace falta ninguna otra web ni cuenta.

---

## Antes de empezar: haz una copia

En el dispositivo donde tienes tus datos ahora, abre la web y descarga las dos copias:

1. Pestaña **📦 VINTED** → **Copia de seguridad** → **Descargar copia**.
2. Pestaña **💸 DEUDAS** → **Copia de las deudas** → **Descargar copia**.

## Paso 1. En el dispositivo donde están tus datos

Abre la web (si ya estaba abierta, recárgala). Aparece **Sincronizar tus dispositivos**, que pide dos cosas.

### 1. Un token de GitHub (solo esta vez)

Es un permiso para que la web pueda guardar en tu repositorio. Para crearlo:

1. Abre https://github.com/settings/personal-access-tokens/new con tu cuenta de GitHub iniciada.
2. **Token name:** `CONTROLVINTED`. **Expiration:** la más larga que te deje.
3. **Repository access:** marca **Only select repositories** y elige **CONTROLVINTED**.
4. **Permissions** → **Repository permissions** → **Contents** → **Read and write**.
5. Pulsa **Generate token** y copia el código, que empieza por `github_pat_`.

Pégalo en el primer campo.

### 2. Tu clave de acceso

Es la clave con la que se cifran tus datos. Escríbela dos veces. Usa una **frase larga** (mínimo 10 caracteres) que no olvides.
Puede ser la misma que tu clave maestra.

⚠️ Si olvidas esta clave, los datos guardados en GitHub no se pueden recuperar (por eso conviene tener las copias).

Pulsa **Activar sincronización**. Tus cuentas y deudas de ese navegador se suben cifradas.

## Paso 2. En cada uno de tus otros dispositivos

Abre el mismo enlace. Aparece **Conectar este dispositivo**: escribe tu **clave de acceso** y pulsa **Conectar**. Ya está.
Solo se pide una vez en cada dispositivo. El token no hace falta: viaja cifrado con tus datos.

Si ese dispositivo tenía datos propios, la web te pregunta si quieres añadirlos.

---

## Preguntas frecuentes

**¿Alguien puede ver mis datos?**
El repositorio es público, pero el archivo de datos está cifrado (AES-256) con tu clave de acceso: sin ella es ilegible.
El token también va cifrado. Las contraseñas, PIN y códigos llevan además el cifrado de tu clave maestra.

**¿Cuánto tardan en verse los cambios en otro dispositivo?**
Unos 15 segundos con la página abierta, o al momento al volver a abrirla.

**¿Y si no tengo internet?**
La web sigue funcionando con lo que tiene guardado ese dispositivo y sube los cambios cuando vuelve la conexión.

**¿Qué pasa cuando caduca el token?**
La web te avisa y te pide uno nuevo (mismos pasos de arriba). Basta con ponerlo en un dispositivo: los demás lo recogen solos.

**¿Cómo desconecto un dispositivo?**
Pulsa la etiqueta **Guardado en la nube · privado** (debajo del título) → **Desconectar este dispositivo**.

**¿Siguen funcionando las copias de seguridad?**
Sí, igual que antes. Descárgalas de vez en cuando.
