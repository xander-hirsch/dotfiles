function show-path {
	echo $path | tr ' ' "\n"
}

function unzip-ignore {
	local UNZIP_IGNORE_MAC=('__MACOSX/*' '*.DS_Store')
	local UNZIP_IGNORE_PYTHON=('*__pycache__/*' '*.ipynb_checkpoints/*')
    unzip $1 -x ${UNZIP_IGNORE_MAC[@]} ${UNZIP_IGNORE_PYTHON[@]}
}

function reset-permissions {
    find . -type d -exec chmod 755 '{}' +
    find . -type f -exec chmod 644 '{}' +
}

case $OS_CATEGORY in
	'macos')
		function search-library {
			function search-library-helper() {
				find $1 \
					-iname "*$2*" \
					-not -ipath "*$2*/*$2*" \
					-not -path '*/Google/*' \
					-not -path '*/Firefox/*' \
					-not -path '*/Caches/Yarn/*' \
					2> /dev/null
			}
			search-library-helper ~/Library $1
			search-library-helper /Library $1
		}
		;;
esac
