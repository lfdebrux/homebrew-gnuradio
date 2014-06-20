# homebrew-gnuradio

This is a collection of [Homebrew](https://github.com/mxcl/homebrew) recipes
that makes it easier get GNU Radio and friends running on OS X.

## Installation

These steps have been tested on Mountain Lion 10.8.5 with Xcode 5.1.1.

- Install the prerequisite python packages

  ```sh
  pip install numpy Cheetah lxml
  ```

- Install gnuradio (add `--with-qt` for `gr-qtgui` or `--with-wx` for `gr-wxgui`)

  ```sh
  brew tap lfdebrux/homebrew-gnuradio
  brew install gnuradio
  ```
- Create the `~/.gnuradio/config.conf` config file for custom block support

  ```ini
  [grc]
  local_blocks_path=/usr/local/share/gnuradio/grc/blocks
  ```
