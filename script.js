const btn = document.getElementById('btn');

btn.addEventListener('click' , (e) => {
    const fileInput = document.getElementById('fileInput');
    const file = fileInput.files[0];

    if (!file) {
        alert('Please select a file.');
        return;
    }

    const formData = new FormData();
    formData.append('file', file);

    fetch('https://image-to-text-gzq3.onrender.com/api/ocr', {
        method: 'POST',
        headers: {
            'Content-Type': 'multipart/form-data'
        },
        body: formData
    })
    .then(response => {
        if (!response.ok) {
            return response.text().then(text => { throw new Error(text) });
        }
        const t = document.getElementById('txt');
        t.innerHTML(response);
        return response.json();
    })
    .then(data => {
        console.log('Success:', data);
        alert('File uploaded successfully!');
    })
    .catch(error => {
        console.error('Error:', error.message);
        alert(error.message);
    });
});