import secrets
import traceback
from http.cookies import SimpleCookie
from http.server import HTTPServer, SimpleHTTPRequestHandler
from urllib.parse import parse_qs, urlencode, urlparse, urlunparse

import fire

COOKIE_KEY = "python_http_server_token"


def token_auth_handler_factory(token):
    def _factory(*args, **kwargs):
        print('Factory was called: ', args, kwargs)

        return TokenAuthHandler(token, *args, **kwargs)

    return _factory


class TokenAuthHandler(SimpleHTTPRequestHandler):
    def __init__(self, token, *args, **kwargs):
        self.token = token
        super(TokenAuthHandler, self).__init__(*args, **kwargs)

    def _authenticate(self):
        cookies = SimpleCookie(self.headers.get('Cookie'))
        try:
            token = cookies.get(COOKIE_KEY, None).value
            print("TOKEN FROM CLIENT COOKIE", token)

            return token == self.token
        except AttributeError:
            return False

    def _token_qs_redirect(self):
        parse_result = urlparse(self.path)
        qs = parse_qs(parse_result.query)
        qs = {k: v[0] for k, v in qs.items()}
        print("qs", qs)

        token = qs.pop('token', None)
        print("TOKEN FROM URL", token)

        if token:
            newpath = urlunparse(
                (parse_result.scheme, parse_result.netloc, parse_result.path,
                 parse_result.params, urlencode(qs), parse_result.fragment))
            self._set_cookie_header(token, newpath)

            return True
        else:
            return False

    def _set_cookie_header(self, token, newpath):
        print("SETTING COOKIE HEADER")
        self.send_response(302)
        self.send_header('Content-type', 'text/html')
        self.send_header('Location', newpath)
        cookie = SimpleCookie()
        cookie[COOKIE_KEY] = token
        self.send_header("Set-Cookie", cookie.output(header="", sep=""))
        self.end_headers()

    def do_GET(self):
        if self._token_qs_redirect():
            return

        if not self._authenticate():
            self.send_error(404)

            return

        try:
            # override the default behavior
            super(TokenAuthHandler, self).do_GET()
        except Exception as e:
            traceback.print_exc()
            self.send_error(500, "Internal server error")


def run(port=8000, token=None):
    if token is None:
        token = secrets.token_urlsafe()

    server_address = ('', port)
    handler_class = token_auth_handler_factory(token)
    httpd = HTTPServer(server_address, handler_class)
    print('Starting httpd on port %d...' % port)
    print('http://localhost:{}/?token={}'.format(port, token))
    httpd.serve_forever()


if __name__ == "__main__":
    fire.Fire(run)
