fx_version 'cerulean'
game 'gta5'

author 'TumberosHUD'
description 'Custom HUD with Money, Bank, ID, Hunger and Thirst'
version '1.0.0'

ui_page 'html/index.html'

client_scripts {
    '@es_extended/locale.lua',
    'client.lua'
}

files {
    'html/index.html',
    'html/css/style.css',
    'html/js/script.js',
    'html/images/*.png'
}

dependencies {
    'es_extended',
    'esx_status'
}

shared_scripts {
    '@es_extended/imports.lua'
}
