import unittest

from python.src import abcde


class TestXYZ(unittest.TestCase):

    def setUp(self) -> None:
        pass

    def test_xyz(self):
        event = None
        context = None
        expected = {
            'statusCode': 200,
            'body': '{"asdf": 123123}'
        }
        result = abcde.xyz(event, context)
        self.assertEquals(expected, result)
