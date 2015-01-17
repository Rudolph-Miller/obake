/** @jsx React.DOM */

var React = require("react");
var Router = require("react-router");
var RouteHandler = Router.RouteHandler;

var Main = React.createClass({
    render: function () {
        return (
            <RouteHandler />
        );
    }
});

var Admin = React.createClass({
    // TODO: sign in
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
