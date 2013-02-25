require 'should'

{HanoiTowers} = require '../lib/hanoi'
{HanoiSolver} = require '../lib/solver'

describe 'Hanoi solver', ->

    it 'has a hanoi tower\'s game', ->
        solver = new HanoiSolver(new HanoiTowers(3))
        solver.should.not.be.null

    it 'isn\'t solved at beggining', ->
        solver = new HanoiSolver(new HanoiTowers(3))
        solver.is_solved().should.be.false

    it 'should have an empty solve steps log at beggining', ->
        solver = new HanoiSolver(new HanoiTowers(3))
        solver.get_log().should.be.empty

    it 'should solve it in no movements with zero discs', ->
        solver = new HanoiSolver(new HanoiTowers(0))
        solver.solve()
        steps = solver.get_log()
        steps.should.be.empty
        solver.is_solved().should.be.true

    describe 'with one disc', ->

        beforeEach ->
            @solver = new HanoiSolver(new HanoiTowers(1))

        it 'should solve it moving from first to third', ->
            @solver.solve()
            steps = @solver.get_log()
            steps[0].should.equal 'From 1 tower to 3'

        it 'should solve it in a single step', ->
            @solver.solve()
            steps = @solver.get_log()
            steps.should.have.length 1
            @solver.is_solved().should.be.true

    describe 'with multiple discs:', ->

        it 'for two discs should solve it in 3 steps', ->
            solver = new HanoiSolver(new HanoiTowers(2))
            solver.solve()
            steps = solver.get_log()
            steps.should.have.length 3
            steps[0].should.equal 'From 1 tower to 2'
            steps[1].should.equal 'From 1 tower to 3'
            steps[2].should.equal 'From 2 tower to 3'

        it 'for three discs should solve it in 7 steps', ->
            solver = new HanoiSolver(new HanoiTowers(3))
            solver.solve()
            steps = solver.get_log()
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