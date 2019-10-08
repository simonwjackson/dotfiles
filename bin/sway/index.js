const { when, equals, flip, pipe, subtract, tap, __, 
	toString, concat, add, path, compose, uncurryN 
} = require('ramda')
const { exec } = require('child_process')

const subtractFrom = flip(subtract)

const laptop = 'eDP-1' 

const run = uncurryN(3, binary => args => callback => 
	exec(`${binary} ${args}`, callback)
)

const sway = run('/usr/bin/swaymsg') 

const getScale = (_, data) => (
	compose(
		path([0, 'scale']),
		JSON.parse, 
		tap(console.log)
	)(data)	
)

const getTransform = (_, data) => (
	compose(
		path([0, 'transform']),
		JSON.parse, 
	)(data)	
)

const transform = uncurryN(2, display => deg => 
	sway('-t get_outputs',
		compose(
			sway(__, console.log),
			concat(`output ${display} transform `),
			toString,
			tap(console.log),
			num => ((num + deg) % 360),
			parseInt,
			when(equals("normal"), () => 0),
			getTransform
		)
	)
)

const scale = uncurryN(2, display => fn => 
	sway('-t get_outputs',
		compose(
			sway(__, console.log),
			concat(`output ${display} scale `),
			toString,
			fn,
			getScale
		)
	)
)

const quarterUp = () => scale(laptop, add(.25))

const quarterDown = () => scale(laptop, subtractFrom(.25))

const fullUp = () => scale(laptop, pipe(
	Math.floor,
	add(1),
)) 

const fullDown = () => scale(laptop, pipe(
	Math.ceil,
	subtractFrom(1),
)) 

const transformClock = () => { 
	transform(laptop, 90)
}


module.exports = {
	quarterUp,
	quarterDown,
	fullUp,
	fullDown,
	transformClock,
} 

/*
Client.prototype.getWindows = function (callback) {
    function walkTree(tree, windows) {
        if (tree.window) {
            windows.push({
                name: tree.name,
                id: tree.id,
                focused: tree.focused,
                window: tree.window,
                className: tree['window_properties']['class']
            });
        }
        if (tree.nodes) {
            tree.nodes.forEach(function (subTree) {
                walkTree(subTree, windows);
            });
        }
    }

    this.exec('-t get_tree', function (err, stdout, stderr) {
        if (err) {
            return callback(err);
        }

        var tree;
        try {
            tree = JSON.parse(stdout);
        } catch (err) {
            return callback(err);
        }

        var windows = [];
        if (tree) {
            walkTree(tree, windows);
        }

        // remove i3bars from output
        windows = windows.filter(function (window) {
            return window.className !== 'i3bar';
        });

        callback(null, windows);
    });
};

Client.prototype.focus = function (conId, callback) {
    return this.exec('[con_id=' + conId + '] focus', callback);
};

Client.prototype.run = function (workspace, args, callback) {
    var ws = '';
    if (workspace) { ws = 'workspace ' + workspace + '; ' }

    return this.exec("'" + ws + 'exec --no-startup-id ' + args + "'", callback);
}

module.exports = Client;
*/
