#!/usr/bin/perl 

use strict;
use warnings;

my $numArgs = $#ARGV + 1;
if($numArgs != 2)
{
    die("Wrong number of args ".$numArgs ."\n");
}

print "getLogg\n";

# The program that caused the crash
my $elfFile = $ARGV[0];

# Save output into this file
my $filename = $ARGV[1];


my $str = "arm-none-eabi-gdb ".
    "--eval-command=\"target remote localhost:3333\" ".
    #"--eval-command=\"set logging on\" ".
    "--batch --command=print_ring/commands.gdb ".
    $elfFile;

print "Let's run gdb: ".$str."\n";
open(DATA, $str." 2>&1 |") || die "Failed: $!\n";

my $pos;
my $max;
my $buf;

while ( defined( my $line = <DATA> )  ) {
#chomp($line);
#print "$line\n";
    print $line;
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

# $1 $2 $3 is defined in commands.gdb
print "* \$1 pos = ".$pos." \n";
print "* \$2 max = ".$max." \n";
print "* \$3 buf = ".$buf." \n";


# gdb turns \0 into \000 but split do not like \ so 
# let's fix something that we usally don't print...
if($buf =~ s/\\000/___000___/g) {
    print "* \$3 = ".$buf." \n";
}
# Find the newlines and change them into the split sequence ___000___
if($buf =~ s/\\n/___000___/g) {
    print "* \$3 = ".$buf." \n";
}

#if($buf =~ s/((\\n)|(\\r)|(\\t))/ /g) {
#    print "* \$3 = ".$buf." \n";
#}

my @values = split('___000___', $buf);

my $numberOfLines = @values;
print "numberOfLines ".$numberOfLines."\n" ;

my $len=0;
my $i=0;
my $mark = 0;
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

exit(0);
