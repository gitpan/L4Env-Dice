# $Id: Dice.pm,v 1.2 2004-11-06 15:49:27-05 erob Exp $
# L4Env::Dice - 
# Access L4 primitives with L4Env, Dice compiler.

package L4Env::Dice;

use 5.00005;

# For the XS stuff
require DynaLoader;

use strict;

use vars qw($VERSION @ISA);
$VERSION = '0.01_1';

@ISA = qw( DynaLoader );

bootstrap L4Env::Dice $VERSION;

# Preloaded methods go here.

1 ;
__END__
# Below is stub documentation for your module. You'd better edit it!

=head1 NAME

L4Env::Dice - perl extension to L4 primitives 

=head1 SYNOPSIS

	# in your subclasses: 
  	package MyCompiler::Dice;
  	use base 'L4Env::Dice';

 	write code here ...

	1;

	# on the command line:
	perl -MO=dice, -i [<idl string>] -o [output]

=head1 DESCRIPTION

This module gives the ability to compile packages which
understands L4 primitives.  

The basic idea  consist of linking L4Env I<symbols>
inside our I<namespace>.

=head2 Generating code on the fly with h2xs

L<h2xs> is a great tool designed to produce valuable XS code 
from,  say, C headers files. 

All of the darker stuff is done transparently to the user,
because we haven't written any C code yet. 

Invoking the B::C backend:

	# compile into a binary executable file:    
	perl -MO=C, -o some_app some_app.pm 

=head2 Wrapping our L4 interface in perl 

The next step consist of evalutating how code 
is passed to the stub compiler in perl.

REQUIRE: dice (or idl4) requires valid idl.
 
=head1 CHECKLIST 

=head2 Required 

=over

=item * Fiasco microkernel

=item * L4Env 

=item * dice compiler (or idl4)

=back

=head2 Recommended

=over

=item * gcc (>= 3.3.5)

=item * binutils (>= 2.12)

=item * a /boot filesystem (ufs, ext2fs, ...)           

=item * a grub_config somewhere in /boot

=head2 Optional

=item * L<B::C> backend (bundled with perl) 

=item * L<perlcc> 
 
=back 

=head1 CONFIGURATION

=head2  The config.h method

The user is expected to provide his own config.h, describing 
in more details the aspect of linking the resulting binary
for L4 environments.

This basically means to:

	cp include/template_config.h /my_module/config.h

Further descriptions on the relationships between the linker 
and the stub generator (dice) should be added inside this file as well.

The config.h used by perl contains 
machine specific optimizations for our current libperl object.

=over 

=item * HAVE_DROPS_L4_ENV

Defined if the directory F<drops> exists and containts I<$(L4_STDDIR)>.
This one is not known to exists at other places on earth than here. 

=item * HAVE_DROPS_L4_STUB_GENERATOR

If defined, allows us to call the stub compiler directly:

	perl -ML4Env::Dice, -bc backend.cf -f <file> 

Or with aliases (dice.pm being aliased as a perl back-end):

	perl -MB=dice, -fc frontend.cf -f <file>

=item * HAVE_DROPS_L4_DDE

Defined if we're aware of the current mecanism used
by device drivers in L4. 

=item * HAVE_DROPS_L4_DDE_LINUX

Defined if the DDE librairy we're using points to I<$DDE_LINUX>. 

=item * HAVE_DROPS_L4_DDE_LINUX_DEBUG

Define this if you want DEBUG symbols to be compiled inside
the binary executable.

=item * HAVE_DLFCN_H  

Defined if dlfcn.h is found. 

=item * USE_DL_OPEN 

If defined, use B<dl_open> et al facilities 
for dynamically linking with L4Env symbolic. 

=back

=head1 NOTES ON PORTING 

Several more specialized interfaces are made available to the end-user.

=head2 Subclassing L4Env::Dice::Base

This package is expected to contains basic methods available
to the public.  

=head2 Subclassing L4Env::Dice::POSIX

TODO

=head2 Subclassing L4Env::Dice::GNU

Write hooks for Hurd/L4. 

=head1 EXAMPLES 

Writing your own L4 hello world client/server should be relatively
easy to achieve by using this module as-is. It can sound something
similar to: 

	package foo; 

	use base 'L4Env::Dice';

	... write code ... 

	1;

Convert your perl-script to idl:

	perl -MO=dice, [options] -o foo_interface.idl foo.pl

Run dice over the binary for compiling L4 stubs:
	
	dice [options] foo_interface.idl ...

In your grub /boot/config:

	...
	module=/my/perl/foo_interface [options]
	...

Boot kernel as usual...

=head2 Compiling for a particular arch

You need to subclass and possibly glue, fix things
for your system.

For example, we want to import hooks
for the Linux Device Drivers Framework (DDF).

	# import methods from L4Env to perl
	use Package::Client ':my_user_ddf';

	# melt-in POSIX dependencies  
	use POSIX;

	# you write or import 'new'  
	my $hello = Package::Client->new( ... );

	1;

=head1 SEE ALSO

L4 implementations; the Devices Drivers Framework (DDF) for L4-Linux.

The B<preprocess> utility 
at http://os.inf.tu-dresden.de/~hohmuth/prj/preprocess/

perlcc(1).

perl(1).

=head1 BUGS

The rationale aspect is left as an exercise to the reader.

More investigations is needed with  L<B::C> and L<perlcc>.

=head1 AUTHOR

Etienne Robillard, E<lt>granted14 (at) yahoo (dot) comE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2004 by Etienne Robillard.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.8.5 or,
at your option, any later version of Perl 5 you may have available.

=cut

