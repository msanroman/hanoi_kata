require 'should'

{HanoiTowers} = require '../lib/hanoi'

describe 'Hanoi towers', ->

    beforeEach ->
        @game = new HanoiTowers(3)

    it 'starts with the first tower having as many discs as said', ->

        @game.firstTower.size().should.equal 3

    it 'has the second and third towers empty at the beggining', ->

        @game.secondTower.size().should.equal 0
        @game.thirdTower.size().should.equal 0

    describe 'movements', ->

        it 'can move a disc from a tower to an empty tower', ->

            @game.moveFrom(1).to(2)

            @game.firstTower.size().should.equal 2
            @game.secondTower.size().should.equal 1

            @game.moveFrom(2).to(3)

            @game.secondTower.size().should.equal 0
            @game.thirdTower.size().should.equal 1