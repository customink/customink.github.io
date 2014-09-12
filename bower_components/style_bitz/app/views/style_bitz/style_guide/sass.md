
First and foremost, StyleBitz is our own Sass framework that builds on top of [other Sass dependencies](index#primary-dependencies) like Bourbon and Susy. All of which you should know and learn. Their documentation is out of scope for StyleBitz. So the information below only contains our higher abstractions. We recommend starting here before reading [our primary dependency docs](index#primary-dependencies)

<span class="sg-Label sg-Label--todo"></span> Add new sb-sub, sb-parse-template string ext. Add new sb-map-selectors list ext.


## Usage

#### Core

StyleBitz can be used both as a Sass framework, like Bourbon & Compass, or a fully rendered CSS framework like Foundation & Bootstrap. To use StyleBitz without generating any CSS use this import in your base Sass file. You will have access to every variable, function, and mixin. We call this StyleBitz core.

```scss
@import "style_bitz";
```

#### More
To get all of the generated CSS goodness as well, use this import. This will give you everything from the core import but will also include our normalize and [base styles and component](/style_bitz/guide) styles. We call this StyleBitz more. **When using StyleBitz with Rails and our core layout, we automatically include a stylesheet link tag to the rendered more CSS file.** This allows us to cache this file between requests. So if you are using Rails, use the core technique above in yoru own CSS manifest.

```scss
@import "style_bitz/style_bitz";
```

To use StyleBitz with Codekit, you will need to use a special import. Please read:

* [CodeKit Usage Documentation](sass-codekit)



## Suit Up

When building components for StyleBitz, you must follow the [SUIT CSS methdology](/style_bitz/index#methodology) that we outlined earlier. We leverage the `sb-` namespace prefix for all of StyleBitz variables, mixins, and functions. This namespace prevents conflicts with any other libraries that are brought in or used in tandem with StyleBitz.

Along with this, StyleBitz uses a multi-class vs a single-class approach for CSS class names. The multi-class approach generates less CSS and enables easier extentsion and composability of styles. For example:

```html
<button class="sb-Btn sb-Btn--primary" href="...">Primary</button>
```

A common Sass anti-pattern is to nest CSS styles. Not only is this method not performant, but it couples your styles to the underlying HTML structure of your component. Furthermore, it makes theming and style overrides next to impossible. The SUIT CSS methodology addresses these issues and with the power of Sass 3.3 we can still nest our Sass while keeping our generated CSS flat. The `sb-desc` and `sb-mod` mixins will help you write good SUIT CSS like a pro with Sass.

#### sb-desc($names...)

A mixin that takes one or more descendant names and a declaration block of styles. It applies the block to each descendant following SUIT CSS naming conventions. This helps enforce naming conventions and keep the generated CSS flat.

```scss
.Header {
  background-color: white;
  @include sb-desc(navbar) {
    font-size: 1rem;
    text-decoration: none;
  }
  @include sb-desc(marquee, navbar) {
    font-size: 2rem;
  }
}
```

Would generate the following CSS code.

```css
.Header { background-color: white; }
.Header-navbar { font-size: 1rem; text-decoration: none; }
.Header-marquee { font-size: 2rem; }
.Header-navbar { font-size: 2rem; }
```


#### sb-mod($names...)

A mixin just like `sb-desc` but for modifiers.

```scss
.Btn {
  padding: 0.5rem 1rem;
  @include sb-mod(primary) {
    background-color: blue;
  }
}
```

Would generate the following CSS code.

```css
.Btn { padding: 0.5rem 1rem; }
.Btn--primary { background-color: blue; }
```

<span class="sg-Label sg-Label--todo"></span> Change [implementations](https://gist.github.com/metaskills/0a59c2a6d6ce7d7ff29e) of each to comma seperate name selectors.

The SUIT CSS methodology dictates that state selectors be scoped to their parent component. For example, if we were going to do a hypothetical AJAX button state, we would write the following Sass where nesting is OK to do.

```scss
.Btn {
  padding: 0.5rem 1rem;
  .is-awaitingXhrRequest {
    background-color: yellow;
  }
}
```

<span class="sg-Label sg-Label--guide"></span> Please add a single Sass comment `//` with the name of the generated class above each use of `sb-desc` and `sb-mod` includes. This allows others to quickly read or find where a class name is generated. It also helps break up the code block for legibility. An example:

```scss
.Btn {
  padding: 0.5rem 1rem;
  // .Btn--primary
  @include sb-mod(primary) {
    background-color: blue;
  }
}
```

Lastly, please do not use the `sb-` prefix in your own components that do not reside in StyleBitz. In fact, if you are not writing a sharable framework, then the SUIT CSS namespace is not necessary. Do what is right for you.



## Grid - Quick Start

Our grid utilizes the Susy & Breakpoint Sass libraries to achieve most functionality. Susy is a tool for building grids, and Breakpoint provides concise and powerful ways to write media queries. Susy is designed to work with Breakpoint and coupled together – they make a responsive grid framework.

#### Layouts

StyleBitz goes one step further and creates named Susy grid contexts and Breakpoints, called layouts. You will make use of these layout names, as `$name`, in many of the Sass mixins below. Here is a list of layout names, the number of columns in each, and the pixel representation of the breakpoint in which the layout becomes available.

* `sm` - 4 Columns
* `md` - 12 Columns - 700px Breakpoint
* `lg` - 12 Columns - 1024px Breakpoint
* `xl` - 16 Columns - 1900px Breakpoint

 You will notice that the `sm` layout does not specify a minimum screen-width (a breakpoint). This is because you should *NEVER* explicitly use the `sm` layout in media queries. StyleBitz promotes a mobile first design strategy, therefore the base styles that are not wrapped in media queries will apply to the previous layout (unless overridden by a higher up media query).

#### sb-breakpoint($name)

This is the primary mixin that you will be using. It builds on top of Susy's `susy-breakpoint` mixin and takes care of setting our Susy layout context. It takes a block of styles and applies them when the screen width is greater than or equal to the specified layout's size. Essentially it sets a media query with a minimum width. Styles at larger layout sizes can still be overridden by changing the styles within another `sb-breakpoint` for the larger layout.

The `sm` layout must never be used with this mixin, it is not a breakpoint! We design mobile-first and this layout simply uses the default styles. No media queries needed!

#### sb-respond-to($name)

The mobile first design philosophy dictates that your styles should progressively become more specific for each size moving up to the largest layout. In practice, you will almost never target each StyleBitz layout in isolation. However, if needed, this mixin takes a block of styles and applies them when the screen width is between the size of the specified layout and the next larger layout.

The key difference between `sb-breakpoint` is that this mixin sets styles *ONLY* for the specified layout, while the other applies styles to the specified layout *AND* any larger layout(s).

#### Putting It All Together

Here are a few simple examples taken from the StyleBitz style guide. The first demos our right (table of contents) and left (page) setup for mobile first to the last `xl` breakpoint. The second shows the use of Susy's [`container`](http://susydocs.oddbird.net/en/latest/toolkit/#container) mixin and [`gallery`](http://susydocs.oddbird.net/en/latest/toolkit/#gallery) macro. More important it shows a progressive mobile first styling.

```scss
.sg-Toc {
  @include sb-breakpoint(md) { @include span(3 last); }
  @include sb-breakpoint(xl) { @include span(3 last); }
}
.sg-Page {
  @include sb-breakpoint(md) { @include span(9 first); }
  @include sb-breakpoint(xl) { @include span(13 first); }
}
```

```scss
.sg-InkSwatches { @include container; }
.sg-InkSwatch {
  border-radius: 5px;
  margin-bottom: 1rem;
  @include gallery(2);
  @include sb-breakpoint(md) { @include gallery(4); }
  @include sb-breakpoint(lg) { @include gallery(3); }
  @include sb-breakpoint(xl) { @include gallery(2); }
}
```



## Grid - Comparison

For all intents and purposes, Susy is a math library. It calculates percentages based on context and enables you to create a grid (or even grids) without having to worry about the math behind it. Unlike Bootstrap, Susy is not aware of the DOM. Susy does not know about ancestor/child relationships, it calculates the percentages based on globally set Susy layouts (a Sass map of settings like columns, gutters, gutter position, etc), or redefined contexts in cases where the global layout is not desired for a particular container. Why is this significant? This means that if your global Susy object is set up to have 12 columns, and you span one particular `<div>` by 6 columns, a child `<div>` spanning 3 columns will take up a percentage of 3 columns in relation to the global construct of 12 columns.

What if you want to create another "grid" inside of an element on the page? To do this, you must change the context on this element such that it no longer utilizes the global context. This is what StyleBitz does. It can also be done using Susy's `nested` or `with-layout` mixins, but please use our abstractions. Context can also be changed as simply as saying `@include span(3 of 6)` where 3 is the number of columns and 6 is the new context on the element in which the mixin is included. Susy allows the `of` syntax in some of its mixins to change the context. By changing the context, we can do a variety of complex things with very little Sass.

Going back to how Susy compares to something like Bootstrap, you can think of Susy containers as Bootstrap rows. All they generate is a clearfix just like Bootstrap rows, as well as setting the max-width. A Susy `span` is like a Bootstrap column. The biggest difference between the 2 grid frameworks is that Susy is entirely configurable. From the number of columns, to the gutters, even to setting up asymmetrical grids, it can be done with Susy.

One important thing to note is that in Susy, there is no notion of "adding a grid" to the page. An element does not need a "container" (via the container mixin) to utilize the `span` or any other Susy mixin/function. Like mentioned earlier, Susy is essentially a math library. If there is no container or other local context/layout being set, the global context will be used.



## Grid - Tools

Power up working with StyleBitz' Susy/Breakpoint grids!

#### .sb-Wrapper

The `sb-Wrapper` class adds left and right padding around all of the content within it as well as centering said content by setting margin left and right to auto. It works in tandem with each breakpoint and is most likened to a Bootstrap container.

Its use is seldom and most likely will only appear on the outer most design componets like our header, footer, and main content areas to establish an outer gutter, which is most noticeable on the `sm` layout.

#### Other Private(ish) Tools

Some of these mixins/functions are our own private implementations. So always look for the higher abstractions.

* `sb-layout($name)` - Function: Return our Susy layout map by name.
* `with-sb-layout($name)` - Mixin: Builds on top of Susy's [with-layout](http://susydocs.oddbird.net/en/latest/settings/#with-layout).



## Helpers

A collection of Sass functions and mixins. Some extens the Sass language while others provide support for StyleBitz as a whole.

#### String

* `sb-sub($string, $replace, $value)` - Function: Substitute the **$replace** part of a **$string** with a certain **$value**. Basically a functional version of Ruby's String#sub.
* `sb-parse-template($template, $value)` - Function: Sugar method for sb-sub. Assumes a **VALUE** for **$replace**.

#### List

* `sb-first($list)` - Function: Get the first item in a Sass list.
* `sb-last($list)` - Function: Get the last item in a Sass list.
* `sb-map-selectors($list, $template)` - Function: Take a **$list** of selectors and map them to a new set of selectors using a **$template** string that has **VALUE** for the replacement.

#### Color

* `sb-alphaize($color, $amount, $background: white)` - Function: Like Sass' rgba($color, $alpha) but without opacity. It does this by using a **$background** color which is an optional argument. The **$amount** must be between 0 and 1 inclusive. So a value of 0.2 would be 80% alpha of the **$color** on a white background.

#### Units

* `sb-rem($value)` - Converts a px value to rem. Allows rem values to fall thru. Great for function and/or mixin implementations where you want to allow either value type to be used.

