# $Id: Dice.pm,v 1.2 2004-11-06 15:49:27-05 erob Exp $
# L4Env::Dice - 
# Access L4 primitives with L4Env, Dice compiler.

package L4Env::Dice;

use 5.00005;

use vars qw($VERSION);

use strict;

$VERSION = "0.01_05";

# Preloaded methods go here.

sub MkPrivateHeader { 
	# your code here... 
}

1;
__END__

# Below is stub documentation for your module. You'd better edit it!

=head1 NAME

L4Env::Dice - perl extension to the L4Env API

=head1 SYNOPSIS

	# output => "interface_foo.h"
	MkPrivateHeader
	(
		libio			=>	'My::Module::GenericIO',
		libsomething	=>	'My::LibSomething'
	)->as_string();
		
=head1 DESCRIPTION

Sorry, still snoring on it.

=head1 SEE ALSO

=over

=item * L<L4Env::Dice::Introduction>	

Short introduction to this module. Read this first!

=item * L<L4Env::Dice::GenericIO>

Experimental IO implementation in perl/XS.

Will use the DROPS GenericIO package for L4.

Not yet.

=item * L<L4Env::Dice::api>

The programmer's reference book. Not available in 2004.

=item * L<L4Env::Dice::Notes>

Randomly picked notes. Available.

=back

=head2 Discussions, further readings

The perl-L4 mailing-list: L<http://groups.yahoo.com/group/perl-L4>.

L<perlxs>, L<perlxstut>, L<perlguts> etc.

L<h2xs(1)>

L<perl(1)>

=head1 BUGS

Documentation is drastically out-of-date :-)

The rationale aspect is left as an exercise to the reader.

More investigations is needed with  L<B::C> and L<perlcc>.

=head1 AUTHOR

Etienne Robillard, E<lt>erob (at) cpan (dot) orgE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2004 by Etienne Robillard.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.8.5 or,
at your option, any later version of Perl 5 you may have available.

=cut

