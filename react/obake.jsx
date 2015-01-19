/** @jsx React.DOM */

'use strict';

var React = require("react");
var jonathan = require("react-jonathan");
var Api = jonathan.Api;

var Obake = React.createClass({
    render: function () {
        return (
            <div>
                <ObakeHeader />
                <ObakeContent />
            </div>
        );
    }
});

var ObakeHeader = React.createClass({
    mixins: [ Api ],

    api: "/header",
    
    getInitialState: function () {
        return {
            title: null,
            image: null
        }
    },

    onLoad: function (json) {
        this.setState({
            title: json.title,
            image: json.image
        });
    },
    
    render: function () {
        return (
            <div>
                {this.state.title}
                <img src={this.state.image} />
            </div>
        );
    }
});
            
var ObakeContent = React.createClass({
    render: function () {
        return (
            <div>
                <ObakeItems />
            </div>
        );
    }
});

var ObakeItems = React.createClass({
    mixins: [ Api ],

    api: "/items",
    
    getInitialState: function () {
        return {
            items: []
        };
    },
    
    onLoad: function (json) {
        this.setState({
            items: json.items
        });
    },
    
    render: function () {
        var items = this.state.items.map(function (item, index) {
            return (
                <div key={index}>
                    <label>
                        {item.title}
                    </label>
                    <div>
                        {item.content}
                    </div>
                </div>
            );
        });
        
        return (
            <div>
                {items}
            </div>
        );
    }
});

exports.Obake = Obake;
