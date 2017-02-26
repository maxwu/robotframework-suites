#!/usr/bin/env python
# -*- coding: utf-8 -*-
__author__ = 'maxwu'

class ExamLib:

    ROBOT_LIBRARY_SCOPE = 'TEST SUITE'

    def __init__(self):
        self._counter = 0

    def count(self):
        self._counter += 1
        print self._counter

    def clear_counter(self):
        self._counter = 0