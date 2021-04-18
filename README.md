
<!-- README.md is generated from README.Rmd. Please edit that file -->

# dir

<!-- badges: start -->

<!-- badges: end -->

``` r
dir::ls("./")
```

<div class="directory" id="dir-100">
<ul class="directory-list">
<li>
<i class="fa fa-folder-open"></i>
.
<ul>
<li>
<i class="fa fa-file"></i>
DESCRIPTION
</li>
<li>
<i class="fa fa-file"></i>
dir.Rproj
</li>
<li>
<i class="fa fa-folder-open"></i>
inst
<ul>
<li>
<i class="fa fa-file"></i>
dir.css
</li>
<li>
<i class="fa fa-file"></i>
dir.js
</li>
<li>
<i class="fa fa-folder-open"></i>
fontawesome
<ul>
<li>
<i class="fa fa-folder-open"></i>
css
<ul>
<li>
<i class="fa fa-file"></i>
all.css
</li>
<li>
<i class="fa fa-file"></i>
all.min.css
</li>
</ul>
</li>
<li>
<i class="fa fa-folder-open"></i>
webfonts
<ul>
<li>
<i class="fa fa-file"></i>
fa-brands-400.eot
</li>
<li>
<i class="fa fa-file"></i>
fa-brands-400.svg
</li>
<li>
<i class="fa fa-file"></i>
fa-brands-400.ttf
</li>
<li>
<i class="fa fa-file"></i>
fa-brands-400.woff
</li>
<li>
<i class="fa fa-file"></i>
fa-brands-400.woff2
</li>
<li>
<i class="fa fa-file"></i>
fa-regular-400.eot
</li>
<li>
<i class="fa fa-file"></i>
fa-regular-400.svg
</li>
<li>
<i class="fa fa-file"></i>
fa-regular-400.ttf
</li>
<li>
<i class="fa fa-file"></i>
fa-regular-400.woff
</li>
<li>
<i class="fa fa-file"></i>
fa-regular-400.woff2
</li>
<li>
<i class="fa fa-file"></i>
fa-solid-900.eot
</li>
<li>
<i class="fa fa-file"></i>
fa-solid-900.svg
</li>
<li>
<i class="fa fa-file"></i>
fa-solid-900.ttf
</li>
<li>
<i class="fa fa-file"></i>
fa-solid-900.woff
</li>
<li>
<i class="fa fa-file"></i>
fa-solid-900.woff2
</li>
</ul>
</li>
</ul>
</li>
<li>
<i class="fa fa-folder-open"></i>
jQuery
<ul>
<li>
<i class="fa fa-file"></i>
jquery-3.6.0.min.js
</li>
</ul>
</li>
</ul>
</li>
<li>
<i class="fa fa-folder-open"></i>
man
<ul>
<li>
<i class="fa fa-file"></i>
ls.Rd
</li>
</ul>
</li>
<li>
<i class="fa fa-file"></i>
NAMESPACE
</li>
<li>
<i class="fa fa-folder-open"></i>
R
<ul>
<li>
<i class="fa fa-file"></i>
ls.R
</li>
</ul>
</li>
<li>
<i class="fa fa-file"></i>
README.Rmd
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
