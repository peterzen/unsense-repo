
$(document).ready(function () {

  // wrap checkboxes with labels to enlarge clickable area
  $('[type="checkbox"]').each(function () {
    const $cb = $(this);
    const parent = this.parentNode;

    
    const textNode = Array.from(parent.childNodes).find(n =>
          // Text node with non-empty content
        (n.nodeType === Node.TEXT_NODE && n.textContent.trim().length > 0) ||
        // <strong> element
        (n.nodeType === Node.ELEMENT_NODE && n.tagName === 'STRONG')
    );

    if (textNode) {
      $cb.add(textNode).wrapAll('<label class="control-label legacy-label"></label>');
    }
  });

  // toggle selectable rows on row click in bootgrid tables
  $('.bootgrid-table > tbody > tr').each(function () {
    const $cb = $(this).find('td.select-cell input[type="checkbox"]');

    $(this).on('click', function (e) {
      if (e.target !== $cb[0]) {
        $cb.prop('checked', !$cb.prop('checked')).trigger('change');
      }
    });
  });

  // toggle selectable rows on row click in 
  // firewall rules tables
  $('table.opnsense-rules > tbody > tr').each(function () {
    const $cb = $(this).find('.rule_select');

    $(this).on('click', function (e) {
      if (e.target !== $cb[0]) {
        $cb.prop('checked', !$cb.prop('checked')).trigger('change');
      }
    });
    $(this).addClass('selectable-row');
  });

  
  $('i[id*="show_"]').each(function () {
    const $icon = $(this);
    const $closestParent = $icon.closest('td'); // Find the closest <a> or <td> parent

    if ($closestParent.length) {
        // Get the parent's content
        const $contents = $closestParent.contents();
    
        // Wrap the contents in a label and get the wrapper
        const $label = $contents.wrapAll('<label class="help-toggle"></label>').parent();

    // Forward label click to the icon
        $label.on('click', function (e) {
            // Avoid duplicate click if original click was on the icon
            if (e.target !== $icon[0]) {
                $icon.trigger('click');
            }
        });
    }
  });
});

