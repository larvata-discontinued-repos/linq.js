do ()->

    _ = (obj)->
        return obj if obj instanceof _
        return new _(obj) if @ not instanceof _

    Object::linq =(target)->
        return new Enumerable(target) if target?
        return new Enumerable(this)

    class Enumerable
        constructor: (@data) ->

        # Func<TSource, bool> predicate)
        # Func<TSource, int, bool> predicate
        where: (func)->
            ret=[]
            for i in [0...@data.length]
                ret.push(@data[i]) if func(@data[i],i)
            @data=ret;
            return @

        # Func<TSource, TResult> selector
        # Func<TSource, int, TResult> selector
        select: (func)->
            ret=[]
            for i in [0...@data.length]
                ret.push(func(@data[i],i))
            @data=ret;
            return @

        # Func<TSource, IEnumerable<TResult>> selector
        # Func<TSource, int, IEnumerable<TResult>> selector
        # Func<TSource, int, IEnumerable<TCollection>> collectionSelector, Func<TSource, TCollection, TResult> resultSelector
        # Func<TSource, IEnumerable<TCollection>> collectionSelector, Func<TSource, TCollection, TResult> resultSelector
        selectMany: (func)->


        # int count
        take: (count)->
            @data.splice(0,count)
            return @

        # Func<TSource, bool> predicate
        # Func<TSource, int, bool> predicate
        takeWhile: (func)->
            i=0
            for i in [0...@data.length]
                break if not func(@data[i],i)
            @data.splice(0,i);
            return @

        # int count
        skip: (count)->
            @data.splice(count)
            return @

        # Func<TSource, bool> predicate
        # Func<TSource, int, bool> predicate
        skipWhile: (func)->
            i=0
            for i in [0...@data.length]
                break if func(@data[i],i)
            @data.splice(i)
            return @


        # IEnumerable<TInner> inner, Func<TOuter, TKey> outerKeySelector, Func<TInner, TKey> innerKeySelector, Func<TOuter, TInner, TResult> resultSelector
        # IEnumerable<TInner> inner, Func<TOuter, TKey> outerKeySelector, Func<TInner, TKey> innerKeySelector, Func<TOuter, TInner, TResult> resultSelector, IEqualityComparer<TKey> comparer
        join: ()->

        # IEnumerable<TInner> inner, Func<TOuter, TKey> outerKeySelector, Func<TInner, TKey> innerKeySelector, Func<TOuter, IEnumerable<TInner>, TResult> resultSelector
        # IEnumerable<TInner> inner, Func<TOuter, TKey> outerKeySelector, Func<TInner, TKey> innerKeySelector, Func<TOuter, IEnumerable<TInner>, TResult> resultSelector, IEqualityComparer<TKey> comparer
        groupJoin: ()->

        # Func<TSource, TKey> keySelector
        # Func<TSource, TKey> keySelector, IComparer<TKey> comparer
        orderBy: ()->

        # Func<TSource, TKey> keySelector
        # Func<TSource, TKey> keySelector, IComparer<TKey> comparer
        orderByDescending: ()->

        # Func<TSource, TKey> keySelector
        # Func<TSource, TKey> keySelector, IComparer<TKey> comparer
        thenBy: ()->

        # Func<TSource, TKey> keySelector
        # Func<TSource, TKey> keySelector, IComparer<TKey> comparer
        thenByDescending: ()->

        # Func<TSource, TKey> keySelector
        # Func<TSource, TKey> keySelector, IEqualityComparer<TKey> comparer
        # Func<TSource, TKey> keySelector, Func<TSource, TElement> elementSelector
        # Func<TSource, TKey> keySelector, Func<TSource, TElement> elementSelector, IEqualityComparer<TKey> comparer
        # Func<TSource, TKey> keySelector, Func<TKey, IEnumerable<TSource>, TResult> resultSelector
        # Func<TSource, TKey> keySelector, Func<TSource, TElement> elementSelector, Func<TKey, IEnumerable<TElement>, TResult> resultSelector
        # Func<TSource, TKey> keySelector, Func<TKey, IEnumerable<TSource>, TResult> resultSelector, IEqualityComparer<TKey> comparer
        # Func<TSource, TKey> keySelector, Func<TSource, TElement> elementSelector, Func<TKey, IEnumerable<TElement>, TResult> resultSelector, IEqualityComparer<TKey> comparer
        groupBy: ()->

        # IEnumerable<TSource> second
        concat: (second)->
            for i in [0...second.lenght]
                @data.push(second[i])
            return @

        # void
        # IEqualityComparer<TSource> comparer
        distince: (func)->
            # if func?
            #     return
                # ...


        # IEnumerable<TSource> second
        # IEnumerable<TSource> second, IEqualityComparer<TSource> comparer
        union: (func)->

        # IEnumerable<TSource> second
        # IEnumerable<TSource> second, IEqualityComparer<TSource> comparer
        intersect: (func)->

        # IEnumerable<TSource> second
        # IEnumerable<TSource> second, IEqualityComparer<TSource> comparer
        except: ()->

        # void
        reverse: ()->

        # IEnumerable<TSource> second
        # IEnumerable<TSource> second, IEqualityComparer<TSource> comparer
        sequenceEqual: ()->


        # void
        # asEnumerable: ()->

        # void
        # toArray: ()->

        # void
        # toList: ()->

        # Func<TSource, TKey> keySelector
        # Func<TSource, TKey> keySelector, IEqualityComparer<TKey> comparer
        # Func<TSource, TKey> keySelector, Func<TSource, TElement> elementSelector
        # Func<TSource, TKey> keySelector, Func<TSource, TElement> elementSelector, IEqualityComparer<TKey> comparer
        # toDictionary: ()->

        # Func<TSource, TKey> keySelector
        # Func<TSource, TKey> keySelector, IEqualityComparer<TKey> comparer
        # Func<TSource, TKey> keySelector, Func<TSource, TElement> elementSelector
        # Func<TSource, TKey> keySelector, Func<TSource, TElement> elementSelector, IEqualityComparer<TKey> comparer
        # toLookup: ()->

        # void
        defaultIfEmpty: (source)->
            @data=source if @data.length is 0
            return @


