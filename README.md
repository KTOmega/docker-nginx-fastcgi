nginx-fastcgi Docker Image
==========================

A nice contained Docker image that lets you spin up FastCGI apps (Python frameworks like Flask, Node.js...) quickly.

To run,

- Edit any configuration files to your liking.
- `docker build -t nginx-fastcgi .`
- `docker run --name nginx -p 80:80 -v (PATH TO YOUR FASTCGI APPLICATION):/var/www/app nginx-fastcgi`
- Done!

An example application is available for running - set up the virtual environment and spin up the app like described above.

Prerequisites
=============

You'll of course need an app to run. This container assumes you'll be running a Python 3 app, like Flask. Your app must have a file called `app.fcgi` that listens to FastCGI requests on standard input. 

Besides that, there's nothing else to really set up - make sure your virtual environments are set up correctly, though. 

On Python Virtual Environments
==============================

Virtual environments can be finicky because of the version of Python used, and the site-packages for that version. This image uses Python 3.5, so the environment should be set up for it.

If you need to set it up, run `docker run --rm -v (PATH TO YOUR FASTCGI APPLICATION):/var/www/app nginx-fastcgi 'cd /var/www/app && apk add py-virtualenv && virtualenv -p python3 venv && source venv/bin/activate && pip install -r requirements.txt'`. (TODO: Make that easier.)
