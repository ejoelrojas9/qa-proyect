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
  console.log('The tribute gem has been loaded');

  let showModalButton = document.querySelector('#show-modal-button');

  if(showModalButton) {
    showModalButton.addEventListener('click', () => {
      let inputElement = document.querySelector('#manager_notes');
      console.log('Button clicked');

      tributeNames.attach(inputElement);
      inputElement.select("keydown", (event) => {
        event.preventDefault();
        if (event.key === "@") {
          setTimeout(() => {
            let selection = window.getSelection();
            if (!selection.rangeCount) return;

            let range = selection.getRangeAt(0);
            let node = range.startContainer;

             if (node.nodeType === Node.TEXT_NODE) {
              node = node.parentNode;
             }
             tributeNames.showMenuForCollection(node);
          }, 100);
        }
      })
    })
  }
});