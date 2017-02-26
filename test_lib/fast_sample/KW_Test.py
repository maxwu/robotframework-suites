#!/usr/bin/env python
# -*- coding: utf-8 -*-

__author__ = 'maxwu'
import sys
import datetime

ROBOT_LIBRARY_SCOPE = "TEST SUITE"


def get_ts():
    now = datetime.datetime.now()
    return now.strftime("%Y-%m-%d %H:%M:%S:%f")


def __init__():
    sys.stderr.write(get_ts() + "->This is in test_kw module __init__\n")
    print (get_ts() + "->module init called")


class KW_Test(object):
    """A Class to test Robot Framework KW lib with py src. --Max"""

    ROBOT_LIBRARY_SCOPE = "TEST CASE" #TEST SUITE, TEST CASE

    ROBOT_LIBRARY_VERSION = '1.0'

    def print_help(self):
        self.cnt += 1
        sys.stderr.write(get_ts()+"->This is in TestKeyword.print_help():cnt={0}\n".format(self.cnt))
        print (get_ts()+"-> cnt={0}".format(self.cnt))

    @staticmethod
    def static_help():
        sys.stderr.write(get_ts()+"->in static method\n")
        print (get_ts()+"->in static method, stdout")

    def ts(self):
        return get_ts()

    def __init__(self):
        self.cnt = 0
        sys.stderr.write (get_ts()+"->This is in TestKeyword.__init__:cnt={0}\n".format(self.cnt))
        print (get_ts()+"->constructor called, id={0}".format(id(self)))


    def __del__(self):
        sys.stderr.write(get_ts() + "->This is in TestKeyword.__del__:cnt={0}\n".format(self.cnt))
        print (get_ts()+"->destructor called, id={0}".format(id(self)))


#FIXME: A test on global common part.
sys.stderr.write(get_ts() + "->This is in test_kw module common block\n")
print (get_ts() + "->module common called")


if __name__ == '__main__':
    pass