-- Shared file favorites: all visitors to this public site see the same set.
create table if not exists public.shared_file_favorites (
  file_key text primary key,
  created_at timestamptz not null default now()
);

alter table public.shared_file_favorites enable row level security;

grant select, insert, delete on public.shared_file_favorites to anon, authenticated;

drop policy if exists "Anyone can read shared file favorites" on public.shared_file_favorites;
create policy "Anyone can read shared file favorites"
  on public.shared_file_favorites
  for select
  to anon, authenticated
  using (true);

drop policy if exists "Anyone can add shared file favorites" on public.shared_file_favorites;
create policy "Anyone can add shared file favorites"
  on public.shared_file_favorites
  for insert
  to anon, authenticated
  with check (true);

drop policy if exists "Anyone can remove shared file favorites" on public.shared_file_favorites;
create policy "Anyone can remove shared file favorites"
  on public.shared_file_favorites
  for delete
  to anon, authenticated
  using (true);
