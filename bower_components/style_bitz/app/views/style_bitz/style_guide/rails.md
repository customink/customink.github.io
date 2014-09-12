
# StyleBitz loves Rails.

On top of all the goodness of [our own Sass framework](/style_bitz/sass) using the StyleBitz gem with Rails will give you access to mobile first responsive views and pre-defined layouts that automatically render common CustomInk components like our header and footer. StyleBitz allows you to take as much or as little as you want. You are in full control.


## Usage

To use StyleBitz with Rails, just add it to your `Gemfile`. If needed, you can use a semantic version tag. See our [Change Log](index#change-log) for details.

```ruby
gem 'style_bitz', github: 'customink/style_bitz'
```

Optionally, you can mount the StyleBitz engine by adding the following line to your `routes.rb` file. This will allow you to access the living style guide at the `/style_bitz` URL within your Rails application. It is recommended to do this only for the development environment.

```ruby
if Rails.env.development?
  mount StyleBitz::Rails::Engine => '/style_bitz'
end
```


## Layouts & Views

Since StyleBitz is all about mobile first responsive design, it has only a single Rails layout. We call this the core layout. The core layout's responsibility is very small. It's job is to include other core partials to assemble a working page.

* Common `<head>` via `style_bitz/core/head` partial.
* Common header via `style_bitz/core/header` partial.
* Yielded content within a `<main class="sb-main">` element.
* Common footer via `style_bitz/core/footer` partial.

```ruby
class ProductsController < ApplicationController
  layout 'style_bitz/layouts/core'
end
```

#### Partial: style_bitz/core/head

This partial puts all of our common head elements that you would expect – keywords, title, mobile compatible hints, etc. It also has a stylesheet link tag for the `style_bitz/style_bitz` manifest. This is the fully rendered core CSS as explained in [our Sass framework](/style_bitz/sass) section and it is automatically added to your applications precompile list. StyleBitz does this so it can be cached between requests. It also exposes the following interfaces:

1. A content for yield to `:sb_head` at the very end to customize the contents.
2. A content for `:sb_page_title` to customize the title tag.

<span class="sg-Label sg-Label--todo"></span> There are 14 icon meta tags to fill in. Get some from SG mobile_phone.html.erb assets.

#### Partial: style_bitz/core/header

This partial renders our responsive header. It includes a customizeable TTARP number that is also hooked into our legacy StyleGuide TTARP override. Meaning TTARP number cookies set in StyleGuide will render in StyleBitz. Please see the TTARP Helper section for more details.

The header partial also renders our LivePerson link. It leverages the ESI helpers within the RailsFrontend application too. This ESI partial is what allows Sales/Service to dynamically enable/disable the LivePerson feature via [this admin page](https://www.customink.com/admin/live_person). Please see the ESI Helper section for more details.

#### Partial: style_bitz/core/footer

The footer loads the StyleBitz JavaScript manifest. Please see the JavaScript section to learn more about what assets are loaded and how to use them. The footer exposes the following programtic interfaces.

1. A content for yield to `:sb_footer` at the very end to add other content and/or JavaScript.

<span class="sg-Label sg-Label--todo"></span> Add Google analytics JavaScript.<br/>
<span class="sg-Label sg-Label--todo"></span> Add Coremetrics JavaScript.<br/>


## Helpers

If you add a new helper module to StyleBitz, please follow these guidelines:

1. Avoid name conflicts and prefix all method names with `sb_`.
2. Include the new helper in the `StyleBitz::ApplicationHelper` module.

There is no need to include helpers in your host application. StyleBitz will prepare your application by including our root application helper for you.

#### TTARP Helper

Divergent from our legacy StyleGuide, the StyleBitz gem does not champion named TTARP numbers like `:sales`. We felt this feature is out of Scope for StyleBitz and we only hard code a single default number.

If you want to override the the TTARP number, there are a few ways to do this. First is our typical method that will set the number and cookie it allowing us to track visitors from unique landing pages. To do this, use the following ERB method in your view.

```erb
<% sb_ttarp_number_override_cookied '800-555-1234' %>
```

Please use the `sb_ttarp_number_span` in any content to generate the current TTARP number (default or override). This content tag will be updated by the cookied number above if set too allowing content pages to participate in conversion tracking. If you want to override the TTARP number for a single page without setting a cookie use this in your Rails view.

```erb
<% sb_ttarp_number_override '800-555-1234' %>
```

#### ESI Helper

Used for header footer ESI host app delegation, specifically RailsFrontend. If the host application does not have a `render_esi` helper method, then StyleBitz will render a local partial. Meaning LivePerson is on all the time. The ESI functionality will only work when the request is not SSL or the Rails env is not test or development.

If you change anything in StyleBitz `app/views/style_bitz/esi` view directory, please make sure to update any host application's matching directory. For example and ESI path for `live_person/sb_footer` is in partial form in StyleBitz and a [full view in RailsFrontend](https://github.com/customink/rails_frontend/tree/master/app/views/live_person).


## JavaScript Assets

<span class="sg-Label sg-Label--todo"></span> Will be opening a GitHub issue to discuss.


## Demo Pages

Here are a few pages to show full-stack usage of StyleBitz and Rails. The first page is a sandbox that you can play with. It is an empty layout. Feel free to play with the `sandbox.scss` file that imports StyleBitz core! Then add your HTML to `sandbox.html.erb` too.

* [Open Sandbox Page](pages/sandbox)

<span class="sg-Label sg-Label--todo"></span> Here are a few content pages that Dara recomended that we build to show content first methodolgy being championed.

* [The CustomInk Difference](http://www.customink.com/about/customink_difference)
* [St. Patrick's Day T-Shirts](http://www.customink.com/events/st-patricks-day-t-shirt)

<span class="sg-Label sg-Label--todo"></span> We are waiting to hear back on a mocked up "share the bill" page.

* [Some Mocked Up Share The Bill Page?](#)






## TODO

* Talk about precompile
*
