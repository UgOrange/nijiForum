// config.js
KindEditor.ready(function(K) {
        K.create('textarea[name=content_raw]', {
        // K.create('#id_content_raw', {
            width: '800px',
            height: '500px',
            uploadJson: '/upload/kindeditor',
        });
});