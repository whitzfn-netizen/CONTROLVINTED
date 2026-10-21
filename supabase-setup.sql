-- CONTROLVINTED · Configuración de Supabase
-- Pega todo este archivo en Supabase → SQL Editor → New query y pulsa «Run».
-- Se puede ejecutar más de una vez sin problema.

-- 1. Tabla donde se guardan cuentas, historial, ajustes y deudas.
--    Cada fila pertenece a un usuario (user_id).
create table if not exists public.items (
  user_id    uuid        not null default auth.uid() references auth.users (id) on delete cascade,
  collection text        not null check (collection in ('accounts', 'history', 'settings', 'debts')),
  id         text        not null check (char_length(id) between 1 and 200),
  data       jsonb       not null,
  updated_at timestamptz not null default now(),
  primary key (user_id, collection, id)
);

-- 2. Seguridad: cada usuario solo puede ver y cambiar sus propias filas.
alter table public.items enable row level security;

drop policy if exists "items: leer las mías"      on public.items;
drop policy if exists "items: crear las mías"     on public.items;
drop policy if exists "items: cambiar las mías"   on public.items;
drop policy if exists "items: borrar las mías"    on public.items;

create policy "items: leer las mías"    on public.items for select to authenticated using ((select auth.uid()) = user_id);
create policy "items: crear las mías"   on public.items for insert to authenticated with check ((select auth.uid()) = user_id);
create policy "items: cambiar las mías" on public.items for update to authenticated using ((select auth.uid()) = user_id) with check ((select auth.uid()) = user_id);
create policy "items: borrar las mías"  on public.items for delete to authenticated using ((select auth.uid()) = user_id);

-- Sin sesión iniciada no se puede hacer nada con la tabla.
revoke all on public.items from anon;
grant select, insert, update, delete on public.items to authenticated;

-- 3. Avisos en tiempo real para que los cambios lleguen solos a los demás dispositivos.
do $$
begin
  if not exists (
    select 1 from pg_publication_tables
    where pubname = 'supabase_realtime' and schemaname = 'public' and tablename = 'items'
  ) then
    alter publication supabase_realtime add table public.items;
  end if;
end $$;
