# Sample Application

Simple Node.js Express application for ECS deployment demo.

## Endpoints

- `GET /` - Returns JSON with message and timestamp
- `GET /health` - Health check endpoint

## Local Development

```bash
npm install
npm start
```

The app will run on port 80.

## Docker

```bash
docker build -t sample-app .
docker run -p 80:80 sample-app
```