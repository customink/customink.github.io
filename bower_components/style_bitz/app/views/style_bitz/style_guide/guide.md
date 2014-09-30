
# CustomInk Style Guide

This section is for information typically found in other style guides. Lower level details of our [Sass framework](/style_bitz/sass) belong in that section. We also have a [high level UX section](/style_bitz/ux) that details the highest level rules.

## Colors

Below is a set of swatches that demo each color and its [Sass](/style_bitz/sass) variable name and Hex value. Please note, Hex values are reference here only to help ux and vx with design applications outside of StyleBitz.

#### Base Colors

<div class="sg-InkSwatches">
  <div class="sg-InkSwatch" data-sb-color="sb-orange" data-sb-color-hex="f37321"></div>
  <div class="sg-InkSwatch" data-sb-color="sb-red" data-sb-color-hex="ee3524"></div>
  <div class="sg-InkSwatch" data-sb-color="sb-brown" data-sb-color-hex="54301a"></div>
  <div class="sg-InkSwatch" data-sb-color="sb-blue" data-sb-color-hex="10a6df"></div>
  <div class="sg-InkSwatch" data-sb-color="sb-dark-red" data-sb-color-hex="aa241b"></div>
  <div class="sg-InkSwatch" data-sb-color="sb-light-gray" data-sb-color-hex="cfc5bf"></div>
  <div class="sg-InkSwatch" data-sb-color="sb-dark-gray" data-sb-color-hex="918378"></div>
  <div class="sg-InkSwatch" data-sb-color="sb-black" data-sb-color-hex="000"></div>
  <div class="sg-InkSwatch" data-sb-color="sb-white" data-sb-color-hex="fff"></div>
  <div class="sg-InkSwatch" data-sb-color="sb-light-pink" data-sb-color-hex="ffebee"></div>
  <div class="sg-InkSwatch" data-sb-color="sb-tan" data-sb-color-hex="ece8e5"></div>
</div>

#### Text Colors

<div class="sg-InkSwatches">
  <div class="sg-InkSwatch" data-sb-color="sb-text-color" data-sb-color-hex="54301a"></div>
</div>

#### Social Media

<div class="sg-InkSwatches">
  <div class="sg-InkSwatch" data-sb-color="sb-facebook-blue" data-sb-color-hex="415f9d"></div>
  <div class="sg-InkSwatch" data-sb-color="sb-twitter-aqua" data-sb-color-hex="35c4ee"></div>
</div>

<span class="sg-Label sg-Label--todo"></span> Did we carry over some colors that should have their values changed while keeping the same name for migration purposes? For example, the `sb-light-gray` and `sb-tan` colors.



## Typography

Our font families and weights leverage our Typekit fonts which are included automatically as part of our [Rails](/style_bitz/rails) layouts. They are globally applied to their proper elements already. For reference, here are our [Sass](/style_bitz/sass) variables.

```scss
$sb-font-family--sans: museo-sans, Tahoma, sans-serif;
$sb-font-family--slab: museo-slab, Tahoma, sans-serif;

$sb-font-weight--normal: 300;
$sb-font-weight--strong: 500;
```

This is a paragraph and it has great line height and a bottom margin to fit our baseline grid. If you want something **bold it will look like this** however, *emphasis or italics looks like this*. Now some headings:

<div>
  <h1>h1. StyleBitz heading</h1>
  <h2>h2. StyleBitz heading</h2>
  <h3>h3. StyleBitz heading</h3>
  <h4>h4. StyleBitz heading</h4>
  <h5>h5. StyleBitz heading</h5>
  <h6>h6. StyleBitz heading</h6>
</div>

Here is an unordered list:
<br/><span class="sg-Label sg-Label--todo"></span> Fix this list.

<ul>
  <li>Item Number One</li>
  <li>Item Number Two</li>
  <li>
    <ul>
      <li>Sub Item Number One</li>
      <li>Sub Item Number Two</li>
    </ul>
  </li>
  <li>Item Number Three</li>
</ul>

Here is an ordered list:
<br/><span class="sg-Label sg-Label--todo"></span> Fix this list.

<ol>
  <li>Item Number One</li>
  <li>Item Number Two</li>
  <li>
    <ul>
      <li>Sub Item Number One</li>
      <li>Sub Item Number Two</li>
    </ul>
  </li>
  <li>Item Number Three</li>
