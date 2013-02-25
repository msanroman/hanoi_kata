require 'should'

{Tower} = require '../lib/tower'

describe 'A tower', ->

    it 'is initialized with a number of discs', ->

        tower = new Tower(3)
        tower.size().should.equal 3

    it 'has its discs in descending order', ->

        tower = new Tower(3)
        for disc in tower
            if previous_disc
                disc.should.be.above previous_disc
            previous_disc = disc

    it 'can pop discs', ->

        tower = new Tower(3)
        tower.pop().should.equal 1
        tower.size().should.equal 2

    describe 'pushing', ->

        it 'can push discs', ->

            tower = new Tower(1)
            tower.push(1)
            tower.size().should.equal 2

        it 'the last pushed disc will be the first popped', ->

            tower = new Tower(0)
            tower.push(2)
            tower.push(1)
            tower.pop().should.equal 1

        it 'pushing undefined is harmless', ->

            tower = new Tower(1)
            tower.push undefined
            tower.size().should.equal 1

        it 'throws an error if pushing a bigger disc onto a smaller disc', ->

            tower = new Tower(1)
            ( ->
                tower.push(2)
                ).should.throw('Too big!')

    it 'throws an error when popping an empty tower', ->

        tower = new Tower()
        ( ->
            tower.pop()
            ).should.throw 'Can\'t pop, empty tower.'