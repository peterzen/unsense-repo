
$(document).ready(function () {

  // wrap checkboxes with labels to enlarge clickable area
  $('[type="checkbox"]').each(function () {
    const $cb = $(this);
    const parent = this.parentNode;

    const textNode = Array.from(parent.childNodes).find(
      n => n.nodeType === Node.TEXT_NODE && n.textContent.trim().length > 0
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

  // toggle selectable rows on row click in bootgrid tables
  $('table.opnsense-rules > tbody > tr').each(function () {
    const $cb = $(this).find('.rule_select');

    $(this).on('click', function (e) {
      if (e.target !== $cb[0]) {
        $cb.prop('checked', !$cb.prop('checked')).trigger('change');
      }
    });
    $(this).addClass('selectable-row');
  });
});

