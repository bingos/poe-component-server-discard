# $Id: Discard.pm,v 1.3 2005/01/27 10:55:49 chris Exp $
#
# POE::Component::Server::Echo, by Chris 'BinGOs' Williams <chris@bingosnet.co.uk>
#
# This module may be used, modified, and distributed under the same
# terms as Perl itself. Please see the license that came with your Perl
# distribution for details.
#

package POE::Component::Server::Discard;

use strict;
use warnings;
use Carp;
use POE;
use base qw(POE::Component::Server::Echo);
use vars qw($VERSION);

use constant DATAGRAM_MAXLEN => 1024;
use constant DEFAULT_PORT => 9;

$VERSION = '1.14';

sub _client_input {
  return;
}

sub _get_datagram {
  my ( $kernel, $socket ) = @_[ KERNEL, ARG0 ];

  my $remote_address = recv( $socket, my $message = "", DATAGRAM_MAXLEN, 0 );
    return unless defined $remote_address;
  undef;
}

1;
__END__

=head1 NAME

POE::Component::Server::Discard - A POE component that implements an RFC 863 Discard server.

=head1 SYNOPSIS

 use POE::Component::Server::Discard;

 my $self = POE::Component::Server::Discard->spawn( 
	Alias => 'Discard-Server',
	BindAddress => '127.0.0.1',
	BindPort => 7777,
	options => { trace => 1 },
 );

=head1 DESCRIPTION

POE::Component::Server::Discard implements a RFC 863 L<http://www.faqs.org/rfcs/rfc863.html> TCP/UDP discard server, using 
L<POE>. It is a class inherited from L<POE::Component::Server::Echo>.

=head1 METHODS

=over

=item C<spawn>

Takes a number of optional values: 

  "Alias", the kernel alias that this component is to be blessed with; 
  "BindAddress", the address on the local host to bind to, defaults to 
                 POE::Wheel::SocketFactory default; 
  "BindPort", the local port that we wish to listen on for requests, 
              defaults to 9 as per RFC, this will require "root" privs on UN*X; 
  "options", should be a hashref, containing the options for the component's session, 
             see POE::Session for more details on what this should contain.

=back

=head1 BUGS

Report any bugs through L<http://rt.cpan.org/>.

=head1 AUTHOR

Chris 'BinGOs' Williams, <chris@bingosnet.co.uk>

=head1 LICENSE

Copyright E<copy> Chris Williams

This module may be used, modified, and distributed under the same terms as Perl itself. Please see the license that came with your Perl distribution for details.

=head1 SEE ALSO

L<POE>

L<POE::Session>

L<POE::Wheel::SocketFactory>
 
L<POE::Component::Server::Echo>

L<http://www.faqs.org/rfcs/rfc863.html>

=cut
