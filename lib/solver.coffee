exports.HanoiSolver = 
class HanoiSolver

    TOWERS: {first: 1, second: 2, third: 3}

    constructor: (game) ->
        @game = game
        @solved = false
        @steps = []

    is_solved: ->
        @solved

    solve: ->
        discs = @game.firstTower.size()
        @solve_rec(discs, @TOWERS['first'], @TOWERS['second'], @TOWERS['third'])

    solve_rec: (discs, source, inter, destiny) ->
        if @only_one_movement_remaining discs
            @log_movement source, destiny
            @game.moveFrom(source).to(destiny)
            @solved = true
        else
            @solve_rec discs-1, source, destiny, inter
            @log_movement source, destiny
            @game.moveFrom(source).to(destiny)
            @solve_rec discs-1, inter, source, destiny

    log_movement: (source, destiny) ->
        @steps.push "From #{source} tower to #{destiny}"

    get_log: ->
        @steps

    only_one_movement_remaining: (discs) ->
        discs == 1