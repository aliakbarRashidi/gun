# See LICENSE for licensing information.

PROJECT = gun
PROJECT_DESCRIPTION = HTTP/1.1, HTTP/2 and Websocket client for Erlang/OTP.
PROJECT_VERSION = 1.1.0

# Options.

CT_OPTS += -pa test -ct_hooks gun_ct_hook [] # -boot start_sasl

# Dependencies.

LOCAL_DEPS = ssl

DEPS = cowlib
dep_cowlib = git https://github.com/ninenines/cowlib 2.5.1

DOC_DEPS = asciideck

TEST_DEPS = $(if $(CI_ERLANG_MK),ci.erlang.mk) ct_helper cowboy
dep_ct_helper = git https://github.com/extend/ct_helper.git master
dep_cowboy_commit = master

# CI configuration.

dep_ci.erlang.mk = git https://github.com/ninenines/ci.erlang.mk master
DEP_EARLY_PLUGINS = ci.erlang.mk

AUTO_CI_OTP ?= OTP-19+
AUTO_CI_HIPE ?= OTP-LATEST
# AUTO_CI_ERLLVM ?= OTP-LATEST
AUTO_CI_WINDOWS ?= OTP-19+

# Standard targets.

include erlang.mk

# Generate rebar.config on build.

app:: rebar.config
