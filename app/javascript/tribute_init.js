document.addEventListener("DOMContentLoaded", () => {
  let tributeNames = new Tribute ({
    trigger: "@",
    values: [
      { key: "Dawne", value: "Dawne Bednar" },
      { key: "See", value: "See Konopelski" },
      { key: "Josue", value: "Josue Bayer" }
    ],
    selectTemplate: function (item) {
      return item.original.value;
    }
  });

  let tributePhones = new Tribute ({
    trigger: "@",
    values: [
      { key: "+1-418", value: "+1-418-543-8090" },
      { key: "+1-587", value: "+1-587-530-2271" },
      { key: "+1-404", value: "+1-404-724-1937" }
    ],
    selectTemplate: function (item) {
      return item.original.value;
    }
  });
  console.log('The tribute gem has been loaded');

  let showModalButton = document.querySelector('#show-modal-button');

  if(showModalButton) {
    showModalButton.addEventListener('click', () => {
      let inputElement = document.querySelector('#manager_notes');
      inputElement.classList.add('ckeditor'); // Agrega la clase ckeditor al elemento de entrada

      if (inputElement) {
        const editorElement = document.querySelector('.form-control.ckeditor');
        ClassicEditor.create(editorElement, {
          toolbar: {
            items: [
              '|',
              '|',
              'blockQuote',
              'bold',
              'heading',
              'indent',
              'outdent',
              'italic',
              'link',
              'numberedList',
              'bulletedList',
              'mediaEmbed',
              'insertTable',
              'undo',
              'redo'
            ]
          },
          language: 'en',
          removePlugins: ['Autoformat'],
          allowedContent: true,
          extraAllowedContent: 'p br strong em',
          enterMode: 'p',
          shiftEnterMode: 'br',
        })
        .then(editor => {
          editorInstance = editor;
          window.editor = editor;
          editor.setData(inputElement.value);

          let ckEditorElement = editor.ui.view.editable.element;
          tributeNames.attach(ckEditorElement);
          tributePhones.attach(ckEditorElement);

          console.log("CKEditor successfully started within the modal");
        })
        .catch(error => {
          console.error('Oops, something went wrong!');
          console.error(error);
        });
      }
    })
  }
});