
<a href="https://incident57.com/codekit/" title="CodeKit"><img class="sg-Page-img--quarter" alt="CodeKit" src="https://cloud.githubusercontent.com/assets/2381/3487261/a5b1a18e-0470-11e4-89ec-8ace8c48f827.png" style="width: 100px" /></a>
In order to use StyleBitz as a [CodeKit](https://incident57.com/codekit/) framework you must first have a local copy the [StyleBitz repo](https://github.com/customink/style_bitz) cloned to your local drive. If you are new to git, we recommend using [GitHub for Mac](https://mac.github.com).


## Framework Setup

The first step is to setup StyleBitz as a CodeKit framework. Open up your GitHub cloned repo/directory. From there find the `app/assets/stylesheets` directory and drag that to the CodeKit window. Make sure to drop it on the lower part of the windows so that it is added as a framework.

<img class="sg-Page-img sg-Page-img--half-lg" alt="Drag the stylesheets directory as a CodeKit framework to the CodeKit window." src="https://cloud.githubusercontent.com/assets/2381/3487859/aa621bf0-04ac-11e4-9d41-e8a1d9d41efb.jpg" />

<img class="sg-Page-img sg-Page-img--half" alt="Optionally rename the new StyleBitz framework." src="https://cloud.githubusercontent.com/assets/2381/3487897/e3b430b0-04b0-11e4-94f9-058a09a11071.jpg" />
Once that is done, you can rename the framework from **stylesheets** (the name of the folder) to **StyleBitz**. This is optional.

Now that you have StyleBitz setup as a CodeKit framework, you will be able to use StyleBitz in any future CodeKit project.


## StyleBitz Project

Create a new CodeKit project to use with StyleBitz. Now you will need to install the StyleBitz dependencies via CodeKit's Bower integration. We recommend adding these dependencies as CodeKit favorites to make this step easy for each project. To install StyleBitz dependencies, click on the **Assets** section in the CodeKit project toolbar. Now install the following dependencies:

* bourbon
* compass-breakpoint - *(bad bower name, not really for compass)*
* susy
* sassy-maps

We do depend on normalize.css but it is vendored into StyleBitz as a Sass file, no need to install it with Bower.

<img class="sg-Page-img sg-Page-img--half" alt="Final CodeKit project example." src="https://cloud.githubusercontent.com/assets/2381/3488859/3f57395c-0507-11e4-8702-f6ac7bf406f7.jpg" />
Once the dependencies are installed, you should see them in a folder called `bower_components` at the root of your project. You must create a Sass file at the **ROOT** of your project. In our example, we made one called `app.scss`. Again this has to be at the root of your project for the following import to work.

```scss
@import "style_bitz/codekit";
```

This import is the same as StyleBitz **more** mentioned in [our Sass framework](/style_bitz/sass) docs. This means you get access to the entire Sass framework as well as the compiled bootstrap CSS for all StyleBitz components.

By default, CodeKit will save the processed Sass file using the same name to the `css` directory of your project. So your projects HTML files should link to that file. For example:

```html
<link href="/css/app.css" media="screen" rel="stylesheet" type="text/css" />
```

Any changes to your source Sass file or the root StyleBitz Sass files will automatically trigger a CodeKit compilation! Happy coding.

