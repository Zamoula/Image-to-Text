const btn = document.getElementById('btn');

const form = document.getElementById('uploadForm');
        const fileInput = document.getElementById('fileInput');
        const resultContainer = document.getElementById('extractedText');

        form.addEventListener('submit', async (e) => {
            e.preventDefault();

            const formData = new FormData();
            formData.append('file', fileInput.files[0]);

            try {
                const response = await fetch('https://image-to-text-gzq3.onrender.com/api/ocr', {
                    method: 'POST',
                    body: formData
                });

                if (!response.ok) {
                    throw new Error('Failed to upload image');
                }

                const result = await response.text();
                resultContainer.textContent = result;
            } catch (error) {
                console.error('Error:', error);
                resultContainer.textContent = 'Error uploading image.';
            }
        });