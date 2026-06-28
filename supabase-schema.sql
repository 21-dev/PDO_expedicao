create table if not exists public.pdo_app_state (
    state_key text primary key,
    state_value jsonb not null,
    updated_at timestamptz not null default now()
);

alter table public.pdo_app_state enable row level security;

drop policy if exists "Allow public read for PDO app state" on public.pdo_app_state;
drop policy if exists "Allow public insert for PDO app state" on public.pdo_app_state;
drop policy if exists "Allow public update for PDO app state" on public.pdo_app_state;
drop policy if exists "Allow authenticated read for PDO app state" on public.pdo_app_state;
drop policy if exists "Allow authenticated insert for PDO app state" on public.pdo_app_state;
drop policy if exists "Allow authenticated update for PDO app state" on public.pdo_app_state;

create policy "Allow authenticated read for PDO app state"
on public.pdo_app_state
for select
to authenticated
using (true);

create policy "Allow authenticated insert for PDO app state"
on public.pdo_app_state
for insert
to authenticated
with check (true);

create policy "Allow authenticated update for PDO app state"
on public.pdo_app_state
for update
to authenticated
using (true)
with check (true);
