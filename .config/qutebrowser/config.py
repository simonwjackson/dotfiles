#!/bin/env python

config.load_autoconfig(False)

config.unbind('H')
config.unbind('L')

config.set('colors.webpage.preferred_color_scheme', 'dark')
config.set('colors.webpage.bg', 'black')
config.set('colors.webpage.darkmode.enabled', True)

config.set('colors.tabs.bar.bg', '#000000')
config.set('tabs.padding', { "bottom": 5, "left": 2, "right": 2, "top": 5 })
config.set('colors.tabs.selected.even.fg', '#cccccc')
config.set('colors.tabs.selected.odd.fg', '#cccccc')
config.set('colors.tabs.odd.bg', '#000000')
config.set('colors.tabs.odd.fg', '#888888')
config.set('colors.tabs.even.bg', '#000000')
config.set('colors.tabs.even.fg', '#888888')

#  config.set('fonts.default_size', '7pt')

config.set('colors.tabs.indicator.start', '#00000000')
config.set('colors.tabs.indicator.stop', '#00000000')

config.set('tabs.favicons.show', 'pinned')
config.set('statusbar.show', 'in-mode')
config.set('auto_save.session', True)

config.bind(';v', 'hint links spawn --detach mpv-rpc --video "{hint-url}"')
config.bind(';a', 'hint links spawn --detach mpv-rpc --audio "{hint-url}"')

config.bind('h', 'back')
config.bind('l', 'forward')
config.bind(' bu', 'spawn --userscript qutewarden user')
config.bind(' bp', 'spawn --userscript qutewarden pass')
config.bind(' bb', 'spawn --userscript qutewarden both')

config.set('url.searchengines', {
    "DEFAULT": "https://www.google.com.ar/search?q={}",
    "fake": 'https://fakespot.com/analyze?url={}',
    "r": 'https://www.reddit.com/r/{}/',
})

# More sites are responsive with this user agent
config.set('content.headers.user_agent', "Mozilla/5.0 (Android 10; Mobile; rv:86.0) Gecko/86.0 Firefox/86.0")

# Fix reddit
config.set('content.headers.user_agent', "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36", "https://*.reddit.com/*")

# Fix google account login
config.set('content.headers.user_agent', "Mozilla/5.0 ({os_info}; rv:90.0) Gecko/20100101 Firefox/90.0", "https://accounts.google.com/*")

# Desktop google drive
config.set('content.headers.user_agent', "Mozilla/5.0 ({os_info}; rv:90.0) Gecko/20100101 Firefox/90.0", "https://drive.google.com/*")
