DC=docker-compose -f docker-compose.yml $(1)
DC-RUN=$(call DC, run --rm rails $(1))

usage:
	@echo "Available targets:"
	@echo "  * build               - Builds image"
	@echo "  * bundle              - Runs bundle install"
	@echo "  * test F=file         - Runs tests for the given file(F)"
	@echo "  * ar CONN=adapter     - Runs tests for Active Record with given adapter"
	@echo "  * dev                 - Opens an ash session in the container"
	@echo "  * down                - Removes all the containers"
	@echo "  * tear-down           - Removes all the containers with volumes and tears down the setup"

build:
	$(call DC, build)

bundle:
	$(call DC-RUN, bundle install)

dev:
	$(call DC-RUN, ash)

down:
	$(call DC, down)

tear-down:
	$(call DC, down -v --rmi all --remove-orphans)

GEM_NAME=$(firstword $(subst /, ,$(F)))
TEST_FILE=$(subst $(GEM_NAME)/,,$(F))
ifeq ($(GEM_NAME),$(TEST_FILE))
	TEST_FILE=
else
	TEST_FILE:="TEST=$(TEST_FILE)"
endif

.PHONY: test
test:
	@$(eval TEST_COMMAND := $(if $(GEM_NAME),"cd $(GEM_NAME) && bundle exec rake test $(TEST_FILE)","bundle exec rake test"))
	$(call DC-RUN, ash -c $(TEST_COMMAND))

.PHONY: ar
ar:
	@$(eval AR_TEST_COMMAND := $(if $(CONN),test:$(CONN),test))
	$(call DC-RUN, ash -c "cd activerecord && bundle exec rake $(AR_TEST_COMMAND)")
