# --
# Kernel/Output/HTML/OutputFilterMediaWiki.pm
# Copyright (C) 2011 - 2015 Complemento - Liberdade e Tecnologia http://www.complemento.net.br
# --
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Output::HTML::OutputFilterFastResponse;

use strict;
use warnings;
require LWP::UserAgent;
use List::Util qw(first);
use HTTP::Status qw(:constants :is status_message);
use Kernel::System::Encode;
use Kernel::System::DB;
use Kernel::System::CustomerUser;
use Kernel::System::CustomerCompany;

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    # get needed objects


    $Self->{UserID} = $Param{UserID};


    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;
	my %Data = ();
    my $ParamObject = $Kernel::OM->Get('Kernel::System::Web::Request');
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

	if(${ $Param{Data}} =~ /id=\"ArticleItems\"/ ){
	   # Mostra widget central com iframe da pagina
		my $iFrame = $LayoutObject->Output(
		   	    TemplateFile => 'ShowFastResponse',
	        Data         => \%Data,
    	);
	}
 
}
1;

