# Creating Icon Fonts
Anyone can contribute to our icon font by using the StyleBitz project. These steps assume you have a local working copy of the StyleBitz repo.


## Open Fontello

The first step is to open our shared Fontello session by running this command in your console.

```
$ bundle exec rake inkicons:browse
```

<img alt="Fontello Session" src="https://cloud.githubusercontent.com/assets/2381/3372747/9b5f20ec-fbad-11e3-9601-4e0196d65277.png" class="sg-Page-img sg-Page-img--half" />
This will open our latest Fontello session within your default browser. From here you can make changes by adding or changing glyphs as needed. There are a few rules to follow:

1. StyleBitz glyphs use the `sb-` name prefix. Before downloading an updated webfont, make sure to click on the "**Customized Names**" tab in Fontello. Any new glyph will have to set this only once.
2. Removing a glyph is a big deal. Please consult an engineer about StyleBitz versioning, change logs, downstream usage, etc.
3. New glyphs have to be simple SVG paths. You can not use a complex Illustrator export with many layers -even if they are disabled).

<img alt="Fontello Session" src="https://cloud.githubusercontent.com/assets/2381/3373371/053fe1b8-fbb3-11e3-8e83-68273542cf30.png" class="sg-Page-img sg-Page-img--half" />
As of now, StyleBit has a [Sketch](http://bohemiancoding.com/sketch/) master document located within the [art/inkicons](https://github.com/customink/style_bitz/tree/master/art/inkicons) directory of this project. Our artboard is set to 512px with a crisp size of 32px. Which means our grid is at every 16px. If you want to learn more about icon font design, we recommend these resources.

* [How to Create a Custom, Crisp Icon Fonts](http://asimpleframe.com/writing/custom-icon-font-tutorial-icomoon)
* [The Making of Octicons](https://github.com/blog/1135-the-making-of-octicons)


## Update InkIcons

Once you are done with your changes, click on the red "**Save Session**" button in Fontello and then "**Download Webfont**" by clicking the small dropdown icon in the same red button. Once downloaded, there should be a new directory in your `~/Downloads` folder that looks something like `fontello-48fb1d33`. To update StyleBitz, run the following command in your console.

```
$ bundle exec rake inkicons:update
```

This task will update the appropriate files within the StyleBitz project. From here you can update the documentation on the new glyph(s). Use the `_inkicons-codes.scss` to find the new ASCII unicode content string. Also, make sure to normalize new custom glyphs. Look at the `_inkicons-normalize.scss` file for examples.
