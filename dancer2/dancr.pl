#!/usr/bin/env/perl

#connect to database
sub connect_db {
    my $dbh = DBI->connect("dbi:SQLite:dbname=".setting('database')) or die $DBI::errstr;

    return $dbh;
}

#initialize database
sub init_db {
    my $db = connect_db();
    my $schema = read_text('./schema.sql');
    $db->do($schema)
        or die $db->errstr;
};



#Route Handlers 
get '/' => sub { 
    my $db = $db = connect_db();
    my $sql = 'select, id, title, text from entries order by id desc';

    my $sth = $db->prepare($sql)
        or die $db->errstr;
    
    $sth->execute 
        or die $sth->errstr;

    template 'show_entries.tt', {
        msg  => get_flash(),
        add_entry_url => uri_for('/add'),
        entries => $eth->fetchall_hashref('id'),
    };
     
};