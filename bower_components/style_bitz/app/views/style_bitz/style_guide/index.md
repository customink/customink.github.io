
# Welcome

Welcome to CustomInk's [living styleg guide](http://www.stubbornella.org/content/2014/04/09/style-guide-driven-development/). The building blocks for CustomInk's mobile/responsive websites are known as StyleBitz. Stay up to date with:

<img class="sg-Page-img sg-Page-img--half" alt="StyleBitz Logo" src="https://cloud.githubusercontent.com/assets/2381/2988586/747fde38-dc5b-11e3-8279-af9ac2f54634.png" />
* [Latest Style Guide Site](http://stylebitz.customink.com)<br/>**User:** user@wins<br/>**Pass:** eAoPf$2RH.4tDK
* [StyleBitz GitHub Repository](https://github.com/customink/style_bitz)

#### Overview

Our living style guide is the sum of 3 distinct components.

<img class="sg-Page-img sg-Page-img--half" alt="StyleBitz Sections" src="https://cloud.githubusercontent.com/assets/2381/3484837/5d86f3aa-03b7-11e4-8be8-14d6892cd37c.png" />
1. [Style Guide](/style_bitz/guide) - A traditional technical style guide that outlines all elements and components.
2. [Sass library](/style_bitz/sass) - The lowest level building blocks. Details StyleBitz's CSS framework and how we leverage our primary dependencies.
3. [Rails Engine](/style_bitz/rails) - How to use StyleBitz with Rails layouts, views, and assets.

There is one other section, a high level [User Experience](/style_bitz/ux) for both the visual design and user experience teams to detail their higher patterns. Lastly, if you are interested in learning more about living style guides and our decision making process, [read the GitHub discussion](https://github.com/customink/style_bitz/issues/2) that started it all.



## Primary Dependencies

StyleBitz stands on the shoulders of many great open source projects. Knowing how to use StyleBitz requires knowing how to properly leverage these tools as well. Take some time to review their docs after reading [our own Sass framework](/style_bitz/sass) docs.

* [Sass 3.3](http://sass-lang.com) - Syntactically Awesome Style Sheets. [[DOCS](http://sass-lang.com/documentation/file.SASS_REFERENCE.html)]
* [Bourbon](http://bourbon.io) - Lightweight Mixin Library For Sass. [[DOCS](http://bourbon.io/docs/)]
* [Susy 2](http://susy.oddbird.net) - Layout & Math. AKA Grid System. [[DOCS](http://susydocs.oddbird.net/en/latest/)]
* [Breakpoint](http://breakpoint-sass.com) - Simple Media Queries with Sass. [[DOCS](https://github.com/Team-Sass/breakpoint/wiki)]
* [Sassy-Maps](https://github.com/Team-Sass/Sassy-Maps) - Sass Map Helper Functions.
* [Normalize.css](http://necolas.github.io/normalize.css/) - Just what it says. *(vendored)*

#### Recommended Reading

* [Your Own Damn Susy System](http://vimeo.com/93045089)
* [Sass Bites #29 - Susy Grids 2.0 with Eric M. Suzanne](https://www.youtube.com/watch?v=m7k-vBzebPg)
* [Sass Bites #25 - Mason Wendell and Breakpoint](https://www.youtube.com/watch?v=lR9lK_K8MDE)
* [The EMs have it: Proportional Media Queries FTW](http://blog.cloudfour.com/the-ems-have-it-proportional-media-queries-ftw/)



## Methodology

StyleBitz follows [SUIT CSS](http://suitcss.github.io), a reliable and testable styling methodology for component-based UI development. SUIT CSS plays well with React, Ember, Angular, and other component-based approaches to UI development. The SUIT CSS naming convention helps to scope component CSS and make your widgets render more predictably.

#### Recommended Reading

* [SUIT CSS Documentation](https://github.com/suitcss/suit/blob/master/doc/README.md) - MUST READ!!!
* [About HTML Semantics & Front-End Architecture](http://nicolasgallagher.com/about-html-semantics-front-end-architecture/) - What problems do SUIT & BEM solve. Why we use the "multi-class" vs. the "single-class" pattern.

#### Background Reading

Some curated resources that influenced some of StyleBitz' decisions.

* [BASS CSS](http://www.basscss.com/) - Inspired simple REM-based units.
* [Writing efficient CSS](https://developer.mozilla.org/en-US/docs/Web/Guide/CSS/Writing_efficient_CSS) - Mozilla's Guide. Background for some of our higher implementations.
* [Modular CSS Naming Conventions](http://thesassway.com/advanced/modular-css-naming-conventions) - Efficient OCSS from a Sass perspective.

Please read [our own Sass framework](/style_bitz/sass) section for more details.



## Get Started

To use StyleBitz, please start with the respective usage sections of either [our Sass framework](/style_bitz/sass) and/or [our Rails engine](/style_bitz/rails) documentation sections.

#### Bower & CodeKit

<a href="https://incident57.com/codekit/" title="CodeKit"><img class="sg-Page-img--quarter" alt="CodeKit" src="https://cloud.githubusercontent.com/assets/2381/3487261/a5b1a18e-0470-11e4-89ec-8ace8c48f827.png" style="width: 100px" /></a>
StyleBitz can be used like any other Sass framework that can manage its dependencies. This includes Bower and great GUI tools such as [CodeKit](https://incident57.com/codekit/). StyleBitz includes a `bower.json` which mirrors the Ruby gemspec and accounts for small differences between the two package managers. Usage with Bower & CodeKit requires that you import any StyleBitz deps correctly. Please read the full CodeKit documentation for more details.

* [CodeKit Usage Documentation](sass-codekit)

<span class="sg-Label sg-Label--todo"></span> Break out Bower usage since a JS project can setup `SASS_PATH` correctly.



## Development

#### Project Setup

Clone the [StyleBitz repository](https://github.com/customink/style_bitz) to your local drive. If you are new to git, we recommend using [GitHub for Mac](https://mac.github.com). To either develop StyleBitz or contribute to the living style guide's documentation, you will need Ruby installed, which is already present on OS X. If you use a Ruby version manager, we recommend developing StyleBitz with v2.1.2 or later for a speed boost when rendering pages.

StyleBitz uses [Capybara](https://github.com/jnicklas/capybara) for both its unit and integration tests. The following [terminal commands](http://wiseheartdesign.com/articles/2010/11/12/the-designers-guide-to-the-osx-command-prompt/) need to be run from the root of the cloned StyleBitz repository.

```shell
# Install Homebrew if you do not already have it
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
# Install ruby gem dependencies.
$ brew install libxml2 libxslt phantomjs

# Install ruby gems needed by StyleBitz.
$ gem install bundler
$ env NOKOGIRI_USE_SYSTEM_LIBRARIES=true bundle install
```

#### Project Overview

Our Sass resources can be found in the `app/assets/stylesheets` directory. From here everything related to StyleBitz proper is defined in the `_style_bitz.scss` main file or the adjacent `style_bitz` directory. From here Sass files are organized within a clean directory structure that follows our [core/more](/style_bitz/sass#usage) philosophy. The living style guide uses StyleBitz to build itself. The main Sass file is in the same stylesheets directory and it too has a matching directory named `style_bitz_style_guide` to keep them seperated.

The [Rails Engine](/style_bitz/rails) that StyleBitz gem usage exposes is organized like most Rails applications. We use an isolated namespace to keep our controllers, views, and helpers from negatively affecting host applications. As we develop new helpers it is important to maintain the `sb_` method name prefixes since Rails mixes all helpers all the time.

#### Local Dev Server

You need a development server to see the local version of the StyleBitz living style guide. This way you can see what is changed at either the code or documentation level. For those that use the [Pow](http://pow.cx) rack server, you can symlink to the StyleBitz repository like a normal Rails app. If you do not have Pow installed, you can use the rake command to start a development server. Once running, you can access StyleBitz at: `http://0.0.0.0:3000`

```shell
$ bundle exec rake server
```


## Documentation

The StyleBitz living style guide is authored in easy to use Markdown syntax. Specifically we use [GitHub Flavored Markdown](https://help.github.com/articles/github-flavored-markdown) which allows us to embed syntax highlighted code examples. All style guide pages reside within the `app/views/style_bitz/style_guide` directory and have a `.md` file extension.

Any new new Markdown file added here will automatically be available to use. For example, the `foo.md` file would be accessed at the `/style_bitz/foo` URL path. Markdown files are automatically parsed and given a table of contents using semantic names for each `<h2>` tag which are given the special style guide presentation on each page. **Please, `<h4>` tags within each documentation segment.** For example:

```
## Primary Section

Some content...

#### Other Related Section

More content...
```

Please take the time to consider the content and contextual link to any other style guide pages as needed. For example, this `[our Sass usage](/style_bitz/sass#usage)` will generate a link with the text of **"our Sass usage"** that links to our Sass Framework page. The `#usage` is called an anchor and is optional. In this example, it will jump to that section on the page.

#### Images

If you are using images in the documentation, we recommend hosting them on GitHub's user content server. To do this, [open this GitHub page](https://github.com/customink/style_bitz/issues/new) and just drag your image to the comment input box. Your image will automatically upload and you can copy the URL into the HTML snippet below.

```html
<img class="sg-Page-img sg-Page-img--half" alt="..." src="..." />
```

That image would take up half the right side of the page from the medium breakpoint upward. Full page for mobile first. Check out the style guides `_page.scss` for more classes or write your own.



## Updates & Deploys

Updates to the StyleBitz master repository branch will trigger a [Snap-CI](https://snap-ci.com/) run of the test suite and an automatic deploy to Heroku of the living style guide. This normally happens in only a few minutes. It is recommended that you run the tests before committing.

```shell
$ bundle exec rake test
```

<p>
  <span style="vertical-align: middle;">Current build and deploy status:</span>
  <a href="https://snap-ci.com/customink/style_bitz/branch/master" title="StyleBitz On Snap-CI">
    <img src="https://snap-ci.com/FBTrI1n1v4d0dN2tBDTsIxuCVdsqW0oZ4JCgTgFlBJY/build_image" alt="Build/Deploy Status" style="vertical-align: middle; height: 1.5rem;">
  </a>
</p>



## Change Log

#### master

* ...

#### v0.1.0

* Initial Pre-Release

