print ("Hello world! \n");

use strict;
use warnings;

# Assigning a value to a variable

my $name = "Matthew";

print ("Hello $name! \n");

#commenting in perl 

my $animal = "camel";
my $answer = 40;

#playing with scalars
print $animal; 
print "The animal is $animal\n";
print "The square of  $answer is ", $answer * $answer , "\n"; 

#arrays
my @animals = ("dog", "cat", "rat");

#arrays are zero indexed
print $animals[1] . "\n";

print "Last of element of the array is :" .  $animals[$#animals] . "\n";  

print @animals; 


#getting multiple values from an array
print @animals[0,1] . "\n";
print @animals[0..2] . "\n"; 
print @animals[1..$#animals] . "\n";   #gives all except the first element

my @sorted = sort @animals; 
print @sorted;

#hashes (associative arrays[key : value pairs])
my %fruit_color  = (
    apple => "red",
    banana => "yellow",
);

my @fruits = keys %fruit_color;
my @colors = values %fruit_color;

print @fruits . "\n";
print sort @colors . "\n";

#nesting list and hashes
my $variables =  {
    scalar =>  {
            description => "single item",
            sigil => '$',  
        },
          array => { 
            description => "ordered list of items",
            sigil => '@',
          },
          hash =>  {
            description => "key/value pairs",                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
            sigil => '%',
          },

};

print "Scalars begin with a $variables->{'scalar'}->{'sigil'}\n";

#if statements The traditional way
my $zippy = 0;
# if ($zippy) {
#   print "Wow!"; 
# }

#if statments the perlish post conditional way
my $apples = "";
print "Wow! wow!" if $zippy;
print "We have no apples" unless $apples; 

my @array = (1, 2, 3, 4, 5);
#using foreach
foreach (@array) {
    print "This element is $_\n";
}
 
# you don't have to use the default $_ either...

#working with files 
open (my $in, "<", "input.txt") or die "Can't open input.txt: $!";

#REGULAR EXPRESSIONS
# # simple matching 
# if (/foo/)       { ... }  # true if $_ contains "foo"
# if ($a =~ /foo/) { ... }  # true if $a contains "foo"


# s/foo/bar/;               # replaces foo with bar in $_
# $a =~ s/foo/bar/;         # replaces foo with bar in $a
# $a =~ s/foo/bar/g;        # replaces ALL INSTANCES of foo with bar
#                           # in $a