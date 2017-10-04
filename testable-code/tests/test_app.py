# project/test_basic.py
 
 
import os
import unittest
 
from CI.app import *
 
 
class BasicTests(unittest.TestCase):
 
    ############################
    #### setup and teardown ####
    ############################
 
    # executed prior to each test
    def setUp(self):
        app.config['TESTING'] = True
        app.config['DEBUG'] = False
        self.app = app.test_client()
 
        # Disable sending emails during unit testing
        self.assertEqual(app.debug, False)
 
    # executed after each test
    def tearDown(self):
        pass
 
 
###############
#### tests ####
###############
 
    def test_root_function_status_code(self):
        response = self.app.get('/', follow_redirects=True)
        self.assertEqual(response.status_code, 200)
 
    def test_root_function_response_message(self):
        response = self.app.get('/')
        assert b'Index Page' in response.data
 
    def test_main_page(self):
        response = self.app.get('/hello', follow_redirects=True)
        self.assertEqual(response.status_code, 200)
 
    def test_hello_world(self):
        response = self.app.get('/hello')
        assert b'Hello, World' in response.data
 
if __name__ == "__main__":
    log_file = 'log_file.txt'
    f = open(log_file, "w")
    runner = unittest.TextTestRunner(f)
    unittest.main(testRunner=runner)
    f.close()
