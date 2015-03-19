#mysql.pp
# 
#
#
class profiles::mysql {

  include mysql::server

  mysql::db { 'icinga':
    user           => 'icinga',
    password       => 'icinga',
    host           => 'localhost',
    grant          => ['SELECT', 'INSERT', 'UPDATE', 'DELETE', 'DROP', 'CREATE VIEW', 'INDEX', 'EXECUTE'],
    sql            => '/usr/share/doc/icinga-idoutils-libdbi-mysql-*/db/mysql/mysql.sql',
    import_timeout => 300,
  }
}