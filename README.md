# Node 8.10 Runner

This is an alpine based image with libraries and tools installed for running NodeJS 8.10 web apps.

Expects build artifacts mounted at /home/runner/artifacts, with a package.json configured such that `npm start` runs the app.
