flowq = require '../'

describe 'Flow', ->

	it 'resolve flow', (done) ->
		flowq @, 'value1'

		.then (d, value1) ->
			value1.should.eql 'value1'
			d.resolve 'value2', ['value3']

		.then (d, value2, value3) ->
			value2.should.eql 'value2'
			value3.should.eql ['value3']
			d.resolve 'value4'

		.done (err, value4) ->
			value4.should.eql 'value4'
			done()



	it 'skip flow', (done) ->
		flowq @, 'value1'

		.then (d, value1) ->
			d.skip 'value2', ['value3']

		.then (d, value2, value3) ->
			done new Error 'next flow was called'

		.done (err, value2, value3) ->
			value2.should.eql 'value2'
			value3.should.eql ['value3']
			done()


	it 'reject flow', (done) ->
		flowq @, 'value1'

		.then (d, value1) ->
			d.reject 'error test'

		.then (d, value2, value3) ->
			done new Error 'next flow was called'

		.done (err) ->
			err.should.eql 'error test'
			done()