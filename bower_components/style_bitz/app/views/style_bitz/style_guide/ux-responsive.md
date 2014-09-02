# Responsive Design

As we move forward in designing for CustomInk mobile devices are becoming an important part of our eco-system and with that designing for multiple screen sizes. In some cases, we may still decide to have certain experiences that are optimized for screen size because it will yield to better usability and visual aesthetic. However the in the majority of cases will want to take advantage of the benefits of uniting one code base and one content set across multiple devices. Where possible, we should take a content first, mobile second approach to our architecture and designs. Further more, our designs will employ best practices per breakpoint which should be considered when creating optimized designs.

A few great resources for learning more about design for content and multi-screen experiences are.

* Book:[Mobile First](http://www.abookapart.com/products/mobile-first)
* Book:[Content Strategy for Mobile](http://www.abookapart.com/products/content-strategy-for-mobile)
* Book:[Responsive Web Design](http://www.abookapart.com/products/responsive-web-design)
* Blog:[Deciding What Responsive Breakpoints to Use](http://tangledindesign.com/deciding-what-responsive-breakpoints-to-use/)
* Blog:[Articles about Responsive Design (Reccommended by Marcotte)](http://alistapart.com/topic/responsive-design/20)


## Responsive Grid
CustomInk will utilize four breakpoints for our responsive grid. A breakpoint is merely the point in which the design changes to accommodate a different screen-size. Between each breakpoint the page is to be fluid, in this way the breakpoint will accommodate a range of devices. The breakpoints that were chosen for our grid are suggestions for where designs seem to most commonly need to have the most adjustment.

It should be noted that our breakpoints are suggested breakpoints. However, with a content first approach, the breaks should actually occur where the content or design breaks. Our [development environment](/style_bitz/sass#grid---quick-start) has been built in away that breakpoints can, in fact, vary per page if needed. Also, our global elements (header, footer, menus) have been designed for consistency regardless of the dictates of the page. This means that as a person moves from page to page on their device that should expect to have a consistent experience, while at the same time enjoy content that fits properly and not forced into an artificial frame.

> _At this point, don’t worry too much if you notice that the initial breakpoints on your breakpoint graph simply won’t do. Those were just a starting point, and you’re free to revise your estimate based on your sketches. You might even decide that you need an extra breakpoint for a given design_

-Stephen Hay, [Designing for Breakpoints](http://alistapart.com/article/designing-for-breakpoints)

## The Break Points

<img class="sg-Page-img" alt="..." src="https://cloud.githubusercontent.com/assets/6294237/3544205/4351b1e8-086a-11e4-8374-c62be5f77f49.png" />


* `sm` - 4 Columns
* `md` - 12 Columns - 700px Breakpoint
* `lg` - 12 Columns - 1024px Breakpoint
* `xl` - 16 Columns - 1900px Breakpoint


#### Default (a.k.a small)
Having an approach that starts design from the small screen size up, the default size is small screen size. Loosely speaking, the default range is sized from the Galaxy Note Portrait and smaller. This covers most smart phones.


#### Medium
The medium break ranges loosely from Galaxy Note Landscape to iPad Portrait.

#### Large
The large break ranges loosely iPad landscape to Desktop.

#### X-Large
The x-large is reserved for full screen experiences large desktops such as the iMac 21.5. This range is reserved for special use. In most cases, these screens will be served a large breakpoint experience that has been centered within the browser.


<span class="sg-Label sg-Label--tip">
TIP: File-naming

When naming flat files, make them clear through a strong file-naming conventions {filename}.{ext} | {filename}\_md.{ext} | {filename}\_lg.{ext}.

For example: `home.png | home_md.png | home_lg.png`
</span>

## Responsive Typography
<span class="sg-Label sg-Label--todo"></span>
