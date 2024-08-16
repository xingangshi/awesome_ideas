python3 -m gunicorn hello_django.asgi:application
python3 -m uvicorn hello_django.asgi:application
python3 -m pip install -r requirements.txt

---


Getting Started


Initial Local Setup
Make sure that Python is already installed on your computer along with a way to create virtual environments.

This allows you to run your project locally, and test that it works, before deploying it to Fly.io.

We recommend the latest supported versions of Python.

Create a folder for your project. Here we’ll call it hello-django. Enter the folder with cd:

mkdir hello-django && cd hello-django
Virtual Environment
For this guide, we use venv but any of the other popular choices such as Poetry, Pipenv, or pyenv work too.

# Unix/macOS
$ python3 -m venv .venv
$ source .venv/bin/activate
(.venv) $
# Windows (PowerShell)
> python -m venv .venv
> .venv\Scripts\Activate.ps1
(.venv) ...>
From this point on, the commands won’t be displayed with (.venv) but we assume you have your Python virtual environment activated.

Install Django
With your virtual environment activated, install the latest version of Django using pip:

python -m pip install Django
Create a Django Project
Inside the hello-django folder, create a Django project named hello_django:

django-admin startproject hello_django .
Don’t forget the . at the end. It’s crucial because it tells the script to create the Django project directory structure in the current directory, our folder hello-django.

Note that by convention, we name Django projects using snake_case: words written in lowercase with spaces replaced by underscore (_). Hyphens (-) are not valid identifiers and you might get this error message:

'hello-django' is not a valid project name. Please make sure the name is a valid identifier.
By this point, our project structure should look like this:

hello-django/
|-- .venv
|-- hello_django/
|   |-- __init__.py
|   |-- asgi.py
|   |-- settings.py
|   |-- urls.py
|   |-- wsgi.py
|-- manage.py
Create and Map a URL to a View
Now let’s configure a basic view that returns the text, Hello, Fly! by updating the hello_django/urls.py file:

# hello_django/urls.py
from django.contrib import admin
from django.http import HttpResponse
from django.urls import path


# ↓ New basic view returning "Hello, Fly!" ↓
def hello(request):
    return HttpResponse("Hello, Fly!")


urlpatterns = [
    path("admin/", admin.site.urls),
    path("", hello, name="hello"),  # ← Added!
]
Run migrations
As part of Django’s core functionality, some existing apps are included by default to provide you with out-of-the-box features. Some of those apps require their own database tables.

To initialize the local database and set up those tables, run the migrate command:

python manage.py migrate
Start the Web Server
Now runserver to start up Django’s local web server:

python manage.py runserver
If you open http://127.0.0.1:8000/ in your web browser it now displays the text Hello, Fly!.

Django Deployment Checklist
By default, Django is configured for local development. The How to Deploy Django and Django Deployment Checklist guide list the various steps required for a secure deployment.

You can also find a complete guide Deploying Django to Production in our Django Beats Blog.

However, for demonstration purposes, we can take some shortcuts.

First, in the hello_django/settings.py file update the ALLOWED_HOSTS configuration to accept a host on which it’s deployed. Use the FLY_APP_NAME environment variable for that:

# hello_django/settings.py
import os

APP_NAME = os.environ.get("FLY_APP_NAME")
ALLOWED_HOSTS = [f"{APP_NAME}.fly.dev"]  # ← Updated!
Second, install Gunicorn as our production server:

python -m pip install gunicorn
Third, create a requirements.txt file listing all the packages in the current Python virtual environment:

pip freeze > requirements.txt
That’s it! We’re ready to deploy on Fly.io.

Initial Local Setup
Make sure that Python is already installed on your computer along with a way to create virtual environments.

This allows you to run your project locally, and test that it works, before deploying it to Fly.io.

We recommend the latest supported versions of Python.

Create a folder for your project. Here we’ll call it hello-django. Enter the folder with cd:

mkdir hello-django && cd hello-django
Virtual Environment
For this guide, we use venv but any of the other popular choices such as Poetry, Pipenv, or pyenv work too.

# Unix/macOS
$ python3 -m venv .venv
$ source .venv/bin/activate
(.venv) $
# Windows (PowerShell)
> python -m venv .venv
> .venv\Scripts\Activate.ps1
(.venv) ...>
From this point on, the commands won’t be displayed with (.venv) but we assume you have your Python virtual environment activated.

Install Django
With your virtual environment activated, install the latest version of Django using pip:

python -m pip install Django
Create a Django Project
Inside the hello-django folder, create a Django project named hello_django:

django-admin startproject hello_django .
Don’t forget the . at the end. It’s crucial because it tells the script to create the Django project directory structure in the current directory, our folder hello-django.

Note that by convention, we name Django projects using snake_case: words written in lowercase with spaces replaced by underscore (_). Hyphens (-) are not valid identifiers and you might get this error message:

'hello-django' is not a valid project name. Please make sure the name is a valid identifier.
By this point, our project structure should look like this:

hello-django/
|-- .venv
|-- hello_django/
|   |-- __init__.py
|   |-- asgi.py
|   |-- settings.py
|   |-- urls.py
|   |-- wsgi.py
|-- manage.py
Create and Map a URL to a View
Now let’s configure a basic view that returns the text, Hello, Fly! by updating the hello_django/urls.py file:

# hello_django/urls.py
from django.contrib import admin
from django.http import HttpResponse
from django.urls import path


# ↓ New basic view returning "Hello, Fly!" ↓
def hello(request):
    return HttpResponse("Hello, Fly!")


urlpatterns = [
    path("admin/", admin.site.urls),
    path("", hello, name="hello"),  # ← Added!
]
Run migrations
As part of Django’s core functionality, some existing apps are included by default to provide you with out-of-the-box features. Some of those apps require their own database tables.

To initialize the local database and set up those tables, run the migrate command:

python manage.py migrate
Start the Web Server
Now runserver to start up Django’s local web server:

python manage.py runserver
If you open http://127.0.0.1:8000/ in your web browser it now displays the text Hello, Fly!.

Django Deployment Checklist
By default, Django is configured for local development. The How to Deploy Django and Django Deployment Checklist guide list the various steps required for a secure deployment.

You can also find a complete guide Deploying Django to Production in our Django Beats Blog.

However, for demonstration purposes, we can take some shortcuts.

First, in the hello_django/settings.py file update the ALLOWED_HOSTS configuration to accept a host on which it’s deployed. Use the FLY_APP_NAME environment variable for that:

# hello_django/settings.py
import os

APP_NAME = os.environ.get("FLY_APP_NAME")
ALLOWED_HOSTS = [f"{APP_NAME}.fly.dev"]  # ← Updated!
Second, install Gunicorn as our production server:

python -m pip install gunicorn
Third, create a requirements.txt file listing all the packages in the current Python virtual environment:

pip freeze > requirements.txt
That’s it!
