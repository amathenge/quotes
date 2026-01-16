$(document).ready(function() {
    // Clear the default layout.
    DataTable.defaults.layout = {
        topStart: null,
        topEnd: null,
        bottomStart: null,
        bottomEnd: null
        // bottom: 'paging'
    };

    // $('#quotes').DataTable({
    //     layout: {
    //         top2Start: 'pageLength',
    //         top2End: {
    //             'search': {
    //                 'placeholder': 'Search Here'
    //             }
    //         },
    //         topStart: 'info',
    //         topEnd: 'paging',
    //         bottomStart: 'pageLength',
    //         bottomEnd: 'search',
    //         bottom2Start: 'info',
    //         bottom2End: 'paging'
    //     }
    // });

    $('#quotes').DataTable({
        layout: {
            top: 'paging',
            top2: {
                'pageLength': { 'menu': [ 10, 25, 50, 100 ] },
                'info': { 'text': 'Table display: _START_ to _END_ of _TOTAL_ records' },
                'search': { 'placeholder': 'Search here...' }
            },
            // topStart: {
            //     'pageLength': {
            //         'menu': [ 10, 25, 50, 100 ]
            //     }
            // },
            // bottomStart: {
            //     'search': null,
            // },
            // topEnd: {
            //     'search': {
            //         'placeholder': 'Search Here...'
            //     },
            //     'info': {
            //         'text': 'Table display: _START_ to _END_ of _TOTAL_ records'
            //     }
            // },
            // bottomEnd: {
            //     'paging': {
            //         'buttons': 4
            //     }
            // }
            // bottom: 'paging'
        }
    })
});
