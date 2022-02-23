from insanic import Insanic
from insanic.conf import settings
from sanic.response import json

settings.configure()
__version__ = "0.1.0"

app = Insanic(__name__, version = __version__)

@app.route("/")
async def example(request):
  return json({"insanic": "Gotta go insanely fast!"})


if __name__ == "__main__":
  app.run(host = "0.0.0.0", port = 5000)
