config = {

    source_path : './src'

    destination_path : './dist'

    browserSync_identifier : 'A'

}

# Srouces

config.jade_source_path   = config.source_path + '/jade'
config.css_source_path    = config.source_path + '/css'
config.stylus_source_path = config.source_path + '/stylus'
config.image_source_path  = config.source_path + '/image'

# Selectors

config.jade_selector   = [ config.jade_source_path   + '/*.jade' ]
config.css_selector    = [ config.css_source_path    + '/*.css'  ]
config.stylus_selector = [ config.stylus_source_path + '/*.styl' ]
config.image_selector  = [ config.image_source_path  + '/**/*'   ]

# Destinations

config.jade_destination_path   = config.destination_path + '/'
config.css_destination_path    = config.destination_path + '/css'
config.stylus_destination_path = config.destination_path + '/css'
config.image_destination_path  = config.destination_path + '/image'
config.all_destination_files   = config.destination_path + '/**/*'

# Export

module.exports = config