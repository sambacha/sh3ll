#!/usr/bin/perl

# Source and Destination Directories
$SRC= '/home/webpbn/public_html/js';
$DST= '/home/webpbn/public_html/jsz';

# Target files to build, and source files to put into them
@group=
(
    {
        name => 'front',
        file => ['browser',
                 'button',
                 'http',
                 'draw_html',
                 'play'],
    },
    {
        name => 'play',
        file => ['browser',
                 'args',
                 'session',
                 'button',
                 'http',
                 'panel',
                 'play',
                 'tip'],
    },
);

# Loop through files to generate
for ($i= 0; $i < @group; $i++)
{
    print $group[$i]{name}, "\n";
    $fn= $DST.'/'.$group[$i]{name}.'.js';
    open OUT, ">$fn" or die("Cannot open $fn");

    # Loop through files to concatinate and compress
    $f= $group[$i]{file};
    for ($j= 0; $j < @{$f}; $j++)
    {
        print " ",${$f}[$j],"\n";
        WriteJSFile(${$f}[$j],\*OUT)
    }
    close OUT;

    # Greate gzipped copy of the file
    system "gzip -c $fn > $fn.gz"
}

# WriteJSFile($filename, $outh)
#   Write a JavaScript file to the filehandle $outh with some compressions.

sub WriteJSFile
{
    my ($file, $outh)= @_;
    open JS,"$SRC/$file.js" or
       die("No file $SRC/$file found");
    while (<JS>) {
        s/(^| |\t)\/\/.*$//;        # delete // comments
        s/^[ \t]+//;                # delete leading white space
        s/[ \t]+$//;                # delete trailing white space
        next if /^$/;               # delete blank lines
        print $outh $_;
    }
}
