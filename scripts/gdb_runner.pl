#!/usr/bin/perl -w 
#use strict;

$numArgs = $#ARGV + 1;
if($numArgs != 2)
{
    die("Wrong number of args ".$numArgs ."\n");
}

print "getLogg\n";

# The program that caused the crash
$exec = $ARGV[0];

# Save output into this file
$filename = $ARGV[1];


$str = "gdb --batch --command=res/commands.gdb ".$exec;
print "Let's run gdb: ".$str."\n";
print "output: ".$filename."\n";

open(DATA, $str." 2>&1 |") || die "Failed: $!\n";


open(FILE, ">".$filename) or die "Can't open $filename: $!\n";
print FILE "Autogen results from gdb\nBEGIN\n-----\n";

while ( defined( my $line = <DATA> )  ) {
#chomp($line);
#print "$line\n";
    print $line;
    print FILE $line;

    if($line =~ /\$1 = ([0-9]{1,3})/) {
        $pos = $1;
        #print "* \$1 = ".$pos." \n";
    }
    if($line =~ /\$2 = ([0-9]{1,3})/) {
        $max = $1;
        #print "* \$2 = ".$max." \n";
    }
    if($line =~ /\$3 = \"(.*)\"/) {
        $buf = $1;
        #print "* \$3 = ".$buf." \n";
    }
}
close DATA;

print FILE "\n-----\nEND\n";
close(FILE);

exit 0;


# $1 $2 $3 is defined in commands.gdb
print "* \$1 pos = ".$pos." \n";
print "* \$2 max = ".$max." \n";
print "* \$3 buf = ".$buf." \n";


# gdb turns \0 into \000 but split do not like \ so 
# let's fix something that we usally don't print...
if($buf =~ s/\\000/___000___/g) {
    print "* \$3 = ".$buf." \n";
}
if($buf =~ s/((\\n)|(\\r)|(\\t))/ /g) {
    print "* \$3 = ".$buf." \n";
}


my @values = split('___000___', $buf);

$numberOfLines = @values;
print "numberOfLines ".$numberOfLines."\n" ;

$len=0;
$i=0;
$mark = 0;
foreach my $subLine (@values) {

    $len += (length ($subLine)+1);
    print "Line ".(++$i)."(".$len.") = ".$subLine." \n";

    if($len == $pos) {
        $mark = ($i);
        print "*** Mark $mark \n";
         
    }
    
}

#$filename = "print_lines.txt";
open(FILEH, ">$filename") or die "Can't open $filename: $!\n";
print FILEH "Autogen printbuffer from gdb\nBEGIN\n-----\n";

for($i=$mark ; $i<$numberOfLines; $i++) {
    print "1: ".$i.": ".$values[$i]."\n";
    print FILEH $values[$i];

    if($i != ($numberOfLines-1)) {
        print FILEH "\n";
    }

}
if($mark != 0) {
    for($i=0 ; $i<$mark; $i++) {
        print "2: ".$i.": ".$values[$i]."\n";
        print FILEH $values[$i]."\n";

    }
}

print FILEH "\n-----\nEND\n";
close(FILEH);





