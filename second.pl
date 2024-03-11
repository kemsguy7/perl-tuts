
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

$size = scalar @array;
print (" '\$size = ' . $size  . \n ");

