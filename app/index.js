const express = require('express');
const client = require('prom-client');
const app = express();
const register = client.register;

const httpRequestDurationMilliseconds = new client.Histogram({
  name: 'http_request_duration_seconds',
  help: 'Duration of HTTP requests in seconds',
  labelNames: ['method', 'route', 'code'],
  buckets: [0.1, 0.3, 0.5, 1, 2, 5]
});

app.get('/', (req, res) => {
  const end = httpRequestDurationMilliseconds.startTimer();
  res.send('Hello from k8s!');
  end({ method: req.method, route: '/', code: 200 });
});

app.get('/health', (req, res) => res.send('OK'));

app.get('/metrics', async (req, res) => {
  res.set('Content-Type', register.contentType);
  res.send(await register.metrics());
});

const port = process.env.PORT || 3000;
app.listen(port, () => console.log('listening on', port));
