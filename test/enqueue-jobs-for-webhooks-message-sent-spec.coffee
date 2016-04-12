_ = require 'lodash'
EnqueueJobsForWebhooksMessageSent = require '../'

describe 'EnqueueJobsForWebhooksMessageSent', ->
  beforeEach ->
    @sut = new EnqueueJobsForWebhooksMessageSent {}

  describe '->do', ->
    context 'when given a valid webhook', ->
      beforeEach (done) ->
        request =
          metadata:
            responseId: 'its-electric'
            uuid: 'electric-eels'
            messageType: 'received'
            options: {}
          rawData: '{}'

        @sut.do request, (error, @response) => done error

      it 'should return a 204', ->
        expectedResponse =
          metadata:
            responseId: 'its-electric'
            code: 204
            status: 'No Content'

        expect(@response).to.deep.equal expectedResponse
