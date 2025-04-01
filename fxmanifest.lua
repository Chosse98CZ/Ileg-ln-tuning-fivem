fx_version 'cerulean'
game 'gta5'

author 'Chosse98CZ'
description 'Ilegální tuning - klíče k tajným schránkám'
version '1.0'

shared_scripts {
    '@es_extended/imports.lua', -- Import ESX (pokud používáte novější ESX verzi)
    'config.lua'
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'server.lua'
}

client_scripts {
    'client.lua'
}
