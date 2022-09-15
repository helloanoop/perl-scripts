use strict;

use JSON -support_by_pp;

my %person = (
  'fname'    => 'John',
  'lname'  => 'Doe'
);

writeToFile(\%person, "data/person.json");

sub writeToFile
{
    my ($json_text, $filename) = @_;
    my $json = new JSON;
    my $encodedJson= $json->pretty->encode($json_text);

    close(FILE);
    open(FILE, ">$filename");
    print FILE $encodedJson;
    close(FILE);
}