# --
# Copyright (C) 2001-2016 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::TicketSolved;

use strict;
use warnings;


our $ObjectManagerDisabled = 1;
sub new { 
	my ($Type, %Param) = @_;

	 # allocate new hash for object
	my $Self = {%Param};
	bless ($Self, $Type);

	return $Self;


}

sub Run {
	my ( $Self, %Param) = @_;
	my  %Data;
	
    my $LayoutObject       = $Kernel::OM->Get('Kernel::Output::HTML::Layout');
	    my $ParamObject        = $Kernel::OM->Get('Kernel::System::Web::Request');
	    my $UserObject 		   = $Kernel::OM->Get('Kernel::System::User');
	my $LogObject 		   = $Kernel::OM->Get("Kernel::System::Log");
	my $TicketObject	   = $Kernel::OM->Get("Kernel::System::Ticket");
	my $ConfigObject	   = $Kernel::OM->Get("Kernel::Config");

	#Pega o valor do config
	my $StateID = $ConfigObject->Get("Solved::State") || 10;

	#
	#############################

	if($Self->{Subaction} eq 'Solved'){
			
		my $TicketID = $ParamObject->GetParam(Param => 'TicketID');
		my $ArticleID = $ParamObject->GetParam(Param => 'ArticleID');
		my $ResponseID = $ParamObject->GetParam(Param => 'ResponseID');
		my $Success = $TicketObject->TicketStateSet(
			StateID  => $StateID,
		        TicketID => $TicketID,
		        UserID   => $Self->{UserID},
		 );

         	 return $LayoutObject->Attachment(
	         	 ContentType => 'text/html; charset=' . $LayoutObject->{Charset},
	      	     Content     => $Success,
	  	         Type        => 'inline',
	              NoCache     => 1,
           );

	}
	

}
1;
