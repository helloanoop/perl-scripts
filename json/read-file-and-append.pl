use strict;

use JSON -support_by_pp;
use feature 'say';

my $path = "data/people.json";
my $json_text = do {
   open(my $json_fh, "<:encoding(UTF-8)", $path)
      or die("Can't open \"$path\": $!\n");
   local $/;
   <$json_fh>
};

say ">> read file at path: $path";
say $json_text;

my %person = (
  'fname'    => 'James',
  'lname'  => 'Bond'
);

my $decoded = decode_json($json_text);
push(@{$decoded->{'people'}}, \%person);

say ">> appended new person";
say $decoded->{'people'}[1]->{'fname'};

writeToFile($decoded, "data/people2.json");

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