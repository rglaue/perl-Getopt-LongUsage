# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl Getopt-LongUsage.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use Test::More tests => 4;
BEGIN { use_ok('Getopt::LongUsage') };
use_ok('Getopt::Long');

#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.

my $glu = Getopt::LongUsage->new();

ok ( defined($glu) && ref $glu eq 'Getopt::LongUsage', 'new()' );

my $getoptlongconf = [
                \%options,
                'isAvailable',
                'color=s',
                'type=s',
                'cityGrown=s@' ];
my $usagetext = $glu->GetLongUsage (
        Getopt_Long     => $getoptlongconf
);


# Test the usage message
ok ( ($usagetext =~ /\-\-cityGrown/) , 'GetLongUsage()' ) || diag explain ( $getoptlongconf, $usagetext );
