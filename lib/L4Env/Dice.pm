# $Id: Dice.pm,v 1.2 2004-11-06 15:49:27-05 erob Exp $
# L4Env::Dice - 
# Access L4 primitives with L4Env, Dice compiler.

package L4Env::Dice;

use 5.00005;

# For the XS stuff
require DynaLoader;

use strict;

use vars qw($VERSION @ISA);
$VERSION = '0.01';

@ISA = qw( DynaLoader );

bootstrap L4Env::Dice $VERSION;

# Preloaded methods go here.

1 ;
__END__
# Below is stub documentation for your module. You'd better edit it!

=head1 NAME

L4Env::Dice - Access L4 primitives with L4Env and Dice compiler.

=head1 SYNOPSIS

	# in your subclass: 
  	package MyCompiler::Foo;
  	use base 'L4Env::Dice';

 	write code here ...

	1;

 	# in your packages:
 	package MyBicycle::Wheels;

  	use MyCompiler::Foo;

 	# for gnu hooks...
  	use MyCompiler::Dice ':gnu';

 	# POSIX
 	use MyCompiler::Dice ':posix';

	# get the compiler 
	my $compiler = MyCompiler::Dice->compiler;

	# generate hello_woerl.h 
	my $woerl = $compiler->generate_dice( ... );

	# output to string 
	$woerl->as_string;

	# generate include/config.h,
	# this file should care about compiling 
	# with dice...
	$woerl->gen_config_h;

=head1 DESCRIPTION

This module gives the ability to compile packages which
understands L4 primitives.  

The basic idea  consist of importing L4Env I<symbols>
inside our I<namespace>.

=head2 IMPORTING SYMBOLS WITH H2XS 

L<h2xs> is a tool designed to produce XS code from C headers files. 
For instance, h2xs make it easy to generate XS stub files, and
then by running F<xsubpp> with B<make> to produces binaries
at compilation time. 

=head2 CONFIGURATION

Configurable elements are defined in the file F<include/template_config.h>.

=over 

=item * HAVE_DROPS_ENV

Defined if F<drops> exists and if it's a directory..

=item * HAVE_L4_STUB_GENERATOR

Will point to either one of B<dice> or B<idl4> or better..

=item * HAVE_L4_USER_DDE

Defined if we're aware of the current mecanism used
by device drivers in L4. 

=item * HAVE_L4_USER_DDE_LINUX

Defined if the DDE librairy we're using points to DDE_LINUX. 

=item * HAVE_DL_OPEN 

Use B<dl_open> mecanism for dynamically linking with 
L4Env symbols.

=back

=head1 A NON EXTENSIVE CHECKLIST 

You can get the following packages from Drops CVS.

=head2 REQUIRED

=over

=item * Fiasco microkernel

=item * L4Env 

=item * dice compiler (or idl4)

=back

=head2 OPTIONAL BUT STRONGLY ENCOURAGED

=over

=item * gcc (>= 3.3.5)

=item * binutils (>= 2.12)

=item * a /boot filesystem (ufs, ext2fs, ...)           

=item * a grub_config somewhere in /boot 

=back 

=head1  PORTING TO SOME PLATFORM

Several more specialized interfaces are made available to the end-user.

=head2 L4Env::Dice::Base

Very basic support is included inside this module. For subclassing, 
do C<use base 'L4Env::Dice'>.

=head2 L4Env::Dice::POSIX

=head3 L4Env::Dice::POSIX::Pthread

=head2 L4Env::Dice::GNU

Write hooks for Fabrica, Hurd/L4. 

=head1 On writing L4-Linux compatible headers

See L<WRITING YOUR OWN HELLO WORLD MODULE> below.

=head1 On compiling the Lites single-server with L4Env

=head2 Introduction         

The Lites single-server is the work of Johannes Helander, and thus
served has his master-thesis proposal. 

Several years later, Michael Helmuth and XXX from Tu-Dresden University 
conducted experimentations on running Lites on L3. 

=head2 Running Lites-L4 as a L4Env package

The idea here is that we want to separate code from
the CMU Mach base to the new B<POSIX> Pthread librairy.

=over

=item * The F<POSIX.pm> might help at this point. 

=item * Note that  F<h2xs> utility is great for generating XS code from
C headers file. Refer to L<perlxs> and L<perlxstut>. 

=back

=head1 WRITING YOUR OWN HELLO WORLD MODULE 

Writing your own L4 hello world client/server should be relatively
easy to achieve by using this module as-is. It can sound something
similar to: 

	package foo; 

	use base 'L4Env::Dice';

	... write code ... 

	1;

=head2 Compiling your foo.pl in C code:

	perl -MO=C, [options] -o $(INTERFACE) foo.pl

Then run dice over the binary for compiling L4 stubs:
	
	$(DICE) [options] $(INTERFACE) ... 

In your grub /boot/config:

	...
	module=/my/perl/interface

Boot as usual...

=head2 Experimental interface-dependant trigerring:

A more detailed example. Enable (purists: import) C-strict 
aliasing with the ':ansi' switch.

	use Package::Client ':ansi'; 
	use POSIX;

	# you write or import 'new'  
	my $hello = Package::Client->new( ... );

	1;

=head1 SEE ALSO

Fiasco, Pistachio, L4-Linux, DDE (L4Env) and GNU Hurd/L4.

There's actually  lot others which you can find 
only by trusting Googlee...

perl(1).

=head1 BUGS

Plenty of courses :-) 

Documentation falls in the category were it is almost
completly out-of-date.. 

- SYNOPSIS is fat.

=head1 AUTHOR

Etienne Robillard, E<lt>granted14 (at) yahoo (dot) comE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2004 by Etienne Robillard.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.8.5 or,
at your option, any later version of Perl 5 you may have available.

=cut

