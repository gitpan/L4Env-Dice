#!/usr/bin/perl -w
package MyBaseBelongToMe;
use strict;

use Test::More 
	tests => 1;

use base 'L4Env::Dice';

TODO: 
	local $TODO = "Snoring on Params::Validate.."; 
	my $notdone = eval { MkPrivateHeader ( l4_abi => "V2" ) };
	ok($notdone, "MkPrivateHeader");

1;
		
