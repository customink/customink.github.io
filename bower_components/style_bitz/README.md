
<img src="https://cloud.githubusercontent.com/assets/2381/2988586/747fde38-dc5b-11e3-8279-af9ac2f54634.png" width="361"/>

### Building blocks for CustomInk's mobile/responsive websites.

StyleBitz is a set of both technical and creative components, collectively called a living style guide. The full interface to StyleBitz can be found on the hosted version of the URL below.

[http://stylebitz.customink.com](http://stylebitz.customink.com)

* **User:** user@wins
* **Pass:** eAoPf$2RH.4tDK

The StyleBitz living style guide and technical components are also available when mounted within a Rails application. This gives you a great way of knowing which version and features of StyleBitz you are working with.

```ruby
# In your Gemfile
gem 'style_bitz', github: 'customink/style_bitz'

# In routes.rb
mount StyleBitz::Rails::Engine => '/style_bitz' if Rails.env.development?
```


### The Logo

Handcrafted by Ken Collins using [Sketch <sup>3</sup>](http://bohemiancoding.com/sketch/). It uses an assembled version of the [Style Script](http://www.myfonts.com/fonts/typesetit/style-script/) font in pink as a homage to [Sass](http://sass-lang.com). The bitz font is called [Avenir](http://en.wikipedia.org/wiki/Avenir_(typeface)) and is French for "future". CSS is [often referrenced](http://cssconf.com) as the creative building blocks for the web. Enjoy and do great things!

Need the art files? They are in the [art directory](https://github.com/customink/style_bitz/tree/master/art) of this repo.
