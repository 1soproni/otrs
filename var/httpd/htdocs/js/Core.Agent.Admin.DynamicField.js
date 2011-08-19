// --
// Core.Agent.Admin.DynamicField.js - provides the special module functions for the Dynamic Fields.
// Copyright (C) 2001-2011 OTRS AG, http://otrs.org/
// --
// $Id: Core.Agent.Admin.DynamicField.js,v 1.3 2011-08-18 20:50:24 cr Exp $
// --
// This software comes with ABSOLUTELY NO WARRANTY. For details, see
// the enclosed file COPYING for license information (AGPL). If you
// did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
// --

"use strict";

var Core = Core || {};
Core.Agent = Core.Agent || {};
Core.Agent.Admin = Core.Agent.Admin || {};

/**
 * @namespace
 * @exports TargetNS as Core.Agent.Admin.DynamicField
 * @description
 *      This namespace contains the special module functions for the .DynamicField module.
 */
Core.Agent.Admin.DynamicField = (function (TargetNS) {

    TargetNS.Redirect = function( FieldType, ObjectType ) {
        var DynamicFieldsConfig, Action, URL;

        // get configuration
        DynamicFieldsConfig = Core.Config.Get('DynamicFields');

        // get action
        Action = DynamicFieldsConfig[ ObjectType ][ FieldType ];

        // redirect to correct url
        URL = Core.Config.Get('Baselink') + 'Action=' + Action + ';Subaction=Add' + ';ObjectType=' + ObjectType;
        Core.UI.Popup.OpenPopup(URL, 'Action');
    };

    return TargetNS;
}(Core.Agent.Admin.DynamicField || {}));