# Mixtape
[![Build Status](https://travis-ci.org/merongivian/mixtape.svg)](https://travis-ci.org/mixtape/)

If you love finding new music, but you hate going trough music blogs, this gem is for you!!!

![](http://38.media.tumblr.com/tumblr_m2gjs94p1s1qdflgdo1_500.gif)

## Installation

Install it from the command line

    $ gem install mixtape

## Usage

Simply type `mixtape` on the terminal and you'll get a youtube playlist from a random blog

..or get one from the blogs available

    $ mixtape 'pap'

## Music Blogs

Currently you can create awesome playlists from the current sources:

- [NME](http://www.nme.com) => 'nme'
- [Pitchfork](http://www.pitchfork.com) => 'pitchfork'
- [DIY Magazine](http://www.diymag.com) => 'diy'
- [Indie Shuffle](http://www.indieshuffle.com) => 'indieshuffle'
- [Stereogum](http://www.stereogum.com) => 'stereogum'
- [Pigeons and Planes](http://www.pigeonsandplanes.com) => 'pap'
- [Yvynyl](http://www.yvynyl.com) => 'yvynyl'

## How it Works

Under the hood, this gem fetches top new tracks by scraping the music blog.
It picks each song randomly, so you'll never get the same playlist

## TODO

- Improve tracks searching
- Add new sources
- Improve command line with new options

## Contributing

1. Fork it ( https://github.com/[my-github-username]/mixtape/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
