package Deploy::Template;

use base Template;
use Data::Dumper;

sub _init {
    my ($self, $config) = @_;

    $config->{ENCODING} = 'utf8';
    $config->{OUTPUT_PATH} = $config->{VARIABLES}->{data};
    $config->{INCLUDE_PATH} = '.';

    #print STDERR Dumper($config);
    $self->SUPER::_init($config);
}

package Deploy::Template::Stash;

use Template::Stash;
use Net::IDN::Encode qw(:all);

$Template::Stash::SCALAR_OPS->{ domain_to_ascii } = sub {
    return domain_to_ascii($_[0]);
};
$Template::Stash::SCALAR_OPS->{ email_to_ascii } = sub {
    return email_to_ascii($_[0]);
};
$Template::Stash::SCALAR_OPS->{ domain_to_unicode } = sub {
    return domain_to_unicode($_[0]);
};
$Template::Stash::SCALAR_OPS->{ email_to_unicode } = sub {
    return email_to_unicode($_[0]);
};
1;
