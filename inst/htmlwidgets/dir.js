// from https://codepen.io/asraven/pen/qbrgje
// get all folders in our .directory-list
var allFolders = document.querySelectorAll(".directory-list li > ul");

for(var i = 0; i < allFolders.length; i++) {

          	  // add the folder class to the parent <li>
        	  var folderAndName = allFolders[i].parent();
        	  folderAndName.addClass("folder");

        	  // backup this inner <ul>
        	  var backupOfThisFolder = allFolders[i];
        	  // then delete it
        	  allFolders[i].remove();
        	  // add an <a> tag to whats left ie. the folder name
        	  folderAndName.wrapInner("<a href='#' />");
        	  // then put the inner <ul> back
        	  folderAndName.append(backupOfThisFolder);

        	  // now add a slideToggle to the <a> we just added
        	  folderAndName.find("a").click(function(e) {
        	    allFolders[i].siblings("ul").slideToggle("slow");
        	    e.preventDefault();
        	  });

}



HTMLWidgets.widget({

  name: 'dir',

  type: 'output',

  factory: function(el, width, height) {


    return {

      renderValue: function(x) {

        el.innerHTML = x.html;

        // from https://codepen.io/asraven/pen/qbrgje
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

        });

      },

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});
