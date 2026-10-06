create table aspirants(
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users on delete cascade,
  seat text not null, cons text, ward text,
  name text not null, party text, phone text, wa text, fb text, email text,
  bio text, photo_url text,
  approved boolean not null default false,
  created_at timestamptz default now());
create table messages(
  id uuid primary key default gen_random_uuid(),
  aspirant_id uuid not null references aspirants on delete cascade,
  name text, contact text, message text, created_at timestamptz default now());
create table subscribers(
  id uuid primary key default gen_random_uuid(),
  aspirant_id uuid not null references aspirants on delete cascade,
  email text, created_at timestamptz default now());

alter table aspirants enable row level security;
alter table messages enable row level security;
alter table subscribers enable row level security;

-- Aspirants: public sees approved; owners see their own pending profile
create policy "read approved or own" on aspirants for select using (approved or user_id = auth.uid());
create policy "insert own" on aspirants for insert to authenticated with check (user_id = auth.uid());
create policy "update own" on aspirants for update to authenticated using (user_id = auth.uid()) with check (user_id = auth.uid());
-- Stop users approving themselves: only listed columns are writable
revoke insert, update on aspirants from anon, authenticated;
grant insert (user_id, seat, cons, ward, name, party, phone, wa, fb, email, bio, photo_url) on aspirants to authenticated;
grant update (name, party, phone, wa, fb, email, bio, photo_url) on aspirants to authenticated;

-- Visitors can send messages and subscribe to approved aspirants; only the owner can read them
create policy "send message" on messages for insert to anon, authenticated with check (aspirant_id in (select id from aspirants where approved));
create policy "owner reads messages" on messages for select to authenticated using (aspirant_id in (select id from aspirants where user_id = auth.uid()));
create policy "subscribe" on subscribers for insert to anon, authenticated with check (aspirant_id in (select id from aspirants where approved));
create policy "owner reads subscribers" on subscribers for select to authenticated using (aspirant_id in (select id from aspirants where user_id = auth.uid()));

-- Photos bucket (public read, each user uploads into their own folder)
insert into storage.buckets (id, name, public) values ('photos', 'photos', true);
create policy "upload own folder" on storage.objects for insert to authenticated
  with check (bucket_id = 'photos' and (storage.foldername(name))[1] = auth.uid()::text);

-- To approve a profile (moderation), run:
-- update aspirants set approved = true where id = '<profile id>';
