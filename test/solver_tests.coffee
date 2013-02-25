require 'should'

{HanoiTowers} = require '../lib/hanoi'
{HanoiSolver} = require '../lib/solver'

describe 'Hanoi solver', ->

    it 'has a hanoi tower\'s game', ->
        solver = new HanoiSolver(new HanoiTowers(3))
        solver.should.not.be.null

    it 'should have an empty solve steps log at beggining', ->
        solver = new HanoiSolver(new HanoiTowers(3))
        solver.get_log().should.be.empty

    describe 'with one disc', ->

        beforeEach ->
            @solver = new HanoiSolver(new HanoiTowers(1))

        it 'should solve it moving from first to third', ->
            @solver.solve()
            steps = @solver.get_log()
            steps.should.have.length 1
            steps[0].should.equal 'From 1 to 3'

    describe 'with multiple discs:', ->

        it 'for two discs should solve it in 3 steps', ->
            solver = new HanoiSolver(new HanoiTowers(2))
            solver.solve()
            steps = solver.get_log()
            steps.should.have.length 3
            steps[0].should.equal 'From 1 to 2'
            steps[1].should.equal 'From 1 to 3'
            steps[2].should.equal 'From 2 to 3'

        it 'for three discs should solve it in 7 steps', ->
            solver = new HanoiSolver(new HanoiTowers(3))
            solver.solve()
            steps = solver.get_log()
            steps[0].should.equal 'From 1 to 3'
            steps[1].should.equal 'From 1 to 2'
            steps[2].should.equal 'From 3 to 2'
            steps[3].should.equal 'From 1 to 3'
            steps[4].should.equal 'From 2 to 1'
            steps[5].should.equal 'From 2 to 3'
            steps[6].should.equal 'From 1 to 3'
            steps.should.have.length 7

        it 'for four discs should solve it in 15 steps', ->
            solver = new HanoiSolver(new HanoiTowers(4))
            solver.solve()
            steps = solver.get_log()
            steps.should.have.length 15

        it 'for five discs should solve it in 31 steps', ->
            solver = new HanoiSolver(new HanoiTowers(5))
            solver.solve()
            steps = solver.get_log()
            steps.should.have.length 31