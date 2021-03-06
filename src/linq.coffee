do ()->

    @linq = (obj)->
        return obj if obj instanceof Enumerable
        return new Enumerable(obj) if @ not instanceof Enumerable

    # Object::linq =(target)->
    #     return new Enumerable(target) if target?
    #     return new Enumerable(this)

    String::same =(target)->
        return this.toLowerCase() is target.toLowerCase()

    class Enumerable
        constructor: (@data) ->
            if @data instanceof Document
                @data= document.getElementsByTagName("*")

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
        orderBy: (func)->
            @data.sort((a,b)->
                func(a)-func(b)
            )
            return @

        # Func<TSource, TKey> keySelector
        # Func<TSource, TKey> keySelector, IComparer<TKey> comparer
        orderByDescending: (func)->
            @data.sort((a,b)->
                func(b)-func(a)
            )
            return @

        # WON'T IMPLEMENT
        # Func<TSource, TKey> keySelector
        # Func<TSource, TKey> keySelector, IComparer<TKey> comparer
        # thenBy: ()->

        # WON'T IMPLEMENT
        # Func<TSource, TKey> keySelector
        # Func<TSource, TKey> keySelector, IComparer<TKey> comparer
        # thenByDescending: ()->

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
            for i in [0...second.length]
                @data.push(second[i])
            return @

        # void
        # IEqualityComparer<TSource> comparer
        distinct: (func)->
            # if func?
            #     return
                # ...

        # IEnumerable<TSource> second
        # IEnumerable<TSource> second, IEqualityComparer<TSource> comparer
        union: (func)->

        # IEnumerable<TSource> second
        # IEnumerable<TSource> second, IEqualityComparer<TSource> comparer
        # todo implement comparer
        intersect: (second, comparer)->
            ret=[]
            for i in [0...second.length]
                ret.push(second[i]) if @contains(second[i])
            return ret
                

        # IEnumerable<TSource> second
        # IEnumerable<TSource> second, IEqualityComparer<TSource> comparer
        # todo implement comparer
        except: (second, comparer)->
            ret=[]
            for i in [0...second.length]
                ret.push(second[i]) if not @contains(second[i])
            return ret

        # void
        reverse: ()->
            ret=[]
            for i in [0...@data.length]
                ret.push(@data.splice(-1))
            @data=ret
            return @

        # IEnumerable<TSource> second
        # IEnumerable<TSource> second, IEqualityComparer<TSource> comparer
        sequenceEqual: ()->

        # WON'T IMPLEMENT
        # void
        # asEnumerable: ()->

        # void
        toArray: ()->
            return @data

        # WON'T IMPLEMENT
        # void
        # toList: ()->

        # WON'T IMPLEMENT
        # Func<TSource, TKey> keySelector
        # Func<TSource, TKey> keySelector, IEqualityComparer<TKey> comparer
        # Func<TSource, TKey> keySelector, Func<TSource, TElement> elementSelector
        # Func<TSource, TKey> keySelector, Func<TSource, TElement> elementSelector, IEqualityComparer<TKey> comparer
        # toDictionary: ()->

        # WON'T IMPLEMENT
        # Func<TSource, TKey> keySelector
        # Func<TSource, TKey> keySelector, IEqualityComparer<TKey> comparer
        # Func<TSource, TKey> keySelector, Func<TSource, TElement> elementSelector
        # Func<TSource, TKey> keySelector, Func<TSource, TElement> elementSelector, IEqualityComparer<TKey> comparer
        # toLookup: ()->

        # void
        # TSource defaultValue
        defaultIfEmpty: (source)->
            @data=source if @data.length is 0
            return @

        # WON'T IMPLEMENT
        # void
        # ofType: ()->

        # WON'T IMPLEMENT
        # void
        # cast: ()->

        # void
        # Func<TSource, bool> predicate
        first: (func)->
            @data = @where(func).data if func?
            return @data[0]

        # void
        # Func<TSource, bool> predicate
        firstOrDefault: (func)->
            @data = @where(func).data if func?
            return null if @data.length is 0
            return @data[0]

        # void
        # Func<TSource, bool> predicate
        last: (func)->
            @data = @where(func).data if func?
            return @data.slice(-1)[0]

        # void
        # Func<TSource, bool> predicate
        lastOrDefault: (func)->
            @data = @where(func).data if func?
            return null if @data.length is 0
            return @data.slice(-1)[0]

        # void
        # Func<TSource, bool> predicate
        single: (func)->
            return @first(func)

        # void
        # Func<TSource, bool> predicate
        singleOrDefault: (func)->
            return @firstOrDefault(func)

        # int index
        elementAt: (index)->
            return @data[index]

        # int index
        elementAtOrDefault: (index)->
            return @data[index] if @data[index]?
            return null

        # int start,int count
        range: (start, count)->
            @data = @data.slice(start,start+count)
            return @

        # int count
        # repeat: (count)->

        # WON'T IMPLEMENT
        # void
        # empty: ()->

        # void
        # Func<TSource, bool> predicate
        any: (func)->
            current= false
            for i in [0...@data.length]
                if func?
                    current = func(@data[i])
                else
                    current = !!@data[i]
                return true if current
            return false

        # void
        # Func<TSource, bool> predicate
        all: (func)->
            current= false
            for i in [0...@data.length]
                if func?
                    current = func(@data[i])
                else
                    current = !!@data[i]
                return false if not current
            return true

        # void
        # Func<TSource, bool> predicate
        count: (func)->
            @data= @where(func).data if func?
            return @data.length

        # WON'T IMPLEMENT
        # void
        # Func<TSource, bool> predicate
        # longCount: (func)->

        # TSource value
        # TSource value, IEqualityComparer<TSource> comparer
        contains: (value,comparer)->
            # todo implement comparer
            @any((d)->
                if not func?
                    d is value
            )

        # Func<TSource, TSource, TSource> func
        # TAccumulate seed, Func<TAccumulate, TSource, TAccumulate> func
        # TAccumulate seed, Func<TAccumulate, TSource, TAccumulate> func, Func<TAccumulate, TResult> resultSelector
        aggregate: (op1,op2)->
            if op2?
                ret = op1
                pointer = 0
                func = op2
            else
                ret = @data[0]
                pointer = 1
                func = op1

            for i in [pointer...@data.length]
                 ret = func(ret,@data[i])

            return ret

        # void
        # Func<TSource, int> selector
        sum: (func)->
            ret = 0
            for i in [0...@data.length]
                ret += @data[i] if not func?
                ret += func(@data[i]) if func?
            return ret

        # void
        # Func<TSource, int> selector
        min: (func)->
            minId=0
            for i in [1..@data.length]
                minId = i if not func? and @data[i]<@data[minId]
                minId = i if func? and func(@data[i])<func(@data[minId])
            return @data[minId]

        # void
        # Func<TSource, int> selector
        max: (func)->
            maxId=0
            for i in [1..@data.length]
                maxId = i if not func? and @data[i]>@data[maxId]
                maxId = i if func? and func(@data[i])>func(@data[maxId])
            return @data[maxId]

        # void
        # Func<TSource, int> selector
        average: (func)->
            return @sum(func) / @data.length




