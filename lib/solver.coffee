exports.HanoiSolver = 
class HanoiSolver

    TOWERS: {first: 1, second: 2, third: 3}

    constructor: (game) ->
        @game = game
        @steps = []

    solve: ->
        disks = @game.firstTower.size()
        @solve_recursively(disks, @TOWERS['first'], @TOWERS['second'], @TOWERS['third'])

    solve_recursively: (remaining_disks, source, middle, destiny) ->
        if @there_are_movements_remaining remaining_disks
            @solve_recursively remaining_disks-1, source, destiny, middle
            @moveDisk source, destiny
            @solve_recursively remaining_disks-1, middle, source, destiny

    moveDisk: (source, destiny) ->
        @log_movement source, destiny
        @game.moveFrom(source).to(destiny)

    log_movement: (source, destiny) ->
        @steps.push "From #{source} to #{destiny}"

    get_log: ->
        @steps

    there_are_movements_remaining: (remaining_disks) ->
        remaining_disks > 0