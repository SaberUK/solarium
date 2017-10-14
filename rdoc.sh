#!/usr/bin/env sh
# Solarium (C) 2017 Peter "SaberUK" Powell <petpow@saberuk.com>

rm -fr rdoc
rdoc --markup tomdoc \
	--output rdoc \
	lib/**/*.rb
