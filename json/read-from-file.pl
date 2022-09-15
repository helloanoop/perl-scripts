use strict;

use JSON -support_by_pp;
use feature 'say';

my $path = "data/person.json";
my $json_text = do {
   open(my $json_fh, "<:encoding(UTF-8)", $path)
      or die("Can't open \"$path\": $!\n");
   local $/;
   <$json_fh>
};

say $json_text;
