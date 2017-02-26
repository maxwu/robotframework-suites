#!/usr/bin/env python
# -*- coding: utf-8 -*-
__author__ = 'maxwu'

import unittest
from selenium import webdriver
from bs4 import BeautifulSoup


class seleniumTest(unittest.TestCase):
    def setUp(self):
        self.driver = webdriver.PhantomJS()

    def testEle(self):
        driver = self.driver
        driver.get('https://github.com/maxwu?tab=repositories')
        soup = BeautifulSoup(driver.page_source, "xml")
        # #user-repositories-list > div.js-repo-list > li:nth-child(1) > div.d-inline-block.mb-1 > h3 > a
        repos = driver.find_elements_by_css_selector("div.d-inline-block.mb-1 > h3 > a[itemprop='name codeRepository']")
        driver.save_screenshot("scr_{}.jpg".format(self.id()))
        print("{} repositories found".format(len(repos)))
        for repo in repos:
            print ("Repository name: {}".format(repo.text))

        # while True:
        #     titles = soup.find_all('h3', {'class': 'ellipsis'})
        #     nums = soup.find_all('span', {'class': 'dy-num fr'})
        #     for title, num in zip(titles, nums):
        #         print title.get_text(), num.get_text()
        #     if driver.page_source.find('shark-pager-disable-next') != -1:
        #         break
        #     elem = driver.find_element_by_class_name('shark-pager-next')
        #     elem.click()
        #     soup = BeautifulSoup(driver.page_source, 'xml')

    def tearDown(self):
        print ('Tear down...')
        self.driver.quit()

if __name__ == "__main__":
    unittest.main()