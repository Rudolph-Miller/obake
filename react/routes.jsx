/** @jsx React.DOM */

'use strict';

var React = require("react");
var Router = require("react-router");
var Route = Router.Route;
var DefaultRoute = Router.DefaultRoute;
var Redirect = Router.Redirect;

var App = require("./app");
var Obake = require("./obake");

module.exports = (
    <Route path="/" handler={App.Main}>
        <DefaultRoute handler={Obake.Obake} />
        <Route path="admin/" name="admin" handler={App.Admin}>
        </Route>
        <Redirect from="admin" to="admin" />
    </Route>
);

