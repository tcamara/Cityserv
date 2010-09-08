// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

// Needed for edit-in-place
document.observe('dom:loaded', function(event) {
  Editable.setupAll();
});