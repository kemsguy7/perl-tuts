
#Hash Variables

%data = ('John Paul', 45, 'Lisa', 30, 'Kumar', 40); 

print "\$data{'John Paul'} = $data{'John Paul'}\n";
print "\$data{'Lisa'} = $data{'Lisa'}\n";
print "\$data{'Kumar'} = $data{'Kumar'}\n";

#variable context

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