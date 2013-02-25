{Tower} = require './tower'

exports.HanoiTowers =
class HanoiTowers

    constructor: (number_of_discs) ->
        @firstTower = new Tower(number_of_discs)
        @secondTower = new Tower(0)
        @thirdTower = new Tower(0)
        @towers = [@firstTower, @secondTower, @thirdTower]

    moveFrom: (peg) ->
        @from = true
        @disc = @towers[peg-1].pop()
        @

    to: (peg) ->
        @from = false
        @towers[peg-1].push @disc
        @