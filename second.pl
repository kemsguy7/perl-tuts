#!/usr/local/bin/perl
#Hash Variables

%data = ('John Paul', 45, 'Lisa', 30, 'Kumar', 40); 

print "\$data{'John Paul'} = $data{'John Paul'}\n";
print "\$data{'Lisa'} = $data{'Lisa'}\n";
print "\$data{'Kumar'} = $data{'Kumar'}\n";

#variable contex

@names = ('John Paul', 'Lisa', 'Kumar'); 

@copy = @names;   #copying an array
$size = @names;   #copying the size of an array

print "Given names are : @copy\n";
print "Number of names are : $size\n";
 
# Array variables can be populated using parentheses and the qw operator
@days = qw/Mon Tue Wed Thu Fri Sat Sun/;
@months = ('Jan', 'Feb', 'March');

print "Day: $days[0] in the first month of $months[1] \n";

#sequential number arrays
@var_10 = (1..10);
@var_20 = (10..20);
@var_abc = (a..z);

print "@var_10\n";

#array manipulation methods
# create a simple array 
@coins = ("Quater", "Dime", "Nickel");
print "1. \@coins = @coins\n"; 


# add one element at the end of the array 
push(@coins, "Penny");
print "2. \@coins  = @coins\n";

# add one element at the beginning of the array
unshift(@coins, "Dollar");
print "3. \@coins  = @coins\n";

# remove one element from the last of the array.
pop(@coins);
print "4. \@coins  = @coins\n";

# remove one element from the beginning of the array.
shift(@coins);
print "5. \@coins  = @coins\n";

#slicing an array 
@weekdays = @days[3..5];

@array = (1, 2, 3);
$array[50] = 4;
print("@array\n");

#getting the size of an array with scalar 
$size = scalar @array;
print (" Array size =  $size   \n ");


#replacing elements in an array 
@nums = (1..20);
print "Before - @nums\n"; 

splice(@nums, 5, 5, 21..25);
print "After - @nums\n";

#splitting arrays
$var_string = "Rain-Drops-On-Roses-And-Whiskerss";
@string = split('-', $var_string);
print "$string[4]\n"; print "@string\n";


#using the special variable $[

#define an array
@animals = qw(dog cat cow ant);
print "Animals: @animals\n";

# Reset the first index of all the arrays to 1
# $[ = 1;

print "Animals at \@animals[1]: $animals[1]\n";
print "Animals at \@animals[2]: $animals[2]\n";

#selecting elements from Lists
$var = (5,4,3,2,1)[4];
print "value of var = $var\n";

@list = (5,4,3,2,1)[1..3];
print "value of list = @list\n";


#HASHES
#Extracting Slices

%data = (-JohnPaul => 45, -Lisa => 30, -Kumar => 40);
@array = @data{-JohnPaul, -Lisa};

print "Array : @array\n";

#extracting keys and values from a hash
@names = keys %data;
print "$names[0]\n";

@ages = values %data;
print "@ages\n";


#checking  if key exists
if (exists($data{'Lisa'})) {
    print "Lisa is $data{'Lisa'} years old\n";
} else {
    print "I don't know age of lisa\n";
}

#adding an element to the hash; 
$data{'Ali', 'ogodo'} = 55;
@keys = keys %data;
$size = @keys; 
print "2 - Hash size: is $size\n";

#delete the same element from the hash; 
delete $data{'Ali'};
@keys = keys %data;
$size = @keys;
print "3 - Hash size: is $size\n"; 


#infinite loop 
# for ( ; ;) { 
#     printf "This loop will run forever. \n",
# }

#Operators
#<=> checks if the value of the operands are equal or not and return -1, 0, or 1 depending on whether the left argument is numerically less that, equal to orgreater that the right argument

#quote - like operators
# q{}; #Encloses a string with-in single quotes
# Example - q{abcd} gives 'abcd';

# qq{} - #Encloses a string with -in double quotes
# Example - qq{abcd} gives "abcd";

# qx{} - #Encloses a string with-in invert quotes 
# Example - qx{abcd} gives `abcd`


#Date and Time
@months = qw( Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec );
@days = qw(Sun Mon Tue Wed Thu Fri Sat Sun);

($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime();
print "$mday $months[$mon] $days[$wday]\n";


#Subroutines
 #function definition 
 sub Hello {
     print "Hello, World!\n";
 }

 # Function call
 Hello();

 #Average 
 sub Average { 
    # get total number of arguments passed
    $n = scalar(@_);
    @sum = 0;

    foreach $item (@_) {
        $sum += $item;
    }
    $average = $sum / $n;

    print "Average for the give numbers: $average\n"; 
 }

# function call
Average(10, 20, 30); 


# DEFERENCING
$var = 10; 

# Now $r has reference to $var scalae.
$r = \$var;

# Print value available at the location stored in $r. 
print "Value of $var is :", $$r, "\n";

 @var = (1, 2, 3);
 # Now $r has reference to @var array.

 $r = \@var; 

 print "Value of @var is : ", @$r, "\n";

 %var = ('key1' => 10, 'key2' => 20);
 # Now $r has referecne to var hash. 

 $r = \%var;

 # Print values available at the location stored in $r.
 print "Value of Hash %var is : ", %$r, "\n";

# PERL FORMAT
open(DATA, "<file.txt") or die "Couldn't open file file.txt, $!";

while(<DATA>) { 
    print "$_";
}

# COPYING FILES
#open file to read
open(DATA1, "<file1/txt");

#Open new file to write 
open(DATA2, ">file2.txt");

# Copy data from one file to another. 
while(<DATA1>) { 
    print DATA2 $_;
}

close ( DATA1 );
close ( DATA2 );