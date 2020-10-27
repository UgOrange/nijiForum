// config.js
KindEditor.ready(function(K) {
        // K.create('textarea[name=content]', {
        K.create('#id_content_rendered', {
            width: '800px',
            height: '500px',
            uploadJson: '/upload/kindeditor',
        });
});