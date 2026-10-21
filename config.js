// Conexión con tu proyecto de Supabase.
// Estos dos datos son PÚBLICOS: sirven para encontrar tu proyecto, no para abrirlo.
// Tus datos los protegen tu correo y contraseña de inicio de sesión y las reglas de la tabla.
// NUNCA pongas aquí la clave «secret» ni la «service_role».
// Si los dejas vacíos, la web funciona como antes: guardando solo en cada navegador.
window.CONTROLVINTED_SUPABASE = {
  url: '',      // Project URL, por ejemplo: https://abcdefghijkl.supabase.co
  anonKey: '',  // Publishable key (empieza por sb_publishable_) o la clave «anon public»
};
