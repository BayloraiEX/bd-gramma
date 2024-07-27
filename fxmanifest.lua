fx_version 'cerulean'
game 'gta5'
lua54 'yes'
author 'Baylorai Development'
description 'QBCore Illegal Gramma'
version '0.0.1'

shared_scripts {
	'@ox_lib/init.lua',
	'config.lua'
}

client_script {
	'client/*.lua'
}

server_script 'server/*.lua'