exports.Tower =
class Tower

    constructor: (number_of_discs) ->
        @discs = []
        @discs = [1..number_of_discs] if (number_of_discs)

    size: ->
        @discs.length

    pop: ->
        throw new Error "Can't pop, empty tower." if @discs.length <= 0
        disc = @discs[0]
        @discs = @discs[1..@discs.length]
        return disc

    push: (disc) ->
        throw new Error 'Too big!' if disc > @discs[0]
        @discs = [disc].concat @discs if disc