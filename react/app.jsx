/** @jsx React.DOM */

var React = require("react");
var Router = require("react-router");
var RouteHandler = Router.RouteHandler;
var qwest = require("qwest");

var jonathan = require("react-jonathan");
var Api = jonathan.Api;

var Main = React.createClass({
    render: function () {
        return (
            <RouteHandler />
        );
    }
});

var Admin = React.createClass({
    mixins: [ Api ],
    api: "/api/admin",
    render: function () {
        return (
            <div>
                Admin
            </div>
        );
    }
});

exports.Main = Main; 
exports.Admin = Admin;
