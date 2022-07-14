fx_version 'cerulean'
game 'gta5'

author 'Ghxst'
description 'QB-Vehicletaxes written for der_elmoo'
version 'v1'

shared_scripts {
    '@qb-core/shared/locale.lua',
    'locales/en.lua',
    'config.lua',
}

client_scripts {
    'client/*.lua'
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
    'server/*.lua'
}