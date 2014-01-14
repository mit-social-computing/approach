require 'compass-h5bp'
add_import_path "webroot/assets/bower_components/foundation/scss"
# Require any additional compass plugins here.

# Set this to the root of your project when deployed:
http_path = "webroot/"
css_dir = "webroot/assets/css"
sass_dir = "webroot/assets/css/sass"
images_dir = "webroot/assets/img"
javascripts_dir = "webroot/assets/js"

# You can select your preferred output style here (can be overridden via the command line):
output_style = environment == :production ? :compressed : :expanded

# To enable relative paths to assets via compass helper functions. Uncomment:
relative_assets = true

# To disable debugging comments that display the original location of your selectors. Uncomment:
# line_comments = false


# If you prefer the indented syntax, you might want to regenerate this
# project again passing --syntax sass, or you can uncomment this:
# preferred_syntax = :sass
# and then run:
# sass-convert -R --from scss --to sass sass scss && rm -rf sass && mv scss sass
