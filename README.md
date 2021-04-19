
<!-- README.md is generated from README.Rmd. Please edit that file -->

# dir

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
<!-- badges: end -->

Some HTML elements do not show in GitHub markdown (due to it not
rendering any css and javascript). For demonstration, look at the output
at <http://dir.emitanaka.org> instead.

``` r
dir::finder()
```

<div class="directory">

<ul class="directory-list">

<li>

<i class="fas fa-folder-open"></i> .

<ul>

<li>

<i class="fas fa-file-alt"></i> \_pkgdown.yml

</li>

<li>

<i class="fas fa-file-alt"></i> DESCRIPTION

</li>

<li>

<i class="fas fa-file-alt"></i> dir.Rproj

</li>

<li>

<i class="fas fa-folder-open"></i> inst

<ul>

<li>

<i class="fas fa-file-alt"></i> dir.css

</li>

<li>

<i class="fab fa-js"></i> dir.js

</li>

<li>

<i class="fas fa-folder-open"></i> fontawesome

<ul>

<li>

<i class="fas fa-folder-open"></i> css

<ul>

<li>

<i class="fas fa-file-alt"></i> all.css

</li>

<li>

<i class="fas fa-file-alt"></i> all.min.css

</li>

</ul>

</li>

<li>

<i class="fas fa-folder-open"></i> webfonts

<ul>

<li>

<i class="fas fa-file-alt"></i> fa-brands-400.eot

</li>

<li>

<i class="fas fa-file-alt"></i> fa-brands-400.svg

</li>

<li>

<i class="fas fa-file-alt"></i> fa-brands-400.ttf

</li>

<li>

<i class="fas fa-file-alt"></i> fa-brands-400.woff

</li>

<li>

<i class="fas fa-file-alt"></i> fa-brands-400.woff2

</li>

<li>

<i class="fas fa-file-alt"></i> fa-regular-400.eot

</li>

<li>

<i class="fas fa-file-alt"></i> fa-regular-400.svg

</li>

<li>

<i class="fas fa-file-alt"></i> fa-regular-400.ttf

</li>

<li>

<i class="fas fa-file-alt"></i> fa-regular-400.woff

</li>

<li>

<i class="fas fa-file-alt"></i> fa-regular-400.woff2

</li>

<li>

<i class="fas fa-file-alt"></i> fa-solid-900.eot

</li>

<li>

<i class="fas fa-file-alt"></i> fa-solid-900.svg

</li>

<li>

<i class="fas fa-file-alt"></i> fa-solid-900.ttf

</li>

<li>

<i class="fas fa-file-alt"></i> fa-solid-900.woff

</li>

<li>

<i class="fas fa-file-alt"></i> fa-solid-900.woff2

</li>

</ul>

</li>

</ul>

</li>

<li>

<i class="fas fa-folder-open"></i> jQuery

<ul>

<li>

<i class="fab fa-js"></i> jquery-3.6.0.min.js

</li>

</ul>

</li>

</ul>

</li>

<li>

<i class="fas fa-file-alt"></i> LICENSE

</li>

<li>

<i class="fas fa-file-alt"></i> LICENSE.md

</li>

<li>

<i class="fas fa-folder-open"></i> man

<ul>

<li>

<i class="fas fa-file-alt"></i> dir-package.Rd

</li>

<li>

<i class="fas fa-file-alt"></i> finder.Rd

</li>

<li>

<i class="fas fa-file-alt"></i> is\_file.Rd

</li>

<li>

<i class="fas fa-file-alt"></i> is\_finder.Rd

</li>

<li>

<i class="fas fa-file-alt"></i> pipe.Rd

</li>

</ul>

</li>

<li>

<i class="fas fa-file-alt"></i> NAMESPACE

</li>

<li>

<i class="fas fa-folder-open"></i> R

<ul>

<li>

<i class="fab fa-r-project"></i> dir-package.R

</li>

<li>

<i class="fab fa-r-project"></i> finder.R

</li>

<li>

<i class="fab fa-r-project"></i> print.R

</li>

<li>

<i class="fab fa-r-project"></i> utils-pipe.R

</li>

<li>

<i class="fab fa-r-project"></i> utils.R

</li>

</ul>

</li>

<li>

<i class="fas fa-file-alt"></i> README.md

</li>

<li>

<i class="fas fa-file-code"></i> README.Rmd

</li>

</ul>

</li>

</ul>

<script>// from https://codepen.io/asraven/pen/qbrgje
// get all folders in our .directory-list
var allFolders = $(".directory-list li > ul");
allFolders.each(function() {

      // add the folder class to the parent <li>
      var folderAndName = $(this).parent();
      folderAndName.addClass("folder");

      // backup this inner <ul>
      var backupOfThisFolder = $(this);
      // then delete it
      $(this).remove();
      // add an <a> tag to whats left ie. the folder name
      folderAndName.wrapInner("<a href='#' />");
      // then put the inner <ul> back
      folderAndName.append(backupOfThisFolder);

      // now add a slideToggle to the <a> we just added
      folderAndName.find("a").click(function(e) {
        $(this).siblings("ul").slideToggle("slow");
        e.preventDefault();
      });

});</script>

</div>
