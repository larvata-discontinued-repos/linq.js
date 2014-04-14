do ()->

    Object::linq =()->
        new Enumerable(this)

    class Enumerable
        constructor: (@data) ->

        # Func<TSource, bool> predicate)
        # Func<TSource, int, bool> predicate
        where: (func)->
            ret=[]
            for i in [0...@data.length]
                ret.push(@data[i]) if func(@data[i],i)
            return ret

        # Func<TSource, TResult> selector
        # Func<TSource, int, TResult> selector
        select: (func)->
            ret=[]
            for i in [0...@data.length]
                ret.push(func(@data[i],i))
            return ret

        # Func<TSource, IEnumerable<TResult>> selector
        # Func<TSource, int, IEnumerable<TResult>> selector
        # Func<TSource, int, IEnumerable<TCollection>> collectionSelector, Func<TSource, TCollection, TResult> resultSelector
        # Func<TSource, IEnumerable<TCollection>> collectionSelector, Func<TSource, TCollection, TResult> resultSelector
        selectMany: (func)->