</ol>

#### Text Elements

* The `<a>` ( <a href="#">a element</a> ) example.
* The `<abbr>` ( <abbr>abbr element</abbr> ) example.
* The `<b>` ( <b>b element</b> ) example.
* The `<cite>` ( <cite>cite element</cite> ) example.
* The `<em>` ( <em>em element</em> ) example.
* The `<del>` ( <del>del element</del> ) example.
* The `<dfn>` ( <dfn>dfn element</dfn> ) example.
* The `<i>` ( <i>i element</i> ) example.
* The `<ins>` ( <ins>ins element</ins> ) example.
* The `<kbd>` ( <kbd>kbd element</kbd> ) example.
* The `<mark>` ( <mark>mark element</mark> ) example.
* The `<q>` ( <q>q element</q> ) example.
* The `<s>` ( <s>s element</s> ) example.
* The `<samp>` ( <samp>samp element</samp> ) example.
* The `<small>` ( <small>small element</small> ) example.
* The `<strong>` ( <strong>strong element</strong> ) example.
* The `<sub>` ( <sub>sub element</sub> ) example.
* The `<sup>` ( <sup>sup element</sup> ) example.
* The `<u>` ( <u>u element</u> ) example.
* The `<var>` ( <var>var element</var> ) example.



## Vertical Rhythm

We follow a `.5rem` baseline grid for achieving a vertical rhythm on all block-level elements. Use the *Toggle Baseline* button on the footer of each StyleBitz guide page to show a baseline grid. This can be up to 1px off, so do not nerd out too much.

<span class="sg-Label sg-Label--todo"></span> When finalized, talk about mobile first responsive.</br>
<span class="sg-Label sg-Label--todo"></span> Provide some working Sass examples and practices.



## InkIcons

