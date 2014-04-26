class Flow


	constructor: (@bindObject, @firstParams) ->
		@fns = []
		@doneFn = null



	then: (fn) ->
		@fns.push fn
		this


	done: (fn) ->
		@doneFn = fn
		@run @firstParams



	getDeferred: ->
		resolve: (params...) =>
			@run params

		reject: (err) =>
			@doneFn.call @bindObject, err

		skip: (params...) =>
			@fns = []
			@run params



	run: (params = []) ->
		fn = @fns.shift()
		if fn
			params.unshift @getDeferred()
			fn.apply @bindObject, params
		else
			params.unshift null
			@doneFn.apply @bindObject, params



module.exports = Flow