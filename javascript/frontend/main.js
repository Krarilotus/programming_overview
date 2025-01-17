document.getElementById('streamBtn').addEventListener('click', async () => {
    const n = document.getElementById('nValue').value;
    const output = document.getElementById('output');
    output.textContent = "Streaming data...\n";
  
    // We'll fetch the /stream-fib endpoint as plain text
    const response = await fetch(`/stream-fib?n=${n}`);
  
    // We'll read the body in streaming fashion if the browser supports it:
    if (window.ReadableStream && response.body) {
      const reader = response.body.getReader();
      const decoder = new TextDecoder('utf-8');
  
      while (true) {
        const {done, value} = await reader.read();
        if (done) break;
        output.textContent += decoder.decode(value, {stream: true});
      }
    } else {
      // fallback: read as text if streaming not supported
      output.textContent += await response.text();
    }
  });
  