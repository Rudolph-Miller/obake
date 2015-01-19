/** @jsx React.DOM */

var React = require("react");
var Router = require("react-router");
var RouteHandler = Router.RouteHandler;
var qwest = require("qwest");

var jonathan = require("react-jonathan");
var Api = jonathan.Api;
var Ajax = jonathan.Ajax;

var Main = React.createClass({
    render: function () {
        return (
            <RouteHandler />
        );
    }
});

var Admin = React.createClass({
    mixins: [ Ajax ],
    
    componentDidMount: function () {
        var path = "/api/sign-in";
        var query = {
            email: "sample@example.com",
            password: "password"
        };
        
        this.post(path, query).then(function (json) {
            console.log(json);
        }).catch(function (message) {
            console.log(message);
        });
    },
    
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
