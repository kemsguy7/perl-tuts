
#Hash Variables

%data = ('John Paul', 45, 'Lisa', 30, 'Kumar', 40); 

print "\$data{'John Paul'} = $data{'John Paul'}\n";
print "\$data{'Lisa'} = $data{'Lisa'}\n";
print "\$data{'Kumar'} = $data{'Kumar'}\n";

#variable context

@names = ('John Paul', 'Lisa', 'Kumar'); 

@copy = @names;
$size = @names; 

print "Given names are : @copy\n";
print "Number of names are : $size\n";
 
