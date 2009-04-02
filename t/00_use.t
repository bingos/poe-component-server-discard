use Test::More tests => 1;

BEGIN {
	use_ok( 'POE::Component::Server::Discard' );
}

diag( "Testing POE::Component::Server::Discard-$POE::Component::Server::Discard::VERSION, POE-$POE::VERSION, Perl $], $^X" );
