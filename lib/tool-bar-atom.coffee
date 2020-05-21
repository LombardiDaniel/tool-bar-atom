module.exports =
    deactivate: ->
        @toolBar?.removeItems()

    consumeToolBar: (toolBar) ->
        @toolBar = toolBar 'tool-bar-atom'

        if atom.packages.loadedPackages['project-manager']
            @toolBar.addButton
                'icon': 'file-submodule'
                'tooltip': 'List projects'
                'callback': 'project-manager:list-projects'

        @toolBar.addSpacer()

        if atom.packages.loadedPackages['expose']
            @toolBar.addButton
                'icon': 'browser'
                'tooltip': 'Toggle Exposé'
                'callback': 'expose:toggle'

        if atom.packages.loadedPackages['terminus']
            # @toolBar.addSpacer()
            @toolBar.addButton
                'icon': 'terminal'
                'callback': 'terminus:toggle'
                'tooltip': 'Terminus Toggle'

        if atom.packages.loadedPackages['git-plus']
            @toolBar.addSpacer()
            @toolBar.addButton
                'icon' : 'git-plain'
                'callback' : 'git-plus:menu'
                'tooltip' : 'Git plus'
                'iconset' : 'devicon'
        else if atom.packages.loadedPackages['git-control']
            @toolBar.addSpacer()
            @toolBar.addButton
                'icon' : 'git-plain'
                'callback' : 'git-control:toggle'
                'tooltip' : 'Git control'
                'iconset' : 'devicon'

        if atom.packages.loadedPackages['atom-beautify']
            @toolBar.addButton
                'icon': 'star'
                'callback': 'atom-beautify:beautify-editor'
                'tooltip': 'Beautify'
                'iconset': 'fa'

        if atom.inDevMode()

            @toolBar.addSpacer()

            @toolBar.addButton
                'icon': 'md-refresh'
                'callback': 'window:reload'
                'tooltip': 'Reload Window'
                'iconset': 'ion'

            @toolBar.addButton
                'icon': 'bug'
                'callback': 'window:toggle-dev-tools'
                'tooltip': 'Toggle Developer Tools'

        if atom.packages.loadedPackages['script']
            @toolBar.addSpacer()
            @toolBar.addButton
                'icon': 'play'
                'callback': 'script:run'
                'tooltip': 'Run script'
                'iconset': 'fa'
            # @toolBar.addButton
            #     'icon': 'fast-forward'
            #     'callback': 'script:run-by-line-number'
            #     'tooltip': 'Run by Line Number'
            #     'iconset': 'fa'
            @toolBar.addButton
                'icon': 'stop'
                'callback': 'script:kill-process'
                'tooltip': 'Stop script'
                'iconset': 'fa'
            # @toolBar.addButton
            #     'icon': 'cog'
            #     'callback': 'script:run-options'
            #     'tooltip': 'Configure script'
            #     'iconset': 'fa'

        @toolBar.addSpacer()
        if atom.packages.loadedPackages['markdown-preview']
            @toolBar.addButton
                'icon': 'markdown'
                'callback': 'markdown-preview:toggle'
                'tooltip': 'Markdown Preview'
        # if atom.packages.loadedPackages['atom-html-preview']
        #   @toolBar.addButton
        #     'icon': 'globe'
        #     'callback': 'atom-html-preview:toggle'
        #     'tooltip': 'HTML Preview'
