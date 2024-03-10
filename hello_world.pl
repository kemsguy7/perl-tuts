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
)

my @fruits = keys %fruit_color;
my @colors = values %fruit_color;

print @fruits;
print sort @colors . "\n";

#nesting list and hashes
my $variables =  {
    scalar =>  {
            description => "single item",
            sigil => '$',  
        },
          array => { 
            description => "ordered list of items",
            sigil => '@'
          },
          hash =>  {
            description => "key/value pairs",                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
            sigil = '%',
          }
         

}

#using foreach
foreach (@array) {
    print "This element is $_ \n";
    
}

#working with files 
open (my $in, "<", "input.txt") or die "Can't open input.txt: $!";