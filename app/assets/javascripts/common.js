
// override defaults for DataTables initialisation since defaults are for 12 column grid
$.extend(true, $.fn.dataTable.defaults, {
  dom:
    "<'row'<'small-12 columns'l><'small-12 columns'f>r>"+
    "t"+
    "<'row'<'small-12 columns'i><'small-12 columns'p>>",
  renderer: 'foundation'
});

function str_includes(full_str, search_str) {
  var matches = false;

  if (typeof search_str !== 'undefined' && search_str !== null &&
    typeof full_str !== 'undefined' && full_str !== null) {

    var search_str_lower = search_str.toLowerCase();
    var full_str_lower = full_str.toLowerCase();

    matches = full_str_lower.indexOf(search_str_lower) !== -1;
  }

  return matches;
}

var current_page_datatables;
var pena_datatable_str = {
  all: 'All',
  empty_table: 'No results',
  search: '\uf16c',
  info: '_TOTAL_ total',
  first: 'First',
  last: 'Last',
  // next: 'Next',
  // previous: 'Previous'
  next: '>>',
  previous: '<<'
};

var datatables_defaults = {
  lengthMenu: [[20, 50, 100, 250, -1], [20, 50, 100, 250, 'All']],
  order: [[0, 'asc']],
  columnDefs: [
    {
      targets: 'datatable_no_order',
      orderable: false
    },
    {
      targets: 'datatable_no_search',
      searchable: false
    }
  ],
  language: {
    search: '',
    lengthMenu: "_MENU_",
    emptyTable: pena_datatable_str.empty_table,
    zeroRecords: pena_datatable_str.empty_table,
    info: pena_datatable_str.info,
    infoEmpty: '',
    infoFiltered: '',
    paginate: {
      first: pena_datatable_str.first,
      last: pena_datatable_str.last,
      next: pena_datatable_str.next,
      previous: pena_datatable_str.previous
    }
  }
};

$(function() {

  datatables_config = $.extend(
    {},
    datatables_defaults,
    {
      processing: true,
      serverSide: true,
      ajax: {
        // type: 'POST'
        url: $('.serverside_datatables').data('source')
      },
    }
  );

  current_page_datatables = $('.serverside_datatables').dataTable(datatables_config);
  $('.dataTables_filter input').attr('placeholder', pena_datatable_str.search);

});

