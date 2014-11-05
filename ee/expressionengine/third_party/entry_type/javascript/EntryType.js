(function(w) {

  var $holdFields = $("div[id*=hold_field_]").filter(function(){
        return this.id.match(/^hold_field_\d+$/);
      }),
      $tabs = $("#tab_menu_tabs").find("li");

	w.EntryType = {
    fields: [],
    change: function(event) {
      var i, j, $input, value, fieldId;
      $holdFields.not(this).each(function(){
        var $this = $(this);
        $this.width($this.data("width"));
        if ( !$this.data("invisible")) {
          $this.removeClass("entry-type-hidden");
        }
      });
      for (i = 0; i < EntryType.fields.length; i++) {

        if (EntryType.fields[i].callback !== null) {
          value = $.proxy(EntryType.fields[i].callback, EntryType.fields[i])();

          if (value === null) {
            continue;
          }
        } else {
          value = (EntryType.fields[i].$input.is(":radio")) ? EntryType.fields[i].$input.filter(":checked").val() : EntryType.fields[i].$input.val();
        }

        for (fieldId in EntryType.fields[i].hideFields[value]) {
          $("#hold_field_"+EntryType.fields[i].hideFields[value][fieldId]).addClass("entry-type-hidden");
        }
      }
      $tabs.each(function() {
        var id = this.id.replace(/^menu_/, ""),
            $tab = $(this),
            $fieldset = $("#"+id),
            $visibleFields = $fieldset.find(".publish_field").filter(function() {
              return $(this).css("display") !== "none";
            });

        $tab.toggle($visibleFields.length > 0);
      });
    },
    addField: function(fieldName, hideFields, callback) {
			var field = {
        fieldName: fieldName,
        hideFields: hideFields || [],
        callback: callback || null,
        $input: $(":input[name=\'"+fieldName+"\']")
      };

      if ( ! field.$input.data("entryType")) {
        field.$input.change(EntryType.change).data("entryType", true);
      }

      EntryType.fields.push(field);

      $.proxy(EntryType.change, field.$input)();
    },
    setWidths: function(widths) {
			var fieldId;
      for (fieldId in widths) {
         $("#hold_field_"+fieldId).data("width", widths[fieldId]);
      }
    },
    setInvisible: function(invisible) {
      for (var i in invisible) {
        $("#hold_field_"+invisible[i]).data("invisible", true);
      }
    }
	};

})(window);
