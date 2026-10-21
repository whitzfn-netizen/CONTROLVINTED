# Control de cuentas Vinted

Panel para controlar cuentas de Vinted (accesos, SIM, móviles y dinero) y deudas.

- Con Supabase configurado, los datos se sincronizan entre todos tus dispositivos tras iniciar sesión.
  Cómo configurarlo: [GUIA-SUPABASE.md](GUIA-SUPABASE.md).
- Sin configurar (`config.js` vacío), los datos se guardan **solo en el navegador** donde se usa.
- Las contraseñas, PIN y códigos se cifran en el navegador con una clave maestra antes de guardarse en ningún sitio.
- `config.js` solo contiene datos públicos de Supabase (URL y clave publishable). Nunca pongas ahí la clave secreta.
