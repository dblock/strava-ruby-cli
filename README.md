Strava Command-Line Client
==========================

[![Gem Version](https://badge.fury.io/rb/strava-ruby-cli.svg)](https://badge.fury.io/rb/strava-ruby-cli)
[![Build Status](https://travis-ci.org/dblock/strava-ruby-cli.svg?branch=master)](https://travis-ci.org/dblock/strava-ruby-cli)

A command-line client for Strava [Strava API v3](https://developers.strava.com).

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
  - [Authentication](#authentication)
  - [Run Commands](#run-commands)
  - [Strava Console](#strava-console)
- [Contributing](#contributing)
- [Copyright and License](#copyright-and-license)

## Installation

```
gem install 'strava-ruby-cli'
```

## Usage

### Authentication

Strava commands require a Strava _Client ID_ and _Client Secret_ from [Your API Application](https://www.strava.com/settings/api). The command-line tool with prompt you for these or you can supply them with `--client_id` and `--client_secret` options. You can also adjust access scope with `--scope`.

The client will fetch an access token. This will open a new browser window, navigate to Strava, request the appropriate permissions, then handle OAuth in a local redirect. The token type, refresh token, access token and token expiration will be displayed in the browser and subsequently used.

You can note the access token and supply it via `--access_token` to avoid being prompted in the future.

### Run Commands

Use `strava run` to execute commands against the Strava API. Everything in [strava-ruby-client](https://github.com/dblock/strava-ruby-client) is supported.

```bash
$ strava run athlete.username

dblockdotorg
```

Because this is Ruby, you can could fetch all currently logged-in athlete attributes in JSON.

```bash
$ strava run athlete.to_json

{"id":26462176,"username":"dblockdotorg", ...}
```

To retrieve activities you need the `activity:read` scope.

```bash
$ strava --scope=activity:read run athlete_activities.first.name

TCS NYC Marathon 2018
```

### Strava Console

Use `strava console` to explore the Strava API interactively.

```bash
$ strava console

Strava> athlete.name

"Daniel Doubrovkine"
```

## Contributing

See [CONTRIBUTING](CONTRIBUTING.md).

## Copyright and License

Copyright (c) 2019, [Daniel Doubrovkine](https://twitter.com/dblockdotorg) and [Contributors](CHANGELOG.md).

This project is licensed under the [MIT License](LICENSE.md).