We use the [Fontello Icon Font Generator](http://fontello.com) to build our own font. This new InkIcons icon font is a mix of our own custom glyphs along with hand selected icons from other font families. Icons panes below contain the glyph, class name, and [Hex content code](http://www.evotech.net/articles/testjsentities.html).

<div class="sg-InkIcons">
  <div class="sg-InkIcons-pane">
    <i class="sg-InkIcons-pane-icon icon-sb-chat"></i>
    <div class="sg-InkIcons-pane-class">icon-sb-chat</div>
    <div class="sg-InkIcons-pane-code">\e801</div>
  </div>
  <div class="sg-InkIcons-pane">
    <i class="sg-InkIcons-pane-icon icon-sb-email"></i>
    <div class="sg-InkIcons-pane-class">icon-sb-email</div>
    <div class="sg-InkIcons-pane-code">\e802</div>
  </div>
  <div class="sg-InkIcons-pane">
    <i class="sg-InkIcons-pane-icon icon-sb-phone"></i>
    <div class="sg-InkIcons-pane-class">icon-sb-phone</div>
    <div class="sg-InkIcons-pane-code">\e803</div>
  </div>
  <div class="sg-InkIcons-pane">
    <i class="sg-InkIcons-pane-icon icon-sb-menu"></i>
    <div class="sg-InkIcons-pane-class">icon-sb-menu</div>
    <div class="sg-InkIcons-pane-code">\e800</div>
  </div>
  <div class="sg-InkIcons-pane">
    <i class="sg-InkIcons-pane-icon icon-sb-twitter"></i>
    <div class="sg-InkIcons-pane-class">icon-sb-twitter</div>
    <div class="sg-InkIcons-pane-code">\e804</div>
  </div>
  <div class="sg-InkIcons-pane">
    <i class="sg-InkIcons-pane-icon icon-sb-facebook"></i>
    <div class="sg-InkIcons-pane-class">icon-sb-facebook</div>
    <div class="sg-InkIcons-pane-code">\e805</div>
  </div>
</div>

#### How To Use

Using an InkIcon glyph must be done on an inline element. We recommend using either an `<i>` or `<span>` tag with the glyph's class name. For example:

```html
<i class="icon-sb-phone"></i>
<span class="icon-sb-phone"></span>
```

Styling an InkIcon's presentation requires targeting the `:before` pseudo element. If you want to style a an InkIcon's layout, target the class vs the pseudo selector. StyleBitz provides a Sass mixin that makes targeting the pseudo element easy. It can take multiple InkIcon short names and targets the proper selectors. Remember,  For example, the two following declaration blocks are the same.

```scss
.icon-sb-phone:before,
.icon-sb-chat:before {
  color: $sb-orange;
}

@include sb-icon(phone, chat) {
  color: $sb-orange;
}
```

Here is an example of adding an InkIcon to your own inline element using CSS Hex content codes.

```scss
.Menu {
  cursor: pointer;
  &:before {
    content: '\e800';
    font-family: 'inkicons';
  }
}
```

#### Contributing

If you want to add or update the InkIcons font, please read the full guide on what tools StyleBitz provides.

* [Full Contributing Guide](guide-inkicons-contrib)

<span class="sg-Label sg-Label--todo"></span> Code up small and/or large modifiers. Best practices for sizing in components, etc.


## Grid & Breakpoints

Please read [our Sass framework](/style_bitz/sass) documentation to learn about StyleBitz grid and responsive breakpoint usage.


## Buttons

<span class="sg-Label sg-Label--todo"></span> Our buttons are incomplete. Right now both `<a>` and `<button>` tags are not acting the same. Need to remove differences in vertical padding/margin. Need to make `--block` modifiers. Need to match `<a>` and `button` active state. Notes about JS usage for disabled. Basically we need to get it together like: http://getbootstrap.com/css/#buttons



#### Options

<div class="sg-Example sg-Example--button">
  <button class="sb-Btn sb-Btn--primary" href="#">Primary</button>
  <button class="sb-Btn sb-Btn--secondary" href="#">Secondary</button>
  <a class="sb-Btn sb-Btn--secondary" href="#">Secondary using Anchor Tag</a>
</div>
```html
<button class="sb-Btn sb-Btn--primary" href="#">Primary</button>
<button class="sb-Btn sb-Btn--secondary" href="#">Secondary</button>
<a class="sb-Btn sb-Btn--secondary" href="#">Secondary using Anchor Tag</a>
```

#### Sizes

<div class="sg-Example sg-Example--button">
  <button class="sb-Btn sb-Btn--primary sb-Btn--large" href="#">Large</button>
  <button class="sb-Btn sb-Btn--secondary sb-Btn--large" href="#">Large</button>
  <button class="sb-Btn sb-Btn--primary" href="#">Normal</button>
  <button class="sb-Btn sb-Btn--secondary" href="#">Normal</button>
  <button class="sb-Btn sb-Btn--primary sb-Btn--small" href="#">Small</button>
  <button class="sb-Btn sb-Btn--secondary sb-Btn--small" href="#">Small</button>
  <a class="sb-Btn sb-Btn--primary" href="#">Normal using Anchor Tag</a>
</div>
```html
<button class="sb-Btn sb-Btn--primary sb-Btn--large" href="#">Large</button>
<button class="sb-Btn sb-Btn--secondary sb-Btn--large" href="#">Large</button>
<button class="sb-Btn sb-Btn--primary" href="#">Normal</button>
<button class="sb-Btn sb-Btn--secondary" href="#">Normal</button>
<button class="sb-Btn sb-Btn--primary sb-Btn--small" href="#">Small</button>
<button class="sb-Btn sb-Btn--secondary sb-Btn--small" href="#">Small</button>
<a class="sb-Btn sb-Btn--primary" href="#">Normal using Anchor Tag</a>
```


#### TOL

<div class="sg-Example sg-Example--button">
  <a class="sb-Btn sb-Btn--primary" href="#">Primary</a>
  <button class="sb-Btn sb-Btn--primary" href="#">Primary</button>
</div>
```html
<a class="sb-Btn sb-Btn--primary" href="#">Primary</a>
<button class="sb-Btn sb-Btn--primary" href="#">Primary</button>
```

<div class="sg-Example sg-Example--button">
  <a class="sb-Btn sb-Btn--secondary" href="#">Secondary</a>
  <button class="sb-Btn sb-Btn--secondary" href="#">Secondary</button>
</div>
```html
<a class="sb-Btn sb-Btn--secondary" href="#">Secondary</a>
<button class="sb-Btn sb-Btn--secondary" href="#">Secondary</button>
```




## Forms

Coming Soon...

