Strava Command-Line Tools
=========================

[![Gem Version](https://badge.fury.io/rb/strava-ruby-cli.svg)](https://badge.fury.io/rb/strava-ruby-cli)
[![Build Status](https://travis-ci.org/dblock/strava-ruby-cli.svg?branch=master)](https://travis-ci.org/dblock/strava-ruby-cli)

A set of command-line tools for Strava [Strava API v3](https://developers.strava.com).

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
  - [Strava OAuth](#strava-oauth)
- [Resources](#resources)
- [Contributing](#contributing)
- [Copyright and License](#copyright-and-license)

## Installation

```
gem install 'strava-ruby-cli'
```

## Usage

### Strava OAuth

Use `strava oauth` to obtain a token from the command-line. This will open a new browser window, navigate to Strava, request the appropriate permissions, then handle OAuth in a local redirect. The token type, refresh token, access token and token expiration will be displayed in the browser.

```bash
$ strava oauth token
```

## Contributing

See [CONTRIBUTING](CONTRIBUTING.md).

## Copyright and License

Copyright (c) 2019, [Daniel Doubrovkine](https://twitter.com/dblockdotorg) and [Contributors](CHANGELOG.md).

This project is licensed under the [MIT License](LICENSE.md).
