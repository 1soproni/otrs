# --
# Kernel/System/Ticket/Event/ArticleSearchIndex.pm - update article search index
# Copyright (C) 2001-2012 OTRS AG, http://otrs.org/
# --
# $Id: ArticleSearchIndex.pm,v 1.6 2012-11-20 16:00:38 mh Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::Ticket::Event::ArticleSearchIndex;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.6 $) [1];

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    # get needed objects
    for (
        qw(ConfigObject TicketObject LogObject UserObject CustomerUserObject SendmailObject TimeObject EncodeObject)
        )
    {
        $Self->{$_} = $Param{$_} || die "Got no $_!";
    }

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for (qw(Data Event Config)) {
        if ( !$Param{$_} ) {
            $Self->{LogObject}->Log( Priority => 'error', Message => "Need $_!" );
            return;
        }
    }
    for (qw(TicketID)) {
        if ( !$Param{Data}->{$_} ) {
            $Self->{LogObject}->Log( Priority => 'error', Message => "Need $_ in Data!" );
            return;
        }
    }

    return 1 if !$Param{Data}->{ArticleID};

    $Self->{TicketObject}->ArticleIndexBuild(
        ArticleID => $Param{Data}->{ArticleID},
        UserID    => 1,
    );

    return 1;
}

1;
