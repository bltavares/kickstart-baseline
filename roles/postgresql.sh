kickstart.context postgresql

kickstart.postgresql.install.Ubuntu() {
  echo 'deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main' > /etc/apt/sources.list.d/pgdg.list
  kickstart.apt.add_key_from_url https://www.postgresql.org/media/keys/ACCC4CF8.asc
  kickstart.package.update
  kickstart.package.install postgresql-9.3 libpq-dev

  kickstart.service.enable postgresql
  kickstart.service.restart postgresql

  su - postgres -c "psql -c \"ALTER ROLE postgres WITH PASSWORD 'postgres'\""

  access_rules='host all all 0.0.0.0/0 md5'
  postgresql_access_file=/etc/postgresql/9.3/main/pg_hba.conf
  kickstart.file.contains $postgresql_access_file "$access_rules" || echo "$access_rules" >> $postgresql_access_file

  sed -i "s/^#\?listen_addresses.\+/listen_addresses = '*'/" /etc/postgresql/9.3/main/postgresql.conf

  kickstart.service.restart postgresql
}

kickstart.postgresql.install.Mac() {
  kickstart.package.install postgresql
}

kickstart.postgresql.install.`kickstart.os`
