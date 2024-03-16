#!/usr/bin/env/perl
package Dancr2;
use Dancer2;

our $VERSION = '0.1';

use DBI;
use File::Spec;
use File::Slurper qw/ read_text /;
use Template;
 
#configurations and sessions 
set 'database'        => File::Spec->catfile(File::Spec->tmpdir(), 'dancr.db');
set 'session'         => 'YAML';
set 'template'        => 'template_toolkit';
set 'logger'          => 'console';
set 'log'             => 'debug';
set 'show_stacktrace' => 1;
set 'startup_info'    => 1;

#custome settings
set layout => 'main';  #Tells dancer2's template engine tha that it should look for a file called main.tt in views/layouts/ 
set 'username' => 'admin';
set 'password' => 'password';
 
sub set_flash { 
    my $message = shift; 

    session flash => $message;
}

sub get_flash {
    my $msg = session('flash');
    session->delete('flash'); 

    return $msg;
}

#connect to database
sub connect_db {
    my $dbh = DBI->connect("dbi:SQLite:dbname=".setting('database')) 
        or die $DBI::errstr;

    return $dbh;
};

#initialize database
sub init_db {
    my $db = connect_db();
    my $schema = read_text('./schema.sql');
    $db->do($schema)
        or die $db->errstr;
}

hook before_template_render => sub {
    my $tokens = shift; 

    $tokens->{'css_url'}  = request->base . 'css/style.css';
    $tokens->{'login_url'} = uri_for('/login');
    $tokens->{'logout_url'} = uri_for('/logout');
};

#Route Handlers 
get '/' => sub { 
    my $db  = connect_db();
    my $sql = 'select, id, title, text from entries order by id desc';

    my $sth = $db->prepare($sql)
        or die $db->errstr;
    
    $sth->execute 
        or die $sth->errstr;

    template 'show_entries.tt', {
        msg  => get_flash(),
        add_entry_url => uri_for('/add'),
        entries => $sth->fetchall_hashref('id'),
    };  
};


#add post route 
post '/add' => sub {
    if ( not session('logged_in') ) {
        send_error("Not Logged in", 401);
    }

    my $db = connect_db();
    my $sql = 'insert into entries (title, text) values (?, ?)';

    my $sth = $db->prepare($sql) 
        or die $db->errstr;

    $sth->execute( 
        body_parameters->get('title'),
        body_parameters->get('text')   
    ) or die $sth->srrstr;

    set_flash('new entry posted!');
    redirect '/';
};

#login route
any ['get', 'post'] => '/login' => sub {
    my $err; 

    if ( request->method() eq "POST" ) {
        #process form input
        if( body_parameters->('username') ne setting('username') ) {
            $err = "Invalid username";  
        } elsif ( body_parameters->get('password') ne setting('username') ) {
            $err = "Invalid password";
        } else { 
            session 'logged_in' => true;
            set_flash('You are logged in');
            return redirect '/';
        }
    }

    #display login form
    template 'login.tt', {
        err => $err,
    };
};

get '/logout' => sub{
    app->destroy_session;  #remove a stored session 
    set_flash('You are logged out,');
    redirect '/'; #route th e user nabck to index page
};

init_db();
start;