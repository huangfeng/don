root = @


toString = {}.toString
isArray = Array.isArray or ((elem) -> toString.call(elem) is '[object Array]')


Don = ->


    renderInner = (arr) ->
        res = ''
        for elem in arr
                res += (if isArray elem then toHtml elem else elem)
        res


    renderAttrs = (attrs) ->
        res = ''
        for attr, val of attrs
                res += ' ' + attr + '="' + val + '"'
        res


    toHtml = (arr) ->


        if isArray(arr[0])
                res = ''
                for elem in arr
                        res += toHtml elem
                res

        else if arr.length is 0
                ''

        else if arr.length is 1
                '<' + arr[0] + '>'

        else
                if toString.call(arr[1]) is '[object Object]'

                        if arr.length is 2
                                '<' + arr[0] + renderAttrs(arr[1]) + '>'

                        else
                                '<' + arr[0] + renderAttrs(arr[1]) + '>' + renderInner(arr[2..]) + '</' + arr[0] + '>'

                else
                    '<' + arr[0] + '>' + renderInner(arr[1..]) + '</' + arr[0] + '>'



    @toHtml = toHtml


    @render = (data, template, key) ->

        toHtml template(data, key)


    @mapRender = (dataArr, template) ->
        res = ""
        for key, data of dataArr
                res += @render data, template, key
        res


    @map = @mapRender


    @renderIn = (data, template, key, parent) ->
        toHtml template.call data, key, parent


    @mapRenderIn = (dataArr, template, parent) ->
        res = ""
        for key, data of dataArr
                res += @renderIn data, template, key, parent
        res


    @mapIn = @mapRenderIn


    @


root.Don = new Don()
