# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

.PHONY: all test bootstrap install lint clean breakpad json_enhancements_pg_extension package

all: test

test: bootstrap
	./scripts/test.sh

dev:
	SOCORRO_DEVELOPMENT_ENV=1 ./scripts/bootstrap.sh

bootstrap:
	./scripts/bootstrap.sh

install: bootstrap
	./scripts/install.sh

package: install
	./scripts/package.sh

lint:
	./scripts/lint.sh

clean:
	./scripts/clean.sh

json_enhancements_pg_extension: bootstrap
	./scripts/json-enhancements.sh
