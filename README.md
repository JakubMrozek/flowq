# flowq

Simple flow library for node.js.


## Installation


    $ npm install flowq


## Example

```coffeescript
flow = require 'flowq'

flow @, 'first cb value'

.then (d, param) ->
	# d = deferred, see below
	# param is 'first cb value'

	d.resolve 'value1', 'value2'


.then (d, param1, param2) ->
	# param1 is 'value1', param2 is 'value2'

	d.reject new Error 'error'


.done (err) ->
	# ...

``` 

## API

### flow.then (fn)

### flow.done (fn)

### Defer

#### d.resolve([value1, [value2 ...]])
#### d.skip([value1, [value2 ...]])
#### d.reject(err)



## License

BSD